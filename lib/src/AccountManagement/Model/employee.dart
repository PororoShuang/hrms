// // ignore_for_file: non_constant_identifier_names
import 'dart:convert';

// class Employee {
//   Employee(
//       {this.employee_id,
//       this.employee_id_by_company,
//       this.employee_name,
//       this.user_id,
//       this.parent_company,
//       this.staff_role,
//       this.acc_pass,
//       this.employer_id,
//       this.employer_name,
//       this.types_of_wages,
//       this.ic_no,
//       this.dob,
//       this.gender,
//       this.nationality,
//       this.phone_no,
//       this.email,
//       this.epf_no,
//       this.socso_no,
//       this.itax_no,
//       this.bank_name,
//       this.bank_no,
//       this.employment_start_date,
//       this.year_of_services = 0,
//       this.wages_rate = 0,
//       this.monthly_deduction = 0,
//       this.employement_letter = false});

//   //Variable Declaration
//   String? employee_id;
//   String? employee_id_by_company;
//   String? employee_name;
//   String? user_id;
//   String? parent_company;
//   String? staff_role;
//   String? acc_pass;
//   String? employer_id;
//   String? employer_name;
//   String? types_of_wages;
//   String? ic_no;
//   String? dob;
//   String? gender;
//   String? nationality;
//   String? phone_no;
//   String? email;
//   String? epf_no;
//   String? socso_no;
//   String? itax_no;
//   String? bank_name;
//   String? bank_no;
//   String? religion;
//   String? uuid;
//   String? asp_id;
//   String? prof_img_path;

//   DateTime? employment_start_date;
//   DateTime? leave_update;

//   int year_of_services = 0;

//   double wages_rate = 0.00;
//   double monthly_deduction = 0.00;
//   double paid_leave_hour = 0.0;
//   double sick_leave_hour = 0.0;
//   double sick_leave_on_bargain = 0.0;

//   bool isActive = false;
//   bool employement_letter = false;

//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//       employee_id: json["employee_id"],
//       employee_id_by_company: json["employee_id_by_company"],
//       employee_name: json["employee_name"],
//       types_of_wages: json["type of wages"],
//       ic_no: json["ic no"],
//       dob: json["birthday"],
//       gender: json["gender"],
//       nationality: json["nationality"],
//       phone_no: json["phone no"],
//       email: json["email"],
//       epf_no: json["epf no"],
//       socso_no: json["socso no"],
//       itax_no: json["itax no"],
//       bank_name: json["bank name"],
//       bank_no: json["bank no"]);

//   Map<String, dynamic> toJson() => {
//         "employee_id": employee_id,
//         "employee_id_by_company": employee_id_by_company,
//         "employee_name": employee_name,
//         "type of wages": types_of_wages,
//         "ic_no": ic_no,
//         "birthday": dob,
//         "gender": gender,
//         "nationality": nationality,
//         "phone no": phone_no,
//         "email": email,
//         "epf no": epf_no,
//         "socso_no": socso_no,
//         "itax no": itax_no,
//         "bank name": bank_name,
//         "bank no": bank_no
//       };

//   static String? Function(String?)? validateEmail(String email) {
//     return ((email) {
//       if (email == "" ||
//           !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
//               .hasMatch(email.toString())) {
//         return 'Enter a valid email!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateName(String name) {
//     return ((name) {
//       if (name == "" ||
//           !RegExp(r"^[A-Za-z]+([\sA-Za-z]+)*$").hasMatch(name.toString())) {
//         return 'Enter a valid name!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateIC(String ic) {
//     return ((ic) {
//       if (ic == "" ||
//           !RegExp(r"^[0-9]{6}[0-9]{2}[0-9]{4}$").hasMatch(ic.toString())) {
//         return 'Enter a valid ic!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validatePassport(String passport) {
//     return ((passport) {
//       if (passport == "" ||
//           !RegExp(r"^[A-Z]{0,3}[0-9]{7,}$").hasMatch(passport.toString())) {
//         return 'Enter a valid passport!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateDateOfBirth(String dateOfBirth) {
//     return ((dateOfBirth) {
//       if (dateOfBirth == "" ||
//               !RegExp(r"^(?:0[1-9]|[12]\d|3[01])([\/.-])(?:0[1-9]|1[012])\1(?:19|20)\d\d$")
//                   .hasMatch(dateOfBirth.toString())
//           // !RegExp(r"^(?:0[1-9]|[12]\d|3[1])([\/.-])(?:0[13578]|1[02])\1(?:19|20)\d\d$")
//           //     .hasMatch(dateOfBirth.toString())
//           // !RegExp(r"^(((0[1-9]|[12]\d|3[01])-(0[13578]|1[02])-((?:19|20)\d\d)|((0[1-9]|[12]\d|30)-(0[13456789]|1[012])-((?:19|20)\d\d)|((0[1-9]|1\d|2[0-8])-02-((?:19|20)\d\d)|(29-02-((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$")
//           //     .hasMatch(dateOfBirth.toString())
//           ) {
//         return 'Enter a valid date of birth!';
//       }
//       // } else if (!RegExp(
//       //         r"^(?:0[1-9]|[12]\d|3[0])([\/.-])(?:0[469]|1[1])\1(?:19|20)\d\d$")
//       //     .hasMatch(dateOfBirth.toString())) {
//       //   return 'Enter a valid date of birth2!';
//       // } else if (!RegExp(
//       //         r"^(?:0[1-9]|[1]\d|[2][0-8])([\/.-])(?:0[2])\1(?:19|20)\d\d$")
//       //     .hasMatch(dateOfBirth.toString())) {
//       //   return 'Enter a valid date of birth3!';
//       // }
//       return null;
//     });
//   }

