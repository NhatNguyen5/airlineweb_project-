DROP TABLE IF EXISTS airport CASCADE;

DROP TABLE IF EXISTS boarding_passes CASCADE;

DROP TABLE IF EXISTS seats CASCADE;

DROP TABLE IF EXISTS aircraft CASCADE;

DROP TABLE IF EXISTS ticket CASCADE;

DROP TABLE IF EXISTS ticket_flights CASCADE;

DROP TABLE IF EXISTS bookings CASCADE;

DROP TABLE IF EXISTS flights CASCADE;

DROP TABLE IF EXISTS aircraft CASCADE; 

DROP TABLE IF EXISTS payment CASCADE; 

DROP TABLE IF EXISTS waitlist CASCADE; 

DROP TABLE IF EXISTS services CASCADE; 

DROP TABLE IF EXISTS ticket_price CASCADE; 

DROP TABLE IF EXISTS check_bag CASCADE; 

/*create tables*/
CREATE TABLE aircraft(
    aircraft_code char(3),
    model char(25),
    RANGE integer,
    PRIMARY KEY(aircraft_code),
    CONSTRAINT "flights_aircraft_code_fkey" FOREIGN KEY (aircraft_code) REFERENCES aircraft(aircraft_code) ON DELETE CASCADE,
    CONSTRAINT "seats_aircraft_code_fkey" FOREIGN KEY (aircraft_code) REFERENCES aircraft(aircraft_code) ON DELETE CASCADE
);

CREATE TABLE airport (
    airport_code char(3) NOT NULL,
    airport_name char(40),
    city char(20),
    coordinates point,
    timezone text,
    PRIMARY KEY (airport_code)
    /*
     ,CONSTRAINT "flights_arrival_airport_fkey"
     FOREIGN KEY (arrival_airport)
     REFERENCES airport(airport_code)
     ,CONSTRAINT "seats_aircraft_code_fkey" FOREIGN KEY (aircraft_code)
     REFERENCES aircraft(aircraft_code) ON DELETE CASCADE
     */
);

CREATE TABLE flights (
    flight_id integer NOT NULL,
    flight_no character(6) NOT NULL,
    scheduled_departure timestamp WITH time zone NOT NULL,
    scheduled_arrival timestamp WITH time zone NOT NULL,
    departure_airport character(3) NOT NULL,
    arrival_airport character(3) NOT NULL,
    STATUS character varying(20) NOT NULL,
    aircraft_code character(3) NOT NULL,
    seats_available integer NOT NULL,
    seats_booked integer NOT NULL,
    departure_gate character(3) NOT NULL,
    arrival_gate character(3) NOT NULL,
    PRIMARY KEY (flight_id),
    CONSTRAINT flights_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircraft(aircraft_code) ON DELETE CASCADE,
    CONSTRAINT flights_arrival_airport_fkey FOREIGN KEY (arrival_airport) REFERENCES airport(airport_code) ON DELETE CASCADE,
    CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES airport(airport_code) ON DELETE CASCADE,
    CONSTRAINT flights_check CHECK ((scheduled_arrival > scheduled_departure)),
    /*
     CONSTRAINT flights_check1 CHECK (
         (
             (actual_arrival IS NULL)
             OR (
                 (actual_departure IS NOT NULL)
                 AND (actual_arrival IS NOT NULL)
                 AND (actual_arrival > actual_departure)
             )
         )
     ),
     */
    CONSTRAINT flights_status_check CHECK (
        (
            (STATUS)::text = ANY (
                ARRAY [('On Time'::character varying)::text, ('Delayed'::character varying)::text, ('Departed'::character varying)::text, ('Arrived'::character varying)::text, ('Scheduled'::character varying)::text, ('Cancelled'::character varying)::text]
            )
        )
    )
);

CREATE TABLE bookings (
    book_ref character(6) NOT NULL,
    book_date timestamp WITH time zone NOT NULL,
    PRIMARY KEY(book_ref)
);

CREATE TABLE ticket(
    ticket_no char(13) NOT NULL,
    book_ref character(6) NOT NULL,
    passenger_id varchar(10) NOT NULL,
    passenger_name text NOT NULL,
    email char(50),
    phone char(15),
    PRIMARY KEY (ticket_no),
    CONSTRAINT "tickets_book_ref_fkey" FOREIGN KEY (book_ref) REFERENCES bookings(book_ref) ON DELETE CASCADE
);

