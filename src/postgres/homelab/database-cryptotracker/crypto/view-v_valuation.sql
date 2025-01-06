-- View: crypto.v_valuation

-- DROP VIEW crypto.v_valuation;

CREATE OR REPLACE VIEW crypto.v_valuation
 AS
 WITH cte_calc_valuation AS (
         SELECT p.price_ts_utc,
            h.symbol,
            h.holding * p.price AS valuation
           FROM crypto.raw_prices p
             JOIN crypto.raw_holdings h ON p.symbol_from = h.symbol
        )
 SELECT price_ts_utc,
    sum(valuation) AS total_valuation
   FROM cte_calc_valuation
  GROUP BY price_ts_utc;

ALTER TABLE crypto.v_valuation
    OWNER TO postgres;
