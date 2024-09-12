import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';



const Pedido = sequelize.define('Pedido', {
    IdPedido: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    IdPersona: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    IdDireccion: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    FechaPedido: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    MetodoPago: {
        type: DataTypes.STRING,
        allowNull: false
    },
    EstadoPedido: {
        type: DataTypes.ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado', 'En Proceso'),
        defaultValue: 'Pendiente'
    },
    Total: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    },
    FechaEnvio: {
        type: DataTypes.DATE,
        allowNull: true
    },
    FechaEntrega: {
        type: DataTypes.DATE,
        allowNull: true
    }
});

module.exports = Pedido;