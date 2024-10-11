// controllers/password.controller.js
import { Persona } from '../models/persona.model.js';
import crypto from 'crypto';
import nodemailer from 'nodemailer';

class PasswordController {
  static async requestReset(req, res) {
    const { correo } = req.body;
    const user = await Persona.findOne({ where: { CorreoPersona: correo } });

    if (!user) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Generar un token único
    const token = crypto.randomBytes(32).toString('hex');
    // Aquí deberías guardar el token en la base de datos asociado al usuario

    // Configurar el envío de correo (ejemplo usando nodemailer)
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'aorostegui2@gmail.com',
        pass: 'czrv gqzd gmuh rzmm'
      }
    });

    const mailOptions = {
      from: 'aorostegui2@gmail.com',
      to: correo,
      subject: 'Restablecimiento de Contraseña',
      text: `Para restablecer tu contraseña, haz clic en el siguiente enlace: 
      http://localhost:/reset-password/${token}`
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).json({ message: 'Error al enviar el correo: ' + error });
      }
      res.status(200).json({ message: 'Correo enviado' });
    });
  }

  static async resetPassword(req, res) {
    const { token, newPassword } = req.body;

    // Aquí deberías verificar el token y encontrar el usuario asociado
    // Suponiendo que el usuario se ha encontrado:
    const userId = 24; // Reemplaza esto con la lógica real para obtener el ID del usuario

    await Persona.updatePassword(userId, newPassword);
    res.status(200).json({ message: 'Contraseña actualizada correctamente' });
  }
}

export default PasswordController;
