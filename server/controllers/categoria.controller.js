import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import Categoria from '../models/categoria.model.js'; // Asumiendo que el modelo Categoria está definido como 'categoria.model.js'

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class CategoriaController {
    // Obtener todas las categorías
    static async getCategorias(req, res) {
        try {
            const categorias = await Categoria.getCategorias();
            res.status(200).json(categorias);
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener las categorías: ' + error });
        }
    }

    // Obtener una categoría por ID
    static async getCategoria(req, res) {
        try {
            const id = req.params.id;
            const categoria = await Categoria.getCategoriaById(id);
            if (categoria) {
                res.status(200).json(categoria);
            } else {
                res.status(404).json({ message: 'Categoría no encontrada' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener la categoría: ' + error });
        }
    }

    // Crear una nueva categoría
    static async postCategoria(req, res) {
        try {
            if (!req.files || !req.files.FotoCategoria) {
                return res.status(400).json({ message: 'No se subió ningún archivo' });
            }

            const uploadedFile = req.files.FotoCategoria;
            const timestamp = Date.now();
            const uniqueFileName = `${uploadedFile.name.split('.')[0]}_${timestamp}.${uploadedFile.name.split('.').pop()}`;
            const uploadPath = path.join(__dirname, '../uploads/img/categoria/', uniqueFileName);
            const fotoCategoriaUrl = `uploads/img/categoria/${uniqueFileName}`;

            uploadedFile.mv(uploadPath, async (err) => {
                if (err) {
                    return res.status(500).json({ message: 'Error al subir la imagen: ' + err });
                }

                const c = {
                    NombreCategoria: req.body.NombreCategoria, // Ruta relativa
                    FotoCategoria: fotoCategoriaUrl // Ruta absoluta
                };

                await Categoria.createCategoria(c);
                res.status(200).json({ message: 'Categoría creada correctamente' });
            });
        } catch (error) {
            res.status(500).json({ message: 'Error al crear la categoría: ' + error });
        }
    }

    // Actualizar una categoría existente
    static async putCategoria(req, res) {
        try {
            const id = req.params.id;
            const c = req.body;
            const categoria = await Categoria.getCategoriaById(id);

            if (!categoria) {
                return res.status(404).json({ message: 'Categoría no encontrada' });
            }

            if (req.files && req.files.FotoCategoria) {
                const uploadedFile = req.files.FotoCategoria;
                const timestamp = Date.now();
                const uniqueFileName = `${uploadedFile.name.split('.')[0]}_${timestamp}.${uploadedFile.name.split('.').pop()}`;
                const uploadPath = path.join(__dirname, '../uploads/img/categoria/', uniqueFileName);
                const fotoCategoriaUrl = `uploads/img/categoria/${uniqueFileName}`;

                uploadedFile.mv(uploadPath, async (err) => {
                    if (err) return res.status(500).json({ message: 'Error al mover el archivo: ' + err });

                    if (categoria.FotoCategoria) {
                        const oldImagePath = path.join(__dirname, '..', categoria.FotoCategoria);
                        if (fs.existsSync(oldImagePath)) {
                            fs.unlinkSync(oldImagePath);
                        }
                    }

                    const updated_categoria = {
                        NombreCategoria: c.NombreCategoria,
                        FotoCategoria: fotoCategoriaUrl // Ruta absoluta
                    };

                    await Categoria.updateCategoria(id, updated_categoria);
                    res.status(200).json({ message: 'Categoría actualizada correctamente' });
                });
            } else {
                const updated_categoria = {
                    NombreCategoria: c.NombreCategoria
                };

                await Categoria.updateCategoria(id, updated_categoria);
                res.status(200).json({ message: 'Categoría actualizada correctamente' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Error al actualizar la categoría: ' + error });
        }
    }

    // Eliminar una categoría
    static async deleteCategoria(req, res) {
        try {
            const id = req.params.id;
            await Categoria.deleteCategoria(id);
            res.status(200).json({ message: 'Categoría eliminada correctamente' });
        } catch (error) {
            res.status(500).json({ message: 'Error al eliminar la categoría: ' + error });
        }
    }
}

export default CategoriaController;
