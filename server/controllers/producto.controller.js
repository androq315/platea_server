import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Producto } from '../models/producto.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class ProductoController {
    static async getProductos(req, res) {
        try {
            const productos = await Producto.getProductos();
            res.status(200).json(productos);
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener los productos: ' + error });
        }
    }

    static async getProducto(req, res) {
        try {
            const id = req.params.id;
            const producto = await Producto.getProductoById(id);
            if (producto) {
                res.status(200).json(producto);
            } else {
                res.status(404).json({ message: 'Producto no encontrado' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Error al obtener el producto: ' + error });
        }
    }

    static async postProducto(req, res) {
        try {
            if (!req.files || !req.files.FotoProducto) {
                return res.status(400).json({ message: 'No se subió ningún archivo' });
            }

            const uploadedFile = req.files.FotoProducto;
            const timestamp = Date.now();
            const uniqueFileName = `${uploadedFile.name.split('.')[0]}_${timestamp}.${uploadedFile.name.split('.').pop()}`;
            const uploadPath = path.join(__dirname, '../uploads/img/producto/', uniqueFileName);
            const fotoProductoUrl = `http://localhost:4000/uploads/img/producto/${uniqueFileName}`;

            uploadedFile.mv(uploadPath, async (err) => {
                if (err) {
                    return res.status(500).json({ message: 'Error al subir la imagen: ' + err });
                }

                const p = {
                    NombreProducto: req.body.NombreProducto,
                    DescripcionProducto: req.body.DescripcionProducto,
                    StockProducto: req.body.StockProducto,
                    PrecioProducto: req.body.PrecioProducto,
                    FotoProducto: `uploads/img/producto/${uniqueFileName}`, // Relativa
                    FotoProductoURL: fotoProductoUrl, // Absoluta
                    IdCubiculoFK: req.body.IdCubiculoFK
                };

                await Producto.createProducto(p);
                res.status(200).json({ message: 'Producto creado correctamente' });
            });
        } catch (error) {
            res.status(500).json({ message: 'Error al crear el producto: ' + error });
        }
    }

    static async putProducto(req, res) {
        try {
            const id = req.params.id;
            const p = req.body;
            const producto = await Producto.getProductoById(id);

            if (!producto) {
                return res.status(404).json({ message: 'Producto no encontrado' });
            }

            if (req.files && req.files.FotoProducto) {
                const uploadedFile = req.files.FotoProducto;
                const timestamp = Date.now();
                const uniqueFileName = `${uploadedFile.name.split('.')[0]}_${timestamp}.${uploadedFile.name.split('.').pop()}`;
                const uploadPath = path.join(__dirname, '../uploads/img/producto/', uniqueFileName);
                const fotoProductoUrl = `http://localhost:4000/uploads/img/producto/${uniqueFileName}`;

                uploadedFile.mv(uploadPath, async (err) => {
                    if (err) return res.status(500).json({ message: 'Error al mover el archivo: ' + err });

                    if (producto.FotoProducto) {
                        const oldImagePath = path.join(__dirname, '..', producto.FotoProducto);
                        if (fs.existsSync(oldImagePath)) {
                            fs.unlinkSync(oldImagePath);
                        }
                    }

                    const updated_producto = {
                        NombreProducto: p.NombreProducto,
                        DescripcionProducto: p.DescripcionProducto,
                        StockProducto: p.StockProducto,
                        PrecioProducto: p.PrecioProducto,
                        FotoProducto: `uploads/img/producto/${uniqueFileName}`, // Relativa
                        FotoProductoURL: fotoProductoUrl, // Absoluta
                        IdCubiculoFK: p.IdCubiculoFK
                    };

                    await Producto.updateProducto(id, updated_producto);
                    res.status(200).json({ message: 'Producto actualizado correctamente' });
                });
            } else {
                const updated_producto = {
                    NombreProducto: p.NombreProducto,
                    DescripcionProducto: p.DescripcionProducto,
                    StockProducto: p.StockProducto,
                    PrecioProducto: p.PrecioProducto,
                    IdCubiculoFK: p.IdCubiculoFK
                };

                await Producto.updateProducto(id, updated_producto);
                res.status(200).json({ message: 'Producto actualizado correctamente' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Error al actualizar el producto: ' + error });
        }
    }

    static async deleteProducto(req, res) {
        try {
            const id = req.params.id;
            await Producto.deleteProducto(id);
            res.status(200).json({ message: 'Producto eliminado correctamente' });
        } catch (error) {
            res.status(500).json({ message: 'Error al eliminar el producto: ' + error });
        }
    }
}

export default ProductoController;
