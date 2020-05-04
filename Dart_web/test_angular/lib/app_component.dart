import 'package:angular/angular.dart';
import 'package:test_angular/src/list/list_component.dart';
import 'src/hello_word/hello_world_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [HelloWorldComponent, ListComponent],
)
class AppComponent {
  
}
