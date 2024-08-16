import { pool } from "../db.js";

export async function getUsers(){
    const [ rows ] = await pool.promise().query("SELECT * FROM persona");
    console.log("consulta realizada");
    return rows;
}

export async function getUser(id){
    const [ row ] = await pool.promise().query(`call buscarPersona(${id})`);
    return row[0];
}

export async function postUser(user){
    const [ row ] = await pool.promise().query(`INSERT INTO persona (NombrePersona, ApellidoPersona, CorreoPersona, ContrasenaPersona, EstadoPersona, TelefonoPersona, idRolFK) VALUES ("${user.nombre}", "${user.apellido}", "${user.correo}", "${user.clave}", 1, ${user.telefono}, ${user.rol})`);
    return console.log("Usuario insertado");
}

export async function putUser(user, id){
    const [ row ] = await pool.promise().query(`UPDATE persona SET NombrePersona = "${user.nombre}", ApellidoPersona = "${user.apellido}", CorreoPersona = "${user.correo}", ContrasenaPersona = "${user.clave}", TelefonoPersona = ${user.telefono}, idRolFK = ${user.rol} WHERE IdPersona = ${id}`)
}

export async function toggleUser(id) {
    const [ row ] = await pool.promise().query("UPDATE persona SET EstadoPersona = IF(EstadoPersona = 1, 0, 1)")
}