import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ""),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () => close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("resultado: digitado $query");
    List<String> sugestoes = List.empty();

    if (query.isNotEmpty) {
      sugestoes = ["Flutter", "Dart", "Android", "IOS", "Java", "Kotlin", "Car"]
      .where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();

      return ListView.builder(
        itemCount: sugestoes!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => close(context, sugestoes[index]),
            title: Text(sugestoes![index]),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }
}
