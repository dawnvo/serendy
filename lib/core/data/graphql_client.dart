import 'package:graphql/client.dart';

final httpLink = HttpLink('http://localhost:3000/graphql');

final graphQLClient = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
