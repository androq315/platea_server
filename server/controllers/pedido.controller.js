import { fileURLToPath } from 'url';
import path, { dirname } from 'path';

import { Pedido } from '../models/pedido.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
    static async Compra(req, res) {
        const { idPersona, idDireccion, metodoPago, productos } = req.body;

    try {
        // Iniciar una transacción
        const resultado = await sequelize.transaction(async (t) => {
            // Crear el pedido
            const pedido = await Pedido.create({
                IdPersona: idPersona,
                IdDireccion: idDireccion,
                MetodoPago: metodoPago,
                EstadoPedido: 'Pendiente',
                Total: productos.reduce((total, prod) => total + prod.PrecioUnitario * prod.Cantidad, 0)
            }, { transaction: t });

            // Crear las entradas en PedidoProducto
            for (const prod of productos) {
                await PedidoProducto.create({
                    IdPedidoFK: pedido.IdPedido,
                    IdProductoFK: prod.IdProductoFK,
                    Cantidad: prod.Cantidad,
                    PrecioUnitario: prod.PrecioUnitario
                }, { transaction: t });
            }

            return pedido;
        });

        res.status(201).json(resultado);
    } catch (error) {
        console.error('Error al realizar la compra:', error);
        res.status(500).json({ error: 'Error al realizar la compra' });
    }
    }

    static async DeleteProducto(req, res) {
        try {
            const id = req.params.id;
            const carrito = await Carrito.deleteProducto(id);
    
            // Devuelve el resultado en formato JSON
            res.status(200).json({ message: 'Producto agregado al carrito exitosamente', carrito });
        } catch (error) {
            console.error(`Error al agregar el producto al carrito: ${error}`);
            res.status(500).json({ message: 'Error al agregar el producto al carrito: ' + error.message });
        }
    }

    

}

export default PedidoController;