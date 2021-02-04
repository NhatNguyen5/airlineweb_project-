INSERT INTO bookings VALUES('000001',current_timestamp);
            START TRANSACTION;
              INSERT INTO ticket VALUES('AB1000','000001','BB100000','asd asd','asd@asd123',123123);
              INSERT INTO ticket_flights VALUES('AB1000',1012,'Comfort');
              INSERT INTO boarding_passes VALUES('AB1000',1012,'BD10000','A01');
              UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1012;
              UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1012;
              SELECT * FROM bookings;
INSERT INTO payment VALUES('000001','1231231231231231',32,0,432);
              SELECT * FROM payment;
COMMIT;
START TRANSACTION;
              UPDATE flights SET seats_available = seats_available+1 WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '000001' LIMIT 1));
              UPDATE flights SET seats_booked=seats_booked-1 WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '000001' LIMIT 1));
              DELETE FROM bookings WHERE book_ref = '000001';
            COMMIT;
INSERT INTO bookings VALUES('000001',current_timestamp);
            START TRANSACTION;
              INSERT INTO ticket VALUES('AB1000','000001','BB100000','John Doe','jdoe@mail',12314567612);
              INSERT INTO ticket_flights VALUES('AB1000',1023,'Comfort');
              INSERT INTO boarding_passes VALUES('AB1000',1023,'BD10000','A01');
              UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1023;
              UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1023;
              SELECT * FROM bookings;
INSERT INTO ticket VALUES('AB1001       ','000001','BB100001','qweasdawd awdawd','awd@asdqawe',125125121);
          INSERT INTO ticket_flights VALUES('AB1001       ',1023,'Comfort');
          INSERT INTO boarding_passes VALUES('AB1001       ',1023,'BD10001','A02');
          UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1023;
          UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1023;
          SELECT * FROM bookings;
INSERT INTO ticket VALUES('AB1002       ','000001','BB100002','qweasd qweqras','aweawr@asdaraw',1251521241);
          INSERT INTO ticket_flights VALUES('AB1002       ',1023,'Business');
          INSERT INTO boarding_passes VALUES('AB1002       ',1023,'BD10002','B01');
          UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1023;
          UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1023;
          SELECT * FROM bookings;
INSERT INTO ticket VALUES('AB1003       ','000001','BB100003','asdawrawr asdaweqw','qwrqtrs@asatawra',123141125415);
          INSERT INTO ticket_flights VALUES('AB1003       ',1023,'Business');
          INSERT INTO boarding_passes VALUES('AB1003       ',1023,'BD10003','B02');
          UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1023;
          UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1023;
          SELECT * FROM bookings;
INSERT INTO ticket VALUES('AB1004       ','000001','BB100004','qweasdawra qweawdasd','qwrtastat@asrawr',12412551251251);
          INSERT INTO ticket_flights VALUES('AB1004       ',1023,'Economy');
          INSERT INTO boarding_passes VALUES('AB1004       ',1023,'BD10004','C01');
          UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=1023;
          UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=1023;
          SELECT * FROM bookings;
INSERT INTO payment VALUES('000001','1231231231231231',115.2,160,1555.2);
              SELECT * FROM payment;
COMMIT;
START TRANSACTION;
              UPDATE flights SET seats_available = seats_available+5 WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '000001' LIMIT 1));
              UPDATE flights SET seats_booked=seats_booked-5 WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '000001' LIMIT 1));
              DELETE FROM bookings WHERE book_ref = '000001';
            COMMIT;
