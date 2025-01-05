-- Table: crypto.raw_currencies

-- DROP TABLE IF EXISTS crypto.raw_currencies;

CREATE TABLE IF NOT EXISTS crypto.raw_currencies
(
    symbol text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crypto.raw_currencies
    OWNER to postgres;

COMMENT ON COLUMN crypto.raw_currencies.symbol
    IS 'currency symbol';

COMMENT ON COLUMN crypto.raw_currencies.name
    IS 'currency name';