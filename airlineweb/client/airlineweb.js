// set global variable todos
let flightss = [];
let passengers_content = [[1, false], [2, false], [3, false], [4, false]];
let passengers_count = 0;
let selectedSeats = [0, 0, 0, 0, 0]; //This is the data selected here by the customer(s)
//We did not store any data from the db and process it locally.

async function confirmationTab() {
  await insertAllBooking();
  document.querySelector('#yes').addEventListener("click", function () { checkPayment() });
  document.querySelector('#no').addEventListener("click", function () { confirmBook("no") });
  $('#edit-modal').on('hidden.bs.modal', function () {
    confirmBook("cancel");
  });
  return false;
}

window.onbeforeunload = closingCode;
function closingCode() {
  confirmBook("close");
  return null;
}

async function confirmBook(choice) {
  try {
    // update a todo from "http://localhost:5000/todos/${id}", with "PUT" method
    fetch(`http://localhost:5000/confirmation/${choice}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" }
    })

    // refresh the page when updated
    //alert("Success");
    location.reload();
    if (choice == "yes") {
      alert("Your booking confirmation number is: " + sessionStorage.getItem("bref") + "\n\nWrote it down to search for it later!");
    }
    return false;
  } catch (err) {
    console.log(err.message);
  }
}

// function to set flights
const setFlights = (data) => {
  flightss = data;
}

const displayFlights = () => {
  const flightsTable = document.querySelector('#flights_table');

  // display all todos by modifying the HTML in "todo-table"
  let tableHTML = "";
  flightss.map(flights => {
    tableHTML +=
      `<tr key=${flights.flight_id}>
      <td >${flights.flight_no}</td>
      <td>${flights.departure_airport}</td>
      <td>${flights.arrival_airport}</td>
      <td>${timeConverter(flights.scheduled_departure)}</td>
      <td>${timeConverter(flights.scheduled_arrival)}</td>
      <td>${flights.seats_available}</td>
      <td><a href="book.html" onclick="setFlight_ID(${flights.flight_id})">Book</a></td>
      </tr>`;
  })
  flightsTable.innerHTML = tableHTML;
}

const displayBook = () => {
  const flightsTable = document.querySelector('#book_display');

  // display all todos by modifying the HTML in "todo-table"
  let tableHTML = "";
  flightss.map(flights => {
    tableHTML =
      `<tr key=${flights.flight_id}>
    <td >${flights.flight_no}</td>
    <td>${flights.departure_airport}</td>
    <td>${flights.arrival_airport}</td>
    <td>${timeConverter(flights.scheduled_departure)}</td>
    <td>${timeConverter(flights.scheduled_arrival)}</td>
    <td>${flights.seats_available}</td>
    </tr>`;
  })
  flightsTable.innerHTML = tableHTML;
}

const displayFindBook = () => {
  const flightsTable = document.querySelector('#Find_book_display');

  // display all todos by modifying the HTML in "todo-table"
  let tableHTML = "";
  flightss.map(flights => {
    tableHTML +=
      `<tr key=${flights.flight_id}>
      <td >${flights.flight_no}</td>
      <td>${flights.departure_airport}</td>
      <td>${flights.arrival_airport}</td>
      <td>${timeConverter(flights.scheduled_departure)}</td>
      <td>${timeConverter(flights.scheduled_arrival)}</td>
      <td>${flights.seats_available}</td>
      <td><a href="book.html" onclick="setFlight_ID(${flights.flight_id});">Book</a></td>
      </tr>`;
  })
  flightsTable.innerHTML = tableHTML;
}












const displayTicket = () => {
  const flightsTable = document.querySelector('#ticket_table');

  let tableHTML = "";
  flightss.map(ticket => {
    tableHTML +=
      `<tr key=${ticket.flight_id}>
      <td >${ticket.ticket_no}</td>
      <td>${ticket.book_ref}</td>
      <td>${ticket.passenger_id}</td>
      <td>${ticket.passenger_name}</td>
      <td>${ticket.email}</td>
      <td>${ticket.phone}</td>
      </tr>`;
  })
  flightsTable.innerHTML = tableHTML;
}

const displayPayment = () => {
  const flightsTable2 = document.querySelector('#payment_table');

  let tableHTML1 = "";
  flightss.map(payment => {
    tableHTML1 +=
      `<tr key=${payment.card_no}>
      <td >${payment.card_no}</td>
      <td >${payment.book_ref}</td>
      <td>${payment.taxes}</td>
      <td>${payment.discount}</td>
      <td>${payment.amount}</td>
      </tr>`;
  })
  flightsTable2.innerHTML = tableHTML1;
}

const displayBoarding = () => {
  const flightsTable3 = document.querySelector('#boarding_table');

  let tableHTML2 = "";
  flightss.map(boarding_passes => {
    tableHTML2 +=
      `<tr key=${boarding_passes.ticket_no}>
      <td >${boarding_passes.ticket_no}</td>
      <td >${boarding_passes.flight_id}</td>
      <td>${boarding_passes.boarding_no}</td>
      <td>${boarding_passes.seat_no}</td>
      </tr>`;
  })
  flightsTable3.innerHTML = tableHTML2;
}

















function setFlight_ID(fl_id) {
  sessionStorage.setItem("fl_id", fl_id)
}

// select all the flights when the codes first run
if (document.URL.includes("flight.html")) {
  window.onloadstart = selectFlights();
}
// The following are async function to select, insert, update and delete
// select all the flights
async function selectFlights() {
  // use try... catch... to catch error
  try {

    // GET all flights from "http://localhost:5000/flightss"
    const response = await fetch(`http://localhost:5000/flightss`)
    const jsonData = await response.json();

    setFlights(jsonData);
    displayFlights();
    //return false;
  } catch (err) {
    console.log(err.message);
  }
}

if (document.URL.includes("book.html")) {
  window.onload = checkAllForm();
  window.onload = selectBook();
  window.onload = getMaxValues(0);
  window.onload = totalCalculation();
}


async function selectBook() {
  // use try... catch... to catch error
  try {
    // GET all flights from "http://localhost:5000/flightss"
    if (sessionStorage.getItem("fl_id") == null)
      sessionStorage.setItem("fl_id", 1001);
    const response = await fetch(`http://localhost:5000/flightss/${sessionStorage.getItem("fl_id")}`)
    const jsonData = await response.json();

    setFlights(jsonData);
    displayBook();

    return false;
  } catch (err) {
    console.log(err.message);
  }
}

async function searchFlight() {
  var dep = document.querySelector('#From').value;
  var arr = document.querySelector('#To').value;
  var fac = dep + "," + arr;
  console.log(dep);
  console.log(arr);

  try {
    const response = await fetch(`http://localhost:5000/search/${fac}`);
    const jsonData = await response.json();
    setFlights(jsonData);
    displayFindBook();
    // refresh the page when inserted
    //location.reload();
    //return false;
    //selectFlights();
    return false;
  } catch (err) {
    console.log(err.message);
  }
}














async function customerSearch() {
  var dep = document.querySelector('#cust').value;
  if (dep.length == 6) {
    try {
      const response = await fetch(`http://localhost:5000/cust/${dep}`);
      const jsonData = await response.json();
      setFlights(jsonData);
      //console.log(jsonData);
      displayTicket();

      const response1 = await fetch(`http://localhost:5000/cust1/${dep}`);
      const jsonData1 = await response1.json();
      setFlights(jsonData1);
      displayPayment();

      const response2 = await fetch(`http://localhost:5000/cust2/${dep}`);
      const jsonData2 = await response2.json();
      sessionStorage.setItem("maxTicket_row", Object.keys(jsonData2).length);
      setFlights(jsonData2);
      displayBoarding();

      if (Object.keys(jsonData).length == 0) {
        alert("You enter a wrong book_ref");
      } else {
        sessionStorage.setItem("custBook_ref", dep);
      }
      //console.log(sessionStorage.getItem("maxTicket_row"));
      return false;
    } catch (err) {
      console.log(err.message);
    }
  } else {
    alert("You enter a wrong book_ref");
  }
}

async function cancelCust() {
  var dep = sessionStorage.getItem("custBook_ref");
  var dep1 = sessionStorage.getItem("maxTicket_row");
  var dep2 = dep + "," + dep1;
  //console.log(dep2);
  if (dep1 != 0) {
    try {
      // delete a todo from "http://localhost:5000/todos/${id}", with "DELETE" method
      const deleteTodo = await fetch(`http://localhost:5000/cancelCust/${dep2}`, {
        method: "DELETE"
      })

      // refresh the page when deleted
      sessionStorage.setItem("maxTicket_row", 0);
      alert("Booking deleted!")

      location.reload();
      return false;
    } catch (err) {
      console.log(err.message);
    }

  } else {
    alert("Search for book_ref first!");
  }
}


















async function getMaxValues(pNo) {
  try {
    const response = await fetch(`http://localhost:5000/maxValues`);
    const jsonData = await response.json();
    //console.log(jsonData);
    var bookref;
    if (pNo == 0) {
      bookref = JSON.stringify(jsonData[0].rows[0]).split("\"", 4)[3];
      sessionStorage.setItem("bref", bookref);
    } else
      bookref = sessionStorage.getItem("bref");
    let tickno = JSON.stringify(jsonData[1].rows[0]).split("\"", 4)[3];
    let pasid = JSON.stringify(jsonData[2].rows[0]).split("\"", 4)[3];
    let bdpasno = JSON.stringify(jsonData[3].rows[0]).split("\"", 4)[3];
    if (bookref == null) {
      bookref = "000000";
      sessionStorage.setItem("bref", bookref);
    }
    if (tickno == "undefined    " || tickno == null)
      tickno = "AB0000";
    if (pasid == null)
      pasid = "BB000000";
    if (bdpasno == null)
      bdpasno = "BD00000";
    sessionStorage.setItem("maxBook_ref", bookref);
    sessionStorage.setItem("maxTic_no", tickno);
    sessionStorage.setItem("maxPas_id", pasid);
    sessionStorage.setItem("maxBDPas_no", bdpasno)
    console.log(sessionStorage.getItem("maxBook_ref"));
    console.log(sessionStorage.getItem("maxTic_no"));
    console.log(sessionStorage.getItem("maxPas_id"));
    console.log(sessionStorage.getItem("maxBDPas_no"));
    return false;
  } catch (err) {
    console.log(err.message);
  }
}

async function selectSeats(pNo) {
  var flight_id = sessionStorage.getItem("fl_id");
  var fclass = document.querySelector('#fclass' + pNo).value;
  var fac = flight_id + ',' + fclass;
  //console.log(fclass);
  //console.log(flight_id);
  //console.log(fac);
  // use try... catch... to catch error
  try {
    // GET all availableseats from "http://localhost:5000/flightss"
    const response = await fetch(`http://localhost:5000/seats/${fac}`);
    const jsonData = await response.json();
    let seats = [];
    seats = jsonData;
    //console.log(seats);
    const seatsSelect = document.querySelector('#fseat' + pNo);
    //display all seat by modifying the HTML in "fseat"
    let inis = "";
    let tail = "";
    let tableHTML = "";

    for (let i = 0; i < seats.length; i++) {
      var re = false;
      if (seatsSelect.value == seats[i].seat_no) {
        re = true;
        break;
      }
    }

    if (seatsSelect.value != 0 && re) {
      inis = `<option value=${seatsSelect.value}>${seatsSelect.value}</option>`;
      tail = `<option style="color: gray;" value=0>Select your seat</option>`;
    } else {
      inis = `<option style="color: gray;" value=0>Select your seat</option>`;
      selectedSeats[pNo] = 0;
    }
    seats.map(seats => {
      var a = `<option value=${seats.seat_no}>${seats.seat_no}</option>`;
      if (selectedSeats.indexOf(seats.seat_no) <= -1) {
        tableHTML += a;
      }
    })

    if (fclass == 0) {
      inis = "";
      tableHTML = `<option style="color: gray;" value=0>Select your seat</option>`;
      tail = "";
      selectedSeats[pNo] = 0;
    }

    seatsSelect.innerHTML = inis + tableHTML + tail;
    //console.log(selectedSeats);
    return false;
  } catch (err) {
    console.log(err.message);
  }
}

function checkIfSeatSelected() {
  selectedSeats[0] = document.getElementById('fseat0').value;
  for (let i = 0; i < 4; i++) {
    if (passengers_content[i][1] == true) {
      selectedSeats[i + 1] = document.getElementById('fseat' + (i + 1)).value;
    } else {
      selectedSeats[i + 1] = 0;
    }
    //console.log('fseat' + (i + 1));
    //console.log(document.getElementById('fseat' + (i+1)).value);
  }
  //console.log(selectedSeats);
}

function keepClass(pNo) {
  var classChoices = [[`<option style="color: gray;" value=0>Select your class</option>`, 0],
  [`<option value="Comfort">Comfort</option>`, "Comfort"],
  [`<option value="Business">Business</option>`, "Business"],
  [`<option value="Economy">Economy</option>`, "Economy"]];
  var fclass = document.getElementById('fclass' + pNo).value;
  var inis = "";
  var htmlTXT = "";
  for (let i = 0; i < 4; i++) {
    if (fclass != 0) {
      if (fclass == classChoices[i][1]) {
        inis = classChoices[i][0];
      } else {
        htmlTXT += classChoices[i][0];
      }
    } else {
      htmlTXT += classChoices[i][0];
    }
  }
  document.querySelector('#fclass' + pNo).innerHTML = inis + htmlTXT;
}

function selectAllSeats(pNo) {
  for (let i = 0; i < (passengers_count + 1); i++) {
    if (i != pNo) {
      selectSeats(i);
    }
  }
  console.log(selectedSeats);
}

async function insertBooking(pNo) {
  console.log(pNo);
  var full = document.querySelector('#fname' + pNo).value + " " + document.querySelector('#lname' + pNo).value;
  var phone = document.querySelector('#fphone' + pNo).value;
  var email = document.querySelector('#femail' + pNo).value;
  if (pNo == 0) {
    var bookref = makeB_ref();
    sessionStorage.setItem("bref", bookref);
  } else {
    bookref = sessionStorage.getItem("bref");
  }
  var ticketno = makeTic_no();
  var passengerid = makePas_id();
  var boardingPassno = makeBDPas_no();
  var fclass = document.querySelector('#fclass' + pNo).value;
  var flight_id = sessionStorage.getItem("fl_id");
  var seat = document.querySelector('#fseat' + pNo).value;

  //console.log(card_no);

  // console.log(bookref);
  // console.log(ticketno);
  //console.log(passengerid);
  // console.log(boardingPassno);
  console.log(full);
  // console.log(phone);
  // console.log(email);
  // console.log(flight_id);
  // console.log(fclass);
  // console.log(seat);
  // console.log(amount);
  try {
    const body = {
      pNo: pNo,
      book_ref: bookref,
      full: full,
      phone: phone,
      email: email,
      ticketno: ticketno,
      passengerid: passengerid,
      boardingPassno: boardingPassno,
      flight_id: flight_id,
      fclass: fclass,
      seat: seat,
    };
    const result = await fetch(`http://localhost:5000/bookings`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body)
    });

    //alert(pNo);
    //alert("Success!");
    //refresh the page when inserted
    //location.reload();
    //console.log(result);
    return false;
  } catch (err) {
    alert(err);
    console.log(err.message);
  }
}

