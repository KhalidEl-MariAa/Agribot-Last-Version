class SensorsModel{
  int? id;
  double temp;
  double? humdity;
  double? sunlight;
  int ph;
  String? title;

  SensorsModel({
    required this.id,
    required this.temp,
    required this.humdity,
    required this.sunlight,
    required this.ph,
    required this.title
             });

    factory SensorsModel.fromjson(Map<String,dynamic> json){
        return SensorsModel(id: json['id'],
         temp: json['attributes']['temperature'],
          humdity: json['attributes']['humdity'],
           sunlight: json['attributes']['sunlight'],
            ph:json['attributes']['ph'], 
            title: json['attributes']['title']);
    }

            
}