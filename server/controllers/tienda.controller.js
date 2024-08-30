import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import fs from 'fs';
import { Tienda } from '../models/tienda.model.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class TiendaController {
	static async getTiendas(req, res) {
		try {
			const tiendas = await Tienda.getTiendas();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener las tiendas: ' + error });
		}
	}

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

	static async postTienda(req, res) {
		try {
			if (!req.files) {
				return res.status(400).json({ message: 'No se subió ningún archivo' });
			}

			const { MiniaturaTienda, BannerTienda } = req.files;

			let miniaturaTiendaUrl = null;
			let bannerTiendaUrl = null;

			if (MiniaturaTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${MiniaturaTienda.name.split('.')[0]}_${timestamp}.${MiniaturaTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_miniatura/', uniqueFileName);
				miniaturaTiendaUrl = `./uploads/img/tienda_miniatura/${uniqueFileName}`;

				await MiniaturaTienda.mv(uploadPath);
			}

			if (BannerTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${BannerTienda.name.split('.')[0]}_${timestamp}.${BannerTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_banner/', uniqueFileName);
				bannerTiendaUrl = `./uploads/img/tienda_banner/${uniqueFileName}`;

				await BannerTienda.mv(uploadPath);
			}

			const t = {
				DireccionTienda: req.body.DireccionTienda,
				NombreTienda: req.body.NombreTienda,
				DescripcionTienda: req.body.DescripcionTienda,
				CiudadTienda: req.body.CiudadTienda,
				MiniaturaTienda: miniaturaTiendaUrl,
				MiniaturaTiendaURL: `http://localhost:4000/${miniaturaTiendaUrl}`,
				BannerTienda: bannerTiendaUrl,
				BannerTiendaURL: `http://localhost:4000/${bannerTiendaUrl}`,
				IdCategoriaFK: req.body.IdCategoriaFK,
				IdArrendatarioFK: req.body.IdArrendatarioFK,
			};

			await Tienda.createTienda(t);
			res.status(200).json({ message: 'Tienda creada correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al crear la tienda: ' + error });
		}
	}

	static async putTienda(req, res) {
		try {
			const id = req.params.id;
			const tienda = await Tienda.getTiendaById(id);

			if (!tienda) {
				return res.status(404).json({ message: 'Tienda no encontrada' });
			}

			const { MiniaturaTienda, BannerTienda } = req.files || {};

			const t = {
				DireccionTienda: req.body.DireccionTienda,
				NombreTienda: req.body.NombreTienda,
				DescripcionTienda: req.body.DescripcionTienda,
				CiudadTienda: req.body.CiudadTienda,
				IdCategoriaFK: req.body.IdCategoriaFK,
				IdArrendatarioFK: req.body.IdArrendatarioFK,
			};

			if (MiniaturaTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${MiniaturaTienda.name.split('.')[0]}_${timestamp}.${MiniaturaTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_miniatura/', uniqueFileName);
				const miniaturaTiendaUrl = `./uploads/img/tienda_miniatura/${uniqueFileName}`;

				await MiniaturaTienda.mv(uploadPath);

				// Eliminar la imagen anterior si existe
				if (tienda.MiniaturaTiendaURL) {
					const oldImagePath = path.join(__dirname, '..', tienda.MiniaturaTiendaURL.replace('http://localhost:4000/', ''));
					if (fs.existsSync(oldImagePath)) {
						fs.unlinkSync(oldImagePath);
					}
				}

				t.MiniaturaTienda = miniaturaTiendaUrl;
				t.MiniaturaTiendaURL = `http://localhost:4000/${miniaturaTiendaUrl}`;
			}

			if (BannerTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${BannerTienda.name.split('.')[0]}_${timestamp}.${BannerTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_banner/', uniqueFileName);
				const bannerTiendaUrl = `./uploads/img/tienda_banner/${uniqueFileName}`;

				await BannerTienda.mv(uploadPath);

				// Eliminar la imagen anterior si existe
				if (tienda.BannerTiendaURL) {
					const oldImagePath = path.join(__dirname, '..', tienda.BannerTiendaURL.replace('http://localhost:4000/', ''));
					if (fs.existsSync(oldImagePath)) {
						fs.unlinkSync(oldImagePath);
					}
				}

				t.BannerTienda = bannerTiendaUrl;
				t.BannerTiendaURL = `http://localhost:4000/${bannerTiendaUrl}`;
			}

			await Tienda.updateTienda(id, t);
			res.status(200).json({ message: 'Tienda actualizada correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al actualizar la tienda: ' + error });
		}
	}

	static async patchTienda(req, res) {
		try {
			const id = req.params.id;
			await Tienda.toggleTiendaState(id);
			res.status(200).json({ message: 'Estado actualizado correctamente' });
		} catch (error) {
			res.status(500).json({ message: 'Error al actualizar el estado de la tienda: ' + error });
		}
	}

	static async comprarTienda(req, res) {
		try {
			if (!req.files) {
				return res.status(400).json({ message: 'No se subió ningún archivo' });
			}

			const { MiniaturaTienda, BannerTienda } = req.files;

			let miniaturaTiendaUrl = null;
			let bannerTiendaUrl = null;

			if (MiniaturaTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${MiniaturaTienda.name.split('.')[0]}_${timestamp}.${MiniaturaTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_miniatura/', uniqueFileName);
				miniaturaTiendaUrl = `./uploads/img/tienda_miniatura/${uniqueFileName}`;

				await MiniaturaTienda.mv(uploadPath);
			}

			if (BannerTienda) {
				const timestamp = Date.now();
				const uniqueFileName = `${BannerTienda.name.split('.')[0]}_${timestamp}.${BannerTienda.name.split('.').pop()}`;
				const uploadPath = path.join(__dirname, '../uploads/img/tienda_banner/', uniqueFileName);
				bannerTiendaUrl = `./uploads/img/tienda_banner/${uniqueFileName}`;

				await BannerTienda.mv(uploadPath);
			}

			const {
				IdPersona,
				NombreTienda,
				DireccionTienda,
				CiudadTienda,
				DescripcionTienda,
				IdCategoriaFK,
							} = req.body;

			// Definir las fechas de arrendatario
			const FechaInicioArrendatario = new Date();
			const FechaExpiracionArrendatario = new Date(FechaInicioArrendatario);
			FechaExpiracionArrendatario.setMonth(FechaInicioArrendatario.getMonth() + 2);

			const tienda = {
				IdPersona,
				NombreTienda,
				DireccionTienda,
				CiudadTienda,
				DescripcionTienda,
				IdCategoriaFK,
				MiniaturaTienda: miniaturaTiendaUrl,
				MiniaturaTiendaURL: `http://localhost:4000/${miniaturaTiendaUrl}`,
				BannerTienda: bannerTiendaUrl,
				BannerTiendaURL: `http://localhost:4000/${bannerTiendaUrl}`,
				FechaInicioArrendatario,
				FechaExpiracionArrendatario,
			};

			await Tienda.comprarTienda(tienda);
			res.status(200).json({ message: 'Tienda creada exitosamente.' });
		} catch (error) {
			res.status(500).json({ message: 'Error al crear la tienda: ' + error });
		}
	}
}

export default TiendaController;
