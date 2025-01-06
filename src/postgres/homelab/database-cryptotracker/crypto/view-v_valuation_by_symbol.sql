-- View: crypto.v_valuation_by_symbol

-- DROP VIEW crypto.v_valuation_by_symbol;

CREATE OR REPLACE VIEW crypto.v_valuation_by_symbol
 AS
 WITH cte_calc_valuation AS (
         SELECT p.price_ts_utc,
            h.symbol,
            h.holding * p.price AS valuation
           FROM crypto.raw_prices p
             JOIN crypto.raw_holdings h ON p.symbol_from = h.symbol
        )
 SELECT price_ts_utc,
    symbol,
    sum(valuation) AS total_valuation
   FROM cte_calc_valuation
  GROUP BY price_ts_utc, symbol;

ALTER TABLE crypto.v_valuation_by_symbol
    OWNER TO postgres;
