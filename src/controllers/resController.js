import initModels from '../models/init-models.js';
import sequelize from '../models/connect.js';
import { responseApi } from '../config/response.js';
import { dataToken } from '../config/jwt.js';
import { where } from 'sequelize';

const model = initModels(sequelize);

// Like nhà hàng
let likeRes = async (req, res) => {
    let { resId } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let data = await model.like_res.findOne({
        where: {
            user_id: userId,
            res_id: resId,
        }
    })

    let newLike;
    if (!data) {
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
            is_liked: !data.is_liked
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

// Lấy like nhà hàng
let getLikeRes = async (req, res) => {
    let { resId } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let data = await model.like_res.findOne({
        where: {
            user_id: userId,
            res_id: resId,
        }
    })
    responseApi(res, 200, data, "Thành công")
}


// Đánh giá nhà hàng
let rateRes = async (req, res) => {
    let { resId, rating } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let data = await model.rate_res.findOne({
        where: {
            user_id: userId,
            res_id: resId,
        }
    })

    let newRate;
    if (!data) {
        newRate = {
            user_id: userId,
            res_id: resId,
            date_rate: new Date(),
            amount: rating
        }
        await model.rate_res.create(newRate);
        responseApi(res, 200, "", "Đánh giá thành công")
    }
    else {
        newRate = {
            date_rate: new Date(),
            amount: rating
        }
        await model.rate_res.update(newRate,
            // để thực hiện lệnh PUT cần có đk where
            {
                where: {
                    user_id: userId,
                    res_id: resId,
                }
            });
        responseApi(res, 200, "", "Sửa đánh giá thành công")
    }
}

// Lấy rate nhà hàng
let getRateRes = async (req, res) => {
    let { resId } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let data = await model.rate_res.findOne({
        where: {
            user_id: userId,
            res_id: resId,
        }
    })
    responseApi(res, 200, data, "Thành công")
}

// Đặt món
let order = async (req, res) => {
    let { foodId, amount, code, arrSubId } = req.body;
    let { token } = req.headers
    // userId lấy từ token để đảm bảo vấn đề bảo mật
    let decode = dataToken(token);
    let { userId } = decode;

    let data = await model.orders.findOne({
        where: {
            user_id: userId,
            food_id: foodId,
        }
    })

    let newOrder;
    if (!data) {
        newOrder = {
            user_id: userId,
            food_id: foodId,
            amount: amount,
            code: code,
            arr_sub_id: arrSubId,
        }

        await model.orders.create(newOrder, { ignoreDuplicates: true });
        responseApi(res, 200, "", "Đặt món thành công")
    }
    else {
        newOrder = {
            amount: amount,
            code: code,
            arr_sub_id: arrSubId,
        }
        await model.orders.update(newOrder,
            // để thực hiện lệnh PUT cần có đk where
            {
                where: {
                    user_id: userId,
                    food_id: foodId,
                }
            });
        responseApi(res, 200, "", "Đặt món thành công")
    }
}


export {
    likeRes, getLikeRes, rateRes, getRateRes, order
}