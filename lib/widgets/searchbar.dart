part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (!state.manualSelection)
          return FadeInDown(
              duration: Duration(milliseconds: 300),
              child: buildSearchBar(context));
        return Container();
      },
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () async {
          final result =
              await showSearch(context: context, delegate: SearchDestination());
          this.searchResult(context, result!);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  'Where to?',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Expanded(child: Container()),
                Icon(Icons.search),
              ],
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

  void searchResult(BuildContext context, SearchResult result) {
    if (result.cancelled) return;
    if (result.manual!) {
      context.read<SearchBloc>().add(OnManualMarkerActivated());
      return;
    }
  }
}