async function insertAllBooking() {
  for (let i = 0; i < passengers_count + 1; i++) {
    pasNo = document.querySelector('#Passengers').children[i].getAttribute("name");
    await insertBooking(pasNo);
    await getMaxValues(pasNo);
  }

  return false;
  //alert("Success!");
  //location.reload();
}

async function insertPayment() {
  var card_no = document.querySelector('#cardNumber').value;
  var bookref = sessionStorage.getItem("bref");
  var amount = await totalCalculation();
  var discount = amount[0];
  var tax = amount[1];
  var final_total = amount[2];

  try {
    const body = {
      book_ref: bookref,
      discount: discount,
      tax: tax,
      final_total: final_total,
      card_no: card_no
    };
    const result = await fetch(`http://localhost:5000/payment`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body)
    });

    //alert(pNo);
    //alert("Success!");
    //refresh the page when inserted
    //location.reload();
    //console.log(result);
    return false;
  } catch (err) {
    alert(err);
    console.log(err.message);
  }
}

function addPassenger() {
  //console.log(document.getElementById('Passenger_0').querySelector('#fclass0').value);
  console.log("Before add: " + passengers_count);
  var freeSlot = checkFilledSlot();
  passengers_content[freeSlot - 1][1] = true;
  //var prevSlot = freeSlot - 1;
  //var nextSlot = freeSlot + 1;

  //Remove add button

  var addPas = document.querySelector('#Passengers');

  // var addButton = document.querySelector('#addButton' + prevSlot);
  // addButton.innerHTML = "";
  //var passengerNo = document.getElementById('#Passenger_0')

  let tableHTML = "";
  tableHTML =
    `<div id="Passenger_${freeSlot}" name=${freeSlot}>
      <form id="PassengerForm_${freeSlot}">
        <li id="rmvButton${freeSlot}">
          <button class="remove_button" type="button" onclick="removePassenger(${freeSlot})">Remove passenger</button>
        </li>

        <li><label>Full Name of Additional Passenger ${freeSlot} <span class="required">*</span></label><input id = "fname${freeSlot}" type="text" onkeyup="checkAllForm()" name="field1" class="field-divided" placeholder="First" />&nbsp;<input id = "lname${freeSlot}" type="text" name="field2" onkeyup="checkAllForm()" class="field-divided" placeholder="Last" /></li>
        <li>
          <label>Email <span class="required">*</span></label>
          <input id = "femail${freeSlot}" type="email" onkeyup="checkAllForm()"name="field3" class="field-long" />
        </li>
        <li>
          <label>Phone <span class="required">*</span></label>
          <input id = "fphone${freeSlot}" type="phone" onkeyup="checkAllForm()" name="field4" class="field-long" />
        </li>
        <li>
          <label>Class<span class="required">*</span></label>
        <select id="fclass${freeSlot}" type="fare_condtion" onchange="totalCalculation();checkAllForm();keepClass(${freeSlot});selectSeats(${freeSlot});selectAllSeats(${freeSlot});checkIfSeatSelected();" name="field5" class="field-select">
          <option style="color: gray;" value=0>Select your class</option>
          <option value="Comfort">Comfort</option>
          <option value="Business">Business</option>
          <option value="Economy">Economy</option>
          </select>
        </li>
        <li>
          <label>Seats<span class="required">*</span></label>
          <select id="fseat${freeSlot}" type="seat" onchange="totalCalculation();checkAllForm();selectSeats(${freeSlot});selectAllSeats(${freeSlot});checkIfSeatSelected();" name="field6" class="field-select">
          
          <option style="color: gray;" value=0>Select your seat</option>

          </select>
        </li>
        <hr style="border-color: black">
        <li id="addButton${freeSlot}">
        
        </li>
      </form>
    </div>`
  selectAllSeats(freeSlot);
  addPas.innerHTML += tableHTML;
  passengers_count += 1;
  checkButton();
  checkAllForm();
  totalCalculation();
  //remove add button
  for (let i = 0; i < (passengers_count + 1); i++) {
    //console.log(addPas.children[i].getAttribute("id"));
    //console.log(`Passenger_${freeSlot}`);
    if (addPas.children[i].getAttribute("id") == (`Passenger_${freeSlot}`)) {
      document.querySelector('#addButton' + addPas.children[i - 1].getAttribute("name")).innerHTML = "";
      break;
    }
  }
  //console.log(addPas);
  //console.log(addPas.children[1].getAttribute("id"));
  console.log("After add: " + passengers_count);
  console.log(passengers_content);
}

