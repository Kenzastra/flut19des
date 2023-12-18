import Masyarakat from "../models/MasyarakatModel.js";
import path from "path";
import fs from "fs";

export const getMasyarakat = async(req, res)=>{
    try {
        const response = await Masyarakat.findAll();
        res.json(response);
    } catch (error) {
        console.log(error.message);
    }
}

export const getMasyarakatById = async(req, res)=>{
    try {
        const response = await Masyarakat.findOne({
            where: {
                nik: req.params.id
            }
        });
        res.json(response);
    } catch (error) {
        console.log(error.message);
    }
}

export const saveMasyarakat = async(req, res)=>{
    
    const nama = req.body.nama;
    const username = req.body.username;
    const password = req.body.password;
    const telp = req.body.telp;

    if( !nama || !username || !password || !telp) return res.status(400).json({msg: "Tidak Ada Akun Yang Dibuat"});
    try {
        await Masyarakat.create({nama: nama, username : username, password: password, telp: telp});
        res.status(201).json({msg: "Akun Berhasil Dibuat"});  
    } catch (error) {
        console.log(error.message);
    }
}

export const updateMasyarakat = async(req, res)=>{
    const masyarakat = await Masyarakat.findOne({
        where: {
            nik : req.params.id
        }
    });
    if(!masyarakat) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    const nama = req.body.nama;
    const username = req.body.username;
    const password = req.body.password;
    const telp = req.body.telp;
    try {
        await Masyarakat.update({nama: nama, username : username, password: password, telp: telp},{
            where:{
                nik:req.params.id
            }
        });
        res.status(200).json({msg: "Akun Berhasil Diupdate"});
    } catch (error) {
        console.log(error.message);
    }
}

export const deleteMasyarakat = async(req, res)=>{
    const masyarakat = await Masyarakat.findOne({
        where:{
            nik: req.params.id
        }
    });
    if(!masyarakat) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    try {
        await Masyarakat.destroy({
            where: {
                nik: req.params.id
            }
        });
        res.status(200).json({msg: "Akun Berhasil Dihapus"});
    } catch (error) {
        console.log(error.message);
    }
}