CREATE TABLE ticket_flights (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    PRIMARY KEY (ticket_no, flight_id),
    CONSTRAINT ticket_flights_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE,
    CONSTRAINT ticket_flights_ticket_no_fkey FOREIGN KEY (ticket_no) REFERENCES ticket(ticket_no) ON DELETE CASCADE,
    

    
    CONSTRAINT ticket_flights_fare_conditions_check CHECK (
        (
            (fare_conditions)::text = ANY (
                ARRAY [('Economy'::character varying)::text, ('Comfort'::character varying)::text, ('Business'::character varying)::text]
            )
        )
    )
);

CREATE TABLE boarding_passes (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    boarding_no character(7) NOT NULL,
    seat_no character varying(4) NOT NULL,
    PRIMARY KEY(ticket_no, flight_id),
    CONSTRAINT boarding_passes_ticket_no_fkey FOREIGN KEY (ticket_no, flight_id) REFERENCES ticket_flights(ticket_no, flight_id) ON DELETE CASCADE
);

CREATE TABLE seats (
    aircraft_code character(3) NOT NULL,
    seat_no character varying(4) NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    PRIMARY KEY (aircraft_code, seat_no),
    CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircraft(aircraft_code) ON DELETE CASCADE,
    

    
    CONSTRAINT seats_fare_conditions_check CHECK (
        (
            (fare_conditions)::text = ANY (
                ARRAY [('Economy'::character varying)::text, ('Comfort'::character varying)::text, ('Business'::character varying)::text]
            )
        )
    )
);

CREATE TABLE payment(
    book_ref character(6) NOT NULL,
    card_no char(19) NOT NULL,
    taxes numeric(10,2),
    discount numeric(10,2),
    amount numeric(10,2),
    PRIMARY KEY(book_ref),
    CONSTRAINT "payment_book_ref_fkey" FOREIGN KEY (book_ref) REFERENCES bookings(book_ref) ON DELETE CASCADE
);

CREATE TABLE waitlist(
    wait_ref character(6) NOT NULL,
    book_date timestamp,
    total_amount numeric(10,2),
    PRIMARY KEY(wait_ref)
);

CREATE TABLE services(
    ticket_no character(13) NOT NULL,
    food character(3),
    wifi character(3),
    movie character(3),
    PRIMARY KEY(ticket_no),
    CONSTRAINT services_ticket_no_code_fkey FOREIGN KEY (ticket_no) REFERENCES ticket(ticket_no) ON DELETE CASCADE
);  

CREATE TABLE check_bag(
    ticket_no character(13) NOT NULL,
    bag_no integer,
    weight_amount integer,
    PRIMARY KEY(ticket_no),
    CONSTRAINT check_bag_ticket_no_code_fkey FOREIGN KEY (ticket_no) REFERENCES ticket(ticket_no) ON DELETE CASCADE
);

CREATE TABLE ticket_price(
    fare_conditions character varying(10) NOT NULL,
    price integer,
    PRIMARY KEY(fare_conditions)
);






INSERT INTO ticket_price
VALUES(
    'Economy',
    200
);

INSERT INTO ticket_price
VALUES(
    'Business',
    300
);

INSERT INTO ticket_price
VALUES(
    'Comfort',
    400
);


/* INSERT VALUES */
/*airport table */
INSERT INTO airport
VALUES (
        'HOU',
        'George Bush Airport',
        'Houston',
        NULL,
        'CT'
    );

INSERT INTO airport
VALUES (
        'JFK',
        'John F Kennedy Airport',
        'New York',
        NULL,
        'ET'
    );

INSERT INTO airport
VALUES (
        'LAX',
        'Los Angeles Airport',
        'Los Angeles',
        NULL,
        'PT'
    );

INSERT INTO airport
VALUES ('ORD', 'O Hare Airport', 'Chicago', NULL, 'CT');

INSERT INTO airport
VALUES ('MIA', 'Miami Airport', 'Miami', NULL, 'ET');

/*aircraft*/
INSERT INTO aircraft
VALUES ('773', 'Boeing 777-300', 11100);

INSERT INTO aircraft
VALUES ('763', 'Boeing 767-300', 7900);

INSERT INTO aircraft
VALUES ('SU9', 'Boeing 777-300', 5700);

INSERT INTO aircraft
VALUES ('320', 'Boeing 777-300', 6400);

