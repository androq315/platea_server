import { Router } from "express";
import { getProductos} from "../controllers/producto.controller.js";

const router = Router()

router.get('/api/producto/', getProductos)


export default router