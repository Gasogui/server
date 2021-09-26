/*  --- moviesRoutes.ts ---  */
import { Router } from "express";
import moviesController from "../controllers/moviesController";

class MoviesRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', moviesController.index);
    }

}

const moviesRoutes = new MoviesRoutes();
export default moviesRoutes.router;
