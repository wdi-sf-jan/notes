function Car(make,model,year){
  this.make = make;
  this.model = model;
  this.year = year;
}

Car.prototype.honk = function(){
  alert("beep!");
};

function Motorcyle(make,model,year){
  // this.make = make;
  // this.model = model;
  // this.year = year;
  Car.call(this,make,model,year);

}

Motorcyle.prototype = new Car();

b = new Motorcyle("Harly", "sportster", 2013);

b.honk();




