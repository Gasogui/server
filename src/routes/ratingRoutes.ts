/*  --- ratingRoutes.ts ---  */
import { Router } from "express";
import ratingController from "../controllers/ratingController";

class RatingRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', ratingController.list);
        this.router.get('/:id', ratingController.getOne);
        this.router.post('/', ratingController.create);
        this.router.put('/:id', ratingController.update);
        this.router.delete('/:id', ratingController.delete);
    }

}

const ratingRoutes = new RatingRoutes();
export default ratingRoutes.router;
