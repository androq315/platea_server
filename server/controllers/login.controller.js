import { Persona } from "../models/persona.model.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import dotenv from "dotenv";

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
            const persona = await Persona.findOne({ where: { CorreoPersona }});

            if (!persona) {
                console.log("Usuario no encontrado.");
                return res.status(401).json({ message: "Credenciales incorrectas." });
            }

            console.log("Usuario encontrado:", persona);

            // Comparar la contraseña ingresada con la contraseña encriptada
            const isMatch = await bcrypt.compare(ClavePersona, persona.ClavePersona);
            console.log("¿La contraseña coincide?:", isMatch);

            if (!isMatch) {
                console.log("Contraseña incorrecta.");
                return res.status(401).json({ message: "Credenciales incorrectas." });
            }

            // Generar token JWT
            const token = jwt.sign(
                { IdPersona: persona.IdPersona },
                process.env.JWT_SECRET,
                { expiresIn: "1h" }
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
                },
            });

        } catch (error) {
            console.error("Error en el login:", error);
            return res.status(500).json({ message: "Error al iniciar sesión. Por favor, intenta nuevamente más tarde." });
        }
    }
}

export default LoginController;