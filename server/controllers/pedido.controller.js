import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import { sequelize } from '../config/db.js';
import { Pedido } from '../models/pedido.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
  static async Compra(req, res) {
    try {
      const hola = await sequelize.transaction(async (t) => {
        const p = {
          IdPersonaFK: req.body.IdPersonaFK,
          Direccion: req.body.Direccion,
          Ciudad: req.body.Ciudad
        }
        
        const pedidoId = await Pedido.createPedido(p)
        const precioTotal = await Pedido.createPedidoProducto(pedidoId, req.body.IdPersonaFK)
        return pedidoId
      });

      res.status(200).json({ idPedido: hola });
    } catch (error) {
      console.error("Error al crear el pedido:", error);
      res.status(500).json({ error: 'Error al realizar la compra' });
    }
  }
  static async GetProductosPedido(req, res) {
		try {
      const id = req.params.id;
			const pedido = await Pedido.GetProductosPedido(id);
			res.status(200).json(pedido);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
		}
	}

  static async GetPedidoPersona(req, res) {
		try {
      const id = req.params.id;
			const pedido = await Pedido.GetPedidosPersona(id);
			res.status(200).json(pedido);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
		}
	}

  static async GetPedidoPersona(req, res) {
		try {
      const id = req.params.id;
			const pedido = await Pedido.GetPedidosPersona(id);
			res.status(200).json(pedido);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
		}
	}

  static async ConfirmarCompra(req, res) {
    try {
      await Pedido.actualizarPrecio(req.body.Total,req.body.IdPedido)
      await Pedido.StockProductoPedido(req.body.IdPedido)
      await Pedido.VaciarCarrito(req.body.IdPersona)
      res.status(200).json({ message: 'compra creada correctamente' });
    } catch (error) {
      console.error("Error al crear el pedido:", error);
      res.status(500).json({ error: 'Error al realizar la compra' });
    }
  }
}


export default PedidoController;
