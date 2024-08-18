import express from 'express'
import personaRoutes from './routes/persona.routes.js'
import cubiculoRoutes from './routes/cubiculo.routes.js'



const app = express()

app.use(express.json())

app.use(personaRoutes, cubiculoRoutes)

export default app