INSERT INTO aircraft
VALUES ('321', 'Boeing 777-300', 6100);

/*flights table*/
INSERT INTO flights
VALUES (
        1001,
        'PG0010',
        '2020-12-01 09:50:00+03',
        '2020-12-01 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'G01',
        'E15'
    );
    
INSERT INTO flights
VALUES (
        1002,
        'PG0011',
        '2020-12-02 10:50:00+03',
        '2020-12-02 15:55:00+03',
        'HOU',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R05',
        'P01'
    );


INSERT INTO flights
VALUES (
        1003,
        'PG0012',
        '2020-12-03 16:50:00+03',
        '2020-12-03 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'R01',
        'W02'
    );

INSERT INTO flights
VALUES (
        1004,
        'PG0013',
        '2020-12-04 12:50:00+03',
        '2020-12-04 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'Q11',
        'R12'
    );

INSERT INTO flights
VALUES (
        1005,
        'PG0014',
        '2020-12-05 01:50:00+03',
        '2020-12-05 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'R01',
        'W02'
    );

INSERT INTO flights
VALUES (
        1006,
        'PG0015',
        '2020-12-06 08:50:00+03',
        '2020-12-06 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'T12',
        'W05'
    );

INSERT INTO flights
VALUES (
        1007,
        'PG0016',
        '2020-12-07 12:50:00+03',
        '2020-12-07 16:55:00+03',
        'JFK',
        'HOU',
        'Scheduled',
        '773',
        10,
        0,
        'R07',
        'G12'
    );

INSERT INTO flights
VALUES (
        1008,
        'PG0017',
        '2020-12-08 05:50:00+03',
        '2020-12-08 11:55:00+03',
        'JFK',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'C04',
        'D10'
    );

INSERT INTO flights
VALUES (
        1009,
        'PG0018',
        '2020-12-09 03:50:00+03',
        '2020-12-09 08:55:00+03',
        'MIA',
        'ORD',
        'Scheduled',
        'SU9',
        10,
        0,
        'R11',
        'W08'
    );

INSERT INTO flights
VALUES (
        1010,
        'PG0019',
        '2020-12-10 16:50:00+03',
        '2020-12-10 22:55:00+03',
        'ORD',
        'JFK',
        'Scheduled',
        '320',
        10,
        0,
        'G07',
        'T08'
    );

INSERT INTO flights
VALUES (
        1011,
        'PG0020',
        '2020-12-11 15:50:00+03',
        '2020-12-11 21:55:00+03',
        'LAX',
        'MIA',
        'Scheduled',
        '321',
        10,
        0,
        'T02',
        'H01'
    );




INSERT INTO flights
VALUES (
        1012,
        'PG0021',
        '2020-12-12 09:50:00+03',
        '2020-12-12 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'R05',
        'W13'
    );
    
INSERT INTO flights
VALUES (
        1013,
        'PG0022',
        '2020-12-12 05:50:00+03',
        '2020-12-12 09:55:00+03',
        'JFK',
        'MIA',
        'Scheduled',
        '773',
        10,
        0,
        'E04',
        'C08'
    );


INSERT INTO flights
VALUES (
        1014,
        'PG0023',
        '2020-12-14 16:50:00+03',
        '2020-12-14 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'D01',
        'E05'
    );

INSERT INTO flights
VALUES (
        1015,
        'PG0024',
        '2020-12-15 12:50:00+03',
        '2020-12-15 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'R02',
        'W09'
    );

INSERT INTO flights
VALUES (
        1016,
        'PG0025',
        '2020-12-16 01:50:00+03',
        '2020-12-16 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'E11',
        'C08'
    );

INSERT INTO flights
VALUES (
        1017,
        'PG0026',
        '2020-12-17 08:50:00+03',
        '2020-12-17 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'R14',
        'W17'
    );

INSERT INTO flights
VALUES (
        1018,
        'PG0027',
        '2020-12-18 12:50:00+03',
        '2020-12-18 16:55:00+03',
        'JFK',
        'HOU',
        'Scheduled',
        '773',
        10,
        0,
        'C08',
        'W08'
    );

INSERT INTO flights
VALUES (
        1019,
        'PG0028',
        '2020-12-19 05:50:00+03',
        '2020-12-19 11:55:00+03',
        'JFK',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R11',
        'E07'
    );

