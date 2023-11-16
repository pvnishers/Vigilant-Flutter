import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_b_i_detail_page_model.dart';
export 'f_b_i_detail_page_model.dart';

class FBIDetailPageWidget extends StatefulWidget {
  const FBIDetailPageWidget({
    Key? key,
    required this.wanted,
  }) : super(key: key);

  final dynamic wanted;

  @override
  _FBIDetailPageWidgetState createState() => _FBIDetailPageWidgetState();
}

class _FBIDetailPageWidgetState extends State<FBIDetailPageWidget> {
  late FBIDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FBIDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: Color(0xFF0658F6),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Details',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getJsonField(
                              widget.wanted,
                              r'''$.images''',
                            ),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Title',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                      widget.wanted,
                                      r'''$.title''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Subject',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                      widget.wanted,
                                      r'''$.subjects''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Nationality',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                      widget.wanted,
                                      r'''$.nationality''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Locations',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                      widget.wanted,
                                      r'''$.locations''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Age Range',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    '${getJsonField(
                                      widget.wanted,
                                      r'''$.age_Min''',
                                    ).toString()} - ${getJsonField(
                                      widget.wanted,
                                      r'''$.age_Max''',
                                    ).toString()}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Place Of Birth',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    widget.wanted,
                                    r'''$.place_Of_Birth''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await launchURL(getJsonField(
                                widget.wanted,
                                r'''$.url''',
                              ).toString());
                            },
                            text: 'See More',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
