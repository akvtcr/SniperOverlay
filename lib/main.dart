import 'package:flutter/material.dart';

void main() => runApp(const SniperOverlayApp());

class SniperOverlayApp extends StatelessWidget {
  const SniperOverlayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SniperDashboardOverlay(),
    );
  }
}

class SniperDashboardOverlay extends StatefulWidget {
  const SniperDashboardOverlay({Key? key}) : super(key: key);

  @override
  State<SniperDashboardOverlay> createState() => _SniperDashboardOverlayState();
}

class _SniperDashboardOverlayState extends State<SniperDashboardOverlay> {
  bool isMinimized = false;
  bool isTracking = true;

  @override
  Widget build(BuildContext context) {
    // If minimized, show just a floating action bubble
    if (isMinimized) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 10),
            child: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              mini: true,
              onPressed: () => setState(() => isMinimized = false),
              child: const Icon(Icons.radar, color: Colors.white),
            ),
          ),
        ),
      );
    }

    // Main Floating Dashboard Window Layout
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 320,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.redAccent.withOpacity(0.5), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            children: [
              // Header Control Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[900]!.withOpacity(0.9),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.g_radar, color: isTracking ? Colors.greenAccent : Colors.amberAccent, size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          "SNIPER MATRIX ENGINE",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.2, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove, color: Colors.white70, size: 20),
                          onPressed: () => setState(() => isMinimized = true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Matrix Metric Slots
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Metric 1: Status / Target
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("ENGINE STATUS:", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text(
                            isTracking ? "SCANNING ACTIVE" : "PAUSED",
                            style: TextStyle(color: isTracking ? Colors.greenAccent : Colors.amberAccent, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white10, height: 1),
                      // Metric 2: Volume Acceleration Space
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("VOL ACCELERATION:", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("WAITING DATA...", style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                      const Divider(color: Colors.white10, height: 1),
                      // Metric 3: Structure / Level Space
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("MATRIX LEVEL:", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("STABLE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Action Control Bottom Bar
              Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isTracking ? Colors.amber[800] : Colors.green[700],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        icon: Icon(isTracking ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 16),
                        label: Text(isTracking ? "PAUSE SCAN" : "START SCAN", style: const TextStyle(color: Colors.white, fontSize: 12)),
                        onPressed: () => setState(() => isTracking = !isTracking),
                      ),
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
