class LogInData{
  
  final String? token;
  final int? id;
  final String? username;
  final String? email;
  final bool? confirmed;

  const  LogInData({ required this.token,required this.id,required this.email,required this.username,required this.confirmed});

  factory LogInData.fromjson(Map<String,dynamic> json){
    return LogInData(
      token: json['jwt'],
      email: json['user']['email'] as String,
      id: json['user']['id'] as int ,
      username: json['user']['username'] as String,
      confirmed: json['user']['confirmed']);
  }

}