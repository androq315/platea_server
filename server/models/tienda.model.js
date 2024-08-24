import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js'; // Asegúrate de que la configuración de la base de datos esté correcta

class Tienda extends Model {
    // Método para crear una nueva tienda
    static async createTienda(tienda) {
        try {
            return await this.create(tienda);
        } catch (error) {
            console.error(`Unable to create tienda: ${error}`);
            throw error;
        }
    }

    // Método para obtener todas las tiendas
    static async getTiendas() {
        try {
            return await this.findAll();
        } catch (error) {
            console.error(`Unable to find all tiendas: ${error}`);
            throw error;
        }
    }

    // Método para obtener una tienda por su ID
    static async getTiendaById(id) {
        try {
            return await this.findByPk(id);
        } catch (error) {
            console.error(`Unable to find tienda by id: ${error}`);
            throw error;
        }
    }

    // Método para actualizar una tienda
    static async updateTienda(id, updated_tienda) {
        try {
            const tienda = await this.findByPk(id);
            return tienda.update(updated_tienda);
        } catch (error) {
            console.error(`Unable to update the tienda: ${error}`);
            throw error;
        }
    }

    // Método para eliminar una tienda
    static async deleteTienda(id) {
        try {
            const tienda = await this.findByPk(id);
            return tienda.destroy();
        } catch (error) {
            console.error(`Unable to delete tienda: ${error}`);
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
    CalificacionTienda: {
        type: DataTypes.DECIMAL(2, 1),
        defaultValue: 0
    },
    EstadoTienda: {
        type: DataTypes.BOOLEAN,
        defaultValue: true
    },
    IdCategoriaFK: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Categoria', // Nombre de la tabla en la base de datos
            key: 'IdCategoria'
        }
    },
    IdArrendatarioFK: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Arrendatario', // Nombre de la tabla en la base de datos
            key: 'IdArrendatario'
        }
    }
}, {
    sequelize,
    tableName: 'Tienda',
    timestamps: false,
    underscored: false,
});

export { Tienda };
