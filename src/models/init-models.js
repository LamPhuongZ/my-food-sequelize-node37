import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _tblFood from  "./tblFood.js";
import _tblFood_type from  "./tblFood_type.js";
import _tblLike_res from  "./tblLike_res.js";
import _tblOrder from  "./tblOrder.js";
import _tblRate_res from  "./tblRate_res.js";
import _tblRestaurant from  "./tblRestaurant.js";
import _tblSub_food from  "./tblSub_food.js";
import _tblUser from  "./tblUser.js";

export default function initModels(sequelize) {
  const tblFood = _tblFood.init(sequelize, DataTypes);
  const tblFood_type = _tblFood_type.init(sequelize, DataTypes);
  const tblLike_res = _tblLike_res.init(sequelize, DataTypes);
  const tblOrder = _tblOrder.init(sequelize, DataTypes);
  const tblRate_res = _tblRate_res.init(sequelize, DataTypes);
  const tblRestaurant = _tblRestaurant.init(sequelize, DataTypes);
  const tblSub_food = _tblSub_food.init(sequelize, DataTypes);
  const tblUser = _tblUser.init(sequelize, DataTypes);

  tblFood.belongsToMany(tblUser, { as: 'user_id_tblUser_tblOrders', through: tblOrder, foreignKey: "food_id", otherKey: "user_id" });
  tblRestaurant.belongsToMany(tblUser, { as: 'user_id_tblUsers', through: tblLike_res, foreignKey: "res_id", otherKey: "user_id" });
  tblRestaurant.belongsToMany(tblUser, { as: 'user_id_tblUser_tblRate_res', through: tblRate_res, foreignKey: "res_id", otherKey: "user_id" });
  tblUser.belongsToMany(tblFood, { as: 'food_id_tblFoods', through: tblOrder, foreignKey: "user_id", otherKey: "food_id" });
  tblUser.belongsToMany(tblRestaurant, { as: 'res_id_tblRestaurants', through: tblLike_res, foreignKey: "user_id", otherKey: "res_id" });
  tblUser.belongsToMany(tblRestaurant, { as: 'res_id_tblRestaurant_tblRate_res', through: tblRate_res, foreignKey: "user_id", otherKey: "res_id" });
  tblOrder.belongsTo(tblFood, { as: "food", foreignKey: "food_id"});
  tblFood.hasMany(tblOrder, { as: "tblOrders", foreignKey: "food_id"});
  tblSub_food.belongsTo(tblFood, { as: "food", foreignKey: "food_id"});
  tblFood.hasMany(tblSub_food, { as: "tblSub_foods", foreignKey: "food_id"});
  tblFood.belongsTo(tblFood_type, { as: "type", foreignKey: "type_id"});
  tblFood_type.hasMany(tblFood, { as: "tblFoods", foreignKey: "type_id"});
  tblLike_res.belongsTo(tblRestaurant, { as: "re", foreignKey: "res_id"});
  tblRestaurant.hasMany(tblLike_res, { as: "tblLike_res", foreignKey: "res_id"});
  tblRate_res.belongsTo(tblRestaurant, { as: "re", foreignKey: "res_id"});
  tblRestaurant.hasMany(tblRate_res, { as: "tblRate_res", foreignKey: "res_id"});
  tblLike_res.belongsTo(tblUser, { as: "user", foreignKey: "user_id"});
  tblUser.hasMany(tblLike_res, { as: "tblLike_res", foreignKey: "user_id"});
  tblOrder.belongsTo(tblUser, { as: "user", foreignKey: "user_id"});
  tblUser.hasMany(tblOrder, { as: "tblOrders", foreignKey: "user_id"});
  tblRate_res.belongsTo(tblUser, { as: "user", foreignKey: "user_id"});
  tblUser.hasMany(tblRate_res, { as: "tblRate_res", foreignKey: "user_id"});

  return {
    tblFood,
    tblFood_type,
    tblLike_res,
    tblOrder,
    tblRate_res,
    tblRestaurant,
    tblSub_food,
    tblUser,
  };
}
