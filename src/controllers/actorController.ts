/* ---  actorController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class ActorController {

    public async list(req: Request, res: Response) {
        const actoresList = await pool.query('SELECT * FROM actor');
        res.json(actoresList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const actor = await pool.query('SELECT * FROM actor WHERE act_id = ?', [id]);
        console.log(actor.length);
        if (actor.length > 0) {
            return res.json(actor[0]);
        }
        res.status(404).json({ text: "The actor doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createActor = await pool.query('INSERT INTO actor set ?', [req.body]);
        res.json({ message: 'Actor Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldActor = req.body;
        await pool.query('UPDATE actor set ? WHERE act_id = ?', [req.body, id]);
        res.json({ message: "The actor was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM actor WHERE act_id = ?', [id]);
        res.json({ message: "The actor was deleted" });
    }

}

const actorController = new ActorController();
export default actorController;