class TrainingProgress {
  String? staffID;
  String? trainingID;
  String? trainingName;
  String? completion;
  String? durationLeft;
  String? certID;

  TrainingProgress(
      {this.staffID,
        this.trainingID,
        this.completion,
        this.durationLeft,
        this.certID,
  });

  get staff_ID => this.staffID;

  set staff_ID(value) => this.staffID = value;

  get training_ID => this.trainingID;

  set training_ID(value) => this.trainingID = value;

  get training_name => this.trainingName;

  set training_name(value) => this.trainingName=value;

  get training_completion => this.completion;

  set training_completion(value) => this.completion = value;

  get training_duration_left => this.durationLeft;

  set training_duration_left(value) => this.durationLeft = value;

  get cert_id => this.certID;

  set cert_id(value) => this.certID = value;
}
