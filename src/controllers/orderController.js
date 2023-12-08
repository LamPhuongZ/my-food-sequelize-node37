import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Sequelize } from "sequelize";
import { responseData } from "../config/Response.js";

const model = initModels(sequelize);
let Op = Sequelize.Op;

const addOrder = async (req, res) => {
  try {
    let { user_id, food_id, amount, code, arr_sub_id } = req.body;

    let data = await model.tblOrder.create({
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    });

    responseData(res, "Successfully order", data, 200);
  } catch (error) {
    responseData(res, "Error BE", "", 500);
  }
};

export { addOrder };
