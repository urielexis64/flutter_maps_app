import 'package:flutter/material.dart';

class SearchDestination extends SearchDelegate {
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
      onPressed: () => this.close(context, null),
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
            print('asda');
            this.close(context, null);
          },
        )
      ],
    );
  }
}
