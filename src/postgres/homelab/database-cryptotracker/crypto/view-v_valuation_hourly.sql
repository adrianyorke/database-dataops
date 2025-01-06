-- View: crypto.v_valuation_hourly

-- DROP VIEW crypto.v_valuation_hourly;

CREATE OR REPLACE VIEW crypto.v_valuation_hourly
 AS
 WITH cte_calc_valuation AS (
         SELECT p.price_ts_utc,
            h.symbol,
            h.holding * p.price AS valuation
           FROM crypto.v_price_last_in_hour p
             JOIN crypto.raw_holdings h ON p.symbol_from = h.symbol
        )
 SELECT price_ts_utc,
    sum(valuation) AS total_valuation
   FROM cte_calc_valuation
  GROUP BY price_ts_utc;

ALTER TABLE crypto.v_valuation_hourly
    OWNER TO postgres;
