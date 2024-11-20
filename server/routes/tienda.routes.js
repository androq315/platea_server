import { Router } from "express";
import TiendaController from "../controllers/tienda.controller.js";


const router = Router();

router.get('/api/tienda/', TiendaController.getTiendas);
router.get('/api/tiendastop/', TiendaController.TiendasDestacadas);
router.post('/api/tienda/', TiendaController.postTienda);
router.post('/api/tienda/persona/', TiendaController.comprarTienda);
router.put('/api/tienda/:id', TiendaController.putTienda);
router.patch('/api/tienda/:id', TiendaController.patchTienda);
router.get('/api/tienda/moda', TiendaController.obtenerTiendasDeModa);
router.get('/api/tienda/electrodomesticos', TiendaController.obtenerTiendasDeElectrodomesticos);
router.get('/api/tienda/hogar', TiendaController.obtenerTiendasDeHogar);
router.get('/api/tienda/deportes', TiendaController.obtenerTiendasDeDeportes);
router.get('/api/tienda/juguetes', TiendaController.obtenerTiendasDeJuguetes);
router.get('/api/tienda/belleza', TiendaController.obtenerTiendasDeBelleza);
router.get('/api/tienda/obtenerPorCategoria/:id', TiendaController.obtenerPorCategoria);
router.get('/api/tienda/:id', TiendaController.getTienda);
router.get('/api/tienda/pedidos/:id', TiendaController.pedidosTienda);
router.get('/api/tienda/pedidos/productos/:IdTienda/:IdPedido', TiendaController.productospedidosTienda);
router.delete('/tienda/:id', TiendaController.deleteTienda);
export default router;
