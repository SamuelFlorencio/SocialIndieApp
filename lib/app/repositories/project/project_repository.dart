import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/project_models/project_model.dart';
import '../firebase_repository_base.dart';

class ProjectRepository extends FirebaseRepositoyBase<ProjectModel> {
  @override
  String get collection => 'projects';

  @override
  ProjectModel Function(DocumentSnapshot document) get fromMap =>
      (document) => ProjectModel.fromMap(document);
}
