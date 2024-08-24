import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';// Asumiendo que existe un modelo Cubiculo

class Producto extends Model {
    // Método para crear un nuevo producto
    static async createProducto(producto) {
        try {
            return await this.create(producto);
        } catch (error) {
            console.error(`Unable to create producto: ${error}`);
            throw error;
        }
    }

    // Método para obtener todos los productos
    static async getProductos() {
        try {
            return await this.findAll();
        } catch (error) {
            console.error(`Unable to find all productos: ${error}`);
            throw error;
        }
    }

    // Método para obtener un producto por su ID
    static async getProductoById(id) {
        try {
            return await this.findByPk(id);
        } catch (error) {
            console.error(`Unable to find producto by id: ${error}`);
            throw error;
        }
    }

    // Método para actualizar un producto
    static async updateProducto(id, updated_producto) {
        try {
            const producto = await this.findByPk(id);
            return producto.update(updated_producto);
        } catch (error) {
            console.error(`Unable to update the producto: ${error}`);
            throw error;
        }
    }

    // Método para eliminar un producto
    static async deleteProducto(id) {
        try {
            const producto = await this.findByPk(id);
            return producto.destroy();
        } catch (error) {
            console.error(`Unable to delete producto: ${error}`);
            throw error;
        }
    }
}

// Definición del modelo Producto en Sequelize
Producto.init({
    IdProducto: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    NombreProducto: {
        type: DataTypes.STRING(20),
        allowNull: false
    },
    DescripcionProducto: {
        type: DataTypes.STRING(100)
    },
    StockProducto: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    PrecioProducto: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    FotoProducto: {
        type: DataTypes.TEXT
    },
    FotoProductoURL: {
        type: DataTypes.TEXT
    },
    IdCategoriaFK: {
        type: DataTypes.INTEGER
    },
    IdTiendaFK:{
        type: DataTypes.INTEGER
    }
    },
 {
    sequelize,
    tableName: 'Producto',
    timestamps: false,
    underscored: false,
});

export { Producto };
