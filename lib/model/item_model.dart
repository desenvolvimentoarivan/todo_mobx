import 'package:mobx/mobx.dart';

part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  @observable
  String title;

  @observable
  bool check;

  _ItemModelBase({
    this.title,
    this.check = false,
  });

  @action
  setTitle(String value) => title = value;

  @action
  setCheck(bool value) => check = value;
}
