const isAuth = (req, res, next) =>{
    console.log("Test")
    console.log(req.session.user)
  
    if(typeof(req.session.user) !== 'undefined'){
        return next()
    }else{
        res.redirect('/login')
    }


}

module.exports= isAuth
