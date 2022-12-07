const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");

const mysql = require("mysql");
const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASS,
  database: process.env.DATABASE,
});

exports.login = async (req, res) => {
  try {
    const { useremail, userpassword } = req.body;
    if (!useremail || !userpassword) {
      return res.status(400).render("login", {
        msg: "Please Enter Your Email and Password",
        msg_type: "error",
      });
    }

    db.query(
      "select * from users where useremail=?",
      [useremail],
      async (error, result) => {
        console.log(result);
        if(result === undefined){
            return res.status(401).render("login", {
                msg: "Please Enter Your Email and Password",
                msg_type: "error",
            });
        }
        if (result.length <= 0) {
          return res.status(401).render("login", {
            msg: "Please Enter Your Email and Password",
            msg_type: "error",
          });
        } else {
          if (!(await bcrypt.compare(userpassword, result[0].userpass))) {
            return res.status(401).render("login", {
              msg: "Please Enter Your Email and Password",
              msg_type: "error",
            });
          } else {
            const userid = result[0].userid;
            const token = jwt.sign({ userid: userid }, process.env.JWT_SECRET, {
              expiresIn: process.env.JWT_EXPIRES_IN,
            });
            console.log("The Token is " + token);
            const cookieOptions = {
              expires: new Date(
                Date.now() +
                  process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
              ),
              httpOnly: true,
            };
            res.cookie("joes", token, cookieOptions);
            res.status(200).redirect("/home");
          }
        }
      }
    );
  } catch (error) {
    console.log(error);
  }
};
exports.register = (req, res) => {
  console.log(req.body);
  /*
  const username = req.body.username;
  const useremail = req.body.useremail;
  const userpassword = req.body.userpassword;
  const confirm_password = req.body.confirm_userpassword;
  console.log(username);
  console.log(useremail);
    //res.send("Form Submitted");
  */
  const { username, useremail, userpassword, confirm_userpassword, user_type } = req.body;
  db.query(
    "select useremail from users where useremail=?",
    [useremail],
    async (error, result) => {
      if (error) {
        console.log(error);
      }

      if (result.length > 0) {
        return res.render("register", {
          msg: "Email id already Taken",
          msg_type: "error",
        });
      } else if (userpassword !== confirm_userpassword) {
        return res.render("register", {
          msg: "Password do not match",
          msg_type: "error",
        });
      }
      let hashedPassword = await bcrypt.hash(userpassword, 8);
      //console.log(hashedPassword);

      db.query(
        "insert into users set ?",
        { username: username, useremail: useremail, userpass: hashedPassword, user_type: user_type },
        (error, result) => {
          if (error) {
            console.log(error);
          } else {
            //console.log(result);
            return res.render("register", {
              msg: "User Registration Success",
              msg_type: "good",
            });
          }
        }
      );
    }
  );
};

exports.isLoggedIn = async (req, res, next) => {
  //req.name = "Check Login....";
  //console.log(req.cookies);
  if (req.cookies.joes) {
    try {
      const decode = await promisify(jwt.verify)(
        req.cookies.joes,
        process.env.JWT_SECRET
      );
      //console.log(decode);
      db.query(
        "select * from users where userid=?",
        [decode.userid],
        (err, results) => {
          //console.log(results);
          if (!results) {
            return next();
          }
          req.user = results[0];
          return next();
        }
      );
    } catch (error) {
      console.log(error);
      return next();
    }
  } else {
    next();
  }
};

exports.logout = async (req, res) => {
  res.cookie("joes", "logout", {
    expires: new Date(Date.now() + 2 * 1000),
    httpOnly: true,
  });
  res.status(200).redirect("/");
};