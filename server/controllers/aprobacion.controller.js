import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Aprobacion } from '../models/aprobacion.model.js';


class AprobacionController{

  static async getAprobacion(req, res) {
    try {
      const id = req.params.id;
      const aprobacion = await Aprobacion.getComentarios(id);
      if (aprobacion) {
        res.status(200).json(aprobacion);
      } else {
        res.status(404).json({ message: 'Aprobación no encontrada' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error al obtener la Aprobación: ' + error });
    }
  }

  static async CrearComentario(req, res) {
    try {
        const { ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK } = req.body;

        const aprobacion = { ComentarioAprobacion, CalificacionAprobacion, IdPersonaFK, IdProductoFK };
        await Aprobacion.CrearComentario(aprobacion);
        res.status(201).json({ message: 'Comentario creado correctamente' });
    } catch (error) {
        console.error('Error al crear el comentario: ${error}');
        res.status(500).json({ message: 'Error al crear el comentario: ' + error.message });
    }
}
}

export default AprobacionController;