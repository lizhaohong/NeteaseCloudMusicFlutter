import 'package:flutter/widgets.dart';
import 'package:netease_cloud_music_flutter/common/bloc/base_bloc.dart';
import 'package:provider/provider.dart';

/// A [StatelessWidget] that help you reduce boilerplate code of instantiating and disposing a BLoC.
///
/// The [BlocProvider] underly base on the [Provider], so you can simplified get the BLoC by using the
/// [Provider]'s syntax inside the child widget: `Provider.of<YourBLoC>(context)`
class BlocProvider<T extends BaseBloc> extends StatelessWidget {
  final Create<T> _create;
  final Widget _child;

  BlocProvider({@required Create<T> create, @required Widget child})
      : this._create = create,
        this._child = child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: _create,
      child: _child,
      dispose: (context, bloc) {
        bloc.dispose();
      },
    );
  }
}
