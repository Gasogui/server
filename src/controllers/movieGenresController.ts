/* ---  movieGenresController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class MovieGenresController {

    public async list(req: Request, res: Response) {
        const mgenList = await pool.query('SELECT * FROM movie_genres');
        res.json(mgenList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const actor = await pool.query('SELECT * FROM movie_genres WHERE mgen_id = ?', [id]);
        console.log(actor.length);
        if (actor.length > 0) {
            return res.json(actor[0]);
        }
        res.status(404).json({ text: "The movie_genres doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createActor = await pool.query('INSERT INTO movie_genres set ?', [req.body]);
        res.json({ message: 'movie_genres Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldActor = req.body;
        await pool.query('UPDATE movie_genres set ? WHERE mgen_id = ?', [req.body, id]);
        res.json({ message: "The movie_genres was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM movie_genres WHERE mgen_id = ?', [id]);
        res.json({ message: "The movie_genres was deleted" });
    }

}

const movieGenresController = new MovieGenresController();
export default movieGenresController;