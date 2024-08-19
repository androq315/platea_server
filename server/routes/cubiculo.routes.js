import { Router } from "express";
import { getCubiculos, getCubiculo, postCubiculo, putCubiculo, toggleCubiculo, patchCubiculo } from "../controllers/cubiculo.controller.js";

const router = Router()

router.get('/api/cubiculo/', getCubiculos)
router.get('/api/cubiculo/:id', getCubiculo)
router.post('/api/cubiculo/', postCubiculo)
router.put('/api/cubiculo/:id', putCubiculo)
router.delete('/api/cubiculo/:id', toggleCubiculo)
router.patch('/api/cubiculo/:id', patchCubiculo)



export default router