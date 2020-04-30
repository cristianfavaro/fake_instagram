const isAuth = (req, res, next) =>{
    if(typeof(req.session.user) !== 'undefined'){
        return next()
    }else{
        res.redirect('/login')
    }
}

module.exports= isAuth
