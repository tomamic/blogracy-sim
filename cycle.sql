SELECT @t:=value FROM system WHERE name = 't';

# connect/disconnect
UPDATE node SET online = 0, countdown = FLOOR(minoffline + (RAND() * (maxoffline-minoffline))) WHERE online = 1 AND countdown = 0;
UPDATE node SET online = 1, countdown = FLOOR(minonline + (RAND() * (maxonline-minonline))) WHERE online = 0 AND countdown = 0;

# generate new messages
INSERT INTO message (src, created, available) SELECT id, @t, 0 FROM node WHERE online = 1 AND FLOOR(RAND() * 100) = 0;

# count available seeds
UPDATE message SET available = (SELECT COUNT(*) FROM node WHERE node.id = message.src and online = 1);
UPDATE message SET available = available + (SELECT COUNT(*) FROM delivery, node WHERE delivery.src = message.src AND delivery.created = message.created AND received > 0 AND dst = id and online = 1);

# create deliveries
INSERT INTO delivery (src, dst, created, received, optimal) SELECT message.src, edge.a, message.created, 0, 0 FROM message, edge WHERE edge.b = message.src AND created = @t;

# mark optimal reception time, to detect missed deliveries (churn)
UPDATE delivery, node SET optimal = @t WHERE dst = id AND online = 1 AND received = 0 AND optimal = 0;

# deliver to online users
UPDATE delivery, message, node SET received = @t WHERE received = 0 AND delivery.dst = node.id AND online = 1 AND message.src = delivery.src AND message.created = delivery.created AND available > 0;

# advance time
UPDATE system SET value = value + 1 WHERE name = 't';
UPDATE node SET countdown = countdown - 1;
