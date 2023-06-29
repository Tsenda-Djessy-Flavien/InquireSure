import 'dart:convert';
import 'package:analyse_gp/domain/models/analysis_result_model.dart';
import 'package:analyse_gp/network/api/key.dart';
import 'package:analyse_gp/presentation/widget/check_button.dart';
import 'package:analyse_gp/presentation/widget/analysis_result/analysis_malicious_card.dart';
import 'package:analyse_gp/presentation/widget/analysis_result/analysis_status_card.dart';
import 'package:analyse_gp/presentation/widget/analysis_result/analysis_engine_card.dart';
import 'package:analyse_gp/presentation/widget/gradient_container.dart';
import 'package:analyse_gp/utils/colors.dart';
import 'package:analyse_gp/utils/config.dart';
import 'package:analyse_gp/utils/constant.dart';
import 'package:analyse_gp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;
  bool _isUrlEmpty = false;
  bool _isPasteButtonVisible = false;
  List _result = [];

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _pasteText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      setState(() {
        _urlController.text = clipboardData.text!;
      });
    }
  }

  String extractUrl(String text) {
    final regex = RegExp(
      r"(?:(?:https?|http):\/\/|www\.)[^\s/$.?#].[^\s]*",
      caseSensitive: false,
    );
    final match = regex.firstMatch(text);
    return match?.group(0) ?? '';
  }

  Future<Map<String, dynamic>> submitUrl(String url) async {
    const apiUrl = 'https://www.virustotal.com/api/v3/urls';
    final headers = {
      'x-apikey': apiKey,
      'Content-Type': 'application/json',
    };
    final queryParams = {'url': url};
    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    final response = await http.post(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data as Map<String, dynamic>;
    } else {
      final error = json.decode(response.body)['error'];
      throw Exception('${error['code']}: ${error['message']}');
    }
  }

  Future<Map<String, dynamic>> getFinalResults(String finalResultsUrl) async {
    final headers = {'x-apikey': apiKey};

    final response =
        await http.get(Uri.parse(finalResultsUrl), headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final attributes = data['data']?['attributes'];
      final analysisStatus = attributes?['status'];
      final maliciousStatus = attributes?['stats']?['malicious'];
      final engines = attributes?['results'];

      return {
        'analysisStatus': analysisStatus,
        'maliciousStatus': maliciousStatus,
        'engines': engines,
      };
    } else {
      final error = json.decode(response.body)['error'];
      throw Exception('${error['code']}: ${error['message']}');
    }
  }

  Future<List<AnalysisResult>> _checkUrl() async {
    final url = extractUrl(_urlController.text);

    setState(() {
      _isUrlEmpty = url.isEmpty;
    });

    if (_isUrlEmpty) {
      return [
        AnalysisResult(
          analysisStatus: 'Error: URL is empty',
          maliciousStatus: 0,
          engines: [],
        )
      ];
    }

    setState(() {
      _isLoading = true;
      _result = [];
    });

    try {
      final result = await submitUrl(url);

      final analysisResultsUrl = result['data']['links']['self'];
      final finalResults = await getFinalResults(analysisResultsUrl);

      final analysisStatus = finalResults['analysisStatus'];
      final maliciousStatus = finalResults['maliciousStatus'];
      final engines = finalResults['engines'];

      final enginesList = engines?.entries
              .map((entry) {
                final engineName = entry.key;
                final engineResult = entry.value['result'];
                final convertedEngine = Map<String, String>.from({
                  'engineName': engineName,
                  'engineResult': engineResult ?? 'N/A',
                });
                return convertedEngine;
              })
              .toList()
              .cast<Map<String, String>>() ??
          [];

      final List<AnalysisResult> analysisResults = [
        AnalysisResult(
          analysisStatus: analysisStatus ?? 'N/A',
          maliciousStatus: maliciousStatus ?? 0,
          engines: enginesList,
        ),
      ];

      setState(() {
        _result = analysisResults;
      });

      return analysisResults;
    } catch (error) {
      final List<AnalysisResult> errorResult = [
        AnalysisResult(
          analysisStatus: 'Error: $error',
          maliciousStatus: 0,
          engines: [],
        ),
      ];

      setState(() {
        _result = errorResult;
      });

      return errorResult;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayoutBackground,
      // app bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(
          child: GradientContainer(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Image.asset(
                        KorangeLogo,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            APP_NAME.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: appSectionBackground,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                Kby,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: appSectionBackground,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                KorangeCyber,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: appOrangeColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            colors: KappBarGradientColor,
          ),
        ),
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // LogoApp
              Center(child: Image.asset(KLogoApp)),
              const SizedBox(height: 20),
              // IntoText
              const Text(KintoText, textAlign: TextAlign.center),
              const SizedBox(height: 30),
              // inputTextarea
              TextField(
                controller: _urlController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: KcheckContent,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: appBlackColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: appBlackColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  border: _isUrlEmpty
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : null,
                  errorText: _isUrlEmpty ? KurlEmpty : null,
                ),
                onChanged: (value) {
                  setState(() {
                    _isUrlEmpty = false;
                    _isPasteButtonVisible = value.isEmpty;
                  });
                },
              ),
              const SizedBox(height: 20),
              // checkButton
              _urlController.text.isNotEmpty
                  ? Center(
                      child: CheckButton(
                        onTap: _isLoading ? null : _checkUrl,
                        checkContent: KcheckButtonText,
                      ),
                    )
                  : const SizedBox(height: 0),
              _urlController.text.isEmpty
                  ? Center(
                      child: CheckButton(
                        onTap: _pasteText,
                        checkContent: 'Coller un Contenu',
                      ),
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 20),
              // loader
              Center(
                child: Visibility(
                  visible: _isLoading,
                  child: CircularProgressIndicator(
                    color: appColorPrimary,
                    backgroundColor: appColorPrimary.withOpacity(0.1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // analysis result
              Column(
                children: _result.map((item) {
                  final analysisStatus = item.analysisStatus;
                  final maliciousStatus = item.maliciousStatus;
                  final engines = item.engines;

                  final enginesWidgets = engines.map((engine) {
                    final engineName = engine['engineName'];
                    final engineResult = engine['engineResult'];
                    return CheckCard(
                      engineName: engineName,
                      engineResult: engineResult,
                    );
                  }).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckStatus(analysisStatus: analysisStatus),
                      const SizedBox(height: 5),
                      analysisStatus != 'queued'
                          ? CheckMalicious(
                              maliciousStatus: maliciousStatus.toString(),
                            )
                          : const SizedBox(height: 0),
                      const SizedBox(height: 20),
                      maliciousStatus <= 0 && analysisStatus != 'queued'
                          ? const Center(
                              child: Text(
                                kTrueContenu,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kCheckIconColor,
                                ),
                              ),
                            )
                          : const SizedBox(height: 0),
                      maliciousStatus > 0 && analysisStatus != 'queued'
                          ? const Center(
                              child: Text(
                                kFalseContenu,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: appRedColor,
                                ),
                              ),
                            )
                          : const SizedBox(height: 0),
                      const SizedBox(height: 15),
                      analysisStatus != 'queued'
                          ? const Text(
                              KresultText,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox(height: 0),
                      analysisStatus == 'queued'
                          ? const Center(
                              child: Text(
                                kQueudStatus,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const SizedBox(height: 0),
                      ...enginesWidgets,
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
