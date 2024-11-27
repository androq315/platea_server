  import { DataTypes, Model } from 'sequelize';
  import { sequelize } from '../config/db.js';

  class Pedido extends Model {

    static async createPedido(pedido) {
      const {
        IdPersonaFK,
        Direccion,
        Ciudad,
      } = pedido;

      try {
        const resultSet = await sequelize.query(
          `CALL CrearPedido(
                      :IdPersonaFK,
                      :Direccion,
                      :Ciudad
                  )`,
          {
            replacements: {
              IdPersonaFK: IdPersonaFK,
              Direccion: Direccion,
              Ciudad: Ciudad
            },
            type: sequelize.QueryTypes.RAW,
          }
        );
        const result = resultSet[0];
        const resultado = result.IdPedidoCreado;

        return resultado;
      } catch (error) {
        console.error(`Unable to create pedido: ${error}`);
        throw error;
      }
    }
    static async createPedidoProducto(idPedido, idPersona) {
      try {
        // Llamar al procedimiento almacenado
        const resultSet = await sequelize.query(
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
        const result = resultSet[0];
        const resultado = result.Total;

        return resultado;
      } catch (error) {
        console.error(`Unable to create pedidoProducto: ${error}`);
        throw error;
      }
    }

    static async actualizarPrecio(resultado, pedidoId) {
      try {
        await sequelize.query(
          `UPDATE Pedido SET Total = :totalPedido WHERE IdPedido = :pedidoId`,
          {
            replacements: {
              totalPedido: resultado,
              pedidoId: pedidoId
            }
          }
        );
      } catch (error) {
        console.error(`Unable to create pedidoProducto: ${error}`);
        throw error;
      }
    }
    static async StockProductoPedido(p_IdProdcuto,P_stock) {
      try {
        await sequelize.query(
          `call platea.NuevoStock(${p_IdProdcuto},${P_stock});`,

        );
      } catch (error) {
        console.error(`Unable to update stock: ${error}`);
        throw error;
      }
    }


    static async GetPedidosPersona(id) {
      try {
        const pedidoFinal = await sequelize.query(`CALL platea.pedidopersona(${id})`);
        return pedidoFinal
      } catch (error) {
        console.error(`Unable to create pedidoProducto: ${error}`);
        throw error;
      }
    }
    static async GetPedido(id) {
      try {
        const pedidoFinal = await sequelize.query(`CALL platea.VerPedido(${id})`);
        return pedidoFinal
      } catch (error) {
        console.error(`Unable to create pedidoProducto: ${error}`);
        throw error;
      }
    }

    
    static async GetProductosPedido(id) {
      try {
        const pedidoFinal = await sequelize.query(`CALL platea.ObtenerProductoPedido(${id})`);
        return pedidoFinal
      } catch (error) {
        console.error(`Unable to create pedidoProducto: ${error}`);
        throw error;
      }
    }


    static async VaciarCarrito(id) {
      try {
        const pedidoFinal = await sequelize.query(`CALL platea.vaciarcarrito(${id})`);
        return pedidoFinal
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
