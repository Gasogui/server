/* ---  moviesController.ts ----  */
import { Request, Response } from "express";
import pool from "../database";

class MoviesController {
    public index(req: Request, res: Response) {
        res.send('Movies List - nuevo');
    }
}

const moviesController = new MoviesController();
export default moviesController;