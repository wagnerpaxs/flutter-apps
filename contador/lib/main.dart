import 'package:flutter/material.dart';

void main() {
  runApp(const AppContador());
}

class AppContador extends StatelessWidget {
  const AppContador({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxIn = 20;
  int currentIn = 0;
  int dayIn = 0;
  int dayOut = 0;

  bool get isFull => currentIn == maxIn;
  bool get isEmpty => currentIn == 0;

  void saiu() {
    setState(() {
      currentIn--;
      dayOut++;
    });
  }

  void entrou() {
    setState(() {
      currentIn++;
      dayIn++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/736x/cf/56/ae/cf56aea62b2bc4aceca0086e7d26acea.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**
             * Seção "Em atendimento"
             */
            const Text('Em atendimento:',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                )),
            Text('$currentIn',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(
              height: 20,
            ),

            /**
             * Seção "Vagas disponíveis"
             */
            const Text('Vagas disponíveis:',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white70,
                  fontWeight: FontWeight.w900,
                )),
            Text((maxIn - currentIn).toString(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(
              height: 20,
            ),

            /**
             * Seção "Total do dia"
             */
            const Text('Total do dia:',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Entradas:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(
                width: 20,
              ),
              Text('$dayIn',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  )),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Saídas:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(
                width: 40,
              ),
              Text('$dayOut',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  )),
            ]),
            const SizedBox(
              height: 20,
            ),

            /**
             * Seção "Botões"
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: isEmpty ? null : saiu,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: const Size(150, 50)),
                    child: const Text('Saiu',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: isFull ? null : entrou,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull ? Colors.grey : Colors.blue,
                        fixedSize: const Size(150, 50)),
                    child: Text('Entrou',
                        style: TextStyle(
                          fontSize: 16,
                          color: isFull ? Colors.black26 : Colors.white,
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
