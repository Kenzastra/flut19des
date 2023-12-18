import express from "express";
import {
    getPengaduan,
    getPengaduanById,
    savePengaduan,
    updatePengaduan,
    deletePengaduan
} from "../Controllers/NgaduController.js";

import {
    getMasyarakat,
    getMasyarakatById,
    saveMasyarakat,
    updateMasyarakat,
    deleteMasyarakat
} from "../Controllers/MasyaController.js"

import {
    getPetugas,
    getPetugasById,
    savePetugas,
    updatePetugas,
    deletePetugas
} from "../Controllers/PetugasController.js"

import {
    getTanggapan,
    getTanggapanById,
    saveTanggapan,
    updateTanggapan,
    deleteTanggapan
}from "../Controllers/TanggapanController.js"

const router = express.Router();

// Rute Pengaduan
router.get('/pengaduan', getPengaduan);
router.get('/pengaduan/:id', getPengaduanById);
router.post('/pengaduan', savePengaduan);
router.patch('/pengaduan/:id', updatePengaduan);
router.delete('/pengaduan/:id', deletePengaduan);

// Rute Masyarakat
router.get('/masyarakat', getMasyarakat);
router.get('/masyarakat/:id', getMasyarakatById);
router.post('/masyarakat', saveMasyarakat);
router.patch('/masyarakat/:id', updateMasyarakat);
router.delete('/masyarakat/:id', deleteMasyarakat);

// Rute Petugas
router.get('/petugas', getPetugas);
router.get('/petugas/:id', getPetugasById);
router.post('/petugas', savePetugas);
router.patch('/petugas/:id', updatePetugas);
router.delete('/petugas/:id', deletePetugas);

// Rute Tanggapan
router.get('/tanggapan', getTanggapan);
router.get('/tanggapan/:id', getTanggapanById);
router.post('/tanggapan', saveTanggapan);
router.patch('/tanggapan/:id', updateTanggapan);
router.delete('/tanggapan/:id', deleteTanggapan);

export default router;