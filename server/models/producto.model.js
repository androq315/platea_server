import { DataTypes } from "sequelize";
import { sequelize } from '../config/db.js';

export const Producto = sequelize.define('Producto', {
    IdProducto: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    NombreProducto: { type: DataTypes.STRING(20), allowNull: false },
    DescripcionProducto: { type: DataTypes.STRING(100), allowNull: false },
    PrecioProducto:{type:DataTypes.STRING(100),allowNull: false},
    StockProducto: { type: DataTypes.INTEGER, allowNull: false },
    IdCubiculoFK: { type: DataTypes.INTEGER, allowNull: false },
}, {
    tableName: 'Producto',
    timestamps: false,
});