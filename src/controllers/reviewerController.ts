/* ---  reviewerController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class ReviewerController {

    public async list(req: Request, res: Response) {
        const reviewersList = await pool.query('SELECT * FROM reviewer');
        res.json(reviewersList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const reviewer = await pool.query('SELECT * FROM reviewer WHERE rev_id = ?', [id]);
        console.log(reviewer.length);
        if (reviewer.length > 0) {
            return res.json(reviewer[0]);
        }
        res.status(404).json({ text: "The reviewer doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createReviewerr = await pool.query('INSERT INTO reviewer set ?', [req.body]);
        res.json({ message: 'Reviewer Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const oldReviewer = req.body;
        await pool.query('UPDATE reviewer set ? WHERE rev_id = ?', [req.body, id]);
        res.json({ message: "The reviewer was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM reviewer WHERE rev_id = ?', [id]);
        res.json({ message: "The reviewer was deleted" });
    }

}

const reviewerController = new ReviewerController();
export default reviewerController;