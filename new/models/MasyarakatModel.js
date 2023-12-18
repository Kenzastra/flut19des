import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Pengaduan from "../models/NgaduModel.js"

const {DataTypes} = Sequelize;

const Masyarakat = db.define('masyarakat',{
    nik : {
        type :DataTypes.INTEGER,
        autoIncrement : true,
        primaryKey : true
    },
    nama : DataTypes.STRING,
    username : DataTypes.STRING,
    password : DataTypes.STRING,
    telp : DataTypes.STRING
},{
    freezeTableName : true
});



export default Masyarakat;

// (async()=>{
//     await db.sync({});
// }) ();