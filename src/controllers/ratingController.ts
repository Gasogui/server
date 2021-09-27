/* ---  ratingController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class RatingController {

    public async list(req: Request, res: Response) {
        const ratingList = await pool.query('SELECT * FROM rating');
        res.json(ratingList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const rating = await pool.query('SELECT * FROM rating WHERE rat_id = ?', [id]);
        console.log(rating.length);
        if (rating.length > 0) {
            return res.json(rating[0]);
        }
        res.status(404).json({ text: "The rating doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createRating = await pool.query('INSERT INTO rating set ?', [req.body]);
        res.json({ message: 'Rating Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldRating = req.body;
        await pool.query('UPDATE rating set ? WHERE rat_id = ?', [req.body, id]);
        res.json({ message: "The rating was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM rating WHERE rat_id = ?', [id]);
        res.json({ message: "The rating was deleted" });
    }

}

const ratingController = new RatingController();
export default ratingController;