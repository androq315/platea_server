import { Persona } from '../models/persona.model.js'

export const getPersonas = async (req, res) => {
    try {
        const personas = await Persona.findAll()
        res.status(200).json(personas)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener los usuarios' + error })
    }
}

export const getPersona = async (req, res) => {
    try {
        const id = req.params.id
        const persona = await Persona.findByPk(id)
        res.status(200).json(persona)
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el usuario' + error })
    }
}

export const postPersona = async (req, res) => {
    try {
        const p = req.body
        await Persona.create({ NombrePersona: p.NombrePersona, ApellidoPersona: p.ApellidoPersona, CorreoPersona: p.CorreoPersona, ClavePersona: p.ClavePersona, EstadoPersona: p.EstadoPersona, idRolFK: p.idRolFK })
        res.status(200).json({ message: 'Usuario creado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al crear el usuario' + error })
    }
}

export const putPersona = async (req, res) => {
    try {
        const id = req.params.id
        const p = req.body
        await Persona.update({
            NombrePersona: p.NombrePersona, ApellidoPersona: p.ApellidoPersona, CorreoPersona: p.CorreoPersona, ClavePersona: p.ClavePersona, EstadoPersona: p.EstadoPersona, idRolFK: p.idRolFK
        }, {
            where: {
                IdPersona: id
            }
        })
        res.status(200).json({ message: 'Usuario actualizado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el usuario' + error })
    }
}

export const patchPersona = async (req, res) => {
    try {
        const id = req.params.id;
        const p = req.body;

        const [updated] = await Persona.update({
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
            res.status(200).json({ message: 'Usuario actualizado correctamente' });
        } else {
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el usuario: ' + error });
    }
};

export const togglePersona = async (req, res) => {
    try {
        const id = req.params.id;

        const persona = await Persona.findByPk(id);

        if (!persona) {
            return res.status(404).json({ message: 'Usuario no encontrado' });
        }

        const nuevoEstado = persona.EstadoPersona ? 0 : 1;

        await Persona.update(
            { EstadoPersona: nuevoEstado },
            { where: { IdPersona: id } }
        );

        res.status(200).json({ message: 'Estado del usuario actualizado correctamente' });
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar el estado del usuario: ' + error });
    }
};
