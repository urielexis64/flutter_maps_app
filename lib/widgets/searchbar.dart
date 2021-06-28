part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: SearchDestination());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            child: Text(
              'Where to?',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(0, 4),
                      color: Colors.black12)
                ]),
          ),
        ),
      ),
    );
  }
}
