import { Router } from "express";
import { getPersonas, getPersona, postPersona, putPersona, togglePersona, patchPersona } from "../controllers/persona.controller.js";

const router = Router()

router.get('/api/persona/', getPersonas)
router.get('/api/persona/:id', getPersona)
router.post('/api/persona/', postPersona)
router.put('/api/persona/:id', putPersona)
router.delete('/api/persona/:id', togglePersona)
router.patch('/api/persona/:id', patchPersona)


export default router