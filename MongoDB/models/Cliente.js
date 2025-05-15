const mongoose=require('mongoose')

const clienteSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    cedula:{type:String,require:true},
    correo:{type:String}
})
module.exports=mongoose.model('Cliente',clienteSchema)