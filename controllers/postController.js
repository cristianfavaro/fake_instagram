const { Publication, User } = require("../models");

const userController = {
  create: (_req, res) => res.render("post"),

  store: async (req, res) => {
    const [photo] = req.files;
    const { user } = req.session;

    const newPost = Publication.create({
      image: `/posts/${photo.originalname}`,
      like: 0,
      users_id: user.id,
      create_at: new Date(),
      update_at: new Date(),
    });

    return res.redirect("/home");
  },
  index: async (req, res, next) =>{
    const idUser = req.session.user.id;     
    const publications = await Publication.findAll({
      where: {
        users_id: idUser,
      },
      include: {
        model: User,
        as: "user",
      },
    });   
    console.log("Publicacao")
    console.log(publications)
    console.log("Nome 2")
    console.log(publications[0].dataValues)
    res.render("index", { publication: publications[0].dataValues, title: "Express" });
  }

};

module.exports = userController;

