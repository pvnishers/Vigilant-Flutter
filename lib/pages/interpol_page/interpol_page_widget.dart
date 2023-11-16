import '/backend/api_requests/api_calls.dart';
import '/components/interpol_filters_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'interpol_page_model.dart';
export 'interpol_page_model.dart';

class InterpolPageWidget extends StatefulWidget {
  const InterpolPageWidget({Key? key}) : super(key: key);

  @override
  _InterpolPageWidgetState createState() => _InterpolPageWidgetState();
}

class _InterpolPageWidgetState extends State<InterpolPageWidget> {
  late InterpolPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterpolPageModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              _model.filterVisibility = !_model.filterVisibility;
              _model.nameForename =
                  _model.interpolFiltersModel.interpolNameController.text;
              _model.nationality = _model
                  .interpolFiltersModel.interpolNationalityController.text;
              _model.charge =
                  _model.interpolFiltersModel.interpolChargeController.text;
              _model.chargeCountry = _model
                  .interpolFiltersModel.interpolChargeCountryController.text;
            });
            setState(() => _model.listViewPagingController?.refresh());
            await _model.waitForOnePageForListView();
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Stack(
            children: [
              if (_model.filterVisibility == false)
                Icon(
                  Icons.filter_alt,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 24.0,
                ),
              if (_model.filterVisibility == true)
                Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 24.0,
                ),
            ],
          ),
        ),
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
                'Interpol Notices',
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
                child: Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        setState(
                            () => _model.listViewPagingController?.refresh());
                        await _model.waitForOnePageForListView();
                      },
                      child: PagedListView<ApiPagingParams, dynamic>.separated(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) => InterpolNoticesCall.call(
                            page: functions
                                .nextPage(nextPageMarker.nextPageNumber),
                            nameForename: _model.nameForename,
                            nationalities: _model.nationality,
                            charge: _model.charge,
                            issuingCountry: _model.chargeCountry,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => SizedBox(height: 30.0),
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, noticesIndex) {
                            final noticesItem = _model.listViewPagingController!
                                .itemList![noticesIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 50.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'InterpolDetailPage',
                                    queryParameters: {
                                      'notices': serializeParam(
                                        noticesItem,
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 20.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              getJsonField(
                                                noticesItem,
                                                r'''$.thumbnailUrl''',
                                              ),
                                              width: 130.0,
                                              height: 130.0,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.00, -1.00),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 270.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, -1.00),
                                                      child: Text(
                                                        'Name',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Text(
                                                        '${getJsonField(
                                                          noticesItem,
                                                          r'''$.forename''',
                                                        ).toString()} ${getJsonField(
                                                          noticesItem,
                                                          r'''$.name''',
                                                        ).toString()}'
                                                            .maybeHandleOverflow(
                                                                maxChars: 20),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 3.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 270.0,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Text(
                                                        'Charge',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Text(
                                                        getJsonField(
                                                          noticesItem,
                                                          r'''$.arrestWarrants[0].charge''',
                                                        )
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                              maxChars: 40,
                                                              replacement: '…',
                                                            ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 3.0)),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 5.0))
                                              .around(SizedBox(height: 5.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (_model.filterVisibility == true)
                      wrapWithModel(
                        model: _model.interpolFiltersModel,
                        updateCallback: () => setState(() {}),
                        child: InterpolFiltersWidget(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
