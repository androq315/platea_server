import { Router } from "express";
import PersonaController from "../controllers/persona.controller.js";
import { registerPersona } from "../controllers/register.controller.js";
import loginController from "../controllers/login.controller.js";
import authenticateToken from "../middleware/persona.middleware.js";  // Importa el middleware para autenticar el token

const router = Router()

// Rutas protegidas que requieren autenticación
router.get('/api/persona/',  PersonaController.getPersonas)
router.get('/api/persona/:id', PersonaController.getPersona)
router.get('/api/navbar/:id', PersonaController.Navbar)
router.get('/api/persona/tienda/:id', PersonaController.TiendaPersona)
router.post('/api/persona/', PersonaController.postPersona)
router.put('/api/persona/:id', PersonaController.putPersona)
router.patch('/api/persona/:id',  PersonaController.patchPersona)

router.delete('/api/persona/:correo', PersonaController.deletePersona);


// Rutas públicas (no requieren autenticación)
router.post('/api/register/', registerPersona)
router.post('/api/login/', loginController.login)

export default router
