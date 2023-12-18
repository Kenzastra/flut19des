import { Sequelize } from "sequelize";

const db = new Sequelize('ngadu_db','root','',{
    host : 'localhost',
    dialect : "mysql"
});

export default db;