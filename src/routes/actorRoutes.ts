/*  --- actorRoutes.ts ---  */
import { Router } from "express";
import actorController from "../controllers/actorController";

class ActorRoutes {

    public router: Router = Router();

    constructor() {
        this.config();

    }

    config(): void {
        this.router.get('/', actorController.list);
        this.router.get('/:id', actorController.getOne);
        this.router.post('/', actorController.create);
        this.router.put('/:id', actorController.update);
        this.router.delete('/:id', actorController.delete);
    }

}

const actorRoutes = new ActorRoutes();
export default actorRoutes.router;