function removePassenger(pNo) {
  // for (let i = 0; i < 4; i++) {
  //   if (passengers_content[i][1] == true)
  //     var lastPas = i;
  // }
  console.log("Before rmv: " + passengers_count);
  prevpNo = pNo - 1;
  var rmvPas = document.querySelector('#Passenger_' + pNo);
  rmvPas.remove();
  // if (prevpNo == lastPas) {
  //   var addButton = document.querySelector('#addButton' + prevpNo);
  //   addButton.innerHTML = `<button type="button" onclick="addPassenger()">Add a passenger</button>`;
  // }
  passengers_content[prevpNo][1] = false;
  passengers_count -= 1;
  checkButton();
  checkAllForm();
  totalCalculation();
  console.log("After rmv: " + passengers_count);
  console.log(passengers_content);
  selectedSeats[pNo] = 0;
  selectAllSeats(pNo);
  //var passengerNo = document.getElementById('#Passenger_0')
}

function checkButton() {
  var lastPas = document.querySelector('#Passengers').children[passengers_count].getAttribute("name");
  //console.log(lastPas);
  var addButton = document.querySelector('#addButton' + lastPas);
  var a = "";
  if (passengers_count < 4) {
    a = `<button type="button" onclick="addPassenger()">Add a passenger</button>`;

  } else {
    a = `<p style='text-align:center'>We apologize for the inconvenience <br> Only 5 passengers are allowed per booking </p>`;

  }
  addButton.innerHTML = a;
}

