import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rxdart/rxdart.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  BarcodeScannerPageState createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final _barcodeStreamController = BehaviorSubject<Barcode>();
  late Stream<Barcode> _debouncedBarcodeStream;

  @override
  void initState() {
    super.initState();
    _initStreams();
  }

  @override
  void dispose() {
    _disposeStreams();
    super.dispose();
  }

  /// Initializes all streams needed for this widget in one place.
  void _initStreams() {
    // Set up the debounced barcode stream, which throttles incoming
    // barcode detections to handle them at a controlled rate. The debouncing
    // helps in preventing multiple detections of the barcode in quick
    // succession, which could lead to redundant processing.
    _debouncedBarcodeStream = _barcodeStreamController.stream
        .throttleTime(const Duration(seconds: 3));
    _debouncedBarcodeStream.listen((barcode) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Barcode Detected: ${barcode.rawValue}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  /// Disposes all streams used by this widget.
  void _disposeStreams() {
    _barcodeStreamController.close();
  }

  void _handleBarcodeDetect(BarcodeCapture barcodes) {
    var barcode = barcodes.barcodes.firstOrNull;
    if (barcode != null) {
      _barcodeStreamController.add(barcode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false, // Hide the back button
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: IconButton(
              icon: const Icon(Icons.close, color: Color(0xFF777777)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar,
      body: Stack(
        children: [
          MobileScanner(onDetect: _handleBarcodeDetect),
          const ScannerOverlay(holeSize: 300),
        ],
      ),
    );
  }
}

class ScannerOverlay extends StatelessWidget {
  final double holeSize;

  const ScannerOverlay({super.key, required this.holeSize});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textPosition = (screenSize.height / 2) - (holeSize / 2) - 50;

    return Stack(
      children: [
        CustomPaint(
          size: MediaQuery.of(context).size,
          painter: ScannerOverlayPainter(holeSize: holeSize),
        ),
        Positioned(
          top: textPosition,
          left: 0,
          right: 0,
          child: const Text(
            'Поместите QR-код в рамку',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final double holeSize;

  ScannerOverlayPainter({required this.holeSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.7);
    const cornerLength = 33.0; // Length of the corner lines
    const cornerWidth = 3.0; // Thickness of the corner lines
    final paintCorner = Paint()
      ..color = Colors.white
      ..strokeWidth = cornerWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Set the stroke cap to round

    // Define a path that covers the whole screen
    var path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Define a path for the hole
    var hole = Path()
      ..addRect(Rect.fromCenter(
          center: size.center(Offset.zero), width: holeSize, height: holeSize));

    // Use even-odd rule to achieve a hole in the path
    path = Path.combine(PathOperation.difference, path, hole);

    // Draw the main filled path
    canvas.drawPath(path, paint);

    // Calculate center rectangle for easier reference
    final centerRect = Rect.fromCenter(
        center: size.center(Offset.zero), width: holeSize, height: holeSize);

    // Draw corner lines
    // Top left corner
    canvas.drawLine(centerRect.topLeft,
        Offset(centerRect.left + cornerLength, centerRect.top), paintCorner);
    canvas.drawLine(centerRect.topLeft,
        Offset(centerRect.left, centerRect.top + cornerLength), paintCorner);
    // Top right corner
    canvas.drawLine(centerRect.topRight,
        Offset(centerRect.right - cornerLength, centerRect.top), paintCorner);
    canvas.drawLine(centerRect.topRight,
        Offset(centerRect.right, centerRect.top + cornerLength), paintCorner);
    // Bottom left corner
    canvas.drawLine(centerRect.bottomLeft,
        Offset(centerRect.left + cornerLength, centerRect.bottom), paintCorner);
    canvas.drawLine(centerRect.bottomLeft,
        Offset(centerRect.left, centerRect.bottom - cornerLength), paintCorner);
    // Bottom right corner
    canvas.drawLine(
        centerRect.bottomRight,
        Offset(centerRect.right - cornerLength, centerRect.bottom),
        paintCorner);
    canvas.drawLine(
        centerRect.bottomRight,
        Offset(centerRect.right, centerRect.bottom - cornerLength),
        paintCorner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Only repaint if UI changes explicitly request it
  }
}
