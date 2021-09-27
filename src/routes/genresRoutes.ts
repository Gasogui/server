/*  --- generesRoutes.ts ---  */
import { Router } from "express";
import genresController from "../controllers/genresController";

class GenderRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', genresController.list);
        this.router.get('/:id', genresController.getOne);
        this.router.post('/', genresController.create);
        this.router.put('/:id', genresController.update);
        this.router.delete('/:id', genresController.delete);
    }

}

const genderRoutess = new GenderRoutes();
export default genderRoutess.router;
