module.exports = async (srv) => {
    //implementation code
    srv.on('greetings', ( req,res)=>{
        return "good morning sunshine! " + req.data.name ;
    })
}