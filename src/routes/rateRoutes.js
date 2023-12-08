import express from "express";
import {
  addRateRestaurant,
  getListRateByRestaurant,
  getListRateByUser,
} from "../controllers/rateController.js";

const rateRoute = express.Router();

// Xử lý thêm đánh giá nhà hàng
rateRoute.post("/add-rate-res", addRateRestaurant);

// Xử lý lấy danh sách đánh giá theo nhà hàng
rateRoute.get("/get-rate-by-res/:res_id", getListRateByRestaurant);

// Xử lý lấy danh sách đánh giá theo user
rateRoute.get("/get-rate-by-user/:user_id", getListRateByUser);

export default rateRoute;
