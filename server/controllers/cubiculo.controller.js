import { Cubiculo } from '../models/cubiculo.model.js'

export const getCubiculos = async (req, res) => {
    try {
        const cubiculos = await Cubiculo.findAll()
        res.status(200).json(cubiculos)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los Cubiculos' + error })
    }
}

export const getCubiculo = async (req, res) => {
    try {
        const id = req.params.id
        const cubiculo = await Cubiculo.findByPk(id)
        res.status(200).json(cubiculo)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el Cubiculo' + error })
    }
}

export const postCubiculo = async (req, res) => {
    try {
        const c = req.body
        await Cubiculo.create({DireccionCubiculo: c.DireccionCubiculo, NombreCubiculo: c.NombreCubiculo, CalificacionCubiculo: c.CalificacionCubiculo, EstadoCubiculo: 1, idArrendatarioFK: c.idArrendatarioFK,idAdministradorFK: c.idAdministradorFK })
        res.status(200).json({ message: 'Cubiculo creado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al crear el Cubiculo' + error })
    }
}

export const putCubiculo = async (req, res) => {
    try {
        const id = req.params.id
        const c = req.body
        await Cubiculo.update({
            DireccionCubiculo: c.DireccionCubiculo , NombreCubiculo: c.NombreCubiculo, CalificacionCubiculo: c.CalificacionCubiculo, EstadoCubiculo: 1, idArrendatarioFK: c.idArrendatarioFK,idArrendatarioFK: c.idArrendatarioFK
        }, {
            where: {
                IdCubiculo: id
            }
        })
        res.status(200).json({ message: 'Cubiculo actualizado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el Cubiculo' + error })
    }
}

export const patchCubiculo = async (req, res) => {
    try {
        const id = req.params.id;
        const c = req.body;

        const [updated] = await Cubiculo.update({
            DireccionCubiculo: c.DireccionCubiculo, NombreCubiculo: c.NombreCubiculo, CalificacionCubiculo: c.CalificacionCubiculo, EstadoCubiculo: 1, idArrendatarioFK: c.idArrendatarioFK,idArrendatarioFK: c.idArrendatarioFK
        }, {
            where: {
                IdCubiculo: id
            }
        });

        if (updated) {
            res.status(200).json({ message: 'Cubiculo actualizado correctamente' });
        } else {
            res.status(404).json({ message: 'Cubiculo no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el Cubiculo: ' + error });
    }
};

export const toggleCubiculo = async (req, res) => {
    try {
        const id = req.params.id;

        const cubiculo = await Cubiculo.findByPk(id);

        if (!cubiculo) {
            return res.status(404).json({ message: 'Cubiculo no encontrado' });
        }

        const nuevoEstado = cubiculo.EstadoCubiculo ? 0 : 1;

        await Cubiculo.update(
            { EstadoCubiculo: nuevoEstado },
            { where: { IdCubiculo: id } }
        );

        res.status(200).json({ message: 'Estado del Cubiculo actualizado correctamente' });
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el estado del Cubiculo: ' + error });
    }
};
