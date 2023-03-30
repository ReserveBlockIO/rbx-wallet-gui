// ignore_for_file: non_constant_identifier_names

const RESULTS_PER_PAGE = 9;

class CliPaginatedResponse<T> {
  final int count;
  final List<T> results;
  final int page;

  CliPaginatedResponse({
    required this.count,
    required this.results,
    required this.page,
  });

  factory CliPaginatedResponse.empty() {
    return CliPaginatedResponse(count: 0, page: 1, results: []);
  }

  bool get canLoadMore {
    if (page * RESULTS_PER_PAGE < count) {
      return true;
    }
    return false;
  }
}

class ServerPaginatedReponse<T> {
  final int count;
  final int page;
  final int num_pages;
  final List<T> results;

  const ServerPaginatedReponse({
    required this.count,
    required this.page,
    required this.num_pages,
    required this.results,
  });

  factory ServerPaginatedReponse.empty() {
    return ServerPaginatedReponse(count: 0, page: 0, num_pages: 0, results: []);
  }
}
