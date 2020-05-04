import 'package:angular/angular.dart';
import 'package:test_angular/src/list/list_service.dart';

@Component(
  selector: 'list',
  styleUrls: ['list_component.css'],
  templateUrl: 'list_component.html',
  directives: [NgFor],
  providers: [ClassProvider(ListService)]
)

class ListComponent implements OnInit {
  
  // Injeção de depêndencia
  final ListService listService;
  ListComponent(this.listService);

  var languages = [];

  @override
  void ngOnInit(){
    languages = listService.getLanguages();
  }

}