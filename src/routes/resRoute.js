// Quản lý API của nhà hàng
import express from 'express'
import { likeRes, getLikeRes } from "../controllers/resController.js"

const resRoute = express.Router();


// API like nhà hàng
resRoute.put("/like-res", likeRes)

// API lấy like nhà hàng
resRoute.get("/get-like-res", getLikeRes)

export default resRoute;
