import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Sequelize } from "sequelize";
import { responseData } from "../config/Response.js";

const model = initModels(sequelize);
let Op = Sequelize.Op;

const addRateRestaurant = async (req, res) => {
  try {
    let { user_id, res_id, amount, date_rate } = req.body;

    let data = await model.tblRate_res.create({
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    });

    responseData(res, "Successfully rate restaurant", data, 200);
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

const getListRateByRestaurant = async (req, res) => {
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
        include: ["tblRate_res"],
      });

      responseData(
        res,
        "Successfully get list of rates by restaurant",
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

const getListRateByUser = async (req, res) => {
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
        include: ["tblRate_res"],
      });

      responseData(res, "Successfully get list of rates by user", data, 200);
    } else {
      responseData(res, "User not found", "", 404);
    }
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

export { addRateRestaurant, getListRateByRestaurant, getListRateByUser };
