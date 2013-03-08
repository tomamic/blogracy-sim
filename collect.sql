# count pending deliveries
UPDATE message SET pending = (SELECT COUNT(*) FROM delivery WHERE delivery.src = message.src AND delivery.created = message.created);

# copy completed deliveries into log
INSERT INTO log (src, dst, created, received, optimal) SELECT src, dst, created, received, optimal FROM delivery WHERE (src, created) IN (SELECT src, created FROM message WHERE pending = 0);

# remove old messages from delivery table
DELETE FROM delivery WHERE (src, created) IN (SELECT src, created FROM message WHERE pending = 0);

# get aggregate results
SELECT AVG(received - optimal), STDDEV(received - optimal) FROM `log`;

