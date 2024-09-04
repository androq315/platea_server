import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';


class Aprobacion extends Model {

  static async getComentarios(id) {
    try { 
      const results = await sequelize.query(`call platea.Mostrarcomentarios(${id});`);
      return results;
    } catch (error) {
      console.error(`Unable to find all tiendas: ${error}`);
      throw error;
    }
  }


  static async CrearComentario(tienda) {
    const { ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK
    } = tienda;

    try {
      // Llamar al procedimiento almacenado
      await sequelize.query(
        `CALL crearComentario( :ComentarioAprobacion, :CalificacionAprobacion, :IdPersonaFK, :IdProductoFK)`,
        {
          replacements: {ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK
          },
          type: sequelize.QueryTypes.RAW
        }
      );
    } catch (error) {
      console.error(`Unable to create comment: ${error}`);
      throw error;
    }
  }

  

}

Aprobacion.init({
  IdAprobacion: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  ComentarioAprobacion: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  CalificacionAprobacion: {
    type: DataTypes.DECIMAL(2, 1),
    allowNull: false
  },
  FechaAprobacion: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  NombreTienda: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  IdPersonaFK: {
    type: DataTypes.INTEGER,
  },
  IdProductoFK: {
    type: DataTypes.INTEGER,
  }
}, {
  sequelize,
  tableName: 'Aprobacion',
  timestamps: false,
  underscored: false,
});

export { Aprobacion };