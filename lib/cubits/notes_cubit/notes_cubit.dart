
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? noteList;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    noteList = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
