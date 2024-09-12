import { Router } from "express";
import PedidoController from "../controllers/pedido.controller.js";

const router = Router()


router.post('/api/carrito/', PedidoController.Compra)





export default router