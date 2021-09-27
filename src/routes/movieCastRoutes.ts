/*  --- movieCastRoutesRoutes.ts ---  */
import { Router } from "express";
import movieCastController from "../controllers/movieCastController";

class MovieCastRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', movieCastController.list);
        this.router.get('/:id', movieCastController.getOne);
        this.router.post('/', movieCastController.create);
        this.router.put('/:id', movieCastController.update);
        this.router.delete('/:id', movieCastController.delete);
    }

}

const movieCastRoutes = new MovieCastRoutes();
export default movieCastRoutes.router;
