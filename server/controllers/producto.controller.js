import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Tienda } from '../models/tienda.model.js'; // Asegúrate de que el modelo Tienda esté correctamente importado

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class TiendaController {
    // Método para obtener todas las tiendas
    static async getTiendas(req, res) {
        try {
            const tiendas = await Tienda.getTiendas();
            res.status(200).json(tiendas);
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener las tiendas: ' + error });
        }
    }

    // Método para obtener una tienda por su ID
    static async getTienda(req, res) {
        try {
            const id = req.params.id;
            const tienda = await Tienda.getTiendaById(id);
            if (tienda) {
                res.status(200).json(tienda);
            } else {
                res.status(404).json({ message: 'Tienda no encontrada' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener la tienda: ' + error });
        }
    }

    // Método para crear una nueva tienda
    static async postTienda(req, res) {
        try {
            const p = {
                DireccionTienda: req.body.DireccionTienda,
                NombreTienda: req.body.NombreTienda,
                CalificacionTienda: req.body.CalificacionTienda,
                EstadoTienda: req.body.EstadoTienda,
                IdCategoriaFK: req.body.IdCategoriaFK,
                IdArrendatarioFK: req.body.IdArrendatarioFK
            };

            await Tienda.createTienda(p);
            res.status(200).json({ message: 'Tienda creada correctamente' });
        } catch (error) {
            res.status(500).json({ message: 'Error al crear la tienda: ' + error });
        }
    }

    // Método para actualizar una tienda
    static async putTienda(req, res) {
        try {
            const id = req.params.id;
            const updated_tienda = req.body;
            const tienda = await Tienda.getTiendaById(id);

            if (!tienda) {
                return res.status(404).json({ message: 'Tienda no encontrada' });
            }

            await Tienda.updateTienda(id, updated_tienda);
            res.status(200).json({ message: 'Tienda actualizada correctamente' });
        } catch (error) {
            res.status(500).json({ message: 'Error al actualizar la tienda: ' + error });
        }
    }

    // Método para eliminar una tienda
    static async deleteTienda(req, res) {
        try {
            const id = req.params.id;
            await Tienda.deleteTienda(id);
            res.status(200).json({ message: 'Tienda eliminada correctamente' });
        } catch (error) {
            res.status(500).json({ message: 'Error al eliminar la tienda: ' + error });
        }
    }
}

export default TiendaController;
