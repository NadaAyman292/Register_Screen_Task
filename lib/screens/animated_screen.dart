import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnimatedScreen extends StatelessWidget {
  final items = [];
  final _key = GlobalKey<AnimatedListState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Flutter Mapp"),
          backgroundColor: Color.fromARGB(255, 56, 55, 55),
          centerTitle: true,
          elevation: 0.0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 9, 34, 54),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              additem();
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
            child: AnimatedList(
          key: _key,
          initialItemCount: 0,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: Card(
                margin: EdgeInsets.all(10),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.orange)),
                color: Colors.orange,
                child: ListTile(
                  title: Text(
                    items[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon:const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      deleteitem(index);
                    },
                  ),
                ),
              ),
            );
          },
        )),
      ]),
    );
  }

  //*function of add item
  void additem() {
    items.insert(0, "item ${items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: Duration(seconds: 1),
    );
  }

  //*function of delete item
  void deleteitem(int index) {
    _key.currentState!.removeItem(index, duration: Duration(milliseconds: 500),
        (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          margin: EdgeInsets.all(10),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
          color: Colors.red,
          child: ListTile(
              title: Text(
            "Delete",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      );
    });
    items.removeAt(index);
  }
}
