import 'package:dapperz/config.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 80,
                      color: Colors.yellow,
                    ),
                    Text('No Internet Connection',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 120,
                  height: 100,
                  child: Image.asset(imageAssets.logo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