function timeConverter(t) {
  let ts = t.split("T");
  let d = ts[0];
  ts[1] = ts[1].substr(0, 8);
  ds = d.split("-");
  let date = new Date(ds[0], ds[1] - 1, ds[2]);
  var ct = date.toLocaleString('en-us', { month: 'short' }) + "-" + ds[2] + "-" + ds[0] + " " + ts[1];
  return ct;
}

function makeB_ref() {
  let mbr = sessionStorage.getItem("maxBook_ref");
  sessionStorage.setItem("maxBook_ref", book_refGen(mbr));
  return sessionStorage.getItem("maxBook_ref");
}

function book_refGen(br) {
  br = (hstoi(br) + 1).toString(16).toUpperCase().padStart(6, "0");
  return br;
}

function makeTic_no() {
  let b = sessionStorage.getItem("maxTic_no");
  sessionStorage.setItem("maxTic_no", pad(b));
  return sessionStorage.getItem("maxTic_no");
}

function makePas_id() {
  let b = sessionStorage.getItem("maxPas_id");
  sessionStorage.setItem("maxPas_id", pad(b));
  return sessionStorage.getItem("maxPas_id");
}

function makeBDPas_no() {
  let b = sessionStorage.getItem("maxBDPas_no");
  sessionStorage.setItem("maxBDPas_no", pad(b));
  return sessionStorage.getItem("maxBDPas_no");
}

