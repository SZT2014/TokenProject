import 'package:flutter/cupertino.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, this.describe});

  final String? describe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              describe ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'CupertinoSystemDisplay',
                letterSpacing: -0.48,
                height: 1.3,
              ),
            ),
          ],
        )
      ),
    );
  }
}

