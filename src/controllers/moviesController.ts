/* ---  moviesController.ts ----  */
import { Request, Response } from "express";
import pool from "../database";

class MoviesController {
    public list(req: Request, res: Response) {
        pool.query('DESCRIBE movie');
        res.send('Listing movies ');
    }

    public getOne(req: Request, res: Response) {
        res.json({ text: 'This is movie ' + req.params.id });

    }

    public create(req: Request, res: Response) {
        res.json({ text: 'Creatin a movie' });

    }

    public upate(req: Request, res: Response) {
        res.json({ text: 'Updating a movie ' + req.params.id });
    }

    public delete(req: Request, res: Response) {
        res.json({ text: 'Deleting a movie ' + req.params.id });
    }

}

const moviesController = new MoviesController();
export default moviesController;