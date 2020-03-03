class Employee{
  int _id;
  String _name;
  double _salary;

  int get id =>this._id;

	 set id(int _id) {
		this._id = _id;
	}

  String get name =>this._name;

	 set name(String _name) {
		this._name = _name;
	}

  double get salary =>this._salary;

	 set salary(double _salary) {
		this._salary = _salary;
	}

  Employee(this._id,this._name,this._salary);

  
}