function pad(text) {
  //console.log(text);
  var getPart = text.replace(/[^\d.]/g, '');
  var num = parseInt(getPart);
  var newVal = num + 1;
  var reg = new RegExp(num);
  var newstring = text.replace(reg, newVal);
  return newstring;
}

function hstoi(str) {
  var re = 0;
  for (let i = 0; i < str.length; i++) {
    re = parseInt(str[i], 16) * 16 ** (5 - i) + re;
  }
  return re;
}









async function priceCalculation(pNo) {
  try {
    const fclass = document.getElementById('fclass' + pNo).value;
    var purchase_tag = document.querySelector('#purchase_tag');
    var purchase_price = document.querySelector('#purchase_price');

    var price = 0;
    //console.log(fclass);
    if (fclass != 0) {
      const response = await fetch(`http://localhost:5000/price/${fclass}`);
      const jsonData = await response.json();
      price = jsonData[0].price;
    }

    if (fclass != 0)
      purchase_tag.innerHTML += `<p>P${pNo}-${fclass}:</p>`;
    else
      purchase_tag.innerHTML += `<p>P${pNo}:</p>`;
    purchase_price.innerHTML += `<p>+\$${price.toFixed(2)}</p>`;

    //console.log(price);
    return price;
  } catch (err) {
    console.log(err.message);
  }
}