//   static String? Function(String?)? validatePhoneNumber(String phoneNo) {
//     return ((phoneNo) {
//       if (phoneNo == "" ||
//           !RegExp(r"^[1-9]{9,11}$").hasMatch(phoneNo.toString())) {
//         return 'Enter a valid phone Number!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateEPF(String epf) {
//     return ((epf) {
//       if (epf == "" || !RegExp(r"^\d{7}$").hasMatch(epf.toString())) {
//         return 'Enter a valid EPF!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateSOSCO(String SOSCO) {
//     return ((SOSCO) {
//       if (SOSCO == "" || !RegExp(r"^\d{12}$").hasMatch(SOSCO.toString())) {
//         return 'Enter a valid SOSCO Number!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateITax(String iTax) {
//     return ((iTax) {
//       if (iTax == "" ||
//           !RegExp(r"^(?:\d{3}-\d{2}-\d{4}|\d{2}-\d{7})$")
//               .hasMatch(iTax.toString())) {
//         return 'Enter a valid i-Tax Number!';
//       }
//       return null;
//     });
//   }

//   static String? Function(String?)? validateBankAcc(String bankAcc) {
//     return ((bankAcc) {
//       if (bankAcc == "" ||
//           !RegExp(r"^[0-9]{8,17}$").hasMatch(bankAcc.toString())) {
//         return 'Enter a valid Bank Account Number!';
//       }
//       return null;
//     });
//   }
// //Employee ID Validation

//   // //Getter
//   // String get employee_id => _employee_id ?? "";
//   // String get employee_id_by_company => _employee_id_by_company ?? "";
//   // String get employee_name => _employee_name ?? "";
//   // String get user_id => _user_id ?? "";
//   // String get parent_company => _parent_company ?? "";
//   // String get staff_role => _staff_role ?? "";
//   // String get acc_pass => _acc_pass ?? "";
//   // String get employer_id => _employer_id ?? "";
//   // String get employer_name => _employer_name ?? "";
//   // String get types_of_wages => _types_of_wages ?? "";
//   // String get ic_no => _ic_no ?? "";
//   // String get dob => _dob ?? "";
//   // String get gender => _gender ?? "";
//   // String get nationality => _nationality ?? "";
//   // String get phone_no => _phone_no ?? "";
//   // String get email => _email ?? "";
//   // String get epf_no => _epf_no ?? "";
//   // String get socso_no => _socso_no ?? "";
//   // String get itax_no => _itax_no ?? "";
//   // String get bank_name => _bank_name ?? "";
//   // String get bank_no => _bank_no ?? "";
//   // DateTime get employment_start_date =>
//   //     _employment_start_date ?? DateTime.now();
//   // int get year_of_service => _year_of_services;
//   // double get wages_rate => _wages_rate;
//   // double get monthly_deduction => _monthly_deduction;
//   // bool get employement_letter => _employement_letter;

//   // //Setter
//   // void setEmployeeId(String employeeId) => _employee_id = employeeId;
//   // void setEmployeeIdByCompany(String employeeIdByCompany) =>
//   //     _employee_id_by_company = employee_id_by_company;
// }
// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

class Employee {
  Employee({
    this.employeeId,
    this.employeeIdByCompany,
    this.employeeName,
    this.userId,
    this.parentCompany,
    this.company,
    this.staffRole,
    this.role,
    this.accPass,
    this.employerId,
    this.employer,
    this.employmentStartDate,
    this.typesOfWages,
    this.wagesRate,
    this.employementLetter,
    this.monthlyDeduction,
    this.icNo,
    this.dob,
    this.gender,
    this.nationality,
    this.phoneNo,
    this.email,
    this.epfNo,
    this.soscoNo,
    this.itaxNo,
    this.bankName,
    this.bankNo,
    this.aspId,
    this.profileImgPath,
    this.isActive,
    this.religion,
    this.sickLeaveHourLeft,
    this.paidLeaveHourLeft,
    this.sickLeaveOnBargain,
    this.paidLeaveOnBargain,
    this.uuid,
    this.leaveUpdate,
  });

