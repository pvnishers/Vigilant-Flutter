import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  Local state fields for this page.

  List<String> registerErrors = [];
  void addToRegisterErrors(String item) => registerErrors.add(item);
  void removeFromRegisterErrors(String item) => registerErrors.remove(item);
  void removeAtIndexFromRegisterErrors(int index) =>
      registerErrors.removeAt(index);
  void insertAtIndexInRegisterErrors(int index, String item) =>
      registerErrors.insert(index, item);
  void updateRegisterErrorsAtIndex(int index, Function(String) updateFn) =>
      registerErrors[index] = updateFn(registerErrors[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?=.*\\d)(?=.*[#\$@!%&*?])[A-Za-z\\d#\$@!%&*?]{8,}\$')
        .hasMatch(val)) {
      return 'Password must have at least one uppercase, one lowercase, one digit and one special character.';
    }
    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (register)] action in Button widget.
  ApiCallResponse? apiResultcyq;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
    usernameControllerValidator = _usernameControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmPasswordVisibility = false;
  }

  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    usernameFocusNode?.dispose();
    usernameController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
