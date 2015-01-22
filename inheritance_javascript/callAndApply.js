  function Person(name, job){
    this.name = name;
    this.job = job;
  }

  Person.prototype.walk = function(){
    return this.name + " is walking";
  };

  function Student(name, favTopic){
    // Person.call(this,name);
    Person.apply(this,arguments);
    // Person.apply(this,[name]);
    this.favTopic = favTopic;
  }


  Student.prototype = new Person();
  Student.prototype.constructor = Student;

  var p = new Person("Elie", "Instructor");
  var s = new Student("Bob", "English");

