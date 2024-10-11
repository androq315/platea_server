// controllers/password.controller.js
import { Persona } from '../models/persona.model.js';
import crypto from 'crypto';
import dotenv from "dotenv";
import nodemailer from 'nodemailer';
import jwt from "jsonwebtoken";
dotenv.config();
class PasswordController {
  static async requestReset(req, res) {
    const { correo } = req.body;
    const user = await Persona.findOne({ where: { CorreoPersona: correo } });


    if (!user) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Generar un token único
    // Aquí deberías guardar el token en la base de datos asociado al usuario
    const token = jwt.sign(
      { 
          Correo: correo// Incluyendo el rol en el token
      },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
  );
    // Configurar el envío de correo (ejemplo usando nodemailer)
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'aorostegui2@gmail.com',
          pass: 'czrv gqzd gmuh rzmm' // Cambia esto por una variable de entorno
        }
      });
  
  const mailOptions = {
    from: 'aorostegui2@gmail.com',
    to: correo,
    subject: 'Restablecimiento de Contraseña',
    html: `
      <p>Para restablecer tu contraseña, haz clic en el siguiente enlace:</p>
      <a href="http://localhost:3000/cambiarcontra/${token}">Restablecer Contraseña</a>
      <p>Si no solicitaste este cambio, puedes ignorar este mensaje.</p>
    `
  };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).json({ message: 'Error al enviar el correo: ' + error });
      }
      res.status(200).json({ message: 'Correo enviado' });
    });
  }

  static async resetPassword(req, res) {
    const { gmail, newPassword } = req.body;

    await Persona.updatePassword(gmail, newPassword,process.env.DB_CLAVE);
    res.status(200).json({ message: 'Contraseña actualizada correctamente' });
  }
}

export default PasswordController;
