import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smallbusiness/reusable/user_actions/models.dart';
import 'package:smallbusiness/reusable/user_actions/user_action.dart';
import 'package:random_string/random_string.dart';

class InviteSaveModel {
  final DocumentReference<DynamicMap> companyRef;
  final DocumentReference<DynamicMap> employeeRef;
  final bool employee;
  final bool manager;
  final String companyLabel;

  InviteSaveModel(this.companyRef, this.employeeRef, this.employee,
      this.manager, this.companyLabel);
}

class InviteSaveAction extends UserAction<InviteSaveModel> {
  InviteSaveAction(
      FirebaseFirestore firestore, DocumentReference<Object?> userRef)
      : super(firestore, userRef);

  @override
  Future<ActionResult> performActionInternal(InviteSaveModel action) async {
    final inviteRef = queryBuilder.invitationsCollection().doc();
    String inviteId = randomAlphaNumeric(10);

    DynamicMap data = {
      "employee": action.employee,
      "manager": action.manager,
      "companyRef": action.companyRef,
      "companyLabel": action.companyLabel,
      "employeeRef": action.employeeRef,
      "inviteId": inviteId,
      "status": "invited"
    };

    await addSetDataToBatch(inviteRef, data);
    return ActionResult.ok("invite_saved", inviteRef, data);
  }
}
