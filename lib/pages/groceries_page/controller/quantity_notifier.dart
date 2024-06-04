import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/quantity_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/grocreis_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityNotifier extends Notifier<List<QuantityModel>> {
  final TextEditingController controllerForItemName = TextEditingController();
  final TextEditingController controllerForItemPrice = TextEditingController();
  final TextEditingController controllerForItemQuantity =
      TextEditingController();
  final TextEditingController controlllerForDropDownMenu =
      TextEditingController();
  // to make this list equal with data base
  var _currentItemIndex = 0;
  // expanded tile
  var currentTileIndex = -1;

  @override
  List<QuantityModel> build() {
    ref.onDispose(() {
      controllerForItemName.dispose();
      controllerForItemPrice.dispose();
      controllerForItemQuantity.dispose();
      controlllerForDropDownMenu.dispose();
    });
    return [];
  }

  void resetControllers() {
    controllerForItemName.clear();
    controllerForItemPrice.clear();
    controllerForItemQuantity.clear();
    controlllerForDropDownMenu.clear();
  }

  // function to add new item in data base
  void addNewItem(GroceryModel model, IconData icon) {
    GroceryPage.dummyList.dummyList.add(model);
    state.add(QuantityModel(
        icon: icon,
        total: model.totalQuantity,
        used: 0,
        isExpanded: false,
        index: _currentItemIndex,
        itemPrice: model.itemPrice));
    _currentItemIndex++;
    state = [...state];
  }

  //funtion to delete item form data base
  void deleteItem(int index) {
    GroceryPage.dummyList.dummyList.removeAt(index);
    state.removeAt(index);
    state = [...state];
    //close all tiles
    currentTileIndex = -1;
  }

  //function to increase total of an item
  void increaseTotalOfItem(int index) {
    state[index].total++;
    state = [...state];
  }

//function to decrease total of an item
  void decreaseTotalOfItem(int index) {
    if (state[index].total > 0) {
      state[index].total--;
      state = [...state];
      if (state[index].total < state[index].used) {
        state[index].used--;
        state = [...state];
      }
    }
  }

  //function to increase total Used of an item
  void increaseTotalUsedOfItem(int index) {
    if (state[index].used < state[index].total) {
      state[index].used++;
      state = [...state];
    }
  }

//function to decrease total Used of an item
  void decreaseTotalUsedOfItem(int index) {
    if (state[index].used > 0) {
      state[index].used--;
      state = [...state];
    }
  }

  // function to get total grocery expense to show on overviewpage
  num getTotalGroceryExpense() {
    num totalExpense = 0;
    for (var element in state) {
      num itemExpense = 0;
      itemExpense = element.itemPrice * element.total;
      totalExpense += itemExpense;
    }
    return totalExpense;
  }

  // fuck this function
  void closeOtherTiles(int tileIndex, bool value) {
    if (value) {
      currentTileIndex = tileIndex;
    } else {
      currentTileIndex = -1;
    }
    state = [...state];
  }
}

final quantitiesProvider =
    NotifierProvider<QuantityNotifier, List<QuantityModel>>(
        QuantityNotifier.new);
