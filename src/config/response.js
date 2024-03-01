// 200
// 400
// 500
export const responseApi = (res, statusCode, data, message) => {
    // chỗ này .json là giống res.status(statusCode).send nhưng trả thành dạng json
    res.status(statusCode).json({
        statusCode: statusCode,
        message: message,
        data: data,
        date: new Date()
    })
}