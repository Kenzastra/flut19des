import express  from "express";
import fileUpload from "express-fileupload";
import cors from "cors";
import Route from "./routes/Route.js";

const app = express();

app.use(cors());
app.use(express.json());
app.use(fileUpload());
app.use(express.static("public"));
app.use(Route);
app.listen(2000, ()=> console.log("Server Jalan"));