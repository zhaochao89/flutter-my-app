import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnglishWordsPage extends StatefulWidget {
  const EnglishWordsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EnglishWordsPageState();
  }
}

class _EnglishWordsPageState extends State<EnglishWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Vector {
  const Vector({required this.x, required this.y, required this.z});

  final double x;
  final double y;
  final double z;

  Vector operator +(Vector v) {
    return Vector(x: x + v.x, y: y + v.y, z: z + v.z);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const MyHome(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 44,
          ),
          const Text('A random AWESOME idea:'),
          BigCard(appState: appState),
          ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: const Text('text')),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);
    final pair = appState.current;

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: '${pair.first} ${pair.second}',
        ),
      ),
    );
  }
}
