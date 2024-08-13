import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final List<String> _languages = [
    'English',
    'Arabic',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese'
  ];
  String _originLang = 'From';
  String _destinationLang = 'To';
  String _outputLang = '';
  final Color wtClr = Colors.white;
  final TextEditingController _langController = TextEditingController();

  void _translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(
      input,
      from: src,
      to: dest,
    );
    setState(() => _outputLang = translation.text.toString());
  }

  String _getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Arabic':
        return 'ar';
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'German':
        return 'de';
      case 'Italian':
        return 'it';
      case 'Japanese':
        return 'ja';
      default:
        return '--';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          'Language Translator',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    items: _languages
                        .map(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) =>
                        setState(() => _originLang = val.toString()),
                    focusColor: wtClr,
                    iconDisabledColor: wtClr,
                    iconEnabledColor: wtClr,
                    dropdownColor: wtClr,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    hint: Text(
                      _originLang,
                      style: TextStyle(color: wtClr),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_sharp,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    items: _languages
                        .map(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) =>
                        setState(() => _destinationLang = val.toString()),
                    focusColor: wtClr,
                    iconDisabledColor: wtClr,
                    iconEnabledColor: wtClr,
                    dropdownColor: wtClr,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    hint: Text(
                      _destinationLang,
                      style: TextStyle(color: wtClr),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  cursorColor: wtClr,
                  autocorrect: true,
                  autofocus: false,
                  controller: _langController,
                  style: TextStyle(color: wtClr),
                  decoration: InputDecoration(
                    labelText: 'Please enter your Text...',
                    labelStyle: TextStyle(color: wtClr, fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          width: 2),
                    ),
                    errorStyle:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Please Enter a text to translate';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: wtClr,
                      backgroundColor: const Color(0xff2b3c5a)),
                  onPressed: () {
                    _translate(
                        _getLanguageCode(_originLang),
                        _getLanguageCode(_destinationLang),
                        _langController.text.toString());
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_outputLang != '')
                Text(
                  _outputLang,
                  style: TextStyle(
                      fontSize: 20, color: wtClr, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }
}
