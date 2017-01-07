CREATE TABLE shuttles (
    id       integer,
    blue     interval,
    cus      interval,
    otc      interval,
    work     interval
);

\copy shuttles FROM 'data/shuttle_wide_db.csv' WITH CSV HEADER;

CREATE TABLE calendar (
    service_id   varchar (30) NOT NULL,
    monday       integer NOT NULL,
    tuesday      integer NOT NULL,
    wednesday    integer NOT NULL,
    thursday     integer NOT NULL,
    friday       integer NOT NULL,
    saturday     integer NOT NULL,
    sunday       integer NOT NULL,
    start_date   date NOT NULL,
    end_date     date NOT NULL
);

\copy calendar FROM 'data/schedule/calendar.txt' WITH CSV HEADER DELIMITER AS ',';

CREATE TABLE stop_times (

    trip_id           varchar(30),
    arrival_time      interval, 
    departure_time    interval,
    stop_id           varchar(30),
    stop_sequence     integer,
    pickup_type       integer,
    drop_off_type     integer,
    center_boarding   integer,
    south_boarding    integer,
    bikes_allowed     integer,
    notice            integer
);

\copy stop_times FROM 'data/schedule/stop_times.txt' WITH CSV HEADER DELIMITER AS ',';

CREATE TABLE routes (
    route_id             varchar(10),
    route_short_name     varchar(10),
    route_long_name      varchar(30),
    route_desc           varchar(60),
    agency_id            varchar(10),
    route_type           integer,
    route_color          char(6),
    route_text_color     char(6),
    route_url            varchar(50)
);

\copy routes FROM 'data/schedule/routes.txt' WITH CSV HEADER DELIMITER AS ',';

CREATE TABLE stops (
    stop_id               varchar(30),
    stop_name             varchar(30),
    stop_desc             varchar(60),
    stop_lat              double precision,
    stop_lon              double precision,
    zone_id               char(1),
    stop_url              varchar(100),
    wheelchair_boarding   integer
);

\copy stops FROM 'data/schedule/stops.txt' WITH CSV HEADER DELIMITER AS ',';

CREATE TABLE trips (
    route_id       varchar(10),
    service_id     varchar(30),
    trip_id        varchar(30),
    trip_headsign  varchar(40),
    block_id       varchar(30),
    shape_id       varchar(10),
    direction_id   integer
);

\copy trips FROM 'data/schedule/trips.txt' WITH CSV HEADER DELIMITER AS ',';
