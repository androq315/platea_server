import { Router } from "express";
import CarritoController from "../controllers/carrito.controller.js";

const router = Router()

router.get('/api/carrito/:id', CarritoController.ProductosCarrito)
router.post('/api/carrito/', CarritoController.agregarProductoCarrito)
router.patch('/api/carrito/', CarritoController.ActualizarCantidad)
router.delete('/api/carrito/:id', CarritoController.DeleteProducto)




export default router