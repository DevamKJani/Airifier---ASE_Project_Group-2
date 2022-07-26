import 'package:ase_project1/Model/community_model.dart';
import 'package:ase_project1/data_constants.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

final eventDBS = DatabaseService<AppEvent>(
  AppDBConstants.eventsCollection,
  fromDS: (id, data) => AppEvent.fromDS(id, data!),
  toMap: (event) => event.toMap(),
);
