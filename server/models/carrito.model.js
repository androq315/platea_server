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
          type: sequelize.QueryTypes.RAW // Ajusta esto según sea necesario
        }
      );
    } catch (error) {
      console.error(`Unable to add product to cart: ${error}`);
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
