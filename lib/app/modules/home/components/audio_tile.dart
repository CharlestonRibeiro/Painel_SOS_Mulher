import 'package:flutter/material.dart';

class AudioTile extends StatelessWidget {
  const AudioTile({
    super.key,
    required this.isSelected,
    required this.isPlaying,
    required this.index,
    required this.id,
    required this.duration,
  });

  final bool isSelected;
  final bool isPlaying;
  final int index;
  final String id;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.green,
        selectedColor: Colors.white,
        titleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
        leading: isPlaying
            ? const Icon(
                Icons.volume_up,
                color: Colors.black,
              )
            : const SizedBox.shrink(),
        title: Text('$index. $id'),
        trailing: Text(duration),
      ),
    );
  }
}
