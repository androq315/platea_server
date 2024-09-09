import { Router } from "express";
import CarritoController from "../controllers/carrito.controller.js";

const router = Router()

router.get('/api/carrito/:id', CarritoController.ProductosCarrito)
router.post('/api/carrito/', CarritoController.agregarProductoCarrito)




export default router