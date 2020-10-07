SELECT w1.id          AS w1_id,
       w1.account_id  AS w1_account_id,
       w1.occurred_at AS w1_occurred_at,
       w1.channel     AS w1_channel,
       w2.id          AS w2_id,
       w2.account_id  AS w2_account_id,
       w2.occurred_at AS w2_occurred_at,
       w2.channel     AS w2_channel
FROM web_events w1
LEFT JOIN web_events w2
    ON w1.account_id = w2.account_id
    AND w1.occurred_at > w2.occurred_at
    AND w1.occurred_at <= w2.occurred_at + INTERVAL '1 day'
ORDER BY w1.account_id, w1.occurred_at