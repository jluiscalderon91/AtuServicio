class Requirement 
{
  final int iRequirementId,iServiceId,iStatus,iInsertuserid,iUpdateuserid;
  final String vRequirementCode,
        vServiceName,
        vAddressFrom,
        vAddressDelivery,
        vDetalle,
        vStatus;
 final String dRequestDate,dInsertdate,dUpdatedate;
 final String mPriceSale;

  Requirement({
    this.iRequirementId,
    this.iServiceId,
    this.iStatus,
    this.iInsertuserid,
    this.iUpdateuserid,
    this.vRequirementCode,
    this.vServiceName,
    this.vAddressFrom,
    this.vAddressDelivery,
    this.vDetalle,
    this.mPriceSale,
    this.dRequestDate,
    this.dInsertdate,
    this.dUpdatedate,
    this.vStatus
  });

  factory Requirement.fromJson(Map<String,dynamic> json){
    print(json);
    return Requirement(
    iRequirementId : json['IRequirementId'],
    iServiceId : json['IServiceId'],
    iStatus : json['IStatus'],
    iInsertuserid : json['IInsertuserid'],
    iUpdateuserid : json['IUpdateuserid'],
    vRequirementCode : json['VRequirementCode'],
    vServiceName : json['vServiceName'],
    vAddressFrom : json['VAddressFrom'],
    vAddressDelivery : json['VAddressDelivery'],
    vDetalle : json['VDetalle'],
    mPriceSale : json['sCost'],
    dRequestDate : json['DRequestDate'],
    dInsertdate : json['DInsertdate'],
    dUpdatedate : json['DUpdatedate'],
    vStatus: json['vStatus'],
    );
  } 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["IRequirementId"] = iRequirementId;
    map["IServiceId"] = iServiceId;
    map["IStatus"] = iStatus;
    map["IInsertuserid"] = iInsertuserid;
    map["IUpdateuserid"] = iUpdateuserid;
    map["VRequirementCode"] = vRequirementCode;
    map["vServiceName"] = vServiceName;
    map["VAddressFrom"] = vAddressFrom;
    map["VAddressDelivery"] = vAddressDelivery;
    map["VDetalle"] = vDetalle;
    map["MPriceSale"] = mPriceSale;
    map["DRequestDate"] = dRequestDate;
    map["DInsertdate"] = dInsertdate;
    map["DUpdatedate"] = dUpdatedate;
    return map;
  }
}
