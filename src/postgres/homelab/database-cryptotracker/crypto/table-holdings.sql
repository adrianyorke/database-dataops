-- Table: crypto.holdings

-- DROP TABLE IF EXISTS crypto.holdings;

CREATE TABLE IF NOT EXISTS crypto.holdings
(
    symbol text COLLATE pg_catalog."default",
    currency text COLLATE pg_catalog."default",
    holding numeric(38,10),
    transaction_total_eur numeric(38,2)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crypto.holdings
    OWNER to postgres;