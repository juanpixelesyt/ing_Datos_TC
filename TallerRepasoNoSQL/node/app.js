require('dotenv').config();

const express=require('express');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');
const cors=require('cors');

const prodRoutes=require('./routes/productoRoutes.js');
const usuRoutes=require('./routes/usuarioRoutes.js')

const app=express();
const PORT=3000;

//Middleware

app.use(bodyParser.json());
app.use(cors());

//Conexión Mongo

mongoose.connect('mongodb://localhost:27017/tallerMongoNode',{
    useNewUrlParser:true,
    useUnifiedTopology:true,
})

.then(()=>console.log("MongoDB Conectado"))
.catch(err=>console.error(err))


//Rutas

app.use('/api/Productos', prodRoutes);
app.use('/api/Usuarios',usuRoutes)

app.listen(PORT,()=>{
    console.log(`Servidor Conectado en http://localhost:${PORT}`);
});