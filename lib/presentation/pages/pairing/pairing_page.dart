import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';

class PairingPage extends ConsumerStatefulWidget {
  const PairingPage({super.key});

  @override
  ConsumerState<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends ConsumerState<PairingPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  bool isFlashOn = false; // Track flash state
  bool isScanningPaused = false; // Track whether scanning is paused

  // In order to get hot reload to work properly, we need to pause the camera if the app is inactive
  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // QR Scanner View
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
            cameraFacing: CameraFacing.back,
          ),

          // Flash toggle icon and back button
          Positioned(
            top: 40, // Position near the top
            child: SizedBox(
              width: AppScreens.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => ref.read(routerProvider).pop(),
                    icon: SvgPicture.asset(
                      "assets/icons/arrow-left.svg",
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 32,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFlashOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () async {
                      await controller?.toggleFlash();
                      bool? flashStatus = await controller?.getFlashStatus();
                      setState(() {
                        isFlashOn = flashStatus ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Text description for scanning QR code
          const Positioned(
            top: 100, // Position below the back button and flash toggle
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Scan the QR code on your device to pair.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle QR view creation
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!isScanningPaused) {
        setState(() {
          result = scanData;
          isScanningPaused = true; // Pause scanning after a QR code is detected
        });
        log('QR Code found: ${result!.code}');
        _showBottomSheet(context, result!.code);
      }
    });
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context, String? qrData) {
    showModalBottomSheet(
      context: context,

      isDismissible: false, // Disable closing by tapping outside
      enableDrag: false, // Disable swiping to close
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 240,
            width: AppScreens.width,
            child: Column(
              children: [
                Lottie.asset("assets/lotties/success.json", width: 80, repeat: false),
                const SizedBox(height: 20),
                Text(
                  qrData ?? 'No data',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _resumeScanning();
                  },
                  title: 'Close',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Resume scanning after the dialog is closed
  void _resumeScanning() {
    setState(() {
      result = null; // Clear the result
      isScanningPaused = false; // Allow scanning again
    });
    controller?.resumeCamera(); // Resume the camera for new scans
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
