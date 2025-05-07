const mongoose=requiere('mongoose');

const itemSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    descripcion:string,
    creadoEn:{type:Date,default:Date.now}
});
module.exports=mongoose.model('item',itemSchema)
