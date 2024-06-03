import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/quantity_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityNotifier extends Notifier<List<QuantityModel>> {
  final TextEditingController controllerForItemName = TextEditingController();
  final TextEditingController controllerForItemPrice = TextEditingController();
  final TextEditingController controllerForItemQuantity =
      TextEditingController();

  @override
  List<QuantityModel> build() {
    ref.onDispose(() {
      controllerForItemName.dispose();
      controllerForItemPrice.dispose();
      controllerForItemQuantity.dispose();
    });
    return [];
  }

  void resetControllers() {
    controllerForItemName.clear();
    controllerForItemPrice.clear();
    controllerForItemQuantity.clear();
  }

  void addNewItemQuantities(QuantityModel model) {
    state.add(model);
    state = [...state];
  }

  void removeItemQuantity(int index) {
    state.removeAt(index);
    state = [...state];
  }

  void increaseTotalItemsQuantity(int index) {
    state[index].total++;
    state = [...state];
  }

  void decreaseTotalItemsQuantity(int index) {
    if (state[index].total > 0) {
      state[index].total--;
      state = [...state];
      if (state[index].total < state[index].used) {
        state[index].used--;
        state = [...state];
      }
    }
  }

  void increaseItemUsedQuantity(int index) {
    if (state[index].used < state[index].total) {
      state[index].used++;
      state = [...state];
    }
  }

  void decreaseItemUsedQuantity(int index) {
    if (state[index].used > 0) {
      state[index].used--;
      state = [...state];
    }
  }

  int getTotalGroceryExpense() {
    var totalExpense = 0;
    state.forEach((element) {
      var itemExpense = 0;
      itemExpense = element.itemPrice * element.total;
      totalExpense += itemExpense;
    });
    return totalExpense;
  }

  void closeOtherTiles(int currentTileIndex) {
    List<QuantityModel> list = state;
    for (var i = 0; i < list.length; i++) {
      if (list[i].index != currentTileIndex) {
        list[i].isExpanded = false;
        log('Index : $i value : ${list[i].isExpanded.toString()}');
      } else {
        list[i].isExpanded = true;
        log('index : $i value : ${list[i].isExpanded.toString()}');
      }
    }

    list.forEach((element) {
      log(element.isExpanded.toString());
    });
    state = [...list];
  }
}

final quantitiesProvider =
    NotifierProvider<QuantityNotifier, List<QuantityModel>>(
        QuantityNotifier.new);
