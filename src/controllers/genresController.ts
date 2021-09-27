/* ---  generesController.ts ----  */
import { Request, Response } from "express";
import pool from "../config/database";

class GenresController {

    public async list(req: Request, res: Response) {
        const genderList = await pool.query('SELECT * FROM genres');
        res.json(genderList);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const gender = await pool.query('SELECT * FROM genres WHERE gen_id = ?', [id]);
        console.log(gender.length);
        if (gender.length > 0) {
            return res.json(gender[0]);
        }
        res.status(404).json({ text: "The gender doesn't exits" });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const createGender = await pool.query('INSERT INTO genres set ?', [req.body]);
        res.json({ message: 'Gender Saved' });

    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const olGender = req.body;
        await pool.query('UPDATE genres set ? WHERE gen_id = ?', [req.body, id]);
        res.json({ message: "The gender was Updated" });
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        await pool.query('DELETE FROM genres WHERE gen_id = ?', [id]);
        res.json({ message: "The gender was deleted" });
    }

}

const genresController = new GenresController();
export default genresController;