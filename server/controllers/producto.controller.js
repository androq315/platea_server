import { Producto } from '../models/producto.model.js'

export const getProductos = async (req, res) => {
    try {
        const productos = await Producto.findAll()
        res.status(200).json(productos)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los productos' + error })
    }
}