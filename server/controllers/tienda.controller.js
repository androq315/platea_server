import { Tienda } from '../models/tienda.model.js'

export const getCubiculos = async (req, res) => {
    try {
        const tienda = await Tienda.findAll()
        res.status(200).json(tienda)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los Cubiculos' + error })
    }
}

export const getTienda = async (req, res) => {
    try {
        const id = req.params.id
        const tienda = await Tienda.findByPk(id)
        res.status(200).json(cubiculo)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el Cubiculo' + error })
    }
}

export const postTienda = async (req, res) => {
    try {
        const t = req.body
        await Tienda.create({DireccionTienda: t.DireccionTienda, NombreTienda: t.NombreTienda, CalificacionTienda: t.CalificacionTienda, EstadoTienda: 1, idArrendatarioFK: t.idArrendatarioFK, idcategoriaFK: t.idcategoriaFK })
        res.status(200).json({ message: 'Cubiculo creado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al crear el Cubiculo' + error })
    }
}

export const putTienda = async (req, res) => {
    try {
        const id = req.params.id
        const t = req.body
        await Tienda.update({
            DireccionTienda: t.DireccionTienda, NombreTienda: t.NombreTienda, CalificacionTienda: t.CalificacionTienda, EstadoTienda: 1, idArrendatarioFK: t.idArrendatarioFK, idcategoriaFK: t.idcategoriaFK
        }, {
            where: {
                IdTienda: id
            }
        })
        res.status(200).json({ message: 'Tienda actualizada correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar la Tienda' + error })
    }
}

export const patchTienda = async (req, res) => {
    try {
        const id = req.params.id;
        const t = req.body;

        const [updated] = await Tienda.update({
            DireccionTienda: t.DireccionTienda, NombreTienda: t.NombreTienda, CalificacionTienda: t.CalificacionTienda, EstadoTienda: 1, idArrendatarioFK: t.idArrendatarioFK, idcategoriaFK: t.idcategoriaFK
        }, {
            where: {
                IdTienda: id
            }
        });

        if (updated) {
            res.status(200).json({ message: 'Tienda actualizada correctamente' });
        } else {
            res.status(404).json({ message: 'Tienda no encontrada' });
        }
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar la Tienda: ' + error });
    }
};

export const toggleTienda = async (req, res) => {
    try {
        const id = req.params.id;

        const tienda = await Tienda.findByPk(id);

        if (!cubiculo) {
            return res.status(404).json({ message: 'Tienda encontrado' });
        }

        const nuevoEstado = tienda.EstadoTienda ? 0 : 1;

        await Cubiculo.update(
            { EstadoTienda: nuevoEstado },
            { where: { IdCubiculo: id } }
        );

        res.status(200).json({ message: 'Estado del Cubiculo actualizado correctamente' });
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el estado del Cubiculo: ' + error });
    }
};
