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

	static async obtenerTiendasDeModa(req, res) {
		try {
			console.log('Obteniendo tiendas de moda...');
			const tiendas = await Tienda.obtenerTiendasDeModa();
			console.log('Tiendas obtenidas:', tiendas);
			res.status(200).json(tiendas);
		} catch (error) {
			console.error('Error al obtener tiendas de moda:', error);
			res.status(500).json({ message: 'Error al obtener tiendas de moda: ' + error });
		}
	}

	static async obtenerTiendasDeElectrodomesticos(req, res) {
		try {
			const tiendas = await Tienda.obtenerTiendasDeElectrodomesticos();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
		}
	}

	static async obtenerTiendasDeHogar(req, res) {
		try {
			const tiendas = await Tienda.obtenerTiendasDeHogar();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de hogar: ' + error });
		}
	}

	static async obtenerTiendasDeDeportes(req, res) {
		try {
			const tiendas = await Tienda.obtenerTiendasDeDeportes();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de deportes: ' + error });
		}
	}

	static async obtenerTiendasDeJuguetes(req, res) {
		try {
			const tiendas = await Tienda.obtenerTiendasDeJuguetes();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de juguetes: ' + error });
		}
	}

	static async obtenerTiendasDeBelleza(req, res) {
		try {
			const tiendas = await Tienda.obtenerTiendasDeBelleza();
			res.status(200).json(tiendas);
		} catch (error) {
			res.status(500).json({ message: 'Error al obtener tiendas de belleza: ' + error });
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
			TelefonoTienda: req.body.TelefonoTienda,
			IdCategoriaFK: req.body.IdCategoriaFK,
		  };
	
		  if (MiniaturaTienda) {
			const timestamp = Date.now();
			const uniqueFileName = `${MiniaturaTienda.name.split('.')[0]}_${timestamp}.${MiniaturaTienda.name.split('.').pop()}`;
			const uploadPath = path.join(__dirname, '../uploads/img/tienda_miniatura/', uniqueFileName);
			const miniaturaTiendaUrl = `./uploads/img/tienda_miniatura/${uniqueFileName}`;
	
			await MiniaturaTienda.mv(uploadPath);
	
			// Eliminar la imagen anterior si existe
			if (tienda.MiniaturaTiendaURL) {
			  const oldImagePath = path.join(__dirname, tienda.MiniaturaTiendaURL);
			  fs.unlink(oldImagePath, (err) => {
				if (err) console.error(err);
			  });
			}
	
			t.MiniaturaTiendaURL = miniaturaTiendaUrl;
		  }
	
		  if (BannerTienda) {
			const timestamp = Date.now();
			const uniqueFileName = `${BannerTienda.name.split('.')[0]}_${timestamp}.${BannerTienda.name.split('.').pop()}`;
			const uploadPath = path.join(__dirname, '../uploads/img/tienda_banner/', uniqueFileName);
			const bannerTiendaUrl = `./uploads/img/tienda_banner/${uniqueFileName}`;
	
			await BannerTienda.mv(uploadPath);
	
			// Eliminar la imagen anterior si existe
			if (tienda.BannerTiendaURL) {
			  const oldImagePath = path.join(__dirname, tienda.BannerTiendaURL);
			  fs.unlink(oldImagePath, (err) => {
				if (err) console.error(err);
			  });
			}
	
			t.BannerTiendaURL = bannerTiendaUrl;
		  }
	
		  await Tienda.updateTienda(id, t);
	
		  res.json({ message: 'Tienda actualizada correctamente' });
		} catch (error) {
		  console.error(error);
		  res.status(500).json({ message: 'Error al actualizar la tienda' });
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

// Asegúrate de que esto esté importado

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
        miniaturaTiendaUrl = `uploads/img/tienda_miniatura/${uniqueFileName}`; // URL relativa

        await MiniaturaTienda.mv(uploadPath);
      }

      if (BannerTienda) {
        const timestamp = Date.now();
        const uniqueFileName = `${BannerTienda.name.split('.')[0]}_${timestamp}.${BannerTienda.name.split('.').pop()}`;
        const uploadPath = path.join(__dirname, '../uploads/img/tienda_banner/', uniqueFileName);
        bannerTiendaUrl = `uploads/img/tienda_banner/${uniqueFileName}`; // URL relativa

        await BannerTienda.mv(uploadPath);
      }

      const {
        IdPersona,
        NombreTienda,
        DireccionTienda,
        CiudadTienda,
        DescripcionTienda,
        IdCategoriaFK
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
        FechaExpiracionArrendatario
      };

      // Llama al método comprarTienda y recibe el ID de la tienda
      const idTiendaCreada = await Tienda.comprarTienda(tienda);

      // Devuelve el ID en formato JSON
      res.status(200).json({ idTienda: idTiendaCreada });
    } catch (error) {
      console.error(`Error al crear la tienda: ${error}`);
      res.status(500).json({ message: 'Error al crear la tienda: ' + error.message });
    }
  }

static async TiendasDestacadas(req, res) {
	try {
		const tiendas = await Tienda.listarTop4Tiendas();
		res.status(200).json(tiendas);
	} catch (error) {
		res.status(500).json({ message: 'Error al obtener los productos destacados: ' + error });
	}
}  




}

export default TiendaController;
