/// Resultado de una página devuelta por el backend (envelope con `pagination`).
class PageResult<T> {
  const PageResult({
    required this.items,
    required this.currentPage,
    required this.lastPage,
  });

  final List<T> items;
  final int currentPage;
  final int lastPage;
}

/// Estado acumulado de una lista paginada con scroll infinito.
///
/// [items] son todos los elementos cargados hasta ahora; [page] es la última
/// página cargada (0 = ninguna); [isLoadingMore] indica que se está trayendo la
/// siguiente página (para mostrar un spinner al final de la lista).
class PagedState<T> {
  const PagedState({
    this.items = const [],
    this.page = 0,
    this.lastPage = 1,
    this.isLoadingMore = false,
  });

  final List<T> items;
  final int page;
  final int lastPage;
  final bool isLoadingMore;

  bool get hasMore => page < lastPage;

  PagedState<T> copyWith({
    List<T>? items,
    int? page,
    int? lastPage,
    bool? isLoadingMore,
  }) {
    return PagedState<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
