import { Router } from "express";
import PedidoController from "../controllers/pedido.controller.js";

const router = Router()


router.post('/api/pedido/', PedidoController.Compra)
router.get('/api/pedido/:id', PedidoController.GetProductosPedido)
router.get('/api/pedidopersona/:id', PedidoController.GetPedidoPersona)
router.post('/api/confirmarpedido/', PedidoController.ConfirmarCompra)





export default router