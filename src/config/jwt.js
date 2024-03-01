// yarn add jsonwebtoken

import jwt from "jsonwebtoken";

// tạo Token
export const createToken = (data) =>
    jwt.sign(data, "BI_MAT", { algorithm: "HS256", expiresIn: "5d" })

export const checkToken = (token) => jwt.verify(token, "BI_MAT", (err, decode) => err)


// 2 thằng dưới đây dùng cho refresh token
export const createTokenRef = (data) => jwt.sign(data, "BI_MAT_2", { algorithm: "HS256", expiresIn: "7d" })
export const checkTokenRef = (token) => jwt.verify(token, "BI_MAT_2", (err, decode) => err)

// giải mã Token
export const dataToken = (token) => jwt.decode(token)