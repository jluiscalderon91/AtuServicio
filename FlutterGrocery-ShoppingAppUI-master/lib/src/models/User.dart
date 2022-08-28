class User 
{
  final int iUserid,iApptype,iStatus,iInsertuserid,iUpdateuserid;
  final String vName,
        vSurname,
        vUsername,
        vPassword,
        vEmail,
        vNormalizedusername,
        vSecuritystamp,
        vConcurrencystamp,
        vInsertip,
        vUpdateip,
        vTypeAuth;
 final String dInsertdate,dUpdatedate;
 final bool bPasswordchange;
 final int userRoleid;

  User({
    this.iUserid,
    this.iApptype,
    this.iStatus,
    this.iInsertuserid,
    this.iUpdateuserid,
    this.vName,
    this.vSurname,
    this.vUsername,
    this.vPassword,
    this.vEmail,
    this.vNormalizedusername,
    this.vSecuritystamp,
    this.vConcurrencystamp,
    this.vInsertip,
    this.vUpdateip,
    this.vTypeAuth,
    this.dInsertdate,
    this.dUpdatedate,
    this.bPasswordchange,
    this.userRoleid
  });

  factory User.fromJson(Map<String,dynamic> content){
    var contenido = content['Content'];
    var json = contenido['user'];
    if(json != null){
      var roles = json['Userrole'];
      var role = roles[0];
      print(json);
      return User(
      iUserid : json['IUserid'],
      vName : json['VName'],
      vSurname : json['VSurname'],
      vUsername : json['VUsername'],
      vPassword : json['VPassword'],
      vEmail : json['VEmail'],
      vNormalizedusername : json['VNormalizedusername'],
      iApptype : json['IApptype'],
      bPasswordchange : json['BPasswordchange'],
      iInsertuserid  : json['IInsertuserid'],
      dInsertdate : json['DInsertdate'],
      userRoleid : role['RoleId'],
      vTypeAuth : json['vTypeAuth'],
      iStatus : json['IStatus'], 
      iUpdateuserid : json['IUpdateuserid'],
      vSecuritystamp : json['VSecuritystamp'],
      vConcurrencystamp : json['VConcurrencystamp'],
      vInsertip : json['VInsertip'],
      vUpdateip : json['VUpdateip'],
      dUpdatedate : json['DInsertdate']
    );
    }
    else{return null;}
  } 
}
