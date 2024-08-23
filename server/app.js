import express from 'express';
import cors from 'cors';
import fileUpload from 'express-fileupload';
import personaRoutes from './routes/persona.routes.js';
import cubiculoRoutes from './routes/cubiculo.routes.js';
import productosRoutes from './routes/producto.routes.js';
import path from 'path';
import { fileURLToPath } from 'url';


// Obtener el directorio actual usando __filename y __dirname en módulos ES
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(fileUpload());
app.use(express.json());
app.use(cors({
    origin: 'http://localhost:3000', // URL del frontend
    methods: 'GET,POST,PUT,DELETE',
    allowedHeaders: 'Content-Type',
  }));
  

// Servir archivos estáticos desde la carpeta 'uploads'
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Usar las rutas de la aplicación
app.use(personaRoutes, cubiculoRoutes, productosRoutes);

export default app;
