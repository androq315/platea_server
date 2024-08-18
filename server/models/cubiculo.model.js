import { DataTypes } from "sequelize";
import { sequelize } from '../config/db.js';

export const Cubiculo = sequelize.define('Cubiculo', {
    IdCubiculo: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    NumeroCubiculo: { type: DataTypes.INTEGER, autoIncrement: true },  
    DireccionCubiculo: { type: DataTypes.STRING(20), allowNull: false },
    FechaAperturaCubiculo: { type: DataTypes.DATE, allowNull: false },
    NombreCubiculo: { type: DataTypes.STRING(30), allowNull: false, unique: true },
    CalificacionCubiculo: { type: DataTypes.INTEGER, allowNull: false },
    EstadoCubiculo: { type: DataTypes.BOOLEAN, allowNull: false },
    idArrendatarioFK: { type: DataTypes.INTEGER, allowNull: false },
    idAdministradorFK: { type: DataTypes.INTEGER, allowNull: false },
}, {
    tableName: 'Cubiculo',
    timestamps: true,
});
