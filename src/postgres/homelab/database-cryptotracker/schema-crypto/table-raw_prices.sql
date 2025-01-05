-- Table: crypto.raw_prices

-- DROP TABLE IF EXISTS crypto.raw_prices;

CREATE TABLE IF NOT EXISTS crypto.raw_prices
(
    symbol_from text COLLATE pg_catalog."default",
    symbol_to text COLLATE pg_catalog."default",
    price_epoch integer,
    price_ts_utc timestamp without time zone,
    price_ts_local timestamp without time zone,
    price numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS crypto.raw_prices
    OWNER to postgres;