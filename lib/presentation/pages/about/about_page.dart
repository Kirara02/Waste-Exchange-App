import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String data = """
        <!DOCTYPE html>
      <html>
      <head>
          <title>About Us</title>
      </head>
      <body>
          <h1>About Aplikasi Penukaran Sampah</h1>
          <p>
              <strong>Aplikasi Penukaran Sampah</strong> adalah solusi inovatif untuk mengurangi sampah plastik, khususnya botol plastik, 
              dengan memberikan insentif kepada masyarakat melalui penukaran sampah menjadi saldo digital. 
              Pengguna dapat menukar botol plastik dan mendapatkan <em>saldo e-wallet</em>, pulsa, atau paket data.
          </p>
          <h2>Fitur Utama:</h2>
          <ul>
              <li>Penukaran sampah botol plastik menjadi saldo digital.</li>
              <li>Opsi penarikan saldo berupa <em>e-wallet</em>, pulsa, dan paket data.</li>
              <li>Proses pairing dengan mesin daur ulang melalui <strong>scan QR code</strong>.</li>
          </ul>
          <h2>Cara Kerja:</h2>
          <ol>
              <li>Download aplikasi dari <strong>Play Store</strong> atau <strong>App Store</strong>.</li>
              <li>Registrasi atau login untuk mulai menggunakan aplikasi.</li>
              <li>Pairing dengan mesin daur ulang melalui scan <strong>QR code</strong>.</li>
              <li>Masukkan botol plastik ke dalam mesin satu per satu.</li>
              <li>Dapatkan saldo yang langsung ditambahkan ke akun pengguna.</li>
              <li>Withdraw saldo ke <em>e-wallet</em>, pulsa, atau paket data dengan saldo minimal Rp 10.000.</li>
          </ol>
          <p>
              Bergabunglah dengan kami untuk menjaga lingkungan dan mendapatkan keuntungan dari penukaran sampah botol plastik!
          </p>
      </body>
      </html>
    """;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 8),
          InkWell(
            onTap: () => ref.read(routerProvider).pop(),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow-left.svg",
                  width: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  "Back",
                  style: Typogaphy.Medium.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: HtmlWidget(data),
          ),
        ],
      ),
    );
  }
}
