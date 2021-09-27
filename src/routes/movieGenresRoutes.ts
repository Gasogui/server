/*  --- movieGenresRoutes.ts ---  */
import { Router } from "express";
import movieGenresController from "../controllers/movieGenresController";

class MovieGenresRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', movieGenresController.list);
        this.router.get('/:id', movieGenresController.getOne);
        this.router.post('/', movieGenresController.create);
        this.router.put('/:id', movieGenresController.update);
        this.router.delete('/:id', movieGenresController.delete);
    }

}

const movieGenresRoutes = new MovieGenresRoutes();
export default movieGenresRoutes.router;
