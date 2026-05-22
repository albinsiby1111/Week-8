import 'package:flutter/material.dart';
import '../controllers/roast_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final RoastController controller = RoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Roast Timer"),
        centerTitle: true,
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: controller.roastColor,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  controller.roastStage,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "${controller.seconds} Seconds",
                  style: const TextStyle(fontSize: 22),
                ),

                const SizedBox(height: 30),

                Wrap(
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: controller.startRoasting,
                      child: const Text("Start Roasting"),
                    ),

                    ElevatedButton(
                      onPressed: controller.back,
                      child: const Text("Back"),
                    ),

                    ElevatedButton(
                      onPressed: controller.forward,
                      child: const Text("Forward"),
                    ),

                    ElevatedButton(
                      onPressed: controller.reset,
                      child: const Text("Reset"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}