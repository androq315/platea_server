import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Carrito } from '../models/carrito.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class CarritoController {

    static async ProductosCarrito(req, res) {
        try {
            const id = req.params.id;
            const carrito = await Carrito.getProductos(id);
            res.status(200).json(carrito);
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener los productos: ' + error });
        }
    }

    static async agregarProductoCarrito(req, res) {
        try {
            const {IdPersonaFK,  IdProductoFK } = req.body; 
    
            const producto = {
                IdPersonaFK,
                IdProductoFK
            };
            const resultado = await Carrito.AgregarProductoCarrito(producto);
    
            // Devuelve el resultado en formato JSON
            res.status(200).json({ message: 'Producto agregado al carrito exitosamente', resultado });
        } catch (error) {
            console.error(`Error al agregar el producto al carrito: ${error}`);
            res.status(500).json({ message: 'Error al agregar el producto al carrito: ' + error.message });
        }
    }


}

export default CarritoController;