import '../../../../config.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyLayout(
      title: "Whoops !! No Orders Found",
      desc: "Looks like you haven’t order anything. You will find a lot of interesting products on our “Shop” page",
    );
  }
}
