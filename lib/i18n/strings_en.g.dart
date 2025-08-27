///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Quizlone'
	String get appName => 'Quizlone';

	late final TranslationsGeneralEn general = TranslationsGeneralEn._(_root);
	late final TranslationsDrawerEn drawer = TranslationsDrawerEn._(_root);
	late final TranslationsStartScreenEn startScreen = TranslationsStartScreenEn._(_root);
	late final TranslationsInputScreenEn inputScreen = TranslationsInputScreenEn._(_root);
	late final TranslationsModeSelectionScreenEn modeSelectionScreen = TranslationsModeSelectionScreenEn._(_root);
	late final TranslationsFlashcardScreenEn flashcardScreen = TranslationsFlashcardScreenEn._(_root);
	late final TranslationsLearnScreenEn learnScreen = TranslationsLearnScreenEn._(_root);
	late final TranslationsTestScreenEn testScreen = TranslationsTestScreenEn._(_root);
	late final TranslationsResultsScreenEn resultsScreen = TranslationsResultsScreenEn._(_root);
	late final TranslationsSettingsScreenEn settingsScreen = TranslationsSettingsScreenEn._(_root);
	late final TranslationsControlsScreenEn controlsScreen = TranslationsControlsScreenEn._(_root);
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Save and Continue'
	String get saveAndContinue => 'Save and Continue';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error: $error'
	String genericError({required Object error}) => 'Error: ${error}';

	/// en: 'Reset'
	String get reset => 'Reset';
}

// Path: drawer
class TranslationsDrawerEn {
	TranslationsDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Controls'
	String get controls => 'Controls';

	/// en: 'About'
	String get about => 'About';

	late final TranslationsDrawerAboutDialogEn aboutDialog = TranslationsDrawerAboutDialogEn._(_root);
}

// Path: startScreen
class TranslationsStartScreenEn {
	TranslationsStartScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quizlone'
	String get title => 'Quizlone';

	/// en: 'Welcome!'
	String get welcome => 'Welcome!';

	/// en: 'Create New List'
	String get createNewList => 'Create New List';

	/// en: 'Load Saved List'
	String get loadSavedList => 'Load Saved List';

	/// en: 'No lists saved yet.'
	String get noLists => 'No lists saved yet.';

	/// en: '(one) {1 term} (other) {$count terms}'
	String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		one: '1 term',
		other: '${count} terms',
	);

	late final TranslationsStartScreenConfirmDeleteDialogEn confirmDeleteDialog = TranslationsStartScreenConfirmDeleteDialogEn._(_root);
}

// Path: inputScreen
class TranslationsInputScreenEn {
	TranslationsInputScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create New List'
	String get title => 'Create New List';

	/// en: 'List Name'
	String get listName => 'List Name';

	/// en: 'e.g., Chapter 1 Vocabulary'
	String get listNameHint => 'e.g., Chapter 1 Vocabulary';

	/// en: 'Paste your terms below:'
	String get pasteTerms => 'Paste your terms below:';

	/// en: '(Term on one line, Definition on the next)'
	String get pasteTermsHint => '(Term on one line, Definition on the next)';

	/// en: 'Justice The principle of moral rightness Sun A star that is the center of a planetary system'
	String get termsHint => 'Justice\nThe principle of moral rightness\nSun\nA star that is the center of a planetary system';

	/// en: 'Save List'
	String get saveList => 'Save List';

	late final TranslationsInputScreenErrorsEn errors = TranslationsInputScreenErrorsEn._(_root);
}

// Path: modeSelectionScreen
class TranslationsModeSelectionScreenEn {
	TranslationsModeSelectionScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Options & Mode'
	String get title => 'Options & Mode';

	/// en: 'No active study list found or list could not be loaded.'
	String get noActiveList => 'No active study list found or list could not be loaded.';

	/// en: 'Debug: Current Active ID is $id'
	String debugActiveId({required Object id}) => 'Debug: Current Active ID is ${id}';

	/// en: 'Return to Welcome Screen'
	String get returnToWelcome => 'Return to Welcome Screen';

