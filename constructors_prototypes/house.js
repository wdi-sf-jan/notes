function House(sqFeet, bathrooms, bedrooms, color){
    this.sqFeet = sqFeet;
    this.bathrooms = bathrooms;
    this.bedrooms = bedrooms;
  }
  House.prototype.neighborhood = [];

  // addToNeighborhood
  House.prototype.addToNeighborhood = function(){
    if(House.prototype.neighborhood.indexOf(this) === -1){
      House.prototype.neighborhood.push(this);
    }
    // if this house is already in the neighborhood don't add it
    // if it is not in the neighborhood, push to the neighborhood array
    };

  House.prototype.showFt = function(){
      alert("This house has "+ this.sqFeet + "square feet");
  };

//let's export this guy!
module.exports = House;