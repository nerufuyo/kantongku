import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kantongku/data/model/saving_target_model.dart';
import 'package:kantongku/data/model/transaction_model.dart';

class Repository {
  Future<List<SavingTargetModel>> getSavingTarget() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/json/saving_target_dummy.json');
    final jsonData = jsonDecode(jsonString);
    final List<SavingTargetModel> savingTargets = [];

    for (var item in jsonData) {
      final savingTarget = SavingTargetModel.fromJson(item);
      savingTargets.add(savingTarget);
    }

    return savingTargets;
  }

  Future<List<TransactionModel>> getTransaction() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/json/transaction_dummy.json');
    final jsonData = jsonDecode(jsonString);
    final List<TransactionModel> transactions = [];

    for (var item in jsonData) {
      final transaction = TransactionModel.fromJson(item);
      transactions.add(transaction);
    }

    return transactions;
  }
}
