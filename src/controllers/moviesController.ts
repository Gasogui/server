/* ---  moviesController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class MoviesController {

    public async list(req: Request, res: Response) {
        const moviesList = await pool.query('SELECT * FROM movie');
        res.json(moviesList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const movie = await pool.query('SELECT * FROM movie WHERE mov_id = ?', [id]);
        console.log(movie.length);
        if (movie.length > 0) {
            return res.json(movie[0]);
        }
        res.status(404).json({ text: "The movie doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createMovie = await pool.query('INSERT INTO movie set ?', [req.body]);
        res.json({ message: 'Movie Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldMovie = req.body;
        await pool.query('UPDATE movie set ? WHERE mov_id = ?', [req.body, id]);
        res.json({ message: "The movie was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM movie WHERE mov_id = ?', [id]);
        res.json({ message: "The movie was deleted" });
    }

}

const moviesController = new MoviesController();
export default moviesController;