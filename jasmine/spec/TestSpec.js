var request = require('supertest');
describe("Test", function (){
	var i;
	var server;
	
  beforeEach(function() {
	  i = 0;
  });
	
	describe("login", function() {
	  it("should fail", function() {

		expect(i).toEqual(0);
	  });
	  
	   it("should be successful", function() {

		expect(i).toEqual(0);
	  });
	});
  
	describe("patient query", function() {
	  it("should insert a new patient", function() {

		expect(i).toEqual(0);
	  });
	  
	  it("should delete a patient", function() {

		expect(i).toEqual(0);
	  });
  
	  it("should return multiple patients", function() {

		expect(i).toEqual(0);
	  });
  
	  it("should find a single specific patient", function() {

		expect(i).toEqual(0);
	  });
	});
  
	describe("vaccine query", function() {
	  it("should insert a new vaccine", function() {

		expect(i).toEqual(0);
	  });
	  
	  it("should remove vaccine", function() {

		expect(i).toEqual(0);
	  });
		
	   it("should modify a vaccine in inventory", function() {

		expect(i).toEqual(0);
	  });
	  
	  it("should return multiple vaccines", function() {

		expect(i).toEqual(0);
	  });
	  
	  it("should find a single specific vaccine", function() {

		expect(i).toEqual(0);
	  });
  	});
});