import { pool } from "../config/db.conf.js";

const dbExecute = async (sql, params = []) => {
    let connection;

    try {
        connection = await pool.promise().getConnection();

        const [results] = await connection.execute(sql, params);
        
        return results;
    } catch (err) {
        console.error("❌ Database error:", err);
        throw err;
    } finally {
        if (connection) connection.release();
    }
};

export default dbExecute;