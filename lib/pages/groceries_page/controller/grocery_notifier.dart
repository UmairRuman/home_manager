import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier_states.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/services/database_services/local_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrocceryNotifier extends Notifier<GroceryState> {
  static const _errorMessage = 'Something went wrong';
  static const _notInsertedMessage = 'Couldn\'t add grocery'; 
  final TextEditingController controllerForItemName = TextEditingController();
  final TextEditingController controllerForItemPrice = TextEditingController();
  final TextEditingController controllerForItemQuantity =
      TextEditingController();
  final TextEditingController controlllerForDropDownMenu =
      TextEditingController();
  final LocalDB db = LocalDB();
  List<GroceryModel> groceries = [];
  // expanded tile
  var currentTileIndex = -1;

  @override
  GroceryState build() {
    ref.onDispose(() {
      controllerForItemName.dispose();
      controllerForItemPrice.dispose();
      controllerForItemQuantity.dispose();
      controlllerForDropDownMenu.dispose();
    });

    return GroceryLoadingState();
  }

  void fetchList() async{
    try{
      state = GroceryLoadingState();
    groceries = await db.groceries();
    state = GroceryLoadedState(list: groceries);
    }catch(e){
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void addGrocery(GroceryModel grocery) async{
    try{
      state = GroceryLoadingState();
    bool isInserted = await db.insertGrocery(grocery);
    if(isInserted){
      groceries = await db.groceries();
      state = GroceryLoadedState(list: groceries);
    }else{
      state = const GroceryErrorState(errorMessage: _notInsertedMessage);
    }
    }catch(e){
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void resetControllers() {
    controllerForItemName.clear();
    controllerForItemPrice.clear();
    controllerForItemQuantity.clear();
    controlllerForDropDownMenu.clear();
  }
}

final groceriesProvider =
    NotifierProvider<GrocceryNotifier, GroceryState>(GrocceryNotifier.new);
