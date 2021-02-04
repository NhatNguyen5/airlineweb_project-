const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./db');
const fs = require('fs');
const { exit } = require('process');

if(pool.options.user == "")
  exit();

// middleware
app.use(cors());
app.use(express.json());      //req.body

//get all flights
app.get('/flightss', async (req, res) => {
  try {
    var a = `SELECT * FROM flights 
              ORDER BY flight_id;`;
    const allFlights = await pool.query(a);
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in ");
    console.log(err.message);
  }
  //fs.appendFileSync('airlineweb.sql', a + "\n");
  //await 
});
//get a flights by id
app.get('/flightss/:id', async (req, res) => {
  try {
    const { id } = req.params;
    var a = `SELECT * FROM flights 
              WHERE flight_id = ${id};`;
    const allFlights = await pool.query(a);
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in flightss id");
    console.log(err.message);
  }
});

//get customer info
app.get('/cust/:id', async (req, res) => {
  try {
    const { id } = req.params;
    var a = `SELECT * FROM ticket 
              WHERE book_ref = '${id}';`;
    const allFlights = await pool.query(a);
    res.json(allFlights.rows);
    if(allFlights.rows[0] != null)
      console.log(id + ' was looked up!');
    writeToQuery(a);
  } catch (err) {
    console.log("Err in cust");
    console.log(err.message);
  }
});

app.get('/cust1/:id', async (req, res) => {
  try {
    const { id } = req.params;
    var a = `SELECT * FROM payment 
              WHERE book_ref = '${id}';`
    const allFlights = await pool.query(a);
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in cust1");
    console.log(err.message);
  }
});

app.get('/cust2/:id', async (req, res) => {
  try {
    const { id } = req.params;
    a = `SELECT boarding_passes.ticket_no, flight_id, boarding_no, seat_no
          FROM boarding_passes LEFT JOIN
            (SELECT ticket_no FROM ticket WHERE book_ref = '${id}')
          AS b ON boarding_passes.ticket_no = b.ticket_no
          WHERE b.ticket_no IS NOT NULL;`
    const allFlights = await pool.query(a);
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in cust2");
    console.log(err.message);
  }
});

app.delete("/cancelCust/:id", async (req, res) => {
  try {
    const { id } = req.params;
    var dep = id.split(",")[0];
    var arr = id.split(",")[1];
    var a = `START TRANSACTION;
              UPDATE flights SET seats_available = seats_available+${arr} WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '${dep}' LIMIT 1));
              UPDATE flights SET seats_booked=seats_booked-${arr} WHERE flight_id = 
                  (SELECT flight_id FROM boarding_passes WHERE ticket_no =
                      (SELECT ticket_no FROM ticket WHERE book_ref = '${dep}' LIMIT 1));
              DELETE FROM bookings WHERE book_ref = '${dep}';
            COMMIT;`
    const deleteTodo = await pool.query(a);
    res.json("Book_ref and all related was deleted!");
    console.log(dep + " deleted!");
    writeToTransaction(a);
  } catch (err) {
    console.log("Err in cancelCust");
    console.log(err.message);
  }
});



