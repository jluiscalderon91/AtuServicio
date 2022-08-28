class UserRole
{
  final int userId;
  final int roleId;
  final int iuserroleid;
  
  UserRole({
  this.userId,
  this.roleId,
  this.iuserroleid
  });

  factory UserRole.fromJson(Map<String,dynamic> json){
    return UserRole(
    userId : json['UserId'],
    roleId : json['RoleId'],
    iuserroleid : json['Iuserroleid']
    );
  } 
}