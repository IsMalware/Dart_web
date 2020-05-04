import 'package:angular/angular.dart';

@Injectable()

class ListService {
  List getLanguages(){
    return ['Dart', 'JavaScript', 'PHP', 'Java'];
  }
}