import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import { sequelize } from '../config/db.js';
import { Pedido } from '../models/pedido.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
  static async Compra(req, res) {
    const { idPersonaFK, Direccion, Ciudad } = req.body;
    
    if (!idPersonaFK) {
      return res.status(400).json({ error: "El campo idPersonaFK es requerido." });
    }
    console.log("Datos recibidos en el backend:", req.body); 
    try {
      const [hola] = await sequelize.transaction(async (t) => {
        const resultSet = await sequelize.query(
          `CALL CrearPedido(
                      :p_IdPersonaFK,
                      :p_Direccion,
                      :p_Ciudad
                  )`,
          {
            replacements: {
              p_IdPersonaFK: idPersonaFK, 
              p_Direccion: Direccion,     
              p_Ciudad: Ciudad            
            },
            type: sequelize.QueryTypes.RAW,
            transaction: t
          }
        );
        console.log("Resultado del procedimiento:", resultSet);
        const pedidoId = resultSet[0].IdPedidoCreado;

        const resultSet2 = await sequelize.query(
          `CALL MigrarCarritoAPedido(
              :IdPersonaFK,
              :IdPedidoFK
          )`,
          {
            replacements: {
              IdPersonaFK: idPersonaFK,
              IdPedidoFK: pedidoId
            },
            type: sequelize.QueryTypes.RAW,
            transaction: t
          }
        );

        const result = resultSet2[0];
        const resultado = result.Total;
        console.log("precio: ", resultado);

        await sequelize.query(
          `UPDATE Pedido SET Total = :totalPedido WHERE IdPedido = :pedidoId`,
          {
            replacements: {
              totalPedido: resultado,
              pedidoId: pedidoId
            },
            transaction: t
          }
        );

        const pedidoFinal = await sequelize.query(
          `CALL platea.VerPedido(:pedidoId)`,
          {
            replacements: { pedidoId: pedidoId },
            transaction: t,
            type: sequelize.QueryTypes.SELECT
          }
        );

        return pedidoFinal;
      });

      res.status(200).json(hola);
    } catch (error) {
      console.error("Error al crear el pedido:", error);
      res.status(500).json({ error: 'Error al realizar la compra' });
    }
  }

  static async prueba(req, res) {
    const { idPersonaFK, Direccion, Ciudad } = req.body;

    try {
      // Iniciar una transacción

        // Llamar al procedimiento almacenado para crear el pedido
        const resultSet = await sequelize.query(
          `CALL CrearPedido(
                      :IdPersonaFK,
                      :Direccion,
                      :Ciudad,
                      :MetodoPago
                  )`,
          {
            replacements: {
              IdPersonaFK: idPersonaFK,
              Direccion: Direccion,
              Ciudad: Ciudad,
              MetodoPago: metodoPago
            },
            type: sequelize.QueryTypes.RAW,
          }
        );

        const pedidoId = resultSet[0].IdPedidoCreado;
        console.log("pedidoId: ", pedidoId)
        res.status(500).json(pedidoId);
      } catch (error) {
        console.error('Error al realizar la prueba:', error);
        res.status(500).json({ error: 'Error al realizar la compra' });
      }
  }



}






export default PedidoController;