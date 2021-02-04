SELECT * FROM flights 
              WHERE flight_id = 1012;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT * FROM flights 
              WHERE flight_id = 1012;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1012) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1012) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1012) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1012) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
SELECT * FROM flights 
              WHERE flight_id = 1012;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT * FROM ticket 
              WHERE book_ref = '000001';
SELECT * FROM payment 
              WHERE book_ref = '000001';
SELECT boarding_passes.ticket_no, flight_id, boarding_no, seat_no
          FROM boarding_passes LEFT JOIN
            (SELECT ticket_no FROM ticket WHERE book_ref = '000001')
          AS b ON boarding_passes.ticket_no = b.ticket_no
          WHERE b.ticket_no IS NOT NULL;
SELECT * FROM flights 
              ORDER BY flight_id;
SELECT * FROM flights 
              ORDER BY flight_id;
SELECT * FROM flights;
SELECT DISTINCT arrival_airport FROM flights 
            WHERE departure_airport = 'HOU';
SELECT airport_code FROM airport;
SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = 'HOU';
SELECT airport_code FROM airport;
SELECT DISTINCT arrival_airport FROM flights 
            WHERE departure_airport = 'HOU';
SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = 'JFK';
SELECT * FROM flights 
            WHERE departure_airport = 'HOU' AND arrival_airport = 'JFK';
SELECT airport_code FROM airport;
SELECT * FROM flights 
            WHERE departure_airport = 'HOU';
SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = 'JFK';
SELECT * FROM flights 
            WHERE departure_airport = 'HOU' AND arrival_airport = 'JFK';
SELECT * FROM flights 
              WHERE flight_id = 1023;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = '0')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Economy')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Economy';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Economy')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Comfort')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
 SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = 1023) 
                    AND 
                    fare_conditions = 'Business')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = 1023) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Economy';
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
SELECT price FROM ticket_price WHERE fare_conditions = 'Comfort';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Business';
SELECT price FROM ticket_price WHERE fare_conditions = 'Economy';
SELECT * FROM flights 
              WHERE flight_id = 1023;
SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;
SELECT DISTINCT arrival_airport FROM flights 
            WHERE departure_airport = 'HOU';
SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = 'JFK';
SELECT * FROM flights 
            WHERE departure_airport = 'HOU' AND arrival_airport = 'JFK';
SELECT * FROM ticket 
              WHERE book_ref = '000001';
SELECT * FROM payment 
              WHERE book_ref = '000001';
SELECT boarding_passes.ticket_no, flight_id, boarding_no, seat_no
          FROM boarding_passes LEFT JOIN
            (SELECT ticket_no FROM ticket WHERE book_ref = '000001')
          AS b ON boarding_passes.ticket_no = b.ticket_no
          WHERE b.ticket_no IS NOT NULL;
SELECT * FROM ticket 
              WHERE book_ref = '000001';
SELECT * FROM payment 
              WHERE book_ref = '000001';
SELECT boarding_passes.ticket_no, flight_id, boarding_no, seat_no
          FROM boarding_passes LEFT JOIN
            (SELECT ticket_no FROM ticket WHERE book_ref = '000001')
          AS b ON boarding_passes.ticket_no = b.ticket_no
          WHERE b.ticket_no IS NOT NULL;
SELECT DISTINCT arrival_airport FROM flights 
            WHERE departure_airport = 'HOU';
SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = 'JFK';
SELECT * FROM flights 
            WHERE departure_airport = 'HOU' AND arrival_airport = 'JFK';
SELECT * FROM flights 
              ORDER BY flight_id;
