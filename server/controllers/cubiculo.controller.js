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
        const p = req.body
        await Cubiculo.create({ DireccionCubiculo: c.DireccionCubiculo, FechaAperturaCubiculo: created_at , NombreCubiculo: c.NombreCubiculo, CalificacionCubiculo: p.CalificacionCubiculo, EstadoPersona: p.EstadoPersona, idRolFK: p.idRolFK })
        res.status(200).json({ message: 'Usuario creado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al crear el Cubiculo' + error })
    }
}

export const putCubiculo = async (req, res) => {
    try {
        const id = req.params.id
        const p = req.body
        await Cubiculo.update({
            NombrePersona: p.NombrePersona, ApellidoPersona: p.ApellidoPersona, CorreoPersona: p.CorreoPersona, ClavePersona: p.ClavePersona, EstadoPersona: p.EstadoPersona, idRolFK: p.idRolFK
        }, {
            where: {
                IdPersona: id
            }
        })
        res.status(200).json({ message: 'Cubiculo actualizado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el Cubiculo' + error })
    }
}

export const patchPersona = async (req, res) => {
    try {
        const id = req.params.id;
        const p = req.body;

        const [updated] = await Cubiculo.update({
            NombrePersona: p.NombrePersona,
            ApellidoPersona: p.ApellidoPersona,
            CorreoPersona: p.CorreoPersona,
            ClavePersona: p.ClavePersona,
            EstadoPersona: p.EstadoPersona,
            idRolFK: p.idRolFK
        }, {
            where: {
                IdPersona: id
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

export const togglePersona = async (req, res) => {
    try {
        const id = req.params.id;

        const persona = await Persona.findByPk(id);

        if (!persona) {
            return res.status(404).json({ message: 'Cubiculo no encontrado' });
        }

        const nuevoEstado = persona.EstadoPersona ? 0 : 1;

        await Persona.update(
            { EstadoPersona: nuevoEstado },
            { where: { IdPersona: id } }
        );

        res.status(200).json({ message: 'Estado del Cubiculo actualizado correctamente' });
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el estado del Cubiculo: ' + error });
    }
};
