import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js'; // Asumiendo que existe la conexión a la base de datos

class Categoria extends Model {
    // Método para crear una nueva categoría
    static async createCategoria(categoria) {
        try {
            return await this.create(categoria);
        } catch (error) {
            console.error(`Unable to create categoria: ${error}`);
            throw error;
        }
    }

    // Método para obtener todas las categorías
    static async getCategorias() {
        try {
            return await this.findAll();
        } catch (error) {
            console.error(`Unable to find all categorias: ${error}`);
            throw error;
        }
    }

    // Método para obtener una categoría por su ID
    static async getCategoriaById(id) {
        try {
            const categoria = await this.findByPk(id);
            return categoria;
        } catch (error) {
            console.error(`Unable to find categoria by ID: ${error}`);
            throw error;
        }
    }

    // Método para actualizar una categoría
    static async updateCategoria(id, updated_categoria) {
        try {
            const categoria = await this.findByPk(id);
            return categoria.update(updated_categoria);
        } catch (error) {
            console.error(`Unable to update the categoria: ${error}`);
            throw error;
        }
    }

    // Método para eliminar una categoría
    static async deleteCategoria(id) {
        try {
            const categoria = await this.findByPk(id);
            return categoria.destroy();
        } catch (error) {
            console.error(`Unable to delete categoria: ${error}`);
            throw error;
        }
    }
}

// Definición del modelo
Categoria.init({
    IdCategoria: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    NombreCategoria: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    FotoCategoria: {
        type: DataTypes.TEXT,
        allowNull: true
    }
}, {
    sequelize,
    modelName: 'Categoria',
    tableName: 'Categoria',
    timestamps: false,
    underscored: false,
});

export default Categoria;
