var mysql   = require("mysql");

function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
    router.get("/",function(req,res){
        res.json({"Message" : "Hello World !"});
    });
    router.post("/newPatient",function(req,res){
        var query = "INSERT INTO patient (first_name,last_name,address,city,province,postal_code,idpatient) VALUES (?,?,?,?,?,?,?)";
        var table = [req.body.first_name,req.body.last_name, req.body.address, req.body.city, req.body.province, req.body.postal_code, req.body.idpatient];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : err});
            } else {
                res.json({"Error" : false, "Message" : rows});
            }
        });
    });
    router.post('/login',function(req,res){
        var user_name=req.body.user;
        var password=req.body.password;
        console.log("User name = "+user_name+", password is "+password);

        
	
        var table = [req.body.password, req.body.user];

        query = mysql.format(query,table);
        console.log(query);

        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : rows});
            }
        });
    });
    router.post('/patientInfo',function(req,res){
        var query = "SELECT * FROM patient WHERE first_name LIKE ? AND last_name LIKE ? AND address LIKE ? AND city LIKE ? AND province LIKE ? AND postal_code LIKE ? AND idpatient LIKE ?";
        var table = [req.body.FirstName, req.body.LastName, req.body.Address, req.body.City, req.body.Province, req.body.PostalCode, req.body.AHSID];

        query = mysql.format(query,table);
        console.log(query);

        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : rows});
            }
        });



    });
    router.get("/allPatients",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["patient"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });

    router.get("/allPatients/:first_name",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["patient","first_name",req.params.first_name];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });
    router.put("/users",function(req,res){
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["patient","last_name",req.body.last_name,"first_name",req.body.first_name];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Updated the password for email "+req.body.email});
            }
        });
    });
	
	/*
	select * FROM vaccine WHERE vaccine_code like “%”
		SELECT * FROM vaccine WHERE vaccine_code LIKE BINARY CONCAT('%','A','%')
	select a random delivery site
		choose a random row from the delivery site table
	from your dummy table select manufacturer where lot number = "x"
		SELECT * FROM Dummy WHERE manufacturer = 'CLS'
	if time
		immunization event
		non-immunization event

*/
	//router.get("/all

}

module.exports = REST_ROUTER;
