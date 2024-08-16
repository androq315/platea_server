import express from "express";
import { Router } from "express";
import { getUsers, getUser, postUser, putUser, toggleUser } from "../controllers/user.controller.js";

const router = Router();

router.use(express.json())

router.get('/api/persona/', async (req, res) => {
    res.json(await getUsers());
});

router.get('/api/persona/:id', async (req, res) => {
    const id = req.params.id;
    res.json(await getUser(id));
});

router.post('/api/persona/', async (req, res) => {
    const user = req.body;
    await postUser(user);
    console.log(user);
    res.send("Datos recibidos");
});

router.put('/api/persona/:id', async (req, res) => {
    const id = req.params.id;
    const user = req.body;
    console.log(user);
    await putUser(user, id);
    res.send("Datos Actualizados");
});

router.delete('/api/persona/:id', async (req, res) => {
    const id = req.params.id;
    await toggleUser(id);
    console.log("Se cambio el estado del usuario satisfactoriamente");
    res.send("Se cambio el estado del usuario satisfactoriamente");
});

export default router;