const express=require('express');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');
const cors=require('cors');


const itemRoutes=require('./routes/productoRoutes')
const app=express();

const port=3000;

//midleware

app.use(bodyParser.json());
app.use(cors);

//conexión a mongo

mongoose.connect('mongodb://localhost:27017/miapp',{
    useNewUrlparser:true,
    useUnifiedTopology:true,
})
.then(()=>console.log('MongoDb Conectado'))
.catch(err=>console.error(err))

//Rutas

app.use('api/items',itemRoutes);


app.listen(port,()=>{
    console.log(`servidor conectado en http://localhost:${port}`);
});