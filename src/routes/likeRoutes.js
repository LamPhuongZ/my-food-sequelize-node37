import express from "express";
import { getListLikeByRestaurant, getListLikeByUser, likeRestaurant, unLikeRestaurant } from "../controllers/likeController.js";

const likeRoute = express.Router();

// Xử lý like nhà hàng
likeRoute.post("/like-restaurant", likeRestaurant);

// Xử lý unlike nhà hàng
likeRoute.delete("/unlike-restaurant/:user_id/:res_id", unLikeRestaurant);

// Xử lý lấy danh sách like theo nhà hàng 
likeRoute.get("/get-list-like-by-res/:res_id", getListLikeByRestaurant);

// Xử lý lấy danh sách like theo user
likeRoute.get("/get-list-like-by-user/:user_id", getListLikeByUser)

export default likeRoute;