INSERT INTO flights
VALUES (
        1020,
        'PG0029',
        '2020-12-20 03:50:00+03',
        '2020-12-20 08:55:00+03',
        'MIA',
        'ORD',
        'Scheduled',
        'SU9',
        10,
        0,
        'R01',
        'W02'
    );

INSERT INTO flights
VALUES (
        1021,
        'PG0030',
        '2020-12-21 16:50:00+03',
        '2020-12-21 22:55:00+03',
        'ORD',
        'JFK',
        'Scheduled',
        '320',
        10,
        0,
        'C11',
        'S02'
    );

INSERT INTO flights
VALUES (
        1022,
        'PG0031',
        '2020-12-22 15:50:00+03',
        '2020-12-22 21:55:00+03',
        'LAX',
        'MIA',
        'Scheduled',
        '321',
        10,
        0,
        'P01',
        'T12'
    );




INSERT INTO flights
VALUES (
        1023,
        'PG0032',
        '2020-12-23 09:50:00+03',
        '2020-12-23 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'F02',
        'R01'
    );
    
INSERT INTO flights
VALUES (
        1024,
        'PG0033',
        '2020-12-24 10:50:00+03',
        '2020-12-24 15:55:00+03',
        'HOU',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R10',
        'W09'
    );


INSERT INTO flights
VALUES (
        1025,
        'PG0034',
        '2020-12-25 16:50:00+03',
        '2020-12-25 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'F01',
        'W02'
    );

INSERT INTO flights
VALUES (
        1026,
        'PG0035',
        '2020-12-26 12:50:00+03',
        '2020-12-26 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'R01',
        'F04'
    );

INSERT INTO flights
VALUES (
        1027,
        'PG0036',
        '2020-12-27 01:50:00+03',
        '2020-12-27 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'D07',
        'D02'
    );

INSERT INTO flights
VALUES (
        1028,
        'PG0037',
        '2020-12-28 08:50:00+03',
        '2020-12-28 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'R03',
        'W07'
    );

INSERT INTO flights
VALUES (
        1029,
        'PG0038',
        '2020-12-29 12:50:00+03',
        '2020-12-29 16:55:00+03',
        'JFK',
        'HOU',
        'Scheduled',
        '773',
        10,
        0,
        'T05',
        'T07'
    );

INSERT INTO flights
VALUES (
        1030,
        'PG0039',
        '2020-12-30 05:50:00+03',
        '2020-12-30 11:55:00+03',
        'JFK',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R07',
        'C09'
    );

INSERT INTO flights
VALUES (
        1031,
        'PG0040',
        '2021-01-01 03:50:00+03',
        '2021-01-01 08:55:00+03',
        'MIA',
        'ORD',
        'Scheduled',
        'SU9',
        10,
        0,
        'E04',
        'W02'
    );

INSERT INTO flights
VALUES (
        1032,
        'PG0041',
        '2021-01-02 16:50:00+03',
        '2021-01-02 22:55:00+03',
        'ORD',
        'JFK',
        'Scheduled',
        '320',
        10,
        0,
        'R01',
        'E08'
    );

INSERT INTO flights
VALUES (
        1033,
        'PG0042',
        '2021-01-03 15:50:00+03',
        '2021-01-03 21:55:00+03',
        'LAX',
        'MIA',
        'Scheduled',
        '321',
        10,
        0,
        'Q08',
        'C09'
    );





INSERT INTO flights
VALUES (
        1034,
        'PG0043',
        '2021-01-04 09:50:00+03',
        '2021-01-04 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'S08',
        'F07'
    );
    
INSERT INTO flights
VALUES (
        1035,
        'PG0044',
        '2021-01-05 10:50:00+03',
        '2021-01-05 15:55:00+03',
        'HOU',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R04',
        'D02'
    );


INSERT INTO flights
VALUES (
        1036,
        'PG0045',
        '2021-01-06 16:50:00+03',
        '2021-01-06 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'C03',
        'S12'
    );

INSERT INTO flights
VALUES (
        1037,
        'PG0046',
        '2021-01-07 12:50:00+03',
        '2021-01-07 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'R03',
        'S16'
    );

INSERT INTO flights
VALUES (
        1038,
        'PG0047',
        '2021-01-08 01:50:00+03',
        '2021-01-08 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'H17',
        'T11'
    );

INSERT INTO flights
VALUES (
        1039,
        'PG0048',
        '2021-01-09 08:50:00+03',
        '2021-01-09 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'Q01',
        'D02'
    );

INSERT INTO flights
VALUES (
        1040,
        'PG0049',
        '2021-01-10 12:50:00+03',
        '2021-01-10 16:55:00+03',
        'JFK',
        'HOU',
        'Scheduled',
        '773',
        10,
        0,
        'R11',
        'Q03'
    );

INSERT INTO flights
VALUES (
        1041,
        'PG0050',
        '2021-01-11 05:50:00+03',
        '2021-01-11 11:55:00+03',
        'JFK',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'D18',
        'S10'
    );

INSERT INTO flights
VALUES (
        1042,
        'PG0051',
        '2021-01-12 03:50:00+03',
        '2021-01-12 08:55:00+03',
        'MIA',
        'ORD',
        'Scheduled',
        'SU9',
        10,
        0,
        'F11',
        'W11'
    );

INSERT INTO flights
VALUES (
        1043,
        'PG0052',
        '2021-01-13 16:50:00+03',
        '2021-01-13 22:55:00+03',
        'ORD',
        'JFK',
        'Scheduled',
        '320',
        10,
        0,
        'R11',
        'C11'
    );

INSERT INTO flights
VALUES (
        1044,
        'PG0053',
        '2021-01-14 15:50:00+03',
        '2021-01-14 21:55:00+03',
        'LAX',
        'MIA',
        'Scheduled',
        '321',
        10,
        0,
        'S11',
        'Q12'
    );



INSERT INTO flights
VALUES (
        1045,
        'PG0054',
        '2021-01-15 09:50:00+03',
        '2021-01-15 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'E14',
        'W08'
    );
    
INSERT INTO flights
VALUES (
        1046,
        'PG0055',
        '2021-01-16 10:50:00+03',
        '2021-01-16 15:55:00+03',
        'HOU',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'A01',
        'W02'
    );


INSERT INTO flights
VALUES (
        1047,
        'PG0056',
        '2021-01-17 16:50:00+03',
        '2021-01-17 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'A08',
        'B02'
    );

INSERT INTO flights
VALUES (
        1048,
        'PG0057',
        '2021-01-18 12:50:00+03',
        '2021-01-18 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'A08',
        'C03'
    );

INSERT INTO flights
VALUES (
        1049,
        'PG0058',
        '2021-01-19 01:50:00+03',
        '2021-01-19 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'Q09',
        'A05'
    );

INSERT INTO flights
VALUES (
        1050,
        'PG0059',
        '2021-01-20 08:50:00+03',
        '2021-01-20 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'A06',
        'R07'
    );

INSERT INTO flights
VALUES (
        1051,
        'PG0060',
        '2021-01-21 12:50:00+03',
        '2021-01-21 16:55:00+03',
        'JFK',
        'HOU',
        'Scheduled',
        '773',
        10,
        0,
        'A09',
        'C13'
    );

INSERT INTO flights
VALUES (
        1052,
        'PG0061',
        '2021-01-22 05:50:00+03',
        '2021-01-22 11:55:00+03',
        'JFK',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'N01',
        'H02'
    );

INSERT INTO flights
VALUES (
        1053,
        'PG0062',
        '2021-01-23 03:50:00+03',
        '2021-01-23 08:55:00+03',
        'MIA',
        'ORD',
        'Scheduled',
        'SU9',
        10,
        0,
        'H07',
        'A04'
    );

INSERT INTO flights
VALUES (
        1054,
        'PG0063',
        '2021-01-24 16:50:00+03',
        '2021-01-24 22:55:00+03',
        'ORD',
        'JFK',
        'Scheduled',
        '320',
        10,
        0,
        'G01',
        'H07'
    );

INSERT INTO flights
VALUES (
        1055,
        'PG0064',
        '2021-01-25 15:50:00+03',
        '2021-01-25 21:55:00+03',
        'LAX',
        'MIA',
        'Scheduled',
        '321',
        10,
        0,
        'A07',
        'G02'
    );




INSERT INTO flights
VALUES (
        1056,
        'PG0065',
        '2021-01-26 09:50:00+03',
        '2021-01-26 14:55:00+03',
        'HOU',
        'JFK',
        'Scheduled',
        '773',
        10,
        0,
        'B11',
        'H09'
    );
    
