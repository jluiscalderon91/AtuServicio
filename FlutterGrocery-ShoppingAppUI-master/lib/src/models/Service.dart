class Service 
{
  final int iServiceId,iQualification,iStatus,iInsertuserid,iUpdateuserid;
  final String vCode,
        vName,
        vDescription,
        vPathAttachment,
        vCustomerName;
 final String dInsertdate,dUpdatedate;
 final double mPriceSale;

  Service({
    this.iServiceId,
    this.iQualification,
    this.iStatus,
    this.iInsertuserid,
    this.iUpdateuserid,
    this.vCode,
    this.vName,
    this.vDescription,
    this.mPriceSale,
    this.vPathAttachment,
    this.vCustomerName,
    this.dInsertdate,
    this.dUpdatedate
  });

  factory Service.fromJson(Map<String,dynamic> json){
    var customer = json['ICustomer'];
   print('entra-------------------------------' + DateTime.now().toString());
    print(json);
    return Service(
    iServiceId : json['IServiceId'],
    iQualification : json['IQualification'],
    iStatus : json['IStatus'],
    iInsertuserid : json['IInsertuserid'],
    iUpdateuserid : json['IUpdateuserid'],
    vCode : json['VCode'],
    vName : json['VName'],
    vDescription : json['VDescription'],
    mPriceSale : json['MPriceSale'],
    vPathAttachment  : json['VPathAttachment'],
    vCustomerName : customer['VName'],
    dInsertdate : json['DInsertdate'],
    dUpdatedate : json['DUpdatedate']
    );
  } 
}
