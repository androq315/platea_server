import express from 'express'
import cors from 'cors'
import fileUpload from 'express-fileupload'
import personaRoutes from './routes/persona.routes.js'
import cubiculoRoutes from './routes/cubiculo.routes.js'
import productosRoutes from './routes/producto.routes.js'



const app = express()
app.use(fileUpload());
app.use(express.json());
app.use(cors());

app.use(personaRoutes, cubiculoRoutes, productosRoutes)

export default app