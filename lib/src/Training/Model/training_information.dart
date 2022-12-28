class Training{
  String? trainingID;
  String? trainingName;
  String? trainingDateTime;
  String? duration;

  Training({
    this.trainingID,
    this.trainingName,
    this.trainingDateTime,
    this.duration});

  get training_ID => this.trainingID;

  set training_ID(value) => this.trainingID=value;

  get training_name => this.trainingName;

  set training_name(value) => this.trainingName=value;

  get training_DateTime => this.trainingDateTime;

  set training_DateTime(value) => this.trainingDateTime=value;

  get training_duration => this.duration;

  set training_duration(value) => this.duration=value;


}