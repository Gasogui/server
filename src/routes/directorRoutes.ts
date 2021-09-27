/*  --- directorRoutes.ts ---  */
import { Router } from "express";
import directorController from "../controllers/directorController";

class DirectorRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', directorController.list);
        this.router.get('/:id', directorController.getOne);
        this.router.post('/', directorController.create);
        this.router.put('/:id', directorController.update);
        this.router.delete('/:id', directorController.delete);
    }

}

const directorRoutes = new DirectorRoutes();
export default directorRoutes.router;
