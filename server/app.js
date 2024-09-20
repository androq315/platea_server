import express from 'express';
import cors from 'cors';
import fileUpload from 'express-fileupload';
import personaRoutes from './routes/persona.routes.js';
import tiendaRoutes from './routes/tienda.routes.js';
import productosRoutes from './routes/producto.routes.js';
import aprobacionRoutes  from './routes/aprobacion.routes.js';
import carritoRoutes from  './routes/carrito.routes.js';
import pedidoRoutes from  './routes/pedido.routes.js';
import categoriaRoutes  from './routes/categoria.routes.js';




import path from 'path';
import { fileURLToPath } from 'url';


// Obtener el directorio actual usando __filename y __dirname en módulos ES
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(fileUpload());
app.use(express.json());
app.use(cors());
  

// Servir archivos estáticos desde la carpeta 'uploads'
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Usar las rutas de la aplicación
app.use(personaRoutes, tiendaRoutes, productosRoutes, aprobacionRoutes, carritoRoutes, pedidoRoutes, categoriaRoutes);

export default app;