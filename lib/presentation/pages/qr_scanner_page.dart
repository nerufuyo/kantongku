import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});
  static const routeName = '/qr-scanner-page';

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
          title: Text(
            'Scan QR',
            style: poppinsH3,
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.75,
                    padding: const EdgeInsets.all(16),
                    child: QRView(
                      cameraFacing: CameraFacing.back,
                      formatsAllowed: const [BarcodeFormat.qrcode],
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderRadius: 10,
                        borderColor: textColor,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                    ),
                  ),
                  Text(
                    'You can scan QR code from your friend to send money',
                    style: poppinsBody1.copyWith(
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              bottomButton(context)
            ],
          ),
        ),
      ),
    );
  }

  InkWell bottomButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: primaryColor,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My QR Code',
                            style: poppinsBody1.copyWith(
                              color: textColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                      const VerticalGap15(),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 4.0, color: textColor),
                            left: BorderSide(width: 4.0, color: textColor),
                            right: BorderSide(width: 4.0, color: textColor),
                            bottom: BorderSide(width: 4.0, color: textColor),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: primaryColor,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: textColor,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: QrImageView(
                            data: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                            size: 200,
                            backgroundColor: textColor,
                            errorStateBuilder: (cxt, err) {
                              return const Center(
                                child: Text(
                                  'Uh oh! Something went wrong...',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                            errorCorrectionLevel: QrErrorCorrectLevel.M,
                            padding: const EdgeInsets.all(0),
                          ),
                        ),
                      ),
                      const VerticalGap15(),
                      Text(
                        'You can use this QR Code to receive money from your friends',
                        style: poppinsBody2.copyWith(
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share,
                              color: text2Color,
                            ),
                            const HorizontalGap5(),
                            Text(
                              'Share My QR',
                              style: poppinsBody1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.qr_code,
                color: text2Color,
              ),
              const HorizontalGap5(),
              Text(
                'My QR Code',
                style: poppinsBody1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
