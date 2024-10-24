import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';

class Carrito extends Model {

  static async getProductos(id) {
    try {
      const [results, metadata] = await sequelize.query(
        `CALL platea.ObtenerProductosCarrito(:id);`,
        {
          replacements: { id },
          type: sequelize.QueryTypes.SELECT
        }
      );
      return results; 
    } catch (error) {
      console.error(`Unable to find comments: ${error}`);
      throw error;
    }
  }

  static async DireccionesPersona(id) {
    try {
      const [results, metadata] = await sequelize.query(
        `CALL platea.ObtenerDireccionPersona(:id);`,
        {
          replacements: { id },
          type: sequelize.QueryTypes.SELECT
        }
      );
      return results; 
    } catch (error) {
      console.error(`Unable to find comments: ${error}`);
      throw error;
    }
  }

  static async getCiudades(id) {
    try {
      const results = await sequelize.query(
        `SELECT id,concat(nombre," -- ",departamento) as "ciudad" FROM platea.ciudades`,
        {
          replacements: { id },
          type: sequelize.QueryTypes.SELECT
        }
      );
      return results; 
    } catch (error) {
      console.error(`Unable to find comments: ${error}`);
      throw error;
    }
  }

  static async AgregarProductoCarrito(producto) {
    const {
      IdPersonaFK,
      IdProductoFK
    } = producto;
  
    try {
      // Llamar al procedimiento almacenado
      const result = await sequelize.query(
        `CALL AgregarProductoCarrito(
          :IdPersonaFK,
          :IdProductoFK
        )`,
        {
          replacements: {
            IdPersonaFK,
            IdProductoFK
          },
          type: sequelize.QueryTypes.INSERT // Ajusta esto según sea necesario
        }
      );
      return result;
    } catch (error) {
      console.error(`Unable to add product to cart: ${error}`);
      throw error;
    }
  }
  
  static async ActualizarCantidad(producto) {
    const {
      IdPersonaFK,
      IdProductoFK,
      Cantidad
    } = producto;
  
    try {
      // Llamar al procedimiento almacenado
      const result = await sequelize.query(
        `call platea.ActualizarCantidad(
          :IdPersonaFK,
          :IdProductoFK,
          :Cantidad);`,
        {
          replacements: {
            IdPersonaFK,
            IdProductoFK,
            Cantidad
          },
          type: sequelize.QueryTypes.INSERT // Ajusta esto según sea necesario
        }
      );
    } catch (error) {
      console.error(`Unable to add product to cart: ${error}`);
      throw error;
    }
  }

  static async deleteProducto(id) {
    try {

      const result = await sequelize.query(
        `call platea.EliminarProducto(${id});`,
    ); 
    } catch (error) {
      console.error(`Unable to find comments: ${error}`);
      throw error;
    }
  }
  
  


}

Carrito.init({
    IdCarrito: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    IdPersonaFK: {
      type: DataTypes.INTEGER,
      references: {
        model: 'persona',
        key: 'IdPersona'
      },
      allowNull: true
    },
    fecha_creacion: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'carrito',
    timestamps: false,
    underscored: false,
  });

export { Carrito };
