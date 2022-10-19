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
