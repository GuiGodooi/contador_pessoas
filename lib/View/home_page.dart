import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        centerTitle: true,
        elevation: 20,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 200,
              color: Colors.red[800],
              child: Text(
                isFull ? 'Lotado' : 'Pode Entrar!',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Text(
              '$count',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: isFull ? null : increment,
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.green[200]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: isFull
                          ? MaterialStateProperty.all(
                              Colors.white.withOpacity(0.4))
                          : MaterialStateProperty.all(
                              Colors.red,
                            ),
                    ),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red[200]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: isEmpty
                          ? MaterialStateProperty.all(
                              Colors.white.withOpacity(0.4))
                          : MaterialStateProperty.all(
                              Colors.red,
                            ),
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
