const express=require('express');
const router=express.Router();
const Cliente = require('../models/Cliente');

//Registrar un producto

router.post('/',async(req,res)=>{
try{
    const client=new Cliente(req.body);
    await client.save();
    res.status(201).json(client);
}catch(error){
    res.status(400).json({error:error.message});
}
});

//Consultar todos los productos

router.get('/',async(req,res)=>{
try{
    const client=await Cliente.find();
    res.json(client);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Consultar producto por id

router.get('/:id',async(req,res)=>{
try{
    const client=await 
    Cliente.findById(req.params.id);
    if (!client)return res.status(404).json({error:"Producto no encontrado"});
    res.json(client);
}catch(error){
    res.status(500).json({error:error.message});
}
});


//Modificar datos del producto

router.put('/:id',async(req,res)=>{
try{
    const client=await 
    Cliente.findByIdAndUpdate(req.params.id, req.body, {new:true});
    if (!client)return res.status(404).json({error:"Producto no encontrado"});
    res.json(client);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Eliminar un producto

router.delete('/:id',async(req,res)=>{
try{
    const client=await 
    CLiente.findByIdAndDelete(req.params.id);
    if (!client)return res.status(404).json({error:"Producto no encontrado"});
    res.json(client);
}catch(error){
    res.status(500).json({error:error.message});
}
});

module.exports=router;

