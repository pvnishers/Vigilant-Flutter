import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'interpol_filters_widget.dart' show InterpolFiltersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InterpolFiltersModel extends FlutterFlowModel<InterpolFiltersWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for interpolName widget.
  FocusNode? interpolNameFocusNode;
  TextEditingController? interpolNameController;
  String? Function(BuildContext, String?)? interpolNameControllerValidator;
  // State field(s) for interpolNationality widget.
  FocusNode? interpolNationalityFocusNode;
  TextEditingController? interpolNationalityController;
  String? Function(BuildContext, String?)?
      interpolNationalityControllerValidator;
  // State field(s) for interpolCharge widget.
  FocusNode? interpolChargeFocusNode;
  TextEditingController? interpolChargeController;
  String? Function(BuildContext, String?)? interpolChargeControllerValidator;
  // State field(s) for interpolChargeCountry widget.
  FocusNode? interpolChargeCountryFocusNode;
  TextEditingController? interpolChargeCountryController;
  String? Function(BuildContext, String?)?
      interpolChargeCountryControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    interpolNameFocusNode?.dispose();
    interpolNameController?.dispose();

    interpolNationalityFocusNode?.dispose();
    interpolNationalityController?.dispose();

    interpolChargeFocusNode?.dispose();
    interpolChargeController?.dispose();

    interpolChargeCountryFocusNode?.dispose();
    interpolChargeCountryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
