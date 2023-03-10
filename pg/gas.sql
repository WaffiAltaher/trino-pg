create schema gas;
set schema 'gas';
CREATE TABLE IF NOT EXISTS gas_per_country (
    "Status" TEXT,
    "Name" TEXT,
    "Gas_in_storage_TWh" NUMERIC(8, 4),
    "Full" NUMERIC(5, 2),
    "Trend" NUMERIC(3, 2),
    "Consumption_TWh" NUMERIC(8, 4),
    "Stock_Cons" NUMERIC(5, 2),
    "Injection_GWh_d" NUMERIC(5, 2),
    "Withdrawal_GWh_d" NUMERIC(5, 1),
    "Working_gas_volume_TWh" NUMERIC(8, 4),
    "Injection_Capacity_GWh_d" NUMERIC(7, 2),
    "Withdrawal_Capacity_GWh_d" NUMERIC(7, 2)
);
INSERT INTO gas_per_country VALUES
    ('E','EU',1066.0944,95.34,-0.02,3776.4337,28.23,726.24,1003.9,1118.2281,11873.91,20103.88),
    ('E','Austria',91.2199,95.47,0.07,90.1387,101.2,99.72,35.2,95.5464,845.77,1064.31),
    ('E','Belgium',8.9941,100,0,169.6062,5.3,0,0,7.61,88.14,169.66),
    ('C','Bulgaria',5.4374,93.71,0,33.02,16.47,0,0,5.8025,38.18,40.3),
    ('C','Croatia',4.6037,96.46,0,28.2602,16.29,2.78,2.8,4.7725,43.87,51.57),
    ('C','Czech Republic',42.7011,97.49,-0.08,90.6943,47.08,20.99,55.9,43.7999,503.84,705.07),
    ('C','Denmark',9.8775,99.37,0.65,23.1592,42.65,65.26,0.8,9.9404,90.72,180),
    ('C','France',132.4373,99.13,0.03,430.4139,30.77,129.04,92.8,133.6026,1215.23,2482.65),
    ('E','Germany',245.3694,99.9,0.01,905.3031,27.1,77.9,57.9,245.6224,4254.42,6879.26),
    ('C','Hungary',58.4085,86.27,-0.28,107.8658,54.15,3.12,194.8,67.7027,488.14,839.71),
    ('N','Ireland',0,0,0,50.8989,0,0,0,0,0,0),
    ('C','Italy',183.038,94.62,-0.1,725.0259,25.25,0,192,193.4434,1698.45,2914.24),
    ('C','Latvia',14.468,60.1,-0.04,11.5885,124.85,0,10.3,24.074,50,272),
    ('E','Netherlands',127.4521,91.73,0.01,350.6667,36.35,91.13,71.6,138.9411,1403.64,2786.51),
    ('C','Poland',35.8795,98.54,-0.03,232.4541,15.44,0,11.7,36.4103,345.03,595.86),
    ('C','Portugal',3.9003,98.32,0,58.6354,6.65,0,0,3.967,24,85.68),
    ('C','Romania',32.0722,97.8,-0.22,114.3571,28.05,4.88,78.4,32.7936,240.75,322.44),
    ('C','Slovakia',36.2293,93.26,0,53.2106,68.09,201.12,199.7,38.8476,410.96,491.56),
    ('E','Spain',33.9121,96.2,0.09,338.9865,10,30.29,0,35.2503,126.3,214.5),
    ('E','Sweden',0.0941,92.94,0,13.0475,0.72,0,0,0.1013,6.47,8.56),
    ('N','United Kingdom (Pre-Brexit)',0,0,0,0,0,0,0,0,0,0),
    ('E','Non-EU',114.0982,34.09,-0.11,1030.5274,11.07,51.21,405,334.6523,2793.09,2152.23),
    ('N','Serbia',0,0,0,0,0,0,0,0,0,0),
    ('C','Ukraine',103.6003,31.89,-0.12,261.0519,39.69,0,405,324.8835,2322.16,1650.45),
    ('E','United Kingdom (Post-Brexit)',10.498,100,0.52,769.4755,1.36,51.21,0,9.7688,470.93,501.7);

