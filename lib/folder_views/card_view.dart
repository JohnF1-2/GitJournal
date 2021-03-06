import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gitjournal/core/note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gitjournal/core/notes_folder.dart';
import 'package:gitjournal/folder_views/note_tile.dart';

typedef void NoteSelectedFunction(Note note);

class CardView extends StatelessWidget {
  final NoteSelectedFunction noteSelectedFunction;
  final NotesFolder folder;
  final String emptyText;

  CardView({
    @required this.folder,
    @required this.noteSelectedFunction,
    @required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    if (folder.isEmpty) {
      return Center(
        child: Text(
          emptyText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[350],
          ),
        ),
      );
    }

    var gridView = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: folder.notes.length,
      itemBuilder: (BuildContext context, int index) {
        var note = folder.notes[index];
        return NoteTile(note, noteSelectedFunction);
      },
      staggeredTileBuilder: (int i) => const StaggeredTile.fit(2),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
    );

    return gridView;
  }
}
