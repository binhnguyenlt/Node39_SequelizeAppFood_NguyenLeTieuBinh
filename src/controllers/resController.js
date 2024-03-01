import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseApi } from '../config/response.js';
import { dataToken } from '../config/jwt.js';
import { where } from 'sequelize';

const model = initModels(sequelize);

// Thực hiện chức năng
let likeRes = async (req, res) => {
    let { resId } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let checkResIdUserId = await model.like_res.findOne({
        where: {
            user_id: userId,
            res_id: resId,
        }
    })
    console.log('checkResIdUserId: ', checkResIdUserId);


    let newLike;
    if (!checkResIdUserId) {
        newLike = {
            user_id: userId,
            res_id: resId,
            date_like: new Date(),
            is_liked: true
        }
        await model.like_res.create(newLike);
        responseApi(res, 200, "", "Liked")
    }
    else {
        newLike = {
            date_like: new Date(),
            is_liked: !checkResIdUserId.is_liked
        }
        await model.like_res.update(newLike,
            // để thực hiện lệnh PUT cần có đk where
            {
                where: {
                    user_id: userId,
                    res_id: resId,
                }
            });
            
        if (newLike.is_liked === true) {
            responseApi(res, 200, "", "Liked")
        }
        else {
            responseApi(res, 200, "", "Unliked")
        }
    }
}


let getLikeRes = async (req, res) => {
    let data = await model.like_res.findAll();
    responseApi(res, 200, data, "Thành công")
}


export {
    likeRes, getLikeRes
}