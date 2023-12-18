import Petugas from "../models/PetugasModel.js";
import path from "path";
import fs from "fs";
import Tanggapan from "../models/TanggapanModel.js";

export const getPetugas = async(req, res)=>{
    try {
        const response = await Petugas.findAll();
        res.json(response);
    } catch (error) {
        console.log(error.message);
    }
}

export const getPetugasById = async(req, res)=>{
    try {
        const response = await Petugas.findOne({
            where: {
                id_petugas: req.params.id
            },
        });
        res.json(response);
    } catch (error) {
        console.log(error.message);
    }
}

export const savePetugas = async(req, res)=>{
    if(req.body === null) return res.status(400).json({msg: "Tidak Ada Akun Petugas Yang Dibuat"});
    const nama_petugas = req.body.nama;
    const username = req.body.username;
    const password = req.body.password;
    const telp = req.body.telp;
    const level = req.body.level;
    
    try {
        await Petugas.create({nama_petugas: nama_petugas, username : username, password: password, telp: telp, level: level});
        res.status(201).json({msg: "Akun Petugas Berhasil Dibuat"});  
    } catch (error) {
        console.log(error.message);
    }
}

export const updatePetugas = async(req, res)=>{
    const petugas = await Petugas.findOne({
        where: {
            id_petugas : req.params.id
        }
    });
    if(!petugas) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    const nama_petugas = req.body.nama;
    const username = req.body.username;
    const password = req.body.password;
    const telp = req.body.telp;
    const level = req.body.level;
    try {
        await Petugas.update({nama_petugas: nama_petugas, username : username, password: password, telp: telp, level: level},{
            where:{
                id_petugas:req.params.id
            }
        });
        res.status(200).json({msg: "Akun Berhasil Diupdate"});
    } catch (error) {
        console.log(error.message);
    }
}

export const deletePetugas = async(req, res)=>{
    const petugas = await Petugas.findOne({
        where:{
            id_petugas: req.params.id
        }
    });
    if(!petugas) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    try {
        await Petugas.destroy({
            where: {
                id_petugas: req.params.id
            }
        });
        res.status(200).json({msg: "Akun Petugas Berhasil Dihapus"});
    } catch (error) {
        console.log(error.message);
    }
}
