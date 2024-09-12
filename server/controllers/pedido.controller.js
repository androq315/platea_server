import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import { sequelize } from '../config/db.js';
import { Pedido } from '../models/pedido.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
    static async Compra(req, res) {
        const { idPersonaFK, Direccion, metodoPago, Ciudad } = req.body;

        try {
            // Iniciar una transacción
            const resultado = await sequelize.transaction(async (t) => {
                // Llamar al procedimiento almacenado para crear el pedido
                await sequelize.query(
                  `CALL CrearPedido(
                      :IdPersonaFK,
                      :Direccion,
                      :Ciudad,
                      :MetodoPago,
                      @p_IdPedido
                  )`,
                  {
                    replacements: {
                      IdPersonaFK: idPersonaFK,
                      Direccion: Direccion,
                      Ciudad: Ciudad,
                      MetodoPago: metodoPago
                    },
                    type: sequelize.QueryTypes.RAW,
                    transaction: t
                  }
                );
            
                // Obtener el ID del pedido recién creado
                const [resultSet] = await sequelize.query(`SELECT @p_IdPedido AS IdPedido;`, {
                  type: sequelize.QueryTypes.SELECT,
                  transaction: t
                });
            
                const pedidoId = resultSet[0].IdPedido;
            
                // Llamar al procedimiento almacenado para insertar los productos y calcular el total
                const totalPedido = await PedidoProducto.createPedidoProducto(pedidoId, idPersonaFK);
            
                // Actualizar el total del pedido
                await sequelize.query(
                    `UPDATE Pedido SET Total = :totalPedido WHERE IdPedido = :pedidoId`,
                    {
                      replacements: {
                        totalPedido,
                        pedidoId
                      },
                      transaction: t,
                    }
                );
            
                // Eliminar los productos del carrito
                await CarritoProducto.destroy({
                    where: { IdPersonaFK: idPersonaFK },
                    transaction: t,
                });
            
                // Retornar el pedido
                const pedidoFinal = await Pedido.findOne({
                    where: { IdPedido: pedidoId },
                    transaction: t,
                });
            
                return pedidoFinal;
            });
            
        } catch (error) {
            console.error('Error al realizar la compra:', error);
            res.status(500).json({ error: 'Error al realizar la compra' });
        }
    }




}

export default PedidoController;