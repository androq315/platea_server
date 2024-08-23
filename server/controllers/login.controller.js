import { Persona } from "../models/persona.model.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import dotenv from 'dotenv';

dotenv.config(); // Asegúrate de que las variables de entorno estén cargadas

class LoginController {
    static async login(req, res) {
        try {
            const { CorreoPersona, ClavePersona } = req.body;


            console.log("JWT_SECRET:", process.env.JWT_SECRET);

            const persona = await Persona.findOne({ where: { CorreoPersona }});

            if (persona) {
                const isMatch = await bcrypt.compare(ClavePersona, persona.ClavePersona);

                if (isMatch) {
                    const token = jwt.sign(
                        { IdPersona: persona.IdPersona },
                        process.env.JWT_SECRET,  
                        { expiresIn: "1h" }
                    );

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
                } else {
                    return res.status(401).json({ message: "Credenciales incorrectas." });
                }
            } else {
                return res.status(401).json({ message: "Credenciales incorrectas." });
            }
        } catch (error) {
            console.error("Error en el login:", error);
            return res.status(500).json({ message: "Error al iniciar sesión: " + error.message });
        }
    }
}

export default LoginController;
