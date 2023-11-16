import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interpol_detail_page_model.dart';
export 'interpol_detail_page_model.dart';

class InterpolDetailPageWidget extends StatefulWidget {
  const InterpolDetailPageWidget({
    Key? key,
    required this.notices,
  }) : super(key: key);

  final dynamic notices;

  @override
  _InterpolDetailPageWidgetState createState() =>
      _InterpolDetailPageWidgetState();
}

class _InterpolDetailPageWidgetState extends State<InterpolDetailPageWidget> {
  late InterpolDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterpolDetailPageModel());

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
                              widget.notices,
                              r'''$.thumbnailUrl''',
                            ),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Name',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    '${getJsonField(
                                      widget.notices,
                                      r'''$.forename''',
                                    ).toString()} ${getJsonField(
                                      widget.notices,
                                      r'''$.name''',
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'Charge',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      '${getJsonField(
                                        widget.notices,
                                        r'''$.arrestWarrants[0].charge''',
                                      ).toString()} - ${getJsonField(
                                        widget.notices,
                                        r'''$.arrestWarrants[0].issuingCountryId''',
                                      ).toString()}',
                                      maxLines: 4,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'Nationality',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        getJsonField(
                                          widget.notices,
                                          r'''$.nationalities''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Text(
                                    'Date of Birth',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                      widget.notices,
                                      r'''$.dateOfBirth''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'https://www.interpol.int/How-we-work/Notices/Red-Notices/View-Red-Notices#${(String entityId) {
                                return entityId.replaceAll('/', '-');
                              }(getJsonField(
                                widget.notices,
                                r'''$.entityId''',
                              ).toString())}');
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
