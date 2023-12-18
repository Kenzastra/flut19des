import { Sequelize } from "sequelize";
import Tanggapan from "./TanggapanModel.js";
import Masyarakat from "./MasyarakatModel.js";
import db from "../config/database.js";

const {DataTypes} = Sequelize;

const Pengaduan = db.define('pengaduan',{
    id_pengaduan : {
        autoIncrement : true,
        type : DataTypes.INTEGER,
        primaryKey : true
    },
    tgl_pengaduan : {
        type : DataTypes.DATEONLY,
        defaultValue : DataTypes.NOW
    },
    nik : DataTypes.INTEGER,
    isi_laporan : DataTypes.STRING,
    foto : DataTypes.STRING,
    url : DataTypes.STRING,
    status : DataTypes.STRING
},{
    freezeTableName : true
});

Pengaduan.hasMany(Tanggapan, {foreignKey: "id_pengaduan"})
Masyarakat.hasMany(Pengaduan,{foreignKey: "nik"})
Pengaduan.belongsTo(Masyarakat,{foreignKey:"nik"})

export default Pengaduan;

// (async()=>{
// await db.sync({});
// }) ();