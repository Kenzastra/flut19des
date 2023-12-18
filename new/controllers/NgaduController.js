import Pengaduan from "../models/NgaduModel.js";
import path from "path";
import fs from "fs";
import Tanggapan from "../models/TanggapanModel.js";
import Masyarakat from "../models/MasyarakatModel.js";
import Petugas from "../models/PetugasModel.js";

export const getPengaduan = async(req, res)=>{
    try {
        const response = await Pengaduan.findAll({
            include:[
                {model : Masyarakat,
                attributes: ['nama']},
                {model : Tanggapan,
                attributes : ['id_pengaduan', 'tanggapan', 'id_petugas'], include: [ {model: Petugas, attributes: ['nama_petugas']}]}

            ]
        });
        res.json(response);
    } catch (error) {
        console.log (error.message);
    }
}

export const getPengaduanById = async(req, res)=>{
    try {
        const response = await Pengaduan.findOne({
            where: {
                id_pengaduan : req.params.id
            },
            include: [
                {model : Masyarakat,
                attributes: ['nama']},
                {model : Tanggapan,
                attributes : ['id_pengaduan', 'tanggapan', 'id_petugas'], include: [ {model: Petugas, attributes: ['nama_petugas']}]}

            ]
                
            
        });
        res.json(response);
    } catch (error) {
        console.log (error.message);
    }
}

export const savePengaduan = (req, res)=>{
    if(req.files === null) return res.status(400).json({msg: "Tidak Ada Yang Di Unggah"});
    const nik = req.body.nik;
    const isi = req.body.isi;
    const foto = req.files.foto;
    const status = req.body.status;
    const ext = path.extname(foto.name);
    const fotoName = foto.md5 + ext;
    const url = `${req.protocol}://${req.get("host")}/images/${fotoName}`;
    const allowedType = ['.png','.jpg','.jpeg'];

    if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({msg:"Gambar Invalid"});

    foto.mv(`./public/images/${fotoName}`, async(err)=>{
        if(err) return res.status(500).json({msg: err.message});
        try {
            await Pengaduan.create({nik : nik, isi_laporan : isi, foto : fotoName,url : url, status: status});
            res.status(201).json({msg:"Pengaduan Berhasil Dibuat"});
        } catch (error) {
            console.log(error.message);
        }
    })        
}

export const updatePengaduan = async(req, res)=>{
    const pengaduan = await Pengaduan.findOne({
        where: {
            id_pengaduan: req.params.id
        }
    });
    if(!pengaduan) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    let fotoName = "";
    if(req.files === null){
        fotoName = Pengaduan.foto;
    }else{
        const foto = req.files.foto;
        const ext = path.extname(foto.name);
        fotoName = foto.md5 + ext;
        const allowedType = ['.png','.jpg','.jpeg'];
        
        if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({msg:"Gambar Invalid"});
        
        const filepath = `./public/images/${pengaduan.foto}`;
        fs.unlinkSync(filepath);

        foto.mv(`./public/images/${fotoName}`, (err)=>{
            if(err) return res.status(500).json({msg: err.message});
        });
    }
    const nik = req.body.nik;
    const isi = req.body.isi;
    const url = `${req.protocol}://${req.get("host")}/images/${fotoName}`;
    const status = req.body.status;
    try {
        await Pengaduan.update({nik : nik, isi_laporan : isi, foto : fotoName,url:url, status: status},{
            where:{
                id_pengaduan: req.params.id
            }
        });
        res.status(200).json({msg: "Pengaduan Berhasil Di Update"});
    } catch (error) {
        console.log(error.message);
    }
}

export const deletePengaduan = async(req, res)=>{
    const pengaduan = await Pengaduan.findOne({
        where:{
            id_pengaduan : req.params.id
        }
    });
    if(!pengaduan) return res.status(404).json({msg: "Data Tidak Ditemukan"});
    try {
        const filepath = `./public/images/${pengaduan.foto}`;
        fs.unlinkSync(filepath);
        await Pengaduan.destroy({
            where: {
                id_pengaduan: req.params.id
            }
        });
        res.status(200).json({msg: "Pengaduan Berhasil Dihapus"})
    } catch (error) {
        console.log(error.message);
    }
}
