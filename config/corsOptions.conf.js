import corsMiddleware from 'cors';
import { whiteOrigins } from './whiteOrigins.conf.js';

const corsOptions = {
    origin: (origin, callback) => 
    {
        ///method: 1
        if(whiteOrigins.indexOf(String(origin)) !== -1 || !origin)
        {
            callback(null, true);
        }
        else
        {
            callback(new Error('No origin allowed by CORS'));
        }


        // ///Method: 2
        // if(whiteOrigins.includes(String(origin))){
        //     callback(null, true);
        // }
        // else
        // {
        //     callback(new Error('No origin allowed by CORS'));
        // }

    },

    credentials: true,
}

export const cors = corsMiddleware(corsOptions);