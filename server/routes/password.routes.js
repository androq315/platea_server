// routes/password.routes.js
import { Router } from 'express';
import PasswordController from '../controllers/password.controller.js';

const router = Router();

router.post('/api/request-reset', PasswordController.requestReset);
router.post('/api/reset-password', PasswordController.resetPassword);

export default router;
