import { DataTypes } from "sequelize";
import { sequelize } from '../config/db.js';

export const Persona = sequelize.define('Persona', {
    IdPersona: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    NombrePersona: { type: DataTypes.STRING(20), allowNull: false },
    ApellidoPersona: { type: DataTypes.STRING(20), allowNull: false },
    CorreoPersona: { type: DataTypes.STRING(30), allowNull: false, unique: true },
    ClavePersona: { type: DataTypes.STRING(20), allowNull: false },
    EstadoPersona: { type: DataTypes.BOOLEAN, allowNull: false },
    idRolFK: { type: DataTypes.INTEGER, allowNull: false },
}, {
    tableName: 'Persona',
    timestamps: false,
});
