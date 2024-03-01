import express from "express"
import cors from "cors"

const app = express();

// chuyển đổi text body sang Json
app.use(express.json()) ;

// cho phép truy cập vào API của BE từ FE quy định qua domain
app.use(cors());

// khởi tạo server BE với port 8080
app.listen(8080);

// lấy các endpoint trong rootRoute
import rootRoute from './routes/rootRoute.js';
app.use(rootRoute);