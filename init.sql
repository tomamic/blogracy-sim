# randomize users'' profile, status and countdown before starting
# normally: 30m online, 11h:30m offline
UPDATE `node` SET online = FLOOR(RAND() * 2), minonline = 4, maxonline = 8, minoffline = 98, maxoffline = 178, countdown = FLOOR(RAND() * 10);
# 5% of population: 8h online, 16h offline
UPDATE `node` SET minonline = 67, maxonline = 125, minoffline = 134, maxoffline = 250 WHERE RAND() < 0.05;
