part of 'browse_bloc.dart';

abstract class BrowseEvent extends Equatable {
  const BrowseEvent();

  @override
  List<Object> get props => [];
}

class BrowseQueryChanged extends BrowseEvent {
  final String query;

  const BrowseQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class BrowseReset extends BrowseEvent {}

class BrowseLoad extends BrowseEvent {
  final BuildContext context;

  const BrowseLoad(this.context);

  @override
  List<Object> get props => [context];
}
