/* ---  indexController.ts ----  */
import { Request, Response } from 'express';

class IndexController {

    public index(req: Request, res: Response) {
        res.json({ text: 'API Is /API/movies' });

    }
}

export const indexController = new IndexController;