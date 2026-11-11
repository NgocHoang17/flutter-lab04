import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MagicBallApp());

const answers = [
  'Chắc chắn rồi!',
  'Một cơ hội tốt đang đến.',
  'Hãy tin vào bản thân.',
  'Chưa phải lúc này.',
  'Thử hỏi lại sau nhé.',
  'Có lẽ bạn đã biết câu trả lời.',
  'Cứ mạnh dạn thử xem!',
  'Hãy cân nhắc thêm một chút.',
];

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Magic 8 Ball',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFB7A5F8),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF171625),
    ),
    home: const MagicBallPage(),
  );
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key, this.random});
  final Random? random;
  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  late final Random _random = widget.random ?? Random();
  String _answer = 'Điều gì đang chờ bạn?';
  int _turn = 0;
  void _ask() => setState(() {
    _answer = answers[_random.nextInt(answers.length)];
    _turn++;
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('MAGIC 8 BALL / 04')),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: Color(0xFFCBBAFF),
                  size: 32,
                ),
                const SizedBox(height: 16),
                Text(
                  'Hỏi vũ trụ một câu',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nghĩ về một câu hỏi, rồi chạm vào quả cầu.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Semantics(
                  button: true,
                  label: 'Hỏi quả cầu tiên tri',
                  child: InkWell(
                    onTap: _ask,
                    borderRadius: BorderRadius.circular(240),
                    child: Image.asset(
                      'assets/images/magic_ball.png',
                      height: 280,
                      fit: BoxFit.contain,
                      excludeFromSemantics: true,
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: Container(
                    key: ValueKey(_turn),
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B2742),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      _answer,
                      key: const Key('answer'),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFFDDCFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  key: const Key('ask'),
                  onPressed: _ask,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  icon: const Icon(Icons.auto_awesome_outlined),
                  label: const Text('Nhận câu trả lời'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Một trò vui nhỏ cho những lúc phân vân.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
