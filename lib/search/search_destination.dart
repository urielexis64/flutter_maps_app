import 'package:flutter/material.dart';
import 'package:flutter_maps_app/models/search_result.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;

  SearchDestination() : this.searchFieldLabel = 'Search...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => this.close(context, SearchResult(cancelled: true)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('xd');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Set location manually'),
          onTap: () {
            this.close(context, SearchResult(cancelled: false, manual: true));
          },
        )
      ],
    );
  }
}
