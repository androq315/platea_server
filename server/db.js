import { createPool } from "mysql2";

export const pool = createPool({
    host: "localhost",
    port: 3307,
    user: "root",
    password: "",
    database: "platea"
});