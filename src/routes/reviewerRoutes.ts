/*  --- reviewerRoutes.ts ---  */
import { Router } from "express";
import reviewerController from "../controllers/reviewerController";

class ReviewerRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', reviewerController.list);
        this.router.get('/:id', reviewerController.getOne);
        this.router.post('/', reviewerController.create);
        this.router.put('/:id', reviewerController.update);
        this.router.delete('/:id', reviewerController.delete);
    }

}

const reviewerRoutes = new ReviewerRoutes();
export default reviewerRoutes.router;
