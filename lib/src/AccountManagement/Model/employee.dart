// ignore_for_file: non_constant_identifier_names

class Employee {
  //Variable Declaration
  String? _employee_id;
  String? _employee_id_by_company;
  String? _employee_name;
  String? _user_id;
  String? _parent_company;
  String? _staff_role;
  String? _acc_pass;
  String? _employer_id;
  String? _employer_name;
  String? _types_of_wages;
  String? _ic_no;
  String? _dob;
  String? _gender;
  String? _nationality;
  String? _phone_no;
  String? _email;
  String? _epf_no;
  String? _socso_no;
  String? _itax_no;
  String? _bank_name;
  String? _bank_no;

  DateTime? _employment_start_date;

  int _year_of_services = 0;

  double _wages_rate = 0.00;
  double _monthly_deduction = 0.00;

  bool _employement_letter = false;
  get employee_id => this._employee_id;

  set employee_id(value) => this._employee_id = value;

  get employee_id_by_company => this._employee_id_by_company;

  set employee_id_by_company(value) => this._employee_id_by_company = value;

  get employee_name => this._employee_name;

  set employee_name(value) => this._employee_name = value;

  get user_id => this._user_id;

  set user_id(value) => this._user_id = value;

  get parent_company => this._parent_company;

  set parent_company(value) => this._parent_company = value;

  get staff_role => this._staff_role;

  set staff_role(value) => this._staff_role = value;

  get acc_pass => this._acc_pass;

  set acc_pass(value) => this._acc_pass = value;

  get employer_id => this._employer_id;

  set employer_id(value) => this._employer_id = value;

  get employer_name => this._employer_name;

  set employer_name(value) => this._employer_name = value;

  get types_of_wages => this._types_of_wages;

  set types_of_wages(value) => this._types_of_wages = value;

  get ic_no => this._ic_no;

  set ic_no(value) => this._ic_no = value;

  get dob => this._dob;

  set dob(value) => this._dob = value;

  get gender => this._gender;

  set gender(value) => this._gender = value;

  get nationality => this._nationality;

  set nationality(value) => this._nationality = value;

  get phone_no => this._phone_no;

  set phone_no(value) => this._phone_no = value;

  get email => this._email;

  set email(value) => this._email = value;

  get epf_no => this._epf_no;

  set epf_no(value) => this._epf_no = value;

  get socso_no => this._socso_no;

  set socso_no(value) => this._socso_no = value;

  get itax_no => this._itax_no;

  set itax_no(value) => this._itax_no = value;

  get bank_name => this._bank_name;

  set bank_name(value) => this._bank_name = value;

  get bank_no => this._bank_no;

  set bank_no(value) => this._bank_no = value;

  get employment_start_date => this._employment_start_date;

  set employment_start_date(value) => this._employment_start_date = value;

  get year_of_services => this._year_of_services;

  set year_of_services(value) => this._year_of_services = value;

  get wages_rate => this._wages_rate;

  set wages_rate(value) => this._wages_rate = value;

  get monthly_deduction => this._monthly_deduction;

  set monthly_deduction(value) => this._monthly_deduction = value;

  get employement_letter => this._employement_letter;

  set employement_letter(value) => this._employement_letter = value;