	/// en: 'Flashcard Options'
	String get flashcardOptions => 'Flashcard Options';

	/// en: 'Show Term First'
	String get showTermFirst => 'Show Term First';

	/// en: 'Show Definition First'
	String get showDefFirst => 'Show Definition First';

	/// en: 'Learn & Test Options'
	String get studyOptions => 'Learn & Test Options';

	/// en: 'Show Definition, Ask for Term'
	String get askForTerm => 'Show Definition, Ask for Term';

	/// en: 'Show Term, Ask for Definition'
	String get askForDef => 'Show Term, Ask for Definition';

	/// en: 'Study Length:'
	String get studyLength => 'Study Length:';

	/// en: 'Test Format'
	String get testFormat => 'Test Format';

	/// en: 'Written Answer'
	String get writtenAnswer => 'Written Answer';

	/// en: 'Multiple Choice'
	String get multipleChoice => 'Multiple Choice';

	/// en: 'Flashcards'
	String get flashcards => 'Flashcards';

	/// en: 'Learn'
	String get learn => 'Learn';

	/// en: 'Test'
	String get test => 'Test';

	/// en: 'Back to Welcome Screen'
	String get backToWelcome => 'Back to Welcome Screen';
}

// Path: flashcardScreen
class TranslationsFlashcardScreenEn {
	TranslationsFlashcardScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Flashcards'
	String get title => 'Flashcards';

	/// en: 'No flashcards to display.'
	String get noCards => 'No flashcards to display.';

	/// en: 'No terms available to study.'
	String get noTerms => 'No terms available to study.';

	/// en: 'Shuffle'
	String get shuffle => 'Shuffle';

	/// en: 'Restart'
	String get restart => 'Restart';
}

// Path: learnScreen
class TranslationsLearnScreenEn {
	TranslationsLearnScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Learn'
	String get title => 'Learn';

	/// en: 'Restart Learn Session'
	String get restartSession => 'Restart Learn Session';

	/// en: 'Back to Options'
	String get backToOptions => 'Back to Options';

	/// en: 'Preparing next question...'
	String get preparing => 'Preparing next question...';

	/// en: 'Type your answer here...'
	String get answerHint => 'Type your answer here...';

	/// en: 'Incorrect'
	String get incorrect => 'Incorrect';

	/// en: 'Hint'
	String get hint => 'Hint';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Back to Mode Selection'
	String get backToModeSelection => 'Back to Mode Selection';

	late final TranslationsLearnScreenErrorsEn errors = TranslationsLearnScreenErrorsEn._(_root);
	late final TranslationsLearnScreenFeedbackEn feedback = TranslationsLearnScreenFeedbackEn._(_root);
	late final TranslationsLearnScreenProgressEn progress = TranslationsLearnScreenProgressEn._(_root);
}

// Path: testScreen
class TranslationsTestScreenEn {
	TranslationsTestScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Test'
	String get title => 'Test';

	/// en: 'No questions for this test.'
	String get noQuestions => 'No questions for this test.';

	/// en: 'View Results'
	String get viewResults => 'View Results';

	/// en: 'Submit Test'
	String get submitTest => 'Submit Test';

	late final TranslationsTestScreenErrorsEn errors = TranslationsTestScreenErrorsEn._(_root);
}

// Path: resultsScreen
class TranslationsResultsScreenEn {
	TranslationsResultsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Test Results'
	String get title => 'Test Results';

	/// en: 'Test not submitted yet.'
	String get notSubmitted => 'Test not submitted yet.';

	/// en: 'No questions were in this test.'
	String get noQuestions => 'No questions were in this test.';

	/// en: 'Your Score'
	String get yourScore => 'Your Score';

	/// en: '$score / $total Correct'
	String scoreFraction({required Object score, required Object total}) => '${score} / ${total} Correct';

	/// en: 'Review Incorrect Answers:'
	String get reviewIncorrect => 'Review Incorrect Answers:';

	/// en: 'Your Answer: $answer'
	String yourAnswerWas({required Object answer}) => 'Your Answer: ${answer}';

	/// en: '(No answer)'
	String get noAnswer => '(No answer)';

	/// en: 'Congratulations! You got everything right!'
	String get congratulations => 'Congratulations! You got everything right!';

	/// en: 'Retry Test'
	String get retryTest => 'Retry Test';

	/// en: 'Review with Flashcards'
	String get reviewFlashcards => 'Review with Flashcards';

	/// en: 'Back to Welcome Screen'
	String get backToWelcome => 'Back to Welcome Screen';
}

// Path: settingsScreen
class TranslationsSettingsScreenEn {
	TranslationsSettingsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Appearance'
	String get appearance => 'Appearance';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Select Language'
	String get languageDialogTitle => 'Select Language';

	/// en: 'UI Scaling'
	String get uiScaling => 'UI Scaling';

	/// en: 'Adjust the size of text and interface elements'
	String get uiScalingSubtitle => 'Adjust the size of text and interface elements';

	/// en: 'System Default'
	String get systemDefault => 'System Default';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Finnish'
	String get finnish => 'Finnish';

	/// en: 'Data Management'
	String get dataManagement => 'Data Management';

	/// en: 'Export Data'
	String get exportData => 'Export Data';

	/// en: 'Save all lists to a file'
	String get exportDataSubtitle => 'Save all lists to a file';

	/// en: 'Import Data'
	String get importData => 'Import Data';

	/// en: 'Load lists from a file'
	String get importDataSubtitle => 'Load lists from a file';

	/// en: 'Delete All Data'
	String get deleteAllData => 'Delete All Data';

	late final TranslationsSettingsScreenExportDialogEn exportDialog = TranslationsSettingsScreenExportDialogEn._(_root);
	late final TranslationsSettingsScreenImportDialogEn importDialog = TranslationsSettingsScreenImportDialogEn._(_root);
	late final TranslationsSettingsScreenDeleteDialogEn deleteDialog = TranslationsSettingsScreenDeleteDialogEn._(_root);
	late final TranslationsSettingsScreenSnackbarsEn snackbars = TranslationsSettingsScreenSnackbarsEn._(_root);
}

// Path: controlsScreen
class TranslationsControlsScreenEn {
	TranslationsControlsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Controls'
	String get title => 'Controls';

	/// en: 'Gestures (Flashcards)'
	String get gesturesTitle => 'Gestures (Flashcards)';

	/// en: 'Keyboard (Flashcards)'
	String get keyboardTitle => 'Keyboard (Flashcards)';

	/// en: 'Next Card'
	String get nextCard => 'Next Card';

	/// en: 'Previous Card'
	String get previousCard => 'Previous Card';

	/// en: 'Flip Card'
	String get flipCard => 'Flip Card';

	/// en: 'Swipe Left'
	String get swipeLeft => 'Swipe Left';

	/// en: 'Swipe Right'
	String get swipeRight => 'Swipe Right';

	/// en: 'Swipe Up or Down'
	String get swipeVertical => 'Swipe Up or Down';

	/// en: 'Right Arrow Key'
	String get arrowRight => 'Right Arrow Key';

	/// en: 'Left Arrow Key'
	String get arrowLeft => 'Left Arrow Key';

	/// en: 'Up/Down Arrow or Spacebar'
	String get arrowVerticalOrSpace => 'Up/Down Arrow or Spacebar';
}

// Path: drawer.aboutDialog
class TranslationsDrawerAboutDialogEn {
	TranslationsDrawerAboutDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '© 2025 Quizlone'
	String get legalese => '© 2025 Quizlone';

	/// en: 'A simple, modern study application built with Flutter.'
	String get description => 'A simple, modern study application built with Flutter.';
}

// Path: startScreen.confirmDeleteDialog
class TranslationsStartScreenConfirmDeleteDialogEn {
	TranslationsStartScreenConfirmDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Delete'
	String get title => 'Confirm Delete';

	/// en: 'Are you sure you want to delete '$listName'?'
	String content({required Object listName}) => 'Are you sure you want to delete \'${listName}\'?';
}

// Path: inputScreen.errors
class TranslationsInputScreenErrorsEn {
	TranslationsInputScreenErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'List name cannot be empty.'
	String get listNameEmpty => 'List name cannot be empty.';

	/// en: 'No terms/definitions entered.'
	String get noTerms => 'No terms/definitions entered.';

	/// en: 'Invalid format. Each term needs a definition on the next line.'
	String get invalidFormat => 'Invalid format. Each term needs a definition on the next line.';

	/// en: 'Format error near line $line. Empty term or definition found.'
	String emptyTerm({required Object line}) => 'Format error near line ${line}. Empty term or definition found.';

	/// en: 'No valid term/definition pairs found.'
	String get noValidPairs => 'No valid term/definition pairs found.';

	/// en: 'Failed to save list: $error'
	String saveFailed({required Object error}) => 'Failed to save list: ${error}';
}

// Path: learnScreen.errors
class TranslationsLearnScreenErrorsEn {
	TranslationsLearnScreenErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No terms available for Learn mode.'
	String get noTerms => 'No terms available for Learn mode.';

	/// en: 'Not enough terms for selected length.'
	String get notEnoughTerms => 'Not enough terms for selected length.';
}

// Path: learnScreen.feedback
class TranslationsLearnScreenFeedbackEn {
	TranslationsLearnScreenFeedbackEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Correct!'
	String get correct => 'Correct!';

	/// en: 'Incorrect. Correct answer: $answer'
	String incorrect({required Object answer}) => 'Incorrect. Correct answer: ${answer}';

	/// en: 'Hint: Starts with "$char"'
	String hint({required Object char}) => 'Hint: Starts with "${char}"';

	/// en: 'Skipped. The answer was: $answer'
	String skipped({required Object answer}) => 'Skipped. The answer was: ${answer}';
}

// Path: learnScreen.progress
class TranslationsLearnScreenProgressEn {
	TranslationsLearnScreenProgressEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All terms learned!'
	String get allLearned => 'All terms learned!';

	/// en: 'Cycle $cycleNum | Item $itemNum of $total'
	String cycleStatus({required Object cycleNum, required Object itemNum, required Object total}) => 'Cycle ${cycleNum} | Item ${itemNum} of ${total}';

	/// en: 'Learn session complete! Well done!'
	String get sessionComplete => 'Learn session complete! Well done!';

	/// en: '(one) {Max cycles reached. 1 item still to review.} (other) {Max cycles reached. $count items still to review.}'
	String maxCyclesReached({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		one: 'Max cycles reached. 1 item still to review.',
		other: 'Max cycles reached. ${count} items still to review.',
	);

	/// en: 'Starting Cycle $cycleNum with $count item(s)...'
	String startingCycle({required Object cycleNum, required Object count}) => 'Starting Cycle ${cycleNum} with ${count} item(s)...';
}

// Path: testScreen.errors
class TranslationsTestScreenErrorsEn {
	TranslationsTestScreenErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error loading study list for test.'
	String get loadFailed => 'Error loading study list for test.';

	/// en: 'No terms available for the test.'
	String get noTerms => 'No terms available for the test.';

	/// en: 'Not enough terms for the selected study length.'
	String get notEnoughTerms => 'Not enough terms for the selected study length.';
}

// Path: settingsScreen.exportDialog
class TranslationsSettingsScreenExportDialogEn {
	TranslationsSettingsScreenExportDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Export Data'
	String get title => 'Export Data';

	/// en: 'How would you like to export your data?'
	String get content => 'How would you like to export your data?';

	/// en: 'Share File'
	String get share => 'Share File';

	/// en: 'Save to Device'
	String get save => 'Save to Device';
}

// Path: settingsScreen.importDialog
class TranslationsSettingsScreenImportDialogEn {
	TranslationsSettingsScreenImportDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Import'
	String get title => 'Confirm Import';

	/// en: 'This will import study lists from a file. Any existing lists with the same name will be overwritten. Continue?'
	String get content => 'This will import study lists from a file. Any existing lists with the same name will be overwritten. Continue?';

	/// en: 'Import'
	String get import => 'Import';
}

// Path: settingsScreen.deleteDialog
class TranslationsSettingsScreenDeleteDialogEn {
	TranslationsSettingsScreenDeleteDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Deletion'
	String get title => 'Confirm Deletion';

	/// en: 'Are you sure you want to delete ALL study lists? This action cannot be undone.'
	String get content => 'Are you sure you want to delete ALL study lists? This action cannot be undone.';

	/// en: 'Delete All'
	String get deleteAll => 'Delete All';
}

// Path: settingsScreen.snackbars
class TranslationsSettingsScreenSnackbarsEn {
	TranslationsSettingsScreenSnackbarsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'There is no data to export.'
	String get noDataToExport => 'There is no data to export.';

	/// en: 'Data exported successfully!'
	String get exportSuccess => 'Data exported successfully!';

	/// en: 'Error exporting data: $error'
	String exportError({required Object error}) => 'Error exporting data: ${error}';

	/// en: 'File saved successfully!'
	String get fileSaved => 'File saved successfully!';

	/// en: '$count lists imported successfully!'
	String importSuccess({required Object count}) => '${count} lists imported successfully!';

	/// en: 'Error importing data: $error'
	String importError({required Object error}) => 'Error importing data: ${error}';

	/// en: 'All study lists have been deleted.'
	String get allDeleted => 'All study lists have been deleted.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Quizlone';
			case 'general.back': return 'Back';
			case 'general.cancel': return 'Cancel';
			case 'general.delete': return 'Delete';
			case 'general.error': return 'Error';
			case 'general.next': return 'Next';
			case 'general.previous': return 'Previous';
			case 'general.saveAndContinue': return 'Save and Continue';
			case 'general.submit': return 'Submit';
			case 'general.all': return 'All';
			case 'general.loading': return 'Loading...';
			case 'general.genericError': return ({required Object error}) => 'Error: ${error}';
			case 'general.reset': return 'Reset';
			case 'drawer.settings': return 'Settings';
			case 'drawer.controls': return 'Controls';
			case 'drawer.about': return 'About';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'A simple, modern study application built with Flutter.';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return 'Welcome!';
			case 'startScreen.createNewList': return 'Create New List';
			case 'startScreen.loadSavedList': return 'Load Saved List';
			case 'startScreen.noLists': return 'No lists saved yet.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
				one: '1 term',
				other: '${count} terms',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Confirm Delete';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => 'Are you sure you want to delete \'${listName}\'?';
			case 'inputScreen.title': return 'Create New List';
			case 'inputScreen.listName': return 'List Name';
			case 'inputScreen.listNameHint': return 'e.g., Chapter 1 Vocabulary';
			case 'inputScreen.pasteTerms': return 'Paste your terms below:';
			case 'inputScreen.pasteTermsHint': return '(Term on one line, Definition on the next)';
			case 'inputScreen.termsHint': return 'Justice\nThe principle of moral rightness\nSun\nA star that is the center of a planetary system';
			case 'inputScreen.saveList': return 'Save List';
			case 'inputScreen.errors.listNameEmpty': return 'List name cannot be empty.';
			case 'inputScreen.errors.noTerms': return 'No terms/definitions entered.';
			case 'inputScreen.errors.invalidFormat': return 'Invalid format. Each term needs a definition on the next line.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Format error near line ${line}. Empty term or definition found.';
			case 'inputScreen.errors.noValidPairs': return 'No valid term/definition pairs found.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'Failed to save list: ${error}';
			case 'modeSelectionScreen.title': return 'Options & Mode';
			case 'modeSelectionScreen.noActiveList': return 'No active study list found or list could not be loaded.';
			case 'modeSelectionScreen.debugActiveId': return ({required Object id}) => 'Debug: Current Active ID is ${id}';
			case 'modeSelectionScreen.returnToWelcome': return 'Return to Welcome Screen';
			case 'modeSelectionScreen.flashcardOptions': return 'Flashcard Options';
			case 'modeSelectionScreen.showTermFirst': return 'Show Term First';
			case 'modeSelectionScreen.showDefFirst': return 'Show Definition First';
			case 'modeSelectionScreen.studyOptions': return 'Learn & Test Options';
			case 'modeSelectionScreen.askForTerm': return 'Show Definition, Ask for Term';
			case 'modeSelectionScreen.askForDef': return 'Show Term, Ask for Definition';
			case 'modeSelectionScreen.studyLength': return 'Study Length:';
			case 'modeSelectionScreen.testFormat': return 'Test Format';
			case 'modeSelectionScreen.writtenAnswer': return 'Written Answer';
			case 'modeSelectionScreen.multipleChoice': return 'Multiple Choice';
			case 'modeSelectionScreen.flashcards': return 'Flashcards';
			case 'modeSelectionScreen.learn': return 'Learn';
			case 'modeSelectionScreen.test': return 'Test';
			case 'modeSelectionScreen.backToWelcome': return 'Back to Welcome Screen';
			case 'flashcardScreen.title': return 'Flashcards';
			case 'flashcardScreen.noCards': return 'No flashcards to display.';
			case 'flashcardScreen.noTerms': return 'No terms available to study.';
			case 'flashcardScreen.shuffle': return 'Shuffle';
			case 'flashcardScreen.restart': return 'Restart';
			case 'learnScreen.title': return 'Learn';
			case 'learnScreen.restartSession': return 'Restart Learn Session';
			case 'learnScreen.backToOptions': return 'Back to Options';
			case 'learnScreen.preparing': return 'Preparing next question...';
			case 'learnScreen.answerHint': return 'Type your answer here...';
			case 'learnScreen.incorrect': return 'Incorrect';
			case 'learnScreen.hint': return 'Hint';
			case 'learnScreen.skip': return 'Skip';
			case 'learnScreen.backToModeSelection': return 'Back to Mode Selection';
			case 'learnScreen.errors.noTerms': return 'No terms available for Learn mode.';
			case 'learnScreen.errors.notEnoughTerms': return 'Not enough terms for selected length.';
			case 'learnScreen.feedback.correct': return 'Correct!';
			case 'learnScreen.feedback.incorrect': return ({required Object answer}) => 'Incorrect. Correct answer: ${answer}';
			case 'learnScreen.feedback.hint': return ({required Object char}) => 'Hint: Starts with "${char}"';
			case 'learnScreen.feedback.skipped': return ({required Object answer}) => 'Skipped. The answer was: ${answer}';
			case 'learnScreen.progress.allLearned': return 'All terms learned!';
			case 'learnScreen.progress.cycleStatus': return ({required Object cycleNum, required Object itemNum, required Object total}) => 'Cycle ${cycleNum} | Item ${itemNum} of ${total}';
			case 'learnScreen.progress.sessionComplete': return 'Learn session complete! Well done!';
			case 'learnScreen.progress.maxCyclesReached': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
				one: 'Max cycles reached. 1 item still to review.',
				other: 'Max cycles reached. ${count} items still to review.',
			);
			case 'learnScreen.progress.startingCycle': return ({required Object cycleNum, required Object count}) => 'Starting Cycle ${cycleNum} with ${count} item(s)...';
			case 'testScreen.title': return 'Test';
			case 'testScreen.noQuestions': return 'No questions for this test.';
			case 'testScreen.viewResults': return 'View Results';
			case 'testScreen.submitTest': return 'Submit Test';
			case 'testScreen.errors.loadFailed': return 'Error loading study list for test.';
			case 'testScreen.errors.noTerms': return 'No terms available for the test.';
			case 'testScreen.errors.notEnoughTerms': return 'Not enough terms for the selected study length.';
			case 'resultsScreen.title': return 'Test Results';
			case 'resultsScreen.notSubmitted': return 'Test not submitted yet.';
			case 'resultsScreen.noQuestions': return 'No questions were in this test.';
			case 'resultsScreen.yourScore': return 'Your Score';
			case 'resultsScreen.scoreFraction': return ({required Object score, required Object total}) => '${score} / ${total} Correct';
			case 'resultsScreen.reviewIncorrect': return 'Review Incorrect Answers:';
			case 'resultsScreen.yourAnswerWas': return ({required Object answer}) => 'Your Answer: ${answer}';
			case 'resultsScreen.noAnswer': return '(No answer)';
			case 'resultsScreen.congratulations': return 'Congratulations! You got everything right!';
			case 'resultsScreen.retryTest': return 'Retry Test';
			case 'resultsScreen.reviewFlashcards': return 'Review with Flashcards';
			case 'resultsScreen.backToWelcome': return 'Back to Welcome Screen';
			case 'settingsScreen.title': return 'Settings';
			case 'settingsScreen.appearance': return 'Appearance';
			case 'settingsScreen.language': return 'Language';
			case 'settingsScreen.languageDialogTitle': return 'Select Language';
			case 'settingsScreen.uiScaling': return 'UI Scaling';
			case 'settingsScreen.uiScalingSubtitle': return 'Adjust the size of text and interface elements';
			case 'settingsScreen.systemDefault': return 'System Default';
			case 'settingsScreen.light': return 'Light';
			case 'settingsScreen.dark': return 'Dark';
			case 'settingsScreen.english': return 'English';
			case 'settingsScreen.finnish': return 'Finnish';
			case 'settingsScreen.dataManagement': return 'Data Management';
			case 'settingsScreen.exportData': return 'Export Data';
			case 'settingsScreen.exportDataSubtitle': return 'Save all lists to a file';
			case 'settingsScreen.importData': return 'Import Data';
			case 'settingsScreen.importDataSubtitle': return 'Load lists from a file';
			case 'settingsScreen.deleteAllData': return 'Delete All Data';
			case 'settingsScreen.exportDialog.title': return 'Export Data';
			case 'settingsScreen.exportDialog.content': return 'How would you like to export your data?';
			case 'settingsScreen.exportDialog.share': return 'Share File';
			case 'settingsScreen.exportDialog.save': return 'Save to Device';
			case 'settingsScreen.importDialog.title': return 'Confirm Import';
			case 'settingsScreen.importDialog.content': return 'This will import study lists from a file. Any existing lists with the same name will be overwritten. Continue?';
			case 'settingsScreen.importDialog.import': return 'Import';
			case 'settingsScreen.deleteDialog.title': return 'Confirm Deletion';
			case 'settingsScreen.deleteDialog.content': return 'Are you sure you want to delete ALL study lists? This action cannot be undone.';
			case 'settingsScreen.deleteDialog.deleteAll': return 'Delete All';
			case 'settingsScreen.snackbars.noDataToExport': return 'There is no data to export.';
			case 'settingsScreen.snackbars.exportSuccess': return 'Data exported successfully!';
			case 'settingsScreen.snackbars.exportError': return ({required Object error}) => 'Error exporting data: ${error}';
			case 'settingsScreen.snackbars.fileSaved': return 'File saved successfully!';
			case 'settingsScreen.snackbars.importSuccess': return ({required Object count}) => '${count} lists imported successfully!';
			case 'settingsScreen.snackbars.importError': return ({required Object error}) => 'Error importing data: ${error}';
			case 'settingsScreen.snackbars.allDeleted': return 'All study lists have been deleted.';
			case 'controlsScreen.title': return 'Controls';
			case 'controlsScreen.gesturesTitle': return 'Gestures (Flashcards)';
			case 'controlsScreen.keyboardTitle': return 'Keyboard (Flashcards)';
			case 'controlsScreen.nextCard': return 'Next Card';
			case 'controlsScreen.previousCard': return 'Previous Card';
			case 'controlsScreen.flipCard': return 'Flip Card';
			case 'controlsScreen.swipeLeft': return 'Swipe Left';
			case 'controlsScreen.swipeRight': return 'Swipe Right';
			case 'controlsScreen.swipeVertical': return 'Swipe Up or Down';
			case 'controlsScreen.arrowRight': return 'Right Arrow Key';
			case 'controlsScreen.arrowLeft': return 'Left Arrow Key';
			case 'controlsScreen.arrowVerticalOrSpace': return 'Up/Down Arrow or Spacebar';
			default: return null;
		}
	}
}

