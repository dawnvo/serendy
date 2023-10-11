PaginationRange getPagination(int page, [int perPage = 20]) {
  final from = page * perPage;
  final to = from + perPage - 1;

  return PaginationRange(from: from, to: to);
}

class PaginationRange {
  const PaginationRange({
    required this.from,
    required this.to,
  });

  final int from;
  final int to;
}
