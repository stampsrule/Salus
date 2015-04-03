var mysql   = require("mysql");

// Create connection handler
function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

// Connection handler
REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
    router.get("/",function(req,res){
        res.json({"Message" : "Hello World !"});
    });
	
	// Inserts new patient into database
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
	
	// Login to app
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
	
	// Retrieve patient information based on input from user on app
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
	
	// Get list of all patients from database
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

	// Get all patients with first name given by user
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
	
	// Update patient table with new information from user in app
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
	
	// Select a random row from delivery site table (temp function)
	router.get("/deliverySite",function(req,res){
		var query = "SELECT * FROM ?? ORDER BY RAND() LIMIT 1";
		var table = ["Delivery_site"];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Delivery Site" : rows});
            }
        });
	});
	
	// Select all vaccines containing a vaccine code string (case specific)
	router.get("/vaccine",function(req,res){
		var query = "SELECT * FROM ? WHERE vaccine_code LIKE BINARY CONCAT('%',?,'%')";
		var table = ["vaccine",req.body.vaccineCode];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Vaccine" : rows});
            }
        });
	});
	
	// Select vaccine from (dummy) inventory with specific lot number
	router.get("/dummy",function(req,res){
		var query = "SELECT * FROM ? WHERE lot_number = ?";
		var table = ["Dummy",req.body.lotNumber];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Vaccine" : rows});
            }
        });
	});
	
	// Insert a rejected event into proper tables
	router.post("/noEvent",function(req,res){
		var query = "INSERT INTO ? (not_immunized_event_id,date,reason_code) VALUES (?,?,?)";
		var table = ["not_immunized_event",req.body.noEventID,req.body.date,req.body.reasonCode];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success"});
            }
        });
		
		var query = "INSERT INTO ? \
		(vaccinator_idvaccinator,\
		vaccine_idvaccine,\
		date,\
		patient_idpatient,\
		signed,\
		signature,\
		Delivery_site_Delivery_site_ID_value,\
		Delivery_organization,\
		Grade_code,\
		submitter_prefix,\
		not_immunized_event_not_immunized_event_id,\
		immunization_Event_idimmunization_Event_ID)\
		VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		var table = ["dispensing",req.body.vaccinatorID,req.body.vaccineID,req.body.date,
		req.body.patientID,req.body.signed,req.body.signature,req.body.deliverySiteID,
		req.body.DeliveryOrg,req.body.grade,req.body.submitter,req.body.noEventID,
		req.body.eventID];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success"});
            }
        });
	});
	
	// Insert an immunization event into proper tables
	router.post("/event",function(req,res){
		var query = "INSERT INTO ?\
		(idimmunization_Event_ID,\
		Reason_code,\
		Vaccine_site,\
		admin_method,\
		dosage,\
		dosage_type_code,\
		Manufacturer,\
		Lot_number,\
		comment)\
		VALUES\
		(?,?,?,?,?,?,?,?,?)";
		var table = ["immunization_event",req.body.eventID,req.body.reasonCode,req.body.vaccineSite,req.body.adminMethod,\
		req.body.dosage,req.body.dosageType,req.body.manufacturer,req.body.lotNumber,req.body.comment];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success"});
            }
        });
		
		var query = "INSERT INTO ? \
		(vaccinator_idvaccinator,\
		vaccine_idvaccine,\
		date,\
		patient_idpatient,\
		signed,\
		signature,\
		Delivery_site_Delivery_site_ID_value,\
		Delivery_organization,\
		Grade_code,\
		submitter_prefix,\
		not_immunized_event_not_immunized_event_id,\
		immunization_Event_idimmunization_Event_ID)\
		VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		var table = ["dispensing",req.body.vaccinatorID,req.body.vaccineID,req.body.date,
		req.body.patientID,req.body.signed,req.body.signature,req.body.deliverySiteID,
		req.body.DeliveryOrg,req.body.grade,req.body.submitter,req.body.noEventID,
		req.body.eventID];
		query = mysql.format(query,table);
		connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success"});
            }
        });
	});
	
	/*
	-- Use only if immunization event DID NOT happen
INSERT INTO not_immunized_event (not_immunized_event_id,date,reason_code)
VALUES (1001,'2015-04-01 23:23:23', 'ABC');

-- Use only if immunization event happens
INSERT INTO immunization_Event
(idimmunization_Event_ID,
Reason_code,
Vaccine_site,
admin_method,
dosage,
dosage_type_code,
Manufacturer,
Lot_number,
comment)
VALUES
(1013,4,'RLL','IN',123,'CAP','BAX','LLL-5555','Test Insert');

INSERT INTO dispensing
(vaccinator_idvaccinator,  -- Must be valid ID from Vaccinator table
vaccine_idvaccine, -- Must be valid id from Vaccine table
date, 
patient_idpatient,
-- signed, -- Optional
-- signature, -- Optional
Delivery_site_Delivery_site_ID_value,
-- Delivery_organization, -- Optional
-- Grade_code, -- Optional
submitter_prefix,
not_immunized_event_not_immunized_event_id, -- Must be 0 if immunization happened
immunization_Event_idimmunization_Event_ID -- Must be 0 if immunization DID NOT happen
)
VALUES
(44279406, 71, '2015-04-01', 1006, '0024MESB9725', 01235, 0, 0); -- Replace one of the 0's with LAST_INSERT_ID() based on what was created prior
*/
}

module.exports = REST_ROUTER;
