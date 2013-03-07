# get aggregate results
SELECT AVG(received - optimal), STDDEV(received - optimal) FROM `delivery` WHERE received > 0;
