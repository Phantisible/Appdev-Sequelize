const threads = require("../models/threads");

exports.threadList = (req, res) =>{ 
    res.locals.user = req.session.user;
    
    if(req.session.user.uuid){
        threads.model.findAll({
            attribute: ['id',[sequelize.fn('date_format', sequelize.col('date_col'), '%Y-%m-%d'), 'date_col_formed']],
            where:{ account_uuid: req.session.user.uuid
            }
        }).then(threadlist =>{
            req.session.threadlist = threadlist;
            if(threads){
                res.render("home",{threadlist: threadlist,loggedIn:req.session.loggedIn});
            }
        })
    }else{
        res.redirect("/");
    }
}
exports.addThread = async (req, res) => {
    res.locals.user = req.session.user;
    await threads.model.create({
        threaduuid : req.session.user.uuid,
        thread_title : req.body.thread_title,
        thread_body : req.body.thread_body
    })        
    res.redirect("/home");
    
}
exports.deleteThread = async (req, res) => {
    res.locals.user = req.session.user;
    let data = await threads.model.destroy({
        where : {threadId:req.query.uuid,
            threaduuid: req.session.user.uuid
        }
    })
}
exports.updateThread = async (req, res) => {
    res.locals.user = req.session.user;
    await threads.model.update({
        threaduuid : req.session.user.uuid,
    },req.body,
    {new: true},
    ).exec();
    req.flash('success', 'Successfully updated');
    res.redirect('/home');
}

exports.threadtoppost = async (req, res) =>{
    res.locals.user = req.session.user;
    if(req.session.user){
        res.render("toppost", {check: 1});  
    } else {
        res.redirect("/login")
    }
}

exports.threadrecentpost = async (req, res) =>{
    res.locals.user = req.session.user;
    let thread_data = await threads.model.findAll({
        order: [
            ['createdAt' , 'DESC']
        ]
     });
    if(req.session.user){
        res.render("recentpost", {check: 1, threadlist: thread_data});  
    } else {
        res.redirect("/login")
    }

}