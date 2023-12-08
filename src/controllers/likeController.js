import innitModel from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Sequelize } from "sequelize";
import { responseData } from "../config/Response.js";

const model = innitModel(sequelize);
let Op = Sequelize.Op;

const likeRestaurant = async (req, res) => {
  try {
    let { user_id, res_id } = req.body;

    let data = await model.tblLike_res.create({
      user_id,
      res_id,
      date_like: new Date(),
    });

    responseData(res, "Successfully like", data, 200);
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

const unLikeRestaurant = async (req, res) => {
  try {
    let { user_id, res_id } = req.params;

    let data = await model.tblLike_res.destroy({
      where: {
        user_id,
        res_id,
      },
    });

    responseData(res, "Successfully dislike", "", 200);
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

const getListLikeByRestaurant = async (req, res) => {
  try {
    let { res_id } = req.params;

    let isCheckRes = await model.tblRestaurant.findOne({
      where: {
        res_id,
      },
    });

    if (isCheckRes) {
      let data = await model.tblRestaurant.findAll({
        where: {
          res_id,
        },
        include: ["tblLike_res"],
      });

      responseData(
        res,
        "Successfully get list of likes by restaurant",
        data,
        200
      );
    } else {
      responseData(res, "User not found", "", 404);
    }
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

const getListLikeByUser = async (req, res) => {
  try {
    let { user_id } = req.params;

    let isCheckUser = await model.tblUser.findOne({
      where: {
        user_id,
      },
    });

    if (isCheckUser) {
      let data = await model.tblUser.findAll({
        where: {
          user_id,
        },
        include: ["res_id_tblRestaurants"],
      });

      responseData(res, "Successfully get list of likes by user", data, 200);
    } else {
      responseData(res, "User not found", "", 404);
    }
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

export {
  likeRestaurant,
  unLikeRestaurant,
  getListLikeByRestaurant,
  getListLikeByUser,
};
