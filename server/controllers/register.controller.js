import bcrypt from 'bcrypt';
import { sequelize } from '../config/db.js';

// Controlador para registrar usuarios
export const registerPersona = async (req, res) => {
    try {
        const { NombrePersona, ApellidoPersona, CorreoPersona, ClavePersona, TelefonoPersona } = req.body;

        console.log('Datos recibidos para registro:', req.body);

        if (!NombrePersona || !ApellidoPersona || !CorreoPersona || !ClavePersona || !TelefonoPersona) {
            console.log('Campos incompletos');
            return res.status(400).json({ message: 'Todos los campos son requeridos' });
        }

        const hashedPassword = await bcrypt.hash(ClavePersona, 10);
        console.log('Contraseña encriptada:', hashedPassword);

        const results = await sequelize.query('CALL RegisterPersona(?, ?, ?, ?, ?)', {
            replacements: [
                NombrePersona,
                ApellidoPersona,
                CorreoPersona,
                hashedPassword,
                TelefonoPersona
            ],
        });

        console.log('Resultado del procedimiento almacenado:', results);

        res.status(201).json({ message: 'Usuario creado correctamente', data: results });
    } catch (error) {
        console.error('Error al crear el usuario:', error);
        res.status(500).json({ message: 'Error al crear el usuario: ' + error.message });
    }
};

export default registerPersona;
