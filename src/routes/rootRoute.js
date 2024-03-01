// quản lý đối tượng endpoint
import express from 'express'
import resRoute from './resRoute.js';
import authRoute from './authRoute.js';

const rootRoute = express.Router();

rootRoute.use("/res",resRoute);
rootRoute.use("/auth",authRoute)

export default rootRoute;