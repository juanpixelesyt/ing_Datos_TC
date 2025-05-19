const mongoose=require('mongoose')

const productoSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    precio:{type:String,require:true},
    categoria:{type:String,require:true}
})
module.exports=mongoose.model('producto',productoSchema)