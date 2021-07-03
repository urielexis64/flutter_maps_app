part of 'helpers.dart';

void calculateAlert(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Wait please...'),
              content: CupertinoActivityIndicator(),
            ));
  } else {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Wait please'),
        content: CupertinoActivityIndicator(),
      ),
    );
  }
}
