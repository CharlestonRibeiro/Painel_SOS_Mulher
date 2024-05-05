import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.colored,
    this.asDialog = false,
  });

  /// Se for atribuído "true", será da cor padrão do background do app.
  /// Se for atribuído "false", será do branco padrão.
  /// Se for null, será do cinza padrão.
  final bool? colored;

  /// Se for atribuído "true", será retornado uma dialog contendo o indicator.
  final bool asDialog;

//  TODO: ajustar cores

  @override
  Widget build(BuildContext context) {
    return asDialog
        ? Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(20),
              child: const CupertinoActivityIndicator(color: Colors.black12),
            ),
          )
        : CupertinoActivityIndicator(
            color: colored == null
                ? null
                : colored!
                    ? Colors.black12
                    : Colors.amber,
          );
  }
}
