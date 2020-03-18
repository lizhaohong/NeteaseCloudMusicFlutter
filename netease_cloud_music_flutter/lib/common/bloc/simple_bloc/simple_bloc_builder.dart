import 'package:netease_cloud_music_flutter/common/bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'simple_bloc_repository.dart';

typedef SimpleBlocRepositoryBuilder<R extends SimpleBlocRepository> = R
    Function(BuildContext);

/// [SimpleBlocBuilder] can help you reduce the boilerplate code when implementing
/// the bloc pattern, if the data has only single type and only single data [Stream].
///
/// You need to implement your own [SimpleBlocRepository], pass it to `blocRepositoryBuilder`,
/// and then implement your UI in `asyncChildBuilder`.
/// e.g.,
/// ```dart
/// class JRPassArticleListRepository
///     extends RemoteSimpleBlocRepository<JrpassHorizentalGrids> {
///   JRPassArticleListRepository(CommonRequest commonRequest)
///       : super(commonRequest);
///
///   @override
///   Future<JrpassHorizentalGrids> getData() {
///     return commonRequest.get("/fake").asFuture();
///   }
/// }
///
/// class JRPassArticleList extends StatelessWidget {
///  @override
///  Widget build(BuildContext context) {
///    return SimpleBlocBuilder<JrpassHorizentalGrids,
///        JRPassArticleListRepository>(
///      blocRepositoryBuilder: (context) {
///        return JRPassArticleListRepository(
///            Provider.of<CommonRequest>(context, listen: false));
///      },
///      asyncChildBuilder: (context, snapshot) {
///        return SliverToBoxAdapter(
///          child: snapshot.data?.value is Success
///              ? _contentAndGuideSection(snapshot.data.value())
///              : const ComponentPlaceHolder(),
///        );
///      },
///    );
///  }
/// ```
///
/// **NOTE**: [SimpleBlocBuilder] is designed for situations where there is only
/// single data type and single data [Stream], so don't abuse it if your data is complex.
///
/// See also:
/// * [SimpleBloc]
/// * [SimpleBlocRepository]
/// * [SimpleBlocState]
class SimpleBlocBuilder<T, R extends SimpleBlocRepository<T>>
    extends StatelessWidget {
  SimpleBlocBuilder(
      {@required SimpleBlocRepositoryBuilder<R> blocRepositoryBuilder,
      @required AsyncWidgetBuilder<SimpleBlocState<T>> asyncChildBuilder})
      : assert(blocRepositoryBuilder != null),
        assert(asyncChildBuilder != null),
        this._blocRepositoryBuilder = blocRepositoryBuilder,
        this._asyncChildBuilder = asyncChildBuilder;

  final SimpleBlocRepositoryBuilder<R> _blocRepositoryBuilder;

  final AsyncWidgetBuilder<SimpleBlocState<T>> _asyncChildBuilder;

  @override
  Widget build(BuildContext context) {
    var repository = _blocRepositoryBuilder(context);
    assert(repository != null);
    return BlocProvider<SimpleBloc>(
        create: (context) => SimpleBloc<T, R>(repository),
        child: _InnerSimpleBlocBuilder<T, R>(_asyncChildBuilder));
  }
}

class _InnerSimpleBlocBuilder<T, R extends SimpleBlocRepository<T>>
    extends StatefulWidget {
  _InnerSimpleBlocBuilder(this._asyncChildBuilder);

  final AsyncWidgetBuilder<SimpleBlocState<T>> _asyncChildBuilder;

  @override
  State<StatefulWidget> createState() => _InnerSimpleBlocBuilderState<T, R>();
}

class _InnerSimpleBlocBuilderState<T, R extends SimpleBlocRepository<T>>
    extends State<_InnerSimpleBlocBuilder<T, R>> {
  SimpleBloc<T, R> _simpleBloc;

  @override
  void didChangeDependencies() {
    _simpleBloc = Provider.of<SimpleBloc>(context, listen: false);
    _simpleBloc.getData();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _simpleBloc.stream,
      builder: widget._asyncChildBuilder,
    );
  }
}
