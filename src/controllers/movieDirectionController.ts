/* ---  movieDirectionController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class MovieDirectionController {

    public async list(req: Request, res: Response) {
        const moviDirList = await pool.query('SELECT * FROM movie_direction');
        res.json(moviDirList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const moviDir = await pool.query('SELECT * FROM movie_direction WHERE mdir_id = ?', [id]);
        console.log(moviDir.length);
        if (moviDir.length > 0) {
            return res.json(moviDir[0]);
        }
        res.status(404).json({ text: "The movie_direction doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createActor = await pool.query('INSERT INTO movie_direction set ?', [req.body]);
        res.json({ message: 'movie_direction Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldActor = req.body;
        await pool.query('UPDATE movie_direction set ? WHERE mdir_id = ?', [req.body, id]);
        res.json({ message: "The movie_direction was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM movie_direction WHERE mdir_id = ?', [id]);
        res.json({ message: "The movie_direction was deleted" });
    }

}

const movieDirectionController = new MovieDirectionController();
export default movieDirectionController;