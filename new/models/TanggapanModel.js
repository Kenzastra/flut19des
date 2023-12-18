import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Pengaduan from "./NgaduModel.js";
import Petugas from "./PetugasModel.js";

const {DataTypes} = Sequelize;

const Tanggapan = db.define('tanggapan',{
    id_tanggapan : {
        autoIncrement: true,
        type : DataTypes.INTEGER,
        primaryKey : true
    },
    id_pengaduan : DataTypes.INTEGER,
    tgl_tanggapan : {
        type: DataTypes.DATEONLY,
        defaultValue: DataTypes.NOW
    },
    tanggapan : DataTypes.STRING,
    id_petugas : DataTypes.INTEGER
},{
    freezeTableName : true
});

Petugas.hasMany(Tanggapan, {foreignKey: "id_petugas"});
Tanggapan.belongsTo(Petugas, {foreignKey: "id_petugas"});

export default Tanggapan;

// (async()=>{
//     await db.sync({});
// }) ();