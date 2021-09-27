/*  --- movieRoutes.ts ---  */
import { Router } from "express";
import movieController from "../controllers/movieController";

class MoviesRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', movieController.list);
        this.router.get('/:id', movieController.getOne);
        this.router.post('/', movieController.create);
        this.router.put('/:id', movieController.update);
        this.router.delete('/:id', movieController.delete);
    }

}

const moviesRoutes = new MoviesRoutes();
export default moviesRoutes.router;
