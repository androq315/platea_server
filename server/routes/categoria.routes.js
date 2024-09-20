import { Router } from "express";
import CategoriaController from "../controllers/categoria.controller.js";

const router = Router()

router.get('/api/categoria/', CategoriaController.getCategorias)        
router.get('/api/categoria/:id', CategoriaController.getCategoria)        
router.post('/api/categoria/', CategoriaController.postCategoria)
router.put('/api/categoria/:id', CategoriaController.putCategoria)
router.delete('/api/categoria/:id', CategoriaController.deleteCategoria)



export default router