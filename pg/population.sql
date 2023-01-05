create schema if not exists  population;
set schema 'population';
CREATE TABLE IF NOT EXISTS country_population (
    "Country" TEXT,
    "population" NUMERIC(7, 2)
);
INSERT INTO country_population VALUES
    ('Germany',41039.50),
    ('France',31050.20),
    ('Italy',25787.90),
    ('Spain',18866),
    ('Poland',14435.40),
    ('Netherlands',8346.40),
    ('Romania',7450.80),
    ('Sweden',5474.20),
    ('Belgium',5055.20),
    ('Czechia',4852.50),
    ('Greece',4123.40),
    ('Hungary',4098.20),
    ('Austria',4039.80),
    ('Portugal',3795.10),
    ('Denmark',2967.60),
    ('Bulgaria',2934.60),
    ('Finland',2831),
    ('Ireland',1949.70),
    ('Slovakia',1852.10),
    ('Croatia',1460.90),
    ('Lithuania',1395.50),
    ('Latvia',868.30),
    ('Slovenia',835.40),
    ('Estonia',681.30),
    ('Cyprus',343.70),
    ('Luxembourg',266.10),
    ('Malta',203.50);