  static String? Function(String?)? validateEmail(String email) {
    return ((email) {
      if (email == "" ||
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
              .hasMatch(email.toString())) {
        return 'Enter a valid email!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateName(String name) {
    return ((name) {
      if (name == "" ||
          !RegExp(r"^[A-Za-z]+([\sA-Za-z]+)*$").hasMatch(name.toString())) {
        return 'Enter a valid name!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateIC(String ic) {
    return ((ic) {
      if (ic == "" ||
          !RegExp(r"^[0-9]{6}[0-9]{2}[0-9]{4}$").hasMatch(ic.toString())) {
        return 'Enter a valid ic!';
      }
      return null;
    });
  }

  static String? Function(String?)? validatePassport(String passport) {
    return ((passport) {
      if (passport == "" ||
          !RegExp(r"^[A-Z]{0,3}[0-9]{7,}$").hasMatch(passport.toString())) {
        return 'Enter a valid passport!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateDateOfBirth(String dateOfBirth) {
    return ((dateOfBirth) {
      if (dateOfBirth == "" ||
              !RegExp(r"^(?:0[1-9]|[12]\d|3[01])([\/.-])(?:0[1-9]|1[012])\1(?:19|20)\d\d$")
                  .hasMatch(dateOfBirth.toString())
          // !RegExp(r"^(?:0[1-9]|[12]\d|3[1])([\/.-])(?:0[13578]|1[02])\1(?:19|20)\d\d$")
          //     .hasMatch(dateOfBirth.toString())
          // !RegExp(r"^(((0[1-9]|[12]\d|3[01])-(0[13578]|1[02])-((?:19|20)\d\d)|((0[1-9]|[12]\d|30)-(0[13456789]|1[012])-((?:19|20)\d\d)|((0[1-9]|1\d|2[0-8])-02-((?:19|20)\d\d)|(29-02-((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$")
          //     .hasMatch(dateOfBirth.toString())
          ) {
        return 'Enter a valid date of birth!';
      }
      // } else if (!RegExp(
      //         r"^(?:0[1-9]|[12]\d|3[0])([\/.-])(?:0[469]|1[1])\1(?:19|20)\d\d$")
      //     .hasMatch(dateOfBirth.toString())) {
      //   return 'Enter a valid date of birth2!';
      // } else if (!RegExp(
      //         r"^(?:0[1-9]|[1]\d|[2][0-8])([\/.-])(?:0[2])\1(?:19|20)\d\d$")
      //     .hasMatch(dateOfBirth.toString())) {
      //   return 'Enter a valid date of birth3!';
      // }
      return null;
    });
  }

  static String? Function(String?)? validatePhoneNumber(String phoneNo) {
    return ((phoneNo) {
      if (phoneNo == "" ||
          !RegExp(r"^[1-9]{9,11}$").hasMatch(phoneNo.toString())) {
        return 'Enter a valid phone Number!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateEPF(String epf) {
    return ((epf) {
      if (epf == "" || !RegExp(r"^\d{7}$").hasMatch(epf.toString())) {
        return 'Enter a valid EPF!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateSOSCO(String SOSCO) {
    return ((SOSCO) {
      if (SOSCO == "" || !RegExp(r"^\d{12}$").hasMatch(SOSCO.toString())) {
        return 'Enter a valid SOSCO Number!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateITax(String iTax) {
    return ((iTax) {
      if (iTax == "" ||
          !RegExp(r"^(?:\d{3}-\d{2}-\d{4}|\d{2}-\d{7})$")
              .hasMatch(iTax.toString())) {
        return 'Enter a valid i-Tax Number!';
      }
      return null;
    });
  }

  static String? Function(String?)? validateBankAcc(String bankAcc) {
    return ((bankAcc) {
      if (bankAcc == "" ||
          !RegExp(r"^[0-9]{8,17}$").hasMatch(bankAcc.toString())) {
        return 'Enter a valid Bank Account Number!';
      }
      return null;
    });
  }
//Employee ID Validation

  // //Getter
  // String get employee_id => _employee_id ?? "";
  // String get employee_id_by_company => _employee_id_by_company ?? "";
  // String get employee_name => _employee_name ?? "";
  // String get user_id => _user_id ?? "";
  // String get parent_company => _parent_company ?? "";
  // String get staff_role => _staff_role ?? "";
  // String get acc_pass => _acc_pass ?? "";
  // String get employer_id => _employer_id ?? "";
  // String get employer_name => _employer_name ?? "";
  // String get types_of_wages => _types_of_wages ?? "";
  // String get ic_no => _ic_no ?? "";
  // String get dob => _dob ?? "";
  // String get gender => _gender ?? "";
  // String get nationality => _nationality ?? "";
  // String get phone_no => _phone_no ?? "";
  // String get email => _email ?? "";
  // String get epf_no => _epf_no ?? "";
  // String get socso_no => _socso_no ?? "";
  // String get itax_no => _itax_no ?? "";
  // String get bank_name => _bank_name ?? "";
  // String get bank_no => _bank_no ?? "";
  // DateTime get employment_start_date =>
  //     _employment_start_date ?? DateTime.now();
  // int get year_of_service => _year_of_services;
  // double get wages_rate => _wages_rate;
  // double get monthly_deduction => _monthly_deduction;
  // bool get employement_letter => _employement_letter;

  // //Setter
  // void setEmployeeId(String employeeId) => _employee_id = employeeId;
  // void setEmployeeIdByCompany(String employeeIdByCompany) =>
  //     _employee_id_by_company = employee_id_by_company;
}
