import 'package:analyse_gp/presentation/widget/check_button.dart';
import 'package:analyse_gp/presentation/widget/check_malicious.dart';
import 'package:analyse_gp/presentation/widget/check_status.dart';
import 'package:analyse_gp/presentation/widget/ckeck_card.dart';
import 'package:analyse_gp/presentation/widget/gradient_container.dart';
import 'package:analyse_gp/utils/colors.dart';
import 'package:analyse_gp/utils/config.dart';
import 'package:analyse_gp/utils/constant.dart';
import 'package:analyse_gp/utils/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayoutBackground,
      // app bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: GradientContainer(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Image.asset(
                      KgpLogo,
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      APP_NAME.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: appOrangeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          colors: KappBarGradientColor,
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
              const Text(KintoText, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              // inputTextarea
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: KcheckContent,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appColorPrimary, width: 1.0),
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              // checkButton
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CheckButton(onTap: () {}, checkContent: KcheckButtonText),
                ],
              ),
              const SizedBox(height: 20),
              // results analyses
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // maliciousStatus & analysisStatus
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CheckMalicious(maliciousStatus: '0'),
                        SizedBox(height: 10),
                        CheckStatus(analysisStatus: 'Bonne'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(KresultText),
                    // engineName & engineResult
                    const SizedBox(height: 10),
                    const CheckCard(
                      engineName: 'Abusix',
                      engineResult: 'Clean',
                    ),
                    const SizedBox(height: 5),
                    const CheckCard(
                      engineName: 'Abusix',
                      engineResult: 'Clean',
                    ),
                    const SizedBox(height: 5),
                    const CheckCard(
                      engineName: 'Abusix',
                      engineResult: 'Clean',
                    ),
                    const SizedBox(height: 5),
                    const CheckCard(
                      engineName: 'Abusix',
                      engineResult: 'Clean',
                    ),
                    const SizedBox(height: 5),
                    const CheckCard(
                      engineName: 'Abusix',
                      engineResult: 'Clean',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
