// CREATE TABLE todo(
//   todo_id SERIAL PRIMARY KEY,
//   description VARCHAR(255)  
// );
// only two attributes in the table: todo_id and description
const Pool = require('pg').Pool;
const fs = require("fs");

try {  
  var text = fs.readFileSync("./password.txt");
  var cred = text.toString().split("\n");
  if(text == "")
    console.log("Empty password.txt");
} catch (err) {
  console.log("No password.txt");
}
try {
var user = cred[0].trim();
var pass = cred[1];
const pool = new Pool({
  host: 'code.cs.uh.edu',
  user: user,
  password: pass,
  port: 5432,
  database: 'COSC3380'
});

module.exports = pool;
} catch (err) {
  console.log("Error connecting");
}