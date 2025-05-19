const express=require('express');
const router=express.Router();
const Producto = require('../models/productos');

//Registrar un producto

router.post('/',async(req,res)=>{
try{
    const prod=new Producto(req.body);
    await prod.save();
    res.status(201).json(prod);
}catch(error){
    res.status(400).json({error:error.message});
}
});

//Consultar todos los productos

router.get('/',async(req,res)=>{
try{
    const prod=await Producto.find();
    res.json(prod);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Consultar producto por id

router.get('/:id',async(req,res)=>{
try{
    const prod=await 
    Producto.findById(req.params.id);
    if (!prod)return res.status(404).json({error:"Producto no encontrado"});
    res.json(prod);
}catch(error){
    res.status(500).json({error:error.message});
}
});


//Modificar datos del producto

router.put('/:id',async(req,res)=>{
try{
    const prod=await 
    Producto.findByIdAndUpdate(req.params.id, req.body, {new:true});
    if (!prod)return res.status(404).json({error:"Producto no encontrado"});
    res.json(prod);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Eliminar un producto

router.delete('/:id',async(req,res)=>{
try{
    const prod=await 
    Producto.findByIdAndDelete(req.params.id);
    if (!prod)return res.status(404).json({error:"Producto no encontrado"});
    res.json(prod);
}catch(error){
    res.status(500).json({error:error.message});
}
});

module.exports=router;

