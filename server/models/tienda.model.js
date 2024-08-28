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

  static async getTiendas() {
    try {
      return await this.findAll();
    } catch (error) {
      console.error(`Unable to find all tiendas: ${error}`);
      throw error;
    }
  }

  static async getTiendaById(id) {
    try {
      return await this.findByPk(id);
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
  CiudadTienda:{
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
