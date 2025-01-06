-- Table: iot.sensor_reading

-- DROP TABLE IF EXISTS iot.sensor_reading;

CREATE TABLE IF NOT EXISTS iot.sensor_reading
(
    datetime_epoch integer NOT NULL,
    datetime_utc text COLLATE pg_catalog."default" NOT NULL,
    datetime_local text COLLATE pg_catalog."default" NOT NULL,
    sensor_desc text COLLATE pg_catalog."default" NOT NULL,
    reading_desc text COLLATE pg_catalog."default" NOT NULL,
    reading_1 real,
    reading_2 real,
    reading_3 real
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS iot.sensor_reading
    OWNER to postgres;