  String? employeeId;
  String? employeeIdByCompany;
  String? employeeName;
  String? userId;
  String? parentCompany;
  String? company;
  String? staffRole;
  String? role;
  String? accPass;
  String? employerId;
  String? employer;
  String? employmentStartDate;
  String? typesOfWages;
  String? wagesRate;
  String? employementLetter;
  String? monthlyDeduction;
  String? icNo;
  String? dob;
  String? gender;
  String? nationality;
  String? phoneNo;
  String? email;
  String? epfNo;
  String? soscoNo;
  String? itaxNo;
  String? bankName;
  String? bankNo;
  String? aspId;
  String? profileImgPath;
  String? isActive;
  String? religion;
  String? sickLeaveHourLeft;
  String? paidLeaveHourLeft;
  String? sickLeaveOnBargain;
  String? paidLeaveOnBargain;
  String? uuid;
  String? leaveUpdate;
  //get getEmployeeId => this.employeeId;
  String get getEmployeeId {
    return employeeId.toString();
  }

  set setEmployeeId(employeeId) => this.employeeId = employeeId;

  get getEmployeeIdByCompany => this.employeeIdByCompany;

  set setEmployeeIdByCompany(employeeIdByCompany) =>
      this.employeeIdByCompany = employeeIdByCompany;

  get getEmployeeName => this.employeeName;

  set setEmployeeName(employeeName) => this.employeeName = employeeName;

  get getUserId => this.userId;

  set setUserId(userId) => this.userId = userId;

  get getParentCompany => this.parentCompany;

  set setParentCompany(parentCompany) => this.parentCompany = parentCompany;

  get getCompany => this.company;

  set setCompany(company) => this.company = company;

  get getStaffRole => this.staffRole;

  set setStaffRole(staffRole) => this.staffRole = staffRole;

  get getRole => this.role;

  set setRole(role) => this.role = role;

  get getAccPass => this.accPass;

  set setAccPass(accPass) => this.accPass = accPass;

  get getEmployerId => this.employerId;

  set setEmployerId(employerId) => this.employerId = employerId;

  get getEmployer => this.employer;

  set setEmployer(employer) => this.employer = employer;

  get getEmploymentStartDate => this.employmentStartDate;

  set setEmploymentStartDate(employmentStartDate) =>
      this.employmentStartDate = employmentStartDate;

  get getTypesOfWages => this.typesOfWages;

  set setTypesOfWages(typesOfWages) => this.typesOfWages = typesOfWages;

  get getWagesRate => this.wagesRate;

  set setWagesRate(wagesRate) => this.wagesRate = wagesRate;

  get getEmployementLetter => this.employementLetter;

  set setEmployementLetter(employementLetter) =>
      this.employementLetter = employementLetter;

  get getMonthlyDeduction => this.monthlyDeduction;

  set setMonthlyDeduction(monthlyDeduction) =>
      this.monthlyDeduction = monthlyDeduction;

  get getIcNo => this.icNo;

  set setIcNo(icNo) => this.icNo = icNo;

  get getDob => this.dob;

  set setDob(dob) => this.dob = dob;

  get getGender => this.gender;

  set setGender(gender) => this.gender = gender;

  get getNationality => this.nationality;

  set setNationality(nationality) => this.nationality = nationality;

  get getPhoneNo => this.phoneNo;

  set setPhoneNo(phoneNo) => this.phoneNo = phoneNo;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getEpfNo => this.epfNo;

  set setEpfNo(epfNo) => this.epfNo = epfNo;

  get getSoscoNo => this.soscoNo;

  set setSoscoNo(soscoNo) => this.soscoNo = soscoNo;

  get getItaxNo => this.itaxNo;

  set setItaxNo(itaxNo) => this.itaxNo = itaxNo;

  get getBankName => this.bankName;

  set setBankName(bankName) => this.bankName = bankName;

  get getBankNo => this.bankNo;

  set setBankNo(bankNo) => this.bankNo = bankNo;

  get getAspId => this.aspId;

  set setAspId(aspId) => this.aspId = aspId;

  get getProfileImgPath => this.profileImgPath;

  set setProfileImgPath(profileImgPath) => this.profileImgPath = profileImgPath;

  get getIsActive => this.isActive;

  set setIsActive(isActive) => this.isActive = isActive;

  get getReligion => this.religion;

  set setReligion(religion) => this.religion = religion;

  get getSickLeaveHourLeft => this.sickLeaveHourLeft;

  set setSickLeaveHourLeft(sickLeaveHourLeft) =>
      this.sickLeaveHourLeft = sickLeaveHourLeft;

  get getPaidLeaveHourLeft => this.paidLeaveHourLeft;

  set setPaidLeaveHourLeft(paidLeaveHourLeft) =>
      this.paidLeaveHourLeft = paidLeaveHourLeft;

  get getSickLeaveOnBargain => this.sickLeaveOnBargain;

  set setSickLeaveOnBargain(sickLeaveOnBargain) =>
      this.sickLeaveOnBargain = sickLeaveOnBargain;

  get getPaidLeaveOnBargain => this.paidLeaveOnBargain;

  set setPaidLeaveOnBargain(paidLeaveOnBargain) =>
      this.paidLeaveOnBargain = paidLeaveOnBargain;

  get getUuid => this.uuid;

  set setUuid(uuid) => this.uuid = uuid;

  get getLeaveUpdate => this.leaveUpdate;

  set setLeaveUpdate(leaveUpdate) => this.leaveUpdate = leaveUpdate;
}
