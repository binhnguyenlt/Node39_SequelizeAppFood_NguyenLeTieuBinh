// cài yarn dotenv


// thư viện giúp đưa biến của mình vào hệ thống
import dotenv from "dotenv"

// nếu để .evn trong src thì viết
// dotenv.config("./src")
dotenv.config()


export default {
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    pass: process.env.DB_PASS,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: process.env.DB_DIALECT,
}

// console.log(process.env);
// gõ node src/config/config.js để xem những biến có trong thông tin của hệ thống cũng như biến mội trường của minh