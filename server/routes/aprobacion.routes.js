import { Router } from "express";
import AprobacionController from "../controllers/aprobacion.controller.js";

const router = Router()

router.get('/api/aprobacion/:id', AprobacionController.getAprobacion) 
router.post('/api/aprobacion/', AprobacionController.CrearComentario)



export default router