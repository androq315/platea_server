import { Router } from "express";
import { getTienda, getTienda, postTienda, putTienda, toggleTienda, patchTienda } from "../controllers/tienda.controller.js";

const router = Router()

router.get('/api/tienda/', getTienda)
router.get('/api/tienda/:id', getTienda)
router.post('/api/tienda/', postTienda)
router.put('/api/tienda/:id', putTienda)
router.delete('/api/tienda/:id', toggleTienda)
router.patch('/api/tienda/:id', patchTienda)



export default router