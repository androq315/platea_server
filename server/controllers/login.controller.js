import { Persona } from "../models/persona.model.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import dotenv from "dotenv";
import { sequelize } from '../config/db.js';
dotenv.config(); // Asegúrate de que las variables de entorno estén cargadas

class LoginController {
    static async login(req, res) {
        try {
            const { CorreoPersona, ClavePersona } = req.body;

            if (!CorreoPersona || !ClavePersona) {
                return res.status(400).json({ message: "Correo y contraseña son requeridos." });
            }

            console.log("Correo recibido:", CorreoPersona);
            console.log("Clave recibida:", ClavePersona);

            // Búsqueda del usuario por correo electrónico
            const persona = await Persona.findOne({ where: { CorreoPersona } });

            if (!persona) {
                console.log("Usuario no encontrado.");
                return res.status(401).json({ message: "Credenciales incorrectas." });
            }

            console.log("Usuario encontrado:", persona);

            const Clave = await sequelize.query(`call platea.CLAVE('${CorreoPersona}', '${process.env.DB_CLAVE}');`);
            console.log("clave", Clave);

            const nombreClave = Object.keys(Clave[0])[0];
            console.log('Nombre de la clave:', nombreClave);
            // Extraer el valor de la clave
            const claveEncriptada = Clave[0][nombreClave];
            console.log("claveEncriptada: ", claveEncriptada);
            const isMatch = await bcrypt.compare(ClavePersona, claveEncriptada);
            console.log("¿La contraseña coincide?:", isMatch);

            if (!isMatch) {
                console.log("Contraseña incorrecta.");
                return res.status(401).json({ message: "Credenciales incorrectas." });
            }

            // Generar token JWT con IdPersona y idRolFK
            const token = jwt.sign(
                { 
                    IdPersona: persona.IdPersona, 
                    idRolFK: persona.idRolFK // Incluyendo el rol en el token
                },
                process.env.JWT_SECRET,
                { expiresIn: "24h" }
            );
            console.log("Token generado:", token);

            return res.status(200).json({
                message: "Inicio de sesión exitoso",
                token,
                persona: {
                    IdPersona: persona.IdPersona,
                    NombrePersona: persona.NombrePersona,
                    ApellidoPersona: persona.ApellidoPersona,
                    CorreoPersona: persona.CorreoPersona,
                    FotoPersona: persona.FotoPersona,
                    FotoPersonaURL: persona.FotoPersonaURL,
                    bannerPersona: persona.bannerPersona,
                    bannerPersonaURL: persona.bannerPersonaURL,
                    TelefonoPersona: persona.TelefonoPersona,
                    idRolFK: persona.idRolFK // También se incluye en la respuesta
                },
            });

        } catch (error) {
            console.error("Error en el login:", error);
            return res.status(500).json({ message: "Error al iniciar sesión. Por favor, intenta nuevamente más tarde." });
        }
    }
}

export default LoginController;
