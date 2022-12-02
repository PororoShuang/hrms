class Company {
  String? _company_id;
  String? _company_name;
  DateTime? _date_created;
  String? _current_admin;
  String? _address;
  //Use String or Double?
  String? longitude;
  String? latitude;
  String? radius;
  int? _late_grace_period;

  get company_id => this._company_id;

  set company_id(value) => this._company_id = value;

  get company_name => this._company_name;

  set company_name(value) => this._company_name = value;

  get date_created => this._date_created;

  set date_created(value) => this._date_created = value;

  get current_admin => this._current_admin;

  set current_admin(value) => this._current_admin = value;

  get address => this._address;

  set address(value) => this._address = value;

  get getLongitude => this.longitude;

  set setLongitude(longitude) => this.longitude = longitude;

  get getLatitude => this.latitude;

  set setLatitude(latitude) => this.latitude = latitude;

  get getRadius => this.radius;

  set setRadius(radius) => this.radius = radius;

  get late_grace_period => this._late_grace_period;

  set late_grace_period(value) => this._late_grace_period = value;
}
