import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/screens/suggestions/~graphql/__generated__/suggestions.fragment.graphql.dart';
import 'package:pocadot_client/screens/suggestions/~graphql/__generated__/suggestions_screen.query.graphql.dart';

class SuggestionsProvider extends ChangeNotifier {
  String _userId = '';
  String get userId => _userId;

  void setUserId(String newUserId) {
    _userId = newUserId;
    notifyListeners();
  }

  Request _getRequest() {
    final suggestionsQueryOptions = Options$Query$SuggestionsScreen(
      variables: Variables$Query$SuggestionsScreen(
        id: userId,
      ),
    );
    return suggestionsQueryOptions.asRequest;
  }

  Query$SuggestionsScreen? _tryGetQueryFromCache(GraphQLDataProxy cache, Request request) {
    final readQuery = cache.readQuery(_getRequest());
    return readQuery != null ? Query$SuggestionsScreen.fromJson(readQuery) : null;
  }

  void onDelete(GraphQLDataProxy cache, String listingId) {
    final request = _getRequest();
    final readQuery = _tryGetQueryFromCache(cache, request);
    if(readQuery == null) return;

    readQuery.userSuggestions.removeWhere((element) => element.id == listingId);
    cache.writeQuery(request, data: readQuery.toJson(), broadcast: true);
  }

  void onAdd(GraphQLDataProxy cache, Fragment$suggestion suggestion) {
    final request = _getRequest();
    final readQuery = _tryGetQueryFromCache(cache, request);
    if(readQuery == null) return;

    readQuery.userSuggestions.insert(0, suggestion);
    cache.writeQuery(request, data: readQuery.toJson(), broadcast: true);
  }
}
