import 'package:flutter/foundation.dart';

import '../models/study_list.dart';

@immutable
class StudyListFormState {
  final StudyList studyList;
  final String rawTermsInput;
  final String listNameInput;
  final String? errorMessage;
  final bool isLoading;

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
            ..name = initialListName
            ..terms = [],
      listNameInput: initialListName,
      rawTermsInput: initialRawTerms,
    );
  }

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
