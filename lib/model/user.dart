class User {
  int id;
  String email;
  String displayName;
  String imageUrl;
  String pwd;
  String insertedDate;
  int groupId;
  bool emailActive;
  String address;
  String gsm;
  String sex;
  String birthday;
  String remark;
  int status;
  int createdById;
  Map<String, dynamic> permissions;

  String getDisplayName() {
    if (displayName == null) {
      return email;
    }
    return displayName;
  }

  User(
      {this.id,
      this.email,
      this.displayName,
      this.imageUrl,
      this.pwd,
      this.insertedDate,
      this.groupId,
      this.emailActive,
      this.address,
      this.gsm,
      this.sex,
      this.birthday,
      this.remark,
      this.status,
      this.createdById,
      this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    displayName = json['displayName'];
    imageUrl = json['imageUrl'];
    pwd = json['pwd'];
    insertedDate = json['insertedDate'];
    groupId = json['groupId'];
    emailActive = json['email_active'];
    address = json['address'];
    gsm = json['gsm'];
    sex = json['sex'];
    birthday = json['birthday'];
    remark = json['remark'];
    status = json['status'];
    createdById = json['createdById'];
    permissions = json['permissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['imageUrl'] = this.imageUrl;
    data['pwd'] = this.pwd;
    data['insertedDate'] = this.insertedDate;
    data['groupId'] = this.groupId;
    data['email_active'] = this.emailActive;
    data['address'] = this.address;
    data['gsm'] = this.gsm;
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['createdById'] = this.createdById;
    if (this.permissions != null) {
      data['permissions'] = this.permissions;
    }
    return data;
  }
}
