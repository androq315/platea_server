import { Router } from "express";
import TiendaController from "../controllers/tienda.controller.js";


const router = Router();

router.get('/api/tienda/', TiendaController.getTiendas);
router.get('/api/tienda/:id', TiendaController.getTienda);
router.post('/api/tienda/', TiendaController.postTienda);
router.put('/api/tienda/:id', TiendaController.putTienda);
router.patch('/api/tienda/:id', TiendaController.patchTienda);

export default router;
