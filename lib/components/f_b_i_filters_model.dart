import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f_b_i_filters_widget.dart' show FBIFiltersWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FBIFiltersModel extends FlutterFlowModel<FBIFiltersWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fbiTitle widget.
  FocusNode? fbiTitleFocusNode;
  TextEditingController? fbiTitleController;
  String? Function(BuildContext, String?)? fbiTitleControllerValidator;
  // State field(s) for fbiSubject widget.
  FocusNode? fbiSubjectFocusNode;
  TextEditingController? fbiSubjectController;
  String? Function(BuildContext, String?)? fbiSubjectControllerValidator;
  // State field(s) for fbiNationality widget.
  FocusNode? fbiNationalityFocusNode;
  TextEditingController? fbiNationalityController;
  String? Function(BuildContext, String?)? fbiNationalityControllerValidator;
  // State field(s) for fbiRace widget.
  FocusNode? fbiRaceFocusNode;
  TextEditingController? fbiRaceController;
  String? Function(BuildContext, String?)? fbiRaceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    fbiTitleFocusNode?.dispose();
    fbiTitleController?.dispose();

    fbiSubjectFocusNode?.dispose();
    fbiSubjectController?.dispose();

    fbiNationalityFocusNode?.dispose();
    fbiNationalityController?.dispose();

    fbiRaceFocusNode?.dispose();
    fbiRaceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
