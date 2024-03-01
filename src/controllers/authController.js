import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import bcrypt from "bcrypt"
import { checkTokenRef, createToken, createTokenRef, dataToken } from '../config/jwt.js';
import { responseApi } from '../config/response.js';

const model = initModels(sequelize);

const login = async (req, res) => {

    let { email, password } = req.body

    let checkEmail = await model.users.findOne({
        where: {
            email: email,
        }
    })

    if (checkEmail) {
        if (password == checkEmail.password) {
            let key = new Date().getTime();

            // truyền vào checkEmail là nguyên cái 
            let token = createToken({ userId: checkEmail.dataValues.user_id, key });

            // await model.users.update(checkEmail.dataValues, {
            //     where: {
            //         user_id: checkEmail.dataValues.user_id
            //     }
            // })

            responseApi(res, 200, token, "Đăng nhập thành công")
        }
        else {
            responseApi(res, 400, "", "Mật khẩu không đúng")
        }
    }
    else {
        responseApi(res, 400, "", "Email không đúng")
    }
}


export {
    login
}