app.get("/price/:fcd", async (req, res) => {
  try {
    const { fcd } = req.params;
    var a = `SELECT price FROM ticket_price WHERE fare_conditions = '${fcd}';`;
    const classPrices = await pool.query(a);
    res.json(classPrices.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in price");
    console.log(err.message)
  }
});



app.get('/search/:fac', async (req, res) => {
  try {
    const { fac } = req.params;
    var dep = fac.split(',')[0];
    var arr = fac.split(',')[1];
    var a = "";
    if (dep == "Any" && arr != "Any") {
      a = `SELECT * FROM flights 
            WHERE arrival_airport = '${arr}';`;
    }
    else if (dep != "Any" && arr == "Any") {
      a = `SELECT * FROM flights 
            WHERE departure_airport = '${dep}';`;
    }
    else if (dep == "Any" && arr == "Any") {
      a = `SELECT * FROM flights;`;
    }
    else {
      a = `SELECT * FROM flights 
            WHERE departure_airport = '${dep}' AND arrival_airport = '${arr}';`;
    }
    var allFlights = await pool.query(a);
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in search");
    console.log(err.message);
  }
});

app.get('/airport/:fac', async (req, res) => {
  try {
    const { fac } = req.params;
    var dep = fac.split(',')[0];
    var arr = fac.split(',')[1];
    var a="";
    if (dep == "Any" && arr != "Any") {
      a = `SELECT DISTINCT departure_airport FROM flights 
            WHERE arrival_airport = '${arr}';`;
    }
    else if (dep != "Any" && arr == "Any") {
      a = `SELECT DISTINCT arrival_airport FROM flights 
            WHERE departure_airport = '${dep}';`;
    }
    else if (dep == "Any" && arr == "Any") {
      a = `SELECT airport_code FROM airport;`;
    }
    var allFlights = await pool.query(a)
    res.json(allFlights.rows);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in airport");
    console.log(err.message);
  }
});

//get available seats
app.get('/seats/:fac', async (req, res) => {
  try {
    const { fac } = req.params;
    var flight_id = fac.split(',')[0];
    var fclass = fac.split(',')[1];
    var a = ` SELECT a.seat_no 
                FROM (
                  SELECT seat_no 
                  FROM seats 
                  WHERE (aircraft_code=(
                    SELECT flights.aircraft_code 
                    FROM flights 
                    WHERE flight_id = ${flight_id}) 
                    AND 
                    fare_conditions = '${fclass}')) AS A 
                    LEFT JOIN (
                      SELECT seat_no 
                      FROM boarding_passes 
                      WHERE flight_id = ${flight_id}) AS B 
                      ON
                      (a.seat_no = b.seat_no) 
                      WHERE b.seat_no IS NULL;`;
    const allSeats = await pool.query(a);
    res.json(allSeats.rows);
    writeToQuery(a);
  } catch (err) {
    console.log(err.message);
  }
});

//get latest values
app.get('/maxValues', async (req, res) => {
  try {
    var a = `SELECT MAX(book_ref) FROM bookings; 
            SELECT MAX(ticket_no) FROM ticket;
            SELECT MAX(passenger_id) FROM ticket;
            SELECT MAX(boarding_no) FROM boarding_passes;`
    const maxValues = await pool.query(a);
    res.json(maxValues);
    writeToQuery(a);
  } catch (err) {
    console.log("Err in seats");
    console.log(err.message);
  }
});

app.post('/bookings', async (req, res) => {
  var pNo = req.body.pNo;
  var book_ref = req.body.book_ref;
  var full = req.body.full;
  var phone = req.body.phone;
  var email = req.body.email;
  var ticketno = req.body.ticketno;
  var passengerid = req.body.passengerid;
  var flight_id = req.body.flight_id;
  var fclass = req.body.fclass;
  var boardingPassno = req.body.boardingPassno;
  var seat = req.body.seat;
  //console.log(full);
  var a = "";
  try {
    //console.log(pNo);
    if (pNo == 0) {
      console.log("Insert first ticket");
      a = `INSERT INTO bookings VALUES('${book_ref}',current_timestamp);
            START TRANSACTION;
              INSERT INTO ticket VALUES('${ticketno}','${book_ref}','${passengerid}','${full}','${email}',${phone});
              INSERT INTO ticket_flights VALUES('${ticketno}',${flight_id},'${fclass}');
              INSERT INTO boarding_passes VALUES('${ticketno}',${flight_id},'${boardingPassno}','${seat}');
              UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=${flight_id};
              UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=${flight_id};
              SELECT * FROM bookings;`;
    } else {
      console.log("insert ticket");
      a = `INSERT INTO ticket VALUES('${ticketno}','${book_ref}','${passengerid}','${full}','${email}',${phone});
          INSERT INTO ticket_flights VALUES('${ticketno}',${flight_id},'${fclass}');
          INSERT INTO boarding_passes VALUES('${ticketno}',${flight_id},'${boardingPassno}','${seat}');
          UPDATE flights SET seats_available=seats_available-1 WHERE flight_id=${flight_id};
          UPDATE flights SET seats_booked=seats_booked+1 WHERE flight_id=${flight_id};
          SELECT * FROM bookings;`;
    }
    //await pool.query("COMMIT;");
    var newB = await pool.query(a);
    console.log("Waiting for confirmation...");
    res.json(newB);
    writeToTransaction(a);
  } catch (err) {
    console.log("Err in booking");
    pool.query("ROLLBACK;");
    writeToTransaction("ROLLBACK;");
    console.log(err.message);
  }
});

app.post('/payment', async (req, res) => {
  var book_ref = req.body.book_ref;
  var discount = req.body.discount;
  var tax = req.body.tax;
  var final_total = req.body.final_total;
  var card_no = req.body.card_no;
  //console.log(book_ref, discount, tax, final_total, card_no);
  //console.log(passengerid);
  try {
    var a = `INSERT INTO payment VALUES('${book_ref}','${card_no}',${tax},${discount},${final_total});
              SELECT * FROM payment;`;
    console.log("Insert payment!");
    var newB = await pool.query(a);
    res.json(newB);
    writeToTransaction(a);
  } catch (err) {
    console.log("Err in payment");
    writeToTransaction('/*' + a + '*/');
    pool.query("ROLLBACK;");
    console.log(err.message);
  }
});

app.post('/confirmation/:selection', async (req, res) => {
  try {
    const { selection } = req.params;
    if (selection == "yes") {
      await pool.query("COMMIT;");
      console.log("Commit!");
      writeToTransaction("COMMIT;");
    }
    else {
      await pool.query("ROLLBACK;");
      if (selection == "no") {
        console.log("Rollback!");
        writeToTransaction("ROLLBACK;");
      } else if (selection == "cancel"){
        console.log("Cancel!");
      }
    }
  } catch (err) {
    console.log("Err in confirmation");
    console.log(err.message);
  }
});

function writeToTransaction(txt) {
  try {
    const wTransaction = fs.createWriteStream('Transaction.sql', { flags: 'a' });
    wTransaction.write(txt + '\n');
  } catch (err) {
    console.log("Err in writeToTransaction");
    console.log(err.message);
  }
}

function writeToQuery(txt) {
  try {
    const wQuery = fs.createWriteStream('Query.sql', { flags: 'a' });
    wQuery.write(txt + '\n');
  } catch (err) {
    console.log("Err in writeToQuery");
    console.log(err.message);
  }
}

// set up the server listening at port 5000 (the port number can be changed)
app.listen(5000, () => {
  console.log("server has started on port 5000");
  fs.writeFile('Transaction.sql', "", (err) => {
    if (err)
      console.log(err.message);
  })
  fs.writeFile('Query.sql', "", (err) => {
    if (err)
      console.log(err.message);
  })
});