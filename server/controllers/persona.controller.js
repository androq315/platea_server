import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Persona } from '../models/persona.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PersonaController {
	static async getPersonas(req, res) {
		try {
			const personas = await Persona.getPersonas();
			res.status(200).json(personas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener las personas: ' + error });
		}
	}

	static async TiendaPersona(req, res){
		try	{
			const id =  req.params.id;
			const tiendas = await Persona.TiendaPersona(id);
			if (tiendas) {
				res.status(200).json(tiendas);
			} else {
				res.status(404).json({ message: 'Persona no encontrada' });
			}

		}catch{
			res.status(500).json({ message: 'Error al obtener la tienda de la persona'})
		}
	}

	static async getPersona(req, res) {
		try {
			const id = req.params.id;
			const persona = await Persona.getPersonaById(id);
			if (persona) {
				res.status(200).json(persona);
			} else {
				res.status(404).json({ message: 'Persona no encontrada' });
			}
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener la persona: ' + error });
		}
	}

	static async postPersona(req, res) {
		try {
			if (!req.files) {
				return res.status(400).json({ message: 'No se subió ningún archivo' });
			}

			const { FotoPersona } = req.files;

			let fotoPersonaUrl = null;

			if (FotoPersona) {
				const timestamp = Date.now();
				const uniqueFileName = `${FotoPersona.name.split('.')[0]}_${timestamp}.${FotoPersona.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/persona_avatar/', uniqueFileName);
				fotoPersonaUrl = `./uploads/img/persona_avatar/${uniqueFileName}`;

				await FotoPersona.mv(uploadPath);
			}


			const p = {
				NombrePersona: req.body.NombrePersona,
				ApellidoPersona: req.body.ApellidoPersona,
				CorreoPersona: req.body.CorreoPersona,
				ClavePersona: req.body.ClavePersona,
				EstadoPersona: req.body.EstadoPersona || true,
				FotoPersona: fotoPersonaUrl,
				FotoPersonaURL: `http://localhost:4000/${fotoPersonaUrl}`,
				TelefonoPersona: req.body.TelefonoPersona,
				CiudadPersona: req.body.CiudadPersona || null,
				DescripcionPersona: req.body.DescripcionPersona || null,
				DireccionPersona: req.body.DireccionPersona || null,
				idRolFK: req.body.idRolFK,
			};


			await Persona.createPersona(p);
			res.status(200).json({ message: 'Persona creada correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al crear la persona: ' + error });
		}
	}

	static async putPersona(req, res) {
		try {
			const id = req.params.id;
			const p = req.body;
			const persona = await Persona.getPersonaById(id);

			if (!persona) {
				return res.status(404).json({ message: 'Persona no encontrada' });
			}

			if (req.files) {
				const { FotoPersona } = req.files;

				if (FotoPersona) {
					const timestamp = Date.now();
					const uniqueFileName = `${FotoPersona.name.split('.')[0]}_${timestamp}.${FotoPersona.name.split('.').pop()}`;
					const uploadPath = path.join(__dirname, '../uploads/img/persona_avatar/', uniqueFileName);
					const fotoPersonaUrl = `./uploads/img/persona_avatar/${uniqueFileName}`;

					await FotoPersona.mv(uploadPath);

					if (persona.FotoPersonaURL) {
						const oldImagePath = path.join(__dirname, '..', persona.FotoPersonaURL);
						if (fs.existsSync(oldImagePath)) {
							fs.unlinkSync(oldImagePath);
						}
					}

					p.FotoPersona = fotoPersonaUrl;
					p.FotoPersonaURL = `http://localhost:4000/${fotoPersonaUrl}`;
				}

			}

			await Persona.updatePersona(id, p);
			res.status(200).json({ message: 'Persona actualizada correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al actualizar la persona: ' + error });
		}
	}

	static async patchPersona(req, res) {
		try {
			const id = req.params.id;
			await Persona.togglePersonaState(id);
			res.status(200).json({ message: 'Estado actualizado correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al actualizar el estado de la persona: ' + error });
		}
	}

	
}

export default PersonaController;
