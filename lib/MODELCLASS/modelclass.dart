class classModel {
  String id;
  String ClassName;
  classModel(
    this.id,
    this.ClassName,
  );
}

class studentModel {
  String id;
  String Name;
  String Division;
  String RollNo;
  String Phone;
  String GuadName;
  String GuadPhn;
  String Status;
  studentModel(this.id, this.Name, this.Division, this.RollNo, this.Phone,
      this.GuadName, this.GuadPhn,this.Status);
}

class managerModel {
  String id;
  String ManagerName;
  String ManagerNo;
  String SchoolName;
  String SchoolLogo;
  String Photo;
  managerModel(this.id, this.ManagerName, this.ManagerNo,this.SchoolName, this.SchoolLogo,this.Photo);
}
class HistoryModel{
  String id;
  String studentName;
  String date;
  String amount;

  HistoryModel(this.id,this.studentName,this.date,this.amount);
}