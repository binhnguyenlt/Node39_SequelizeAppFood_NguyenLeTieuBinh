// kết nói BE với CSDL
import { Sequelize } from "sequelize"
import config from "../config/config.js";

const sequelize = new Sequelize(config.database, config.user, config.pass,
    // options phụ theo
    {
        host: config.host,
        port: config.port,
        dialect: config.dialect
    })

export default sequelize;