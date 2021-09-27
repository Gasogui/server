/* ---  directorController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class DirectorController {

    public async list(req: Request, res: Response) {
        const directoresList = await pool.query('SELECT * FROM director');
        res.json(directoresList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const director = await pool.query('SELECT * FROM director WHERE dir_id = ?', [id]);
        console.log(director.length);
        if (director.length > 0) {
            return res.json(director[0]);
        }
        res.status(404).json({ text: "The director doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createDirector = await pool.query('INSERT INTO director set ?', [req.body]);
        res.json({ message: 'Director Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldDirector = req.body;
        await pool.query('UPDATE director set ? WHERE dir_id = ?', [req.body, id]);
        res.json({ message: "The director was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM director WHERE dir_id = ?', [id]);
        res.json({ message: "The director was deleted" });
    }

}

const directorController = new DirectorController();
export default directorController;