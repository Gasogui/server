/* ---  index.ts  --- */
import express, { Application } from "express";
import morgan from 'morgan';
import cors from 'cors';

import indexRoutes from './routes/indexRoutes';
import moviesRoutes from './routes/moviesRoutes';
import actorRoutes from "./routes/actorRoutes";
import directorRoutes from "./routes/directorRoutes";
import genresRoutes from "./routes/genresRoutes";
import ratingRoutes from "./routes/ratingRoutes";
import reviewerRoutes from "./routes/reviewerRoutes";

class Server {

    public app: Application;

    constructor() {
        this.app = express();
        this.config();
        this.routes();
    }

    config(): void {
        this.app.set('port', process.env.PORT || 3000);
        this.app.use(morgan('dev'));
        this.app.use(cors());
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));

    }

    routes(): void {
        this.app.use('/', indexRoutes);
        this.app.use('/api/movies', moviesRoutes);
        this.app.use('/api/actores', actorRoutes);
        this.app.use('/api/directores', directorRoutes);
        this.app.use('/api/genders', genresRoutes);
        this.app.use('/api/ratings', ratingRoutes);
        this.app.use('/api/reviewers', reviewerRoutes);
    }

    start(): void {
        this.app.listen(this.app.get('port'), () => {
            console.log('Server on port ', this.app.get('port'));
        });
    }
}

const server = new Server();
server.start();