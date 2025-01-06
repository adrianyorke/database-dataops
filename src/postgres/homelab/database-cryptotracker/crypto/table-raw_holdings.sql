-- Table: crypto.raw_holdings

-- DROP TABLE IF EXISTS crypto.raw_holdings;

CREATE TABLE IF NOT EXISTS crypto.raw_holdings
(
    symbol text COLLATE pg_catalog."default",
    holding numeric(38,10),
    transaction_total_eur numeric(38,2)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crypto.raw_holdings
    OWNER to postgres;