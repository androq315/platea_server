import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';

class Pedido extends Model {

  static async createPedido(pedido) {
    const {
      IdPersonaFK,
      Direccion,
      Ciudad,
      MetodoPago
    } = pedido;

    try {
      // Llamar al procedimiento almacenado para crear el pedido
      const result = await sequelize.query(
        `CALL CrearPedido(
              :IdPersonaFK,
              :Direccion,
              :Ciudad,
              :MetodoPago
            )`,
        {
          replacements: {
            IdPersonaFK,
            Direccion,
            Ciudad,
            MetodoPago
          },
          type: sequelize.QueryTypes.RAW
        }
      );

      // Recuperar el parámetro de salida con el Id del pedido recién creado
      const [resultSet] = result
      const IdPedido = resultSet[0].IdPedido;

      return IdPedido;
    } catch (error) {
      console.error(`Unable to create pedido: ${error}`);
      throw error;
    }
  }
  static async createPedidoProducto(idPedido, idPersona) {
    try {
      // Llamar al procedimiento almacenado
      const [resultSet] = await sequelize.query(
        `CALL MigrarCarritoAPedido(
              :IdPersonaFK,
              :IdPedidoFK
              
            )`,
        {
          replacements: {
            IdPersonaFK: idPersona,
            IdPedidoFK: idPedido

          },
          type: sequelize.QueryTypes.RAW
        }
      );

      // Recuperar el total del pedido
      const totalPedido = resultSet[0].Total;

      return totalPedido;
    } catch (error) {
      console.error(`Unable to create pedidoProducto: ${error}`);
      throw error;
    }
  }
}




Pedido.init({
  IdPedido: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  IdPersonaFK: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Persona',
      key: 'IdPersona'
    },
    onDelete: 'CASCADE'
  },
  Direccion: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  Ciudad: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  FechaPedido: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  MetodoPago: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  EstadoPedido: {
    type: DataTypes.ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado', 'En Proceso'),
    defaultValue: 'Pendiente'
  },
  Total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  },
  FechaEnvio: {
    type: DataTypes.DATE,
    allowNull: true
  },
  FechaEntrega: {
    type: DataTypes.DATE,
    allowNull: true
  }
}, {
  sequelize,
  tableName: 'Tienda',
  timestamps: false,
  underscored: false,
});


export { Pedido };
