import express from 'express'
import cors from 'cors'
import personaRoutes from './routes/persona.routes.js'
import cubiculoRoutes from './routes/cubiculo.routes.js'
import productosRoutes from './routes/producto.routes.js'



const app = express()

app.use(express.json())
app.use(cors())

app.use(personaRoutes, cubiculoRoutes, productosRoutes)

export default app