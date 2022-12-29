class Benefits{

  String? benefitId;
  String? benefitDesc;
  String? benefitType;
  String? startDate;
  String? endDate;
  String? days;

  Benefits({
    this.benefitId,
    this.benefitDesc,
    this.benefitType,
    this.startDate,
    this.endDate,
    this.days});

  get benefit_ID => this.benefitId;

  set benefit_ID(value) => this.benefitId=value;

  get benefit_Desc => this.benefitDesc;

  set benefit_Desc(value) => this.benefitDesc=value;

  get benefit_Type => this.benefitType;

  set benefit_Type(value) => this.benefitType=value;

  get benefit_Start_Date => this.startDate;

  set benefit_Start_Date(value) => this.startDate=value;

  get benefit_End_Date => this.endDate;

  set benefit_End_Date(value) => this.endDate=value;

  get benefit_Days => this.days;

  set benefit_Days(value) => this.days=value;


}