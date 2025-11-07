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
    this.selectedGroupId,
    this.errorMessage,
    this.isLoading = false,
  });

  factory StudyListFormState.initial() {
    String initialListName = "";
    String initialRawTerms = "";
    return StudyListFormState(
      studyList: StudyList()
        ..id = _uuid.v4()
        ..name = initialListName
        ..terms = [],
      listNameInput: initialListName,
      rawTermsInput: initialRawTerms,
      selectedGroupId: null,
    );
  }

  final String? errorMessage;
  final bool isLoading;
  final String listNameInput;
  final String rawTermsInput;
  final String? selectedGroupId;
  final StudyList studyList;

  StudyListFormState copyWith({
    StudyList? studyList,
    String? rawTermsInput,
    String? listNameInput,
    String? selectedGroupId,
    String? errorMessage,
    bool? isLoading,
    bool clearError = false,
  }) {
    return StudyListFormState(
      studyList: studyList ?? this.studyList,
      rawTermsInput: rawTermsInput ?? this.rawTermsInput,
      listNameInput: listNameInput ?? this.listNameInput,
      selectedGroupId: selectedGroupId ?? this.selectedGroupId,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
