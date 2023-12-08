import express from "express";
import { addOrder } from "../controllers/orderController.js";

const orderRoute = express.Router();

orderRoute.post("/add-order", addOrder);

export default orderRoute;
