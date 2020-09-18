import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_mobx/controller/home_controller.dart';
import 'package:todo_mobx/item_widget.dart';
import 'package:todo_mobx/model/item_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar Item'),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Novo Item'),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Observer(
                builder: (_) {
                  return Text(controller.totalCheck.toString());
                },
              ),
              onPressed: null)
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.listItems.length,
          itemBuilder: (context, index) {
            var item = controller.listItems[index];
            return ItemWidget(
              item: item,
              removeClicked: () {
                controller.removeItem(item);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _dialog();
          }),
    );
  }
}
