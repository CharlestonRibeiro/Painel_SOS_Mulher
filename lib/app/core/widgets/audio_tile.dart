import 'package:flutter/material.dart';

class AudioTile extends StatelessWidget {
  const AudioTile({
    super.key,
    required this.isSelected,
    required this.isPlaying,
    required this.index,
    required this.label,
    required this.duration,
    required this.playFunction,
    required this.showPlayingIcon,
  });

  final bool isSelected;
  final bool isPlaying;
  final bool showPlayingIcon;
  final int index;
  final String label;
  final String duration;
  final VoidCallback playFunction;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: playFunction,
        selected: isSelected,
        selectedTileColor: Colors.green,
        selectedColor: Colors.white,
        titleTextStyle: const TextStyle(overflow: TextOverflow.ellipsis),
        leading: showPlayingIcon
            ? isPlaying
                ? const Icon(
                    Icons.volume_up,
                    color: Colors.black,
                  )
                : const SizedBox.shrink()
            : null,
        title: Text('$index. $label'),
        trailing: Text(duration),
      ),
    );
  }
}
