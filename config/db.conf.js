import mysql from 'mysql2';
import * as dotenv from 'dotenv';
//initial dotenv
dotenv.config();

export const pool = mysql.createPool({
        host: process.env.HOST,
        user: "root",
        password: "",
        database:  process.env.DB,
        waitForConnections: true,
        connectionLimit: 100,
        queueLimit: 0,
});