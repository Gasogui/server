/*  --- movieDirectionRoutes.ts ---  */
import { Router } from "express";
import movieDirectionController from "../controllers/movieDirectionController";

class MovieDirectionRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', movieDirectionController.list);
        this.router.get('/:id', movieDirectionController.getOne);
        this.router.post('/', movieDirectionController.create);
        this.router.put('/:id', movieDirectionController.update);
        this.router.delete('/:id', movieDirectionController.delete);
    }

}

const movieDirectionRoutes = new MovieDirectionRoutes();
export default movieDirectionRoutes.router;
