import { Sequelize, DataTypes } from "sequelize";
import dotenv from "dotenv";

dotenv.config();

export const sequelize = new Sequelize(process.env.DB_SCHEMA, process.env.DB_USER, process.env.DB_PASS, {
<<<<<<< HEAD
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: "mysql",
  dialectOptions: {
    connectTimeout: 60000, // Ajustar si el proxy es lento
  },
=======
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: "mysql",
>>>>>>> ae2dffe842265c4911cb5f6de5dde607e9fcef46
});
