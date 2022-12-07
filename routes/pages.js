const express = require("express");
const router = express.Router();
const userContoller = require("../controllers/users");
const mysql = require("mysql");
const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASS,
  database: process.env.DATABASE,
});

router.get(["/", "/login"], (req, res) => {
  //res.send("<h1>Hello</h1>");
  res.render("login");
});

/* router.get("/register", (req, res) => {
  res.render("register");
}); */

router.get("/register", userContoller.isLoggedIn, (req, res) => {
  //console.log(req.name);
  if (req.user) {
    //res.render("home", { user: req.user });
    res.redirect("/home");
  } else {
    res.render("register");
  }
});

router.get("/profile", userContoller.isLoggedIn, (req, res) => {
  if (req.user) {
    res.render("profile", { user: req.user });
  } else {
    res.redirect("/login");
  }
});
router.get("/home", userContoller.isLoggedIn, (req, res) => {
  //console.log(req.name);
  if (req.user) {
    let sql = "SELECT * FROM `course` INNER JOIN `faculty` ON course.FacultyID  = faculty.FacultyID";
    let query = db.query(sql, (err, results) => {
        if (err) throw err;
        // const results2 = {};
        // for(let x1=0; results.length < x1; x1++){
        //     results2[results[x1].CourseID] = results[x1];
        // }
        // res.render('course_view', {
        //     results: results,
        //     //results2: results2
        // });
        if (req.user.user_type == '1') {
          res.render("admindepartmenthead", {
            results: results,
            user: req.user
          });
        }else if (req.user.user_type == '2') {
          res.render("adminfaculty", {
            results: results,
            user: req.user
          });
        }else if (req.user.user_type == '3') {
          res.render("adminstudent", {
            results: results,
            user: req.user
          });
        }else{
          res.render("home", { user: req.user });
        }
    });


  } else {
    res.redirect("/login");
  }
});
router.get("/login", userContoller.isLoggedIn, (req, res) => {
  //console.log(req.name);
  if (req.user) {
    //res.render("home", { user: req.user });
    res.redirect("/home");
  } else {
    res.redirect("/login");
  }
});

module.exports = router;