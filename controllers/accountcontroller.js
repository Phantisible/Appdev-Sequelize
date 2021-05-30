const account = require("../models/accounts");
const threads = require("../models/threads");
const bcrypt = require('bcrypt');


generateCode = () => {
    let generate = "";
    const char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const length = 32;
    for (var i = 0; i < length; i++) {
        generate += char.charAt(Math.floor(Math.random() * char.length));
    }
    return generate;
}  

exports.index = async (req,res) => {
    res.locals.user = req.session.user;
    let thread_data = await threads.model.findAll();
    res.render("home", {check : 0 , threadlist : thread_data});
}
exports.home = async (req,res) => {
    res.locals.user = req.session.user;
    let thread_data = await threads.model.findAll();
    if(req.session.user.uuid === req.session.threaduuid){
        res.sent("hellow");
    }
    res.render("home", {check : 1 , threadlist : thread_data});
}

exports.getslogin = (req,res) => {
    res.render("login", {check : 0});
}

exports.getslogout = (req,res) => {
    res.redirect("/");
} 
exports.getsignup = (req,res) => {
    res.render("signup", {check : 0});
}
exports.signup = async (req,res) => {
    var salt = bcrypt.genSaltSync(10);
    var hash = bcrypt.hashSync(req.body.password,salt);
    await account.model.create({
                uuid: generateCode(),
                username: req.body.username,
                password: hash,
                status: 0
    })
    res.render("home", {user : data , check : 1});
}


exports.login = async (req, res) => {
    let thread_data = await threads.model.findAll();
    let data = await account.model.findOne({where: {username: req.body.username}});
    
    if (data != null){
        
        bcrypt.compare(req.body.password, data.password, (err, result) => {
            if(err){throw err;}
            if( (data.username == req.body.username) && result){
                req.session.user = data;
                req.session.user.loggedIn = true;
                res.locals.user = req.session.user;
                // req.session.username = data.username;
                // req.session.uuid = data.uuid;
                // res.render("home", {user : data , check : 1});
                res.redirect("/home");
            }else{
                var check = 2;
                if ("/") {    
                    res.render("home" , {check : 2, threadlist : thread_data});
                } else {
                    res.render("/login" , {check : 2});
                }
                
            }
        });
    } else {
        res.send(check);
         res.render("home" , {check : 1});  
    }
}