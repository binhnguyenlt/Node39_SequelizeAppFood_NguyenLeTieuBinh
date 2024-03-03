// Quản lý API của nhà hàng
import express from 'express'
import { likeRes, getLikeRes, rateRes, getRateRes, order } from "../controllers/resController.js"

const resRoute = express.Router();


// API like nhà hàng
resRoute.put("/like-res", likeRes)

// API lấy like nhà hàng
resRoute.get("/get-like-res", getLikeRes)

// API đánh giá nhà hàng
resRoute.put("/rate-res", rateRes)

// API lấy đánh giá nhà hàng
resRoute.get("/get-rate-res", getRateRes)

// API đặt món
resRoute.put("/order", order)

export default resRoute;
