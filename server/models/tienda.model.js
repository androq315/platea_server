import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';

class Tienda extends Model {

  static async createTienda(tienda) {
    try {
      return await this.create(tienda);
    } catch (error) {
      console.error(`Unable to create tienda: ${error}`);
      throw error;
    }
  }
  static async comprarTienda(tienda) {
    const {
      IdPersona,
      NombreTienda,
      DireccionTienda,
      CiudadTienda,
      DescripcionTienda,
      IdCategoriaFK,
      MiniaturaTienda,
      MiniaturaTiendaURL,
      BannerTienda,
      BannerTiendaURL,
      FechaInicioArrendatario,
      FechaExpiracionArrendatario
    } = tienda;
    
    // Establecer la fecha de inicio y expiración si no están proporcionadas
    const fechaInicio = FechaInicioArrendatario || new Date();
    const fechaExpiracion = FechaExpiracionArrendatario || new Date(new Date().setMonth(new Date().getMonth() + 2));
    
    try {
      // Llamar al procedimiento almacenado
      const result = await sequelize.query(
        `CALL CrearTienda(
          :IdPersona,
          :NombreTienda,
          :DireccionTienda,
          :CiudadTienda,
          :DescripcionTienda,
          :IdCategoriaFK,
          :MiniaturaTienda,
          :MiniaturaTiendaURL,
          :BannerTienda,
          :BannerTiendaURL,
          :FechaInicioArrendatario,
          :FechaExpiracionArrendatario,
          @p_IdTienda
        )`,
        {
          replacements: {
            IdPersona,
            NombreTienda,
            DireccionTienda,
            CiudadTienda,
            DescripcionTienda,
            IdCategoriaFK,
            MiniaturaTienda,
            MiniaturaTiendaURL,
            BannerTienda,
            BannerTiendaURL,
            FechaInicioArrendatario: fechaInicio,
            FechaExpiracionArrendatario: fechaExpiracion
          },
          type: sequelize.QueryTypes.RAW
        }
      );

      // Recuperar el parámetro de salida
      const [resultSet] = await sequelize.query(`SELECT @p_IdTienda AS IdTienda;`);
      const IdTienda = resultSet[0].IdTienda;

      return IdTienda;
    } catch (error) {
      console.error(`Unable to create tienda: ${error}`);
      throw error;
    }
  }



  static async getTiendas() {
    try {
    const [results]  = await sequelize.query(`SELECT * FROM platea.vertienda;`);
    return results;
    } catch (error) {
      console.error(`Unable to find all tiendas: ${error}`);
      throw error;
    }
  }

  static async getTiendaById(id) {
    try {
      const [result] = await sequelize.query(`call platea.verTienda(${id});`);
      return result
    } catch (error) {
      console.error(`Unable to find tienda by id: ${error}`);
      throw error;
    }
  }

  static async updateTienda(id, updated_tienda) {
    try {
      const tienda = await this.findByPk(id);
      return tienda.update(updated_tienda);
    } catch (error) {
      console.error(`Unable to update the tienda: ${error}`);
      throw error;
    }
  }

  static async toggleTiendaState(id) {
    try {
      const tienda = await this.findByPk(id);
      const newState = !tienda.EstadoTienda;
      await tienda.update({ EstadoTienda: newState });
      return tienda;
    } catch (error) {
      console.error(`Unable to toggle tienda state: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeModa() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Moda;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeModa: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeElectrodomesticos() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Electrodomesticos;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeElectrodomesticos: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeHogar() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Hogar;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeHogar: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeDeportes() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Deportes;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeDeportes: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeJuguetes() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Juguetes;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeJuguetes: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendasDeBelleza() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Belleza;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeBelleza: ${error}`);
      throw error;
    }
  }

  static async listarTop4Productos() {
    try {
      const [results] = await sequelize.query('SELECT * FROM Top4Productos;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ListarTop4Productos: ${error}`);
      throw error;
    }
  }

  static async listarTop4Tiendas() {
    try {
      const [results] = await sequelize.query('SELECT * FROM top4tiendas;');
      return results;
    } catch (error) {
      console.error(`Unable to execute ListarTop4Tiendas: ${error}`);
      throw error;
    }
  }

  static async obtenerTiendaporCategoria(id) {
    try {
      return await sequelize.query(`call platea.verTiendaCategoria(${id});`);
    } catch (error) {
      console.error(`Unable to execute ObtenerTiendasDeBelleza: ${error}`);
      throw error;
    }
  }
}

// Definición del modelo Tienda en Sequelize
Tienda.init({
  IdTienda: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  DireccionTienda: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  FechaAperturaTienda: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  NombreTienda: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  DescripcionTienda: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  CiudadTienda: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  CalificacionTienda: {
    type: DataTypes.DECIMAL(2, 1),
    defaultValue: 0.0
  },
  EstadoTienda: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  },
  MiniaturaTienda: {
    type: DataTypes.TEXT
  },
  MiniaturaTiendaURL: {
    type: DataTypes.TEXT
  },
  BannerTienda: {
    type: DataTypes.TEXT
  },
  BannerTiendaURL: {
    type: DataTypes.TEXT
  },
  IdCategoriaFK: {
    type: DataTypes.INTEGER,
  },
  IdArrendatarioFK: {
    type: DataTypes.INTEGER,
  }
}, {
  sequelize,
  tableName: 'Tienda',
  timestamps: false,
  underscored: false,
});

export { Tienda };