async function totalCalculation() {
  var total = 0;
  var discount = 0;
  var tax = 0;

  document.querySelector('#purchase_tag').innerHTML = "";
  document.querySelector('#purchase_price').innerHTML = "";

  for (let i = 0; i < passengers_count + 1; i++) {
    pasNo = document.querySelector('#Passengers').children[i].getAttribute("name");
    total += await priceCalculation(pasNo);
  }
  var oTotal = total;
  if (passengers_count > 0)
    discount = total * 0.1;
  tax = (total - discount) * 0.08;
  //console.log("Total: ", total);
  //display the total price
  total = total - discount + tax;
  var dctxBox = document.querySelector('#tAd_price');
  var ftBox = document.querySelector('#final_total');
  let final_total = "";
  let dctxTXT = "";
  dctxTXT = `<br>\n
            <div>\$${oTotal.toFixed(2)}</div>\n
            <div>-\$${discount.toFixed(2)}</div>\n
            <div>+\$${tax.toFixed(2)}</div>`;
  final_total = `<p>\$${total.toFixed(2)}</p>`;
  dctxBox.innerHTML = dctxTXT;
  ftBox.innerHTML = final_total;
  allPrice = [discount, tax, total];
  return allPrice;
}

async function checkPayment() {
  var card = document.querySelector("#cardNumber").value;
  var ccv = document.querySelector("#CCV").value;

  if ((card == "" && ccv == "") || allnumeric(card) == false || allnumeric(ccv) == false || card.length != 16 || ccv.length != 3) {
    alert("Please fill in the card information correctly");
  }
  else {
    if (allnumeric(card) && allnumeric(ccv)) {
      //console.log("Please fill in the card information22");
      if (card.length == 16 && ccv.length == 3) {
        await insertPayment();
        await confirmBook("yes");
      }
    }
  }
  return false;
}

