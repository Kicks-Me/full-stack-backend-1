import { MulterError } from "multer";
import { buildPath, createMulterUpload, generateStorage } from "../../util/multerHelper.js";

const IMAGE_PATH = 'products';

///upload function
export const uploadFile = async (req, res) => {
    try {

      const Storage = generateStorage(IMAGE_PATH);
      
      const upload = createMulterUpload(Storage).fields([
         {name: 'file', maxCount: 1}
      ]);

      upload(req, res, async(error) =>{
        if(error instanceof MulterError)
        {
            return res.status(error.statusCode || 500).json({ statusCode: error.statusCode || 500, message: error.message || "Upload error"}); 
        }
        else if (error) 
        {
            return res.status(206).json({ resultCode: 206, message: error.message || "Upload failed." });
        }

        return res.status(200).json({
          resultCode: 200,
          message: "Operation successfully!",
          fileName: req?.files["file"] ? buildPath(IMAGE_PATH, req?.files["file"][0]?.filename) : null
        });

      });
    } 
    catch (error) 
    {
      return res.status(500).send("Internal Server Error");
    }
};


//////jwt

import jwt from "jsonwebtoken";

exports.verifyJWT = (req, res, next) => {
    const auth_key = req?.headers?.authorization;
    
    if(!auth_key || !auth_key?.startsWith("Bearer "))
    {
        console.log('unauthorized => ',req?.headers);
        return res.status(401).json({resultCode: 401, message: "Unauthorized"});
    }
    
    const token = auth_key?.split(" ")[1];

    jwt?.verify(token, 'PUBLIC_KEY', {
        algorithms: "RS256",
    }, 
    (err, plainCode)=> {
        if(err)
        {
            if(err?.name === 'TokenExpiredError')
            {
                console.log(`token is expired`);
                return res.status(401).json({resultCode: 401, message: "Session is expired"});
            }
            else
            {
                console.log(`${req?.headers}\t Forbidden on jwt decode error`);
                return res.status(403).json({resultCode: 403, message: "Forbidden"});
            }
        }
        
        req.id = plainCode?.id;
        req.username = plainCode?.username;
        req.role = plainCode?.role;

        next();
        
    });

}