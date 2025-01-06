-- View: crypto.v_price_last_in_hour

-- DROP VIEW crypto.v_price_last_in_hour;

CREATE OR REPLACE VIEW crypto.v_price_last_in_hour
 AS
 WITH price_hour_cte AS (
         SELECT rp.symbol_from,
            rp.symbol_to,
            rp.price_ts_utc,
            date_trunc('hour'::text, rp.price_ts_utc) AS price_utc_hour,
            max(rp.price_ts_utc) OVER (PARTITION BY (date_trunc('hour'::text, rp.price_ts_utc))) AS price_ts_utc_last_in_hour,
            rp.price
           FROM crypto.raw_prices rp
          WHERE rp.price_ts_utc >= (now() - '7 days'::interval)
        )
 SELECT symbol_from,
    symbol_to,
    price_ts_utc,
    price_utc_hour,
    price_ts_utc_last_in_hour,
    price
   FROM price_hour_cte
  WHERE price_ts_utc = price_ts_utc_last_in_hour
  ORDER BY price_ts_utc DESC;

ALTER TABLE crypto.v_price_last_in_hour
    OWNER TO postgres;
