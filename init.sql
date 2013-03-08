# randomize users'' profile, status and countdown before starting
# normally: 1h online, 11h offline
UPDATE `node` SET online = FLOOR(RAND() * 2), minonline = 8, maxonline = 16, minoffline = 92, maxoffline = 172, countdown = FLOOR(RAND() * 10);
# 10% of population: 8h online, 16h offline
UPDATE `node` SET minonline = 67, maxonline = 125, minoffline = 134, maxoffline = 250 WHERE RAND() < 0.10;
