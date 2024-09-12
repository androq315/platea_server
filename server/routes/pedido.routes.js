import { Router } from "express";
import PedidoController from "../controllers/pedido.controller.js";

const router = Router()


router.post('/api/pedido/', PedidoController.Compra)





export default router