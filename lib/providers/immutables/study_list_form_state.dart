import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../models/study_list.dart';

const _uuid = Uuid();

@immutable
class StudyListFormState {
  const StudyListFormState({
    required this.studyList,
    this.rawTermsInput = "",
    this.listNameInput = "",
    this.errorMessage,
    this.isLoading = false,
  });

  factory StudyListFormState.initial() {
    String initialListName = "";
    String initialRawTerms = "";
    return StudyListFormState(
      studyList:
          StudyList()
            ..id = _uuid.v4()
            ..name = initialListName
            ..terms = [],
      listNameInput: initialListName,
      rawTermsInput: initialRawTerms,
    );
  }

  final String? errorMessage;
  final bool isLoading;
  final String listNameInput;
  final String rawTermsInput;
  final StudyList studyList;

  StudyListFormState copyWith({
    StudyList? studyList,
    String? rawTermsInput,
    String? listNameInput,
    String? errorMessage,
    bool? isLoading,
    bool clearError = false,
  }) {
    return StudyListFormState(
      studyList: studyList ?? this.studyList,
      rawTermsInput: rawTermsInput ?? this.rawTermsInput,
      listNameInput: listNameInput ?? this.listNameInput,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
