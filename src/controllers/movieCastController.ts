/* ---  movieCastController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class MovieCastController {

    public async list(req: Request, res: Response) {
        const mcastList = await pool.query('SELECT * FROM movie_cast');
        res.json(mcastList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const mcast = await pool.query('SELECT * FROM movie_cast WHERE mcast_id = ?', [id]);
        console.log(mcast.length);
        if (mcast.length > 0) {
            return res.json(mcast[0]);
        }
        res.status(404).json({ text: "The role doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createMcast = await pool.query('INSERT INTO movie_cast set ?', [req.body]);
        res.json({ message: 'Role Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldMcast = req.body;
        await pool.query('UPDATE movie_cast set ? WHERE mcast_id = ?', [req.body, id]);
        res.json({ message: "The role was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM movie_cast WHERE mcast_id = ?', [id]);
        res.json({ message: "The role was deleted" });
    }

}

const movieCastController = new MovieCastController();
export default movieCastController;