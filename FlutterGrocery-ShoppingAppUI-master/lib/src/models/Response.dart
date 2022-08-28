class Response 
{
  final int id;
  final String msg;
  final bool success;

  Response({
    this.id,
    this.success,
    this.msg
  });

  factory Response.fromJson(Map<String,dynamic> content){
    var json = content['Content'];

    print(json);
    return Response(
    id : json['id'],
    success : json['success'],
    msg : json['msg']
    );
  } 
}
