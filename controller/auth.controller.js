import bcrypt from 'bcrypt';
import dbExecute from '../db/dbContext.js';
import { genAccessJWT } from '../helper/jwtHelper.js';

///Arrow function
export const register = async(rq, res) => {
    const { username, password, role } = rq.body;

    if(!username || !password || !role){
        return res.status(422).json({statusCode: 422, message: "Parameter empty!" });
    }

    try {

        bcrypt.genSalt(10, (err, salt) => {
            if(err){
                return res.status(400).json({ resultCode: 400, message: `Can not register user` });
            }

            bcrypt.hash(password, salt, async(error, newPassword) => {
                if(error){
                    return res.status(400).json({ resultCode: 400, message: `Can not register user` });
                }
                
                const sql = "INSERT INTO tbusers(username, password, role) VALUES(?,?,?)";
                const params = [username, newPassword, role];

                const data = await dbExecute(sql, params);

                //data = undefined | null | '' | 0 | empty | false

                if(!data){
                    return res.status(422).json({statusCode: 422, message: "Register user failed" });
                }

                return res.status(201).json({statusCode: 201, message: "Register user success" });

            });
        });
        
    } 
    catch (error) 
    {
        return rs.status(500).json({ message: "server error" });
    }
}


export const Login = async (req, res) => {
    const { username, password } = req.body;

    if(!username || !password){
        return res.status(422).json({statusCode: 422, message: "Can not login"})
    }

    try {

        const sql = "SELECT * FROM tbusers WHERE username=?";
        const params = [username];

        const data = await dbExecute(sql, params);

        if(!data || data?.length === 0){

            /// "1" not 1 , "1" === 1 // compare value and compare dataType
            /// "1" is 1, "1" == 1 // compare value, ignore dataType

            return res.status(422).json({ message: "Not found username" });
        }


        for(const user of data){
            const isValid = bcrypt.compareSync(password, user.password);//True/False

            if(isValid){

                const jwtPayload = {
                    id: user.id,
                    username: user.username,
                    role: user.role
                }

                const accessToken = genAccessJWT(jwtPayload);

                return res.status(200).json({
                    statusCode: 200,
                    message: "Login success",
                    accessToken: accessToken,
                    username: user.username
                });
            }
        }

        return res.status(404).json({statusCode: 404, message: "Username or password incorrect!"});

    } 
    catch (error) {
        console.log(error)
        return res.status(500).json({ message: "server error" });
    }
}