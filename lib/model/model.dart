import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId:0)
class GoogleNotes{
 @HiveField(0)
 String? title;
 @HiveField(1)
 String?subTitle;
 GoogleNotes({
  required this.title,required this.subTitle
 });

}
