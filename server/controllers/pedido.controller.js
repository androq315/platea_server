import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import { sequelize } from '../config/db.js';
import { Pedido } from '../models/pedido.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
  static async Compra(req, res) {
    


    try {
      // Iniciar una transacción
      const [hola] = await sequelize.transaction(async (t) => {
        const p = {
          IdPersonaFK: req.body.IdPersonaFK,
          Direccion: req.body.Direccion,
          Ciudad: req.body.Ciudad
        }
        
        const pedidoId = await Pedido.createPedido(p)
        const precioTotal = await Pedido.createPedidoProducto(pedidoId, req.body.IdPersonaFK)
        

        console.log("precio: ", precioTotal);

        await Pedido.actualizarPrecio(precioTotal, pedidoId)


        const pedidoFinal = await Pedido.GetPedido(pedidoId)

        return pedidoFinal;
      });

      res.status(200).json(hola);
    } catch (error) {
      console.error('Error al realizar la compra:', error);
      res.status(500).json({ error: 'Error al realizar la compra' });
    }
  }

  
}

export default PedidoController;
