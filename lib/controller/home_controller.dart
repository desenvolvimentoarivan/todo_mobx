import 'package:mobx/mobx.dart';
import 'package:todo_mobx/model/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'Item 1', check: true),
    ItemModel(title: 'Item 1', check: true),
    ItemModel(title: 'Item 1', check: false),
  ].asObservable();

  @computed
  int get totalCheck => listItems.where((element) => element.check).length;

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }

  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }
}
