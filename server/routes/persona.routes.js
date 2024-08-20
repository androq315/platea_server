import { Router } from "express";
import PersonaController from "../controllers/persona.controller.js";

const router = Router()

router.get('/api/persona/', PersonaController.getPersonas)
router.get('/api/persona/:id', PersonaController.getPersona)
router.post('/api/persona/', PersonaController.postPersona)
router.put('/api/persona/:id', PersonaController.putPersona)
router.patch('/api/persona/:id', PersonaController.patchPersona)


export default router