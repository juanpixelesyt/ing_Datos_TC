const express=require('express');
const router=express.Router();
const Usuario = require('../models/Usuarios');

//Registrar un producto

router.post('/',async(req,res)=>{
try{
    const usu=new Usuario(req.body);
    await usu.save();
    res.status(201).json(usu);
}catch(error){
    res.status(400).json({error:error.message});
}
});

//Consultar todos los productos

router.get('/',async(req,res)=>{
try{
    const usu=await Usuario.find();
    res.json(usu);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Consultar producto por id

router.get('/:id',async(req,res)=>{
try{
    const usu=await 
    Usuario.findById(req.params.id);
    if (!usu)return res.status(404).json({error:"Producto no encontrado"});
    res.json(usu);
}catch(error){
    res.status(500).json({error:error.message});
}
});


//Modificar datos del producto

router.put('/:id',async(req,res)=>{
try{
    const usu=await 
    Usuario.findByIdAndUpdate(req.params.id, req.body, {new:true});
    if (!usu)return res.status(404).json({error:"Producto no encontrado"});
    res.json(usu);
}catch(error){
    res.status(500).json({error:error.message});
}
});

//Eliminar un producto

router.delete('/:id',async(req,res)=>{
try{
    const usu=await 
    Usuario.findByIdAndDelete(req.params.id);
    if (!usu)return res.status(404).json({error:"Producto no encontrado"});
    res.json(usu);
}catch(error){
    res.status(500).json({error:error.message});
}
});

module.exports=router;

