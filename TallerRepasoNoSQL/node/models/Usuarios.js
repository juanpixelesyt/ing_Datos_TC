const mongoose=require('mongoose')

const usuarioSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    edad:{type:String,require:true},
    correo:{type:String,require:true}
})
module.exports=mongoose.model('Usuario',usuarioSchema)