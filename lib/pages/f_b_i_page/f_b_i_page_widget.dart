import '/backend/api_requests/api_calls.dart';
import '/components/f_b_i_filters_widget.dart';
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
import 'f_b_i_page_model.dart';
export 'f_b_i_page_model.dart';

class FBIPageWidget extends StatefulWidget {
  const FBIPageWidget({Key? key}) : super(key: key);

  @override
  _FBIPageWidgetState createState() => _FBIPageWidgetState();
}

class _FBIPageWidgetState extends State<FBIPageWidget> {
  late FBIPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FBIPageModel());

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
              _model.title = _model.fBIFiltersModel.fbiTitleController.text;
              _model.subject = _model.fBIFiltersModel.fbiSubjectController.text;
              _model.nationality =
                  _model.fBIFiltersModel.fbiNationalityController.text;
              _model.race = _model.fBIFiltersModel.fbiRaceController.text;
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
                'FBI Wanted',
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
                          (nextPageMarker) => FbiWantedCall.call(
                            page: valueOrDefault<int>(
                              functions.nextPage(nextPageMarker.nextPageNumber),
                              0,
                            ),
                            title:
                                _model.fBIFiltersModel.fbiTitleController.text,
                            subject: _model
                                .fBIFiltersModel.fbiSubjectController.text,
                            nationality: _model
                                .fBIFiltersModel.fbiNationalityController.text,
                            race: _model.fBIFiltersModel.fbiRaceController.text,
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

                          itemBuilder: (context, _, wantedListIndex) {
                            final wantedListItem = _model
                                .listViewPagingController!
                                .itemList![wantedListIndex];
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
                                    'FBIDetailPage',
                                    queryParameters: {
                                      'wanted': serializeParam(
                                        wantedListItem,
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
                                                wantedListItem,
                                                r'''$.images''',
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
                                                    Text(
                                                      getJsonField(
                                                        wantedListItem,
                                                        r'''$.title''',
                                                      ).toString(),
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
                                                  ],
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
                                                              1.00, 1.00),
                                                      child: Text(
                                                        'Subject',
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
                                                    Text(
                                                      getJsonField(
                                                        wantedListItem,
                                                        r'''$.subjects''',
                                                      ).toString(),
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
                                                  ],
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
                    if (valueOrDefault<bool>(
                      _model.filterVisibility == true,
                      false,
                    ))
                      wrapWithModel(
                        model: _model.fBIFiltersModel,
                        updateCallback: () => setState(() {}),
                        child: FBIFiltersWidget(),
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
