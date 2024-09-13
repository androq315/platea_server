import { Router } from "express";
import ProductoController from "../controllers/producto.controller.js";

const router = Router()

router.get('/api/producto/', ProductoController.getProductos)
router.get('/api/productosdestacados/', ProductoController.ProductosDestacados)
router.get('/api/tienda/producto/:id', ProductoController.ProductosTienda)
router.get('/api/producto/:id', ProductoController.getProducto)


router.get('/api/productos-similares/:id', ProductoController.getProductosSimilares);





router.post('/api/producto/', ProductoController.postProducto)
router.put('/api/producto/:id', ProductoController.putProducto)
router.delete('/api/producto/:id', ProductoController.deleteProducto)



export default router