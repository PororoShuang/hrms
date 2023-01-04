class Company {
  String? company_Id;
  String? company_name;
  String? current_admin;
  String? address;
  String? longitude;
  String? latitude;
  get companyId => this.company_Id;

  set companyId(value) => this.company_Id = value;

  get companyname => this.company_name;

  set companyname(value) => this.company_name = value;

  get currentadmin => this.current_admin;

  set currentadmin(value) => this.current_admin = value;

  get getAddress => this.address;

  set setAddress(address) => this.address = address;

  get getLongitude => this.longitude;

  set setLongitude(longitude) => this.longitude = longitude;

  get getLatitude => this.latitude;

  set setLatitude(latitude) => this.latitude = latitude;
}
