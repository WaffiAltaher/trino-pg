# Trino as a unified data entry point
This repo shows how Trino can be used as a single entry point for all the data in the data platform/data lake. I shows how trino can be used to access and join data across two Postgres databases, but the same approach can be used with any data source that has a Trino connector.

Complete stack is runnable locally using docker compose.

Based on https://github.com/sairamkrish/trino-superset-demo

## Setup
## Trino 
### TLS Setup
To be able to use Trino's authorization features, TLS must be setup. Trino wont even accept basic username/password auth without first using TLS.
> **_NOTE_**   
This project is using a self signed certificate, which obviously is not good enough for production usage. 

To create a self signed certificate:
```shell
openssl genrsa -out key.pem 2048

openssl req -new -key key.pem -out csr.pem 

openssl x509 -req -days 365 -in csr.pem -signkey key.pem -out cert.pem

cat key.pem cert.pem > combinedcert.pem
```
Now copy the generated combinedcert to trino/coordinator/etc

### users setup
``` shell 
cd trino/coordinator/etc/ 

touch password.db

htpasswd -B -C 10 password.db test1

htpasswd -B -C 10 password.db test2
```
the htpasswd command will prompt you for password, enter passwords for test1 and test2 users. 




## Startup
```shell
docker compose up
```

## Postgres Databases
This project will spin up two databases: PG1 and PG2. Databases must be populated with data. Initialization scripts are available under pg/folder. 
You can use the provided pgAdmin instance or any other DB client of your choice.
Run population.sql on pg1 and gas.sql on pg2.

## Superset 
> **_Note_**
You don't really need superset for this, any db client will suffice. Superset is more than just a DB client

This repo contains superset-data/superset.db for convenience. This will ensure that superset is ready for us. 
The steps under superset setup are only needed if you did not mount the superset-data volume. 

Using superset SQL Lab, you can play around with multiple sql queries against Trino. 
Try running this query, then change the user to test2 (see instructions under connection below) and notice the impact of the rules specified in trino/coordinator/etc/rules.json

```sql
select cp.country, gpc.gas_in_storage_twh, cp.population 
FROM postgres1.population.country_population cp, postgres2.gas.gas_per_country gpc
WHERE cp.country = gpc.name;
```

### Superset setup
#### Superset needs initialization

``` shell
docker compose exec superset fab create-admin     --username admin --firstname Superset     --lastname Admin --email admin@superset.com     --password admin

docker compose exec superset db upgrade

docker compose exec superset init
```

#### connection
Connect to [Superset](http://localhost:8088/) from your browser (username: `admin`, password: `admin`).

Add a database for trino. use  trino://test1:<test1 password>@trino-coordinator:8080
> **_NOTE 1_**   
You can use the url trino://test1:<test1 password>@trino-coordinator:8080/{catalog name}
This will cause the schema name and table names to be shown in the sql lab tab, but it also limits you to a single catalog, which beats the purpose. 

> **_NOTE 2_**   
To tell superset to accept the insecure connection (remember Trino is using a self signed certificate), add the following under  Additional args:
 ```
    {
        "connect_args": {
            "verify": false
        }
    }
 ```