function allnumeric(inputtxt) {
  var numbers = /^[0-9]+$/;
  if (inputtxt.match(numbers)) {
    return true;
  }
  else {
    return false;
  }
}





//check to see if form is filled, if it is, then alow to submit
function checkform(pNo) {
  var cansubmit = true;
  var lastPas = document.querySelector('#Passengers').children[passengers_count].getAttribute("name");
  //console.log(document.forms['PassengerForm_' + pNo].elements);
  var f = document.forms['PassengerForm_' + pNo].elements;
  var fclass = document.getElementById('fclass' + pNo).value;
  var fseat = document.getElementById('fseat' + pNo).value;
  var fphone = document.getElementById('fphone' + pNo).value
  var pF = allnumeric(fphone);

  for (let i = (pNo == 0 ? 0 : 1); i < f.length - (pNo == lastPas && passengers_count == 4 ? 0 : 1); i++) {
    if (f[i].value.length == 0 || fclass == 0 || fseat == 0 || !pF) {
      cansubmit = false;
    }
  }
  //console.log(pNo, "Cansubmit: ", cansubmit);
  return cansubmit;
}

function checkAllForm() {
  var defCanSubmit = true;
  for (let i = 0; i < passengers_count + 1; i++) {
    //console.log(i, "------------");
    pasNo = document.querySelector('#Passengers').children[i].getAttribute("name");
    if (!checkform(pasNo))
      defCanSubmit = false;
  }
  //console.log("defCansubmit: ", defCanSubmit);

  if (defCanSubmit == true) {
    document.getElementById('register').style.background = '#4B99AD';
    document.getElementById('register').value = "Submit";
  }
  else {
    document.getElementById('register').style.background = '#d3d3d3';
    document.getElementById('register').value = "Fill in above";
  }
  document.getElementById('register').disabled = !defCanSubmit;
}



function checkFilledSlot() {
  for (let i = 0; i < 4; i++) {
    //console.log(passengers_content);
    if (passengers_content[i][1] == false) {
      return passengers_content[i][0];
    }
  }
}

async function selectAirportFrom() {
  var dep = document.querySelector('#From').value;
  var arr = document.querySelector('#To').value;
  var fac = dep + ",Any";
  try {
    var response = await fetch(`http://localhost:5000/airport/${fac}`);
    const jsonData = await response.json();
    let location = [];
    location = jsonData;
    console.log(location);

    var selectAirport = document.querySelector('#To');

    //display all seat by modifying the HTML in "fseat"
    var inis = `<option value="${arr}">${arr}</option>`
    var tail = `<option value="Any">Anywhere</option>`;
    let tableHTML = "";
    location.map(location => {
      var s = "";
      if (location.arrival_airport != arr && dep != "Any")
        s = `<option value="${location.arrival_airport}">${location.arrival_airport}</option>`;
      else if (location.airport_code != arr && dep == "Any")
        s = `<option value="${location.airport_code}">${location.airport_code}</option>`;
      tableHTML += s;
    })
    if (arr != "Any")
      selectAirport.innerHTML = inis + tableHTML + tail;
    else
      selectAirport.innerHTML = tail + tableHTML;
  } catch (err) {
    console.log(err.message);
  }
}

async function selectAirportTo() {
  var dep = document.querySelector('#From').value;
  var arr = document.querySelector('#To').value;
  var fac = "Any," + arr;
  try {
    var response = await fetch(`http://localhost:5000/airport/${fac}`);
    const jsonData = await response.json();
    let location = [];
    location = jsonData;
    console.log(location);

    var selectAirport = document.querySelector('#From');

    //display all seat by modifying the HTML in "fseat"
    var inis = `<option value="${dep}">${dep}</option>`
    var tail = `<option value="Any">Anywhere</option>`;
    let tableHTML = "";
    location.map(location => {
      var s = "";
      if (location.departure_airport != dep && arr != "Any")
        s = `<option value="${location.departure_airport}">${location.departure_airport}</option>`;
      else if (location.airport_code != dep && arr == "Any")
        s = `<option value="${location.airport_code}">${location.airport_code}</option>`;
      tableHTML += s;
    })
    if (dep != "Any")
      selectAirport.innerHTML = inis + tableHTML + tail;
    else
      selectAirport.innerHTML = tail + tableHTML;
  } catch (err) {
    console.log(err.message);
  }
}