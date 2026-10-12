import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thực hành 03',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC94C4C)),
        ),
        home: const CalculatorPage(),
      );
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _first = TextEditingController();
  final _second = TextEditingController();
  String? _operation;
  String? _result;
  String? _error;

  @override
  void dispose() {
    _first.dispose();
    _second.dispose();
    super.dispose();
  }

  void _calculate(String operation) {
    final a = double.tryParse(_first.text.trim());
    final b = double.tryParse(_second.text.trim());
    setState(() {
      _operation = operation;
      if (a == null || b == null) {
        _result = null;
        _error = 'Vui lòng nhập hai số hợp lệ.';
        return;
      }
      if (operation == '/' && b == 0) {
        _result = null;
        _error = 'Không thể chia cho 0.';
        return;
      }
      final value = switch (operation) {
        '+' => a + b,
        '-' => a - b,
        '*' => a * b,
        '/' => a / b,
        _ => 0.0,
      };
      _result = value == value.roundToDouble()
          ? value.toInt().toString()
          : value.toString();
      _error = null;
    });
  }

  Widget _numberField(TextEditingController controller, String hint) => TextField(
        controller: controller,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: true),
        onChanged: (_) {
          if (_operation != null) _calculate(_operation!);
        },
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide:
                const BorderSide(color: Color(0xFFC94C4C), width: 1.5),
          ),
        ),
      );

  Widget _operationButton(String symbol, Color color) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => _calculate(symbol),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 52,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _operation == symbol ? Colors.black : Colors.transparent,
                  width: 2.5,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(flex: 4),
                    const Text(
                      'Thực hành 03',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(flex: 3),
                    _numberField(_first, 'Nhập số thứ nhất'),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        _operationButton('+', const Color(0xFFD64B4B)),
                        _operationButton('-', const Color(0xFFE2B345)),
                        _operationButton('*', const Color(0xFF5936D6)),
                        _operationButton('/', const Color(0xFF171717)),
                      ],
                    ),
                    const SizedBox(height: 22),
                    _numberField(_second, 'Nhập số thứ hai'),
                    const SizedBox(height: 14),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _error != null
                            ? _error!
                            : _result == null
                                ? 'Kết quả:'
                                : 'Kết quả: $_result',
                        style: TextStyle(
                          fontSize: 16,
                          color: _error != null
                              ? Colors.red.shade700
                              : Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(flex: 7),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