INSERT INTO flights
VALUES (
        1057,
        'PG0066',
        '2021-01-27 10:50:00+03',
        '2021-01-27 15:55:00+03',
        'HOU',
        'LAX',
        'Scheduled',
        '763',
        10,
        0,
        'R07',
        'H02'
    );


INSERT INTO flights
VALUES (
        1058,
        'PG0067',
        '2021-01-28 16:50:00+03',
        '2021-01-28 21:55:00+03',
        'LAX',
        'JFK',
        'Scheduled',
        '763',
        10,
        0,
        'W07',
        'H02'
    );

INSERT INTO flights
VALUES (
        1059,
        'PG0068',
        '2021-01-29 12:50:00+03',
        '2021-01-29 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0,
        'T07',
        'H02'
    );

INSERT INTO flights
VALUES (
        1060,
        'PG0069',
        '2021-01-30 01:50:00+03',
        '2021-01-30 06:55:00+03',
        'JFK',
        'ORD',
        'Scheduled',
        '320',
        10,
        0,
        'H03',
        'F09'
    );

INSERT INTO flights
VALUES (
        1061,
        'PG0070',
        '2021-01-31 08:50:00+03',
        '2021-01-31 12:55:00+03',
        'MIA',
        'LAX',
        'Scheduled',
        '321',
        10,
        0,
        'N07',
        'D07'
    );

/*
INSERT INTO flights
VALUES (
        1062,
        'PG0071',
        '2020-12-31 12:50:00+03',
        '2020-12-31 17:55:00+03',
        'ORD',
        'MIA',
        'Scheduled',
        'SU9',
        10,
        0
    );
*/

INSERT INTO seats
VALUES (
        '773',
        'A01',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '773',
        'A02',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '773',
        'B01',
        'Business'
    );

INSERT INTO seats
VALUES (
        '773',
        'B02',
        'Business'
    );

INSERT INTO seats
VALUES (
        '773',
        'B03',
        'Business'
    );

INSERT INTO seats
VALUES (
        '773',
        'C01',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '773',
        'C02',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '773',
        'C03',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '773',
        'C04',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '773',
        'C05',
        'Economy'
    );

/* -------------------------------------------------------------- */

INSERT INTO seats
VALUES (
        '763',
        'A01',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '763',
        'A02',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '763',
        'B01',
        'Business'
    );

INSERT INTO seats
VALUES (
        '763',
        'B02',
        'Business'
    );

INSERT INTO seats
VALUES (
        '763',
        'B03',
        'Business'
    );

INSERT INTO seats
VALUES (
        '763',
        'C01',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '763',
        'C02',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '763',
        'C03',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '763',
        'C04',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '763',
        'C05',
        'Economy'
    );

/* -------------------------------------------------------------- */

INSERT INTO seats
VALUES (
        'SU9',
        'A01',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'A02',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'B01',
        'Business'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'B02',
        'Business'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'B03',
        'Business'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'C01',
        'Economy'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'C02',
        'Economy'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'C03',
        'Economy'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'C04',
        'Economy'
    );

INSERT INTO seats
VALUES (
        'SU9',
        'C05',
        'Economy'
    );

/* -------------------------------------------------------------- */

INSERT INTO seats
VALUES (
        '320',
        'A01',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '320',
        'A02',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '320',
        'B01',
        'Business'
    );

INSERT INTO seats
VALUES (
        '320',
        'B02',
        'Business'
    );

INSERT INTO seats
VALUES (
        '320',
        'B03',
        'Business'
    );

INSERT INTO seats
VALUES (
        '320',
        'C01',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '320',
        'C02',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '320',
        'C03',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '320',
        'C04',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '320',
        'C05',
        'Economy'
    );

/* -------------------------------------------------------------- */

INSERT INTO seats
VALUES (
        '321',
        'A01',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '321',
        'A02',
        'Comfort'
    );

INSERT INTO seats
VALUES (
        '321',
        'B01',
        'Business'
    );

INSERT INTO seats
VALUES (
        '321',
        'B02',
        'Business'
    );

INSERT INTO seats
VALUES (
        '321',
        'B03',
        'Business'
    );

INSERT INTO seats
VALUES (
        '321',
        'C01',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '321',
        'C02',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '321',
        'C03',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '321',
        'C04',
        'Economy'
    );

INSERT INTO seats
VALUES (
        '321',
        'C05',
        'Economy'
    );

/* -------------------------------------------------------------- */