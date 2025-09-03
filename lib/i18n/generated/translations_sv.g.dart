///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsSv extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsSv _root = this; // ignore: unused_field

	@override 
	TranslationsSv $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSv(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Quizlone';
	@override late final _TranslationsGeneralSv general = _TranslationsGeneralSv._(_root);
	@override late final _TranslationsDrawerSv drawer = _TranslationsDrawerSv._(_root);
	@override late final _TranslationsAboutScreenSv aboutScreen = _TranslationsAboutScreenSv._(_root);
	@override late final _TranslationsStartScreenSv startScreen = _TranslationsStartScreenSv._(_root);
	@override late final _TranslationsInputScreenSv inputScreen = _TranslationsInputScreenSv._(_root);
	@override late final _TranslationsModeSelectionScreenSv modeSelectionScreen = _TranslationsModeSelectionScreenSv._(_root);
	@override late final _TranslationsFlashcardScreenSv flashcardScreen = _TranslationsFlashcardScreenSv._(_root);
	@override late final _TranslationsLearnScreenSv learnScreen = _TranslationsLearnScreenSv._(_root);
	@override late final _TranslationsMatchScreenSv matchScreen = _TranslationsMatchScreenSv._(_root);
	@override late final _TranslationsTestScreenSv testScreen = _TranslationsTestScreenSv._(_root);
	@override late final _TranslationsResultsScreenSv resultsScreen = _TranslationsResultsScreenSv._(_root);
	@override late final _TranslationsSettingsScreenSv settingsScreen = _TranslationsSettingsScreenSv._(_root);
	@override late final _TranslationsControlsScreenSv controlsScreen = _TranslationsControlsScreenSv._(_root);
}

// Path: general
class _TranslationsGeneralSv extends TranslationsGeneralEn {
	_TranslationsGeneralSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get back => 'Tillbaka';
	@override String get cancel => 'Avbryt';
	@override String get delete => 'Ta bort';
	@override String get error => 'Fel';
	@override String get next => 'Nästa';
	@override String get previous => 'Föregående';
	@override String get saveAndContinue => 'Spara och fortsätt';
	@override String get submit => 'Skicka';
	@override String get all => 'Alla';
	@override String get loading => 'Laddar...';
	@override String genericError({required Object error}) => 'Fel: ${error}';
	@override String get reset => 'Återställ';
}

// Path: drawer
class _TranslationsDrawerSv extends TranslationsDrawerEn {
	_TranslationsDrawerSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Inställningar';
	@override String get controls => 'Kontroller';
	@override String get about => 'Om';
	@override late final _TranslationsDrawerAboutDialogSv aboutDialog = _TranslationsDrawerAboutDialogSv._(_root);
	@override String get cloudSync => 'Molnsynkronisering';
	@override String get loggedInAs => 'Inloggad som:';
	@override String get noEmail => 'Ingen e-post';
	@override String get logout => 'Logga ut';
	@override String get email => 'E-post';
	@override String get password => 'Lösenord';
	@override String get signIn => 'Logga in';
	@override String get signUp => 'Registrera dig';
	@override late final _TranslationsDrawerValidationSv validation = _TranslationsDrawerValidationSv._(_root);
	@override late final _TranslationsDrawerSnackbarsSv snackbars = _TranslationsDrawerSnackbarsSv._(_root);
}

// Path: aboutScreen
class _TranslationsAboutScreenSv extends TranslationsAboutScreenEn {
	_TranslationsAboutScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String version({required Object version}) => 'Version ${version}';
	@override String get viewLicenses => 'Visa licenser';
}

// Path: startScreen
class _TranslationsStartScreenSv extends TranslationsStartScreenEn {
	_TranslationsStartScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quizlone';
	@override String get welcome => 'Välkommen!';
	@override String get createNewList => 'Skapa ny lista';
	@override String get loadSavedList => 'Ladda sparad lista';
	@override String get noLists => 'Inga listor sparade än.';
	@override String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(count,
		one: '1 term',
		other: '${count} termer',
	);
	@override late final _TranslationsStartScreenConfirmDeleteDialogSv confirmDeleteDialog = _TranslationsStartScreenConfirmDeleteDialogSv._(_root);
	@override late final _TranslationsStartScreenRenameListDialogSv renameListDialog = _TranslationsStartScreenRenameListDialogSv._(_root);
}

// Path: inputScreen
class _TranslationsInputScreenSv extends TranslationsInputScreenEn {
	_TranslationsInputScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skapa ny lista';
	@override String get listName => 'Listans namn';
	@override String get listNameHint => 't.ex. Kapitel 1 Ordlista';
	@override String get pasteTerms => 'Klistra in dina termer nedan:';
	@override String get pasteTermsHint => '(Term på en rad, definition på nästa)';
	@override String get termsHint => 'Rättvisa\nPrincipen om moralisk riktighet\nSol\nEn stjärna som är centrum i ett planetsystem';
	@override String get saveList => 'Spara lista';
	@override late final _TranslationsInputScreenErrorsSv errors = _TranslationsInputScreenErrorsSv._(_root);
}

// Path: modeSelectionScreen
class _TranslationsModeSelectionScreenSv extends TranslationsModeSelectionScreenEn {
	_TranslationsModeSelectionScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alternativ & Läge';
	@override String get noActiveList => 'Ingen aktiv studielista hittades eller listan kunde inte laddas.';
	@override String debugActiveId({required Object id}) => 'Debug: Nuvarande aktivt ID är ${id}';
	@override String get returnToWelcome => 'Återgå till välkomstskärmen';
	@override String get flashcardOptions => 'Inställningar för bildkort';
	@override String get showTermFirst => 'Visa term först';
	@override String get showDefFirst => 'Visa definition först';
	@override String get studyOptions => 'Inställningar för Inlärning & Prov';
	@override String get askForTerm => 'Visa definition, fråga efter term';
	@override String get askForDef => 'Visa term, fråga efter definition';
	@override String get studyLength => 'Studielängd:';
	@override String get testFormat => 'Provformat';
	@override String get writtenAnswer => 'Skrivet svar';
	@override String get multipleChoice => 'Flerval';
	@override String get requireOnlyOneAnswer => 'Acceptera ett kommatecken-separerat svar';
	@override String get requireOnlyOneAnswerSubtitle => 'Om korrekt svar är \'a, b\', accepteras \'a\'';
	@override String get flashcards => 'Bildkort';
	@override String get learn => 'Inlärning';
	@override String get test => 'Prov';
	@override String get match => 'Matcha';
	@override String get backToWelcome => 'Tillbaka till välkomstskärmen';
}

// Path: flashcardScreen
class _TranslationsFlashcardScreenSv extends TranslationsFlashcardScreenEn {
	_TranslationsFlashcardScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildkort';
	@override String get noCards => 'Inga bildkort att visa.';
	@override String get noTerms => 'Inga termer tillgängliga att studera.';
	@override String get shuffle => 'Blanda';
	@override String get restart => 'Starta om';
}

// Path: learnScreen
class _TranslationsLearnScreenSv extends TranslationsLearnScreenEn {
	_TranslationsLearnScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inlärning';
	@override String get restartSession => 'Starta om inlärningssessionen';
	@override String get backToOptions => 'Tillbaka till alternativ';
	@override String get preparing => 'Förbereder nästa fråga...';
	@override String get answerHint => 'Skriv ditt svar här...';
	@override String get incorrect => 'Felaktigt';
	@override String get hint => 'Ledtråd';
	@override String get skip => 'Hoppa över';
	@override String get backToModeSelection => 'Tillbaka till lägesval';
	@override late final _TranslationsLearnScreenErrorsSv errors = _TranslationsLearnScreenErrorsSv._(_root);
	@override late final _TranslationsLearnScreenFeedbackSv feedback = _TranslationsLearnScreenFeedbackSv._(_root);
	@override late final _TranslationsLearnScreenProgressSv progress = _TranslationsLearnScreenProgressSv._(_root);
}

// Path: matchScreen
class _TranslationsMatchScreenSv extends TranslationsMatchScreenEn {
	_TranslationsMatchScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Matcha';
	@override String get congratulations => 'Grattis!';
	@override String timeCompleted({required Object time}) => 'Du klarade det på ${time} sekunder!';
	@override String get playAgain => 'Spela igen';
	@override String get backToOptions => 'Tillbaka till alternativ';
	@override late final _TranslationsMatchScreenLeaderboardSv leaderboard = _TranslationsMatchScreenLeaderboardSv._(_root);
	@override late final _TranslationsMatchScreenErrorsSv errors = _TranslationsMatchScreenErrorsSv._(_root);
}

// Path: testScreen
class _TranslationsTestScreenSv extends TranslationsTestScreenEn {
	_TranslationsTestScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prov';
	@override String get noQuestions => 'Inga frågor för detta prov.';
	@override String get viewResults => 'Visa resultat';
	@override String get submitTest => 'Lämna in provet';
	@override late final _TranslationsTestScreenErrorsSv errors = _TranslationsTestScreenErrorsSv._(_root);
}

// Path: resultsScreen
class _TranslationsResultsScreenSv extends TranslationsResultsScreenEn {
	_TranslationsResultsScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Provresultat';
	@override String get notSubmitted => 'Provet har inte lämnats in än.';
	@override String get noQuestions => 'Det fanns inga frågor i detta prov.';
	@override String get yourScore => 'Ditt resultat';
	@override String scoreFraction({required Object score, required Object total}) => '${score} / ${total} rätt';
	@override String get reviewIncorrect => 'Granska felaktiga svar:';
	@override String yourAnswerWas({required Object answer}) => 'Ditt svar: ${answer}';
	@override String get noAnswer => '(Inget svar)';
	@override String get congratulations => 'Grattis! Du hade alla rätt!';
	@override String get retryTest => 'Försök igen';
	@override String get reviewFlashcards => 'Repetera med bildkort';
	@override String get backToWelcome => 'Tillbaka till välkomstskärmen';
}

// Path: settingsScreen
class _TranslationsSettingsScreenSv extends TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inställningar';
	@override String get appearance => 'Utseende';
	@override String get language => 'Språk';
	@override String get languageDialogTitle => 'Välj språk';
	@override String get uiScaling => 'UI-skalning';
	@override String get uiScalingSubtitle => 'Justera storleken på text och gränssnittselement';
	@override String get systemDefault => 'Systemstandard';
	@override String get light => 'Ljus';
	@override String get dark => 'Mörk';
	@override String get english => 'Engelska';
	@override String get finnish => 'Finska';
	@override String get russian => 'Ryska';
	@override String get spanish => 'Spanska';
	@override String get swedish => 'Svenska';
	@override String get update => 'Uppdatering';
	@override String get checkForUpdate => 'Sök efter uppdateringar';
	@override String get checkingForUpdate => 'Söker efter uppdateringar...';
	@override String get upToDate => 'Du har den senaste versionen';
	@override String get noNewVersion => 'Ingen ny version hittades.';
	@override String updateAvailable({required Object version}) => 'Uppdatering tillgänglig: v${version}';
	@override String get tapToInstall => 'Tryck för att ladda ner och installera';
	@override String get viewReleaseNotes => 'Visa versionsinformation';
	@override String get downloadingUpdate => 'Laddar ner uppdatering...';
	@override String get updateCheckFailed => 'Kunde inte söka efter uppdateringar';
	@override String get dataManagement => 'Datahantering';
	@override String get exportData => 'Exportera data';
	@override String get exportDataSubtitle => 'Spara alla listor till en fil';
	@override String get importData => 'Importera data';
	@override String get importDataSubtitle => 'Ladda listor från en fil';
	@override String get deleteAllData => 'Ta bort all data';
	@override late final _TranslationsSettingsScreenExportDialogSv exportDialog = _TranslationsSettingsScreenExportDialogSv._(_root);
	@override late final _TranslationsSettingsScreenImportDialogSv importDialog = _TranslationsSettingsScreenImportDialogSv._(_root);
	@override late final _TranslationsSettingsScreenDeleteDialogSv deleteDialog = _TranslationsSettingsScreenDeleteDialogSv._(_root);
	@override late final _TranslationsSettingsScreenSnackbarsSv snackbars = _TranslationsSettingsScreenSnackbarsSv._(_root);
}

// Path: controlsScreen
class _TranslationsControlsScreenSv extends TranslationsControlsScreenEn {
	_TranslationsControlsScreenSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kontroller';
	@override String get gesturesTitle => 'Gester (Bildkort)';
	@override String get keyboardTitle => 'Tangentbord (Bildkort)';
	@override String get nextCard => 'Nästa kort';
	@override String get previousCard => 'Föregående kort';
	@override String get flipCard => 'Vänd kort';
	@override String get swipeLeft => 'Svep vänster';
	@override String get swipeRight => 'Svep höger';
	@override String get swipeVertical => 'Svep upp eller ner';
	@override String get arrowRight => 'Högerpiltangent';
	@override String get arrowLeft => 'Vänsterpiltangent';
	@override String get arrowVerticalOrSpace => 'Upp/ner-piltangenter eller Mellanslag';
}

// Path: drawer.aboutDialog
class _TranslationsDrawerAboutDialogSv extends TranslationsDrawerAboutDialogEn {
	_TranslationsDrawerAboutDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get legalese => '© 2025 Quizlone';
	@override String get description => 'En enkel, modern studieapplikation byggd med Flutter.';
}

// Path: drawer.validation
class _TranslationsDrawerValidationSv extends TranslationsDrawerValidationEn {
	_TranslationsDrawerValidationSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get emailEmpty => 'Vänligen ange en e-postadress';
	@override String get passwordEmpty => 'Vänligen ange ett lösenord';
}

// Path: drawer.snackbars
class _TranslationsDrawerSnackbarsSv extends TranslationsDrawerSnackbarsEn {
	_TranslationsDrawerSnackbarsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get confirmationSent => 'Bekräftelsemejl har skickats! Kontrollera din inkorg.';
	@override String get unexpectedError => 'Ett oväntat fel inträffade';
}

// Path: startScreen.confirmDeleteDialog
class _TranslationsStartScreenConfirmDeleteDialogSv extends TranslationsStartScreenConfirmDeleteDialogEn {
	_TranslationsStartScreenConfirmDeleteDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bekräfta borttagning';
	@override String content({required Object listName}) => 'Är du säker på att du vill ta bort \'${listName}\'?';
}

// Path: startScreen.renameListDialog
class _TranslationsStartScreenRenameListDialogSv extends TranslationsStartScreenRenameListDialogEn {
	_TranslationsStartScreenRenameListDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Byt namn på listan';
	@override String get rename => 'Byt namn';
	@override String get errorNameExists => 'En lista med detta namn finns redan.';
	@override String get errorNameEmpty => 'Listnamnet kan inte vara tomt.';
}

// Path: inputScreen.errors
class _TranslationsInputScreenErrorsSv extends TranslationsInputScreenErrorsEn {
	_TranslationsInputScreenErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get listNameEmpty => 'Listans namn kan inte vara tomt.';
	@override String get noTerms => 'Inga termer/definitioner inmatade.';
	@override String get invalidFormat => 'Ogiltigt format. Varje term behöver en definition på nästa rad.';
	@override String emptyTerm({required Object line}) => 'Formatfel nära rad ${line}. Tom term eller definition hittades.';
	@override String get noValidPairs => 'Inga giltiga par av term/definition hittades.';
	@override String saveFailed({required Object error}) => 'Det gick inte att spara listan: ${error}';
}

// Path: learnScreen.errors
class _TranslationsLearnScreenErrorsSv extends TranslationsLearnScreenErrorsEn {
	_TranslationsLearnScreenErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Inga termer tillgängliga för inlärningsläget.';
	@override String get notEnoughTerms => 'Inte tillräckligt med termer för den valda längden.';
}

// Path: learnScreen.feedback
class _TranslationsLearnScreenFeedbackSv extends TranslationsLearnScreenFeedbackEn {
	_TranslationsLearnScreenFeedbackSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Rätt!';
	@override String incorrect({required Object answer}) => 'Fel. Rätt svar: ${answer}';
	@override String hint({required Object char}) => 'Ledtråd: Börjar med "${char}"';
	@override String skipped({required Object answer}) => 'Överhoppad. Svaret var: ${answer}';
}

// Path: learnScreen.progress
class _TranslationsLearnScreenProgressSv extends TranslationsLearnScreenProgressEn {
	_TranslationsLearnScreenProgressSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get allLearned => 'Alla termer inlärda!';
	@override String cycleStatus({required Object cycleNum, required Object itemNum, required Object total}) => 'Omgång ${cycleNum} | Fråga ${itemNum} av ${total}';
	@override String get sessionComplete => 'Inlärningssessionen är klar! Bra jobbat!';
	@override String maxCyclesReached({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(count,
		one: 'Max antal omgångar nåddes. 1 fråga kvar att repetera.',
		other: 'Max antal omgångar nåddes. ${count} frågor kvar att repetera.',
	);
	@override String startingCycle({required Object cycleNum, required Object count}) => 'Startar omgång ${cycleNum} med ${count} fråga(or)...';
}

// Path: matchScreen.leaderboard
class _TranslationsMatchScreenLeaderboardSv extends TranslationsMatchScreenLeaderboardEn {
	_TranslationsMatchScreenLeaderboardSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Topplista';
	@override String get noRecords => 'Inga rekord än. Bli den första!';
	@override String time({required Object time}) => '${time} Sekunder';
	@override String rank({required Object rank}) => '#${rank}';
	@override String get rankOver100 => '>100';
}

// Path: matchScreen.errors
class _TranslationsMatchScreenErrorsSv extends TranslationsMatchScreenErrorsEn {
	_TranslationsMatchScreenErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Inga termer tillgängliga för Matcha-läget.';
	@override String get notEnoughTerms => 'Minst ett par med term/definition krävs för att spela.';
}

// Path: testScreen.errors
class _TranslationsTestScreenErrorsSv extends TranslationsTestScreenErrorsEn {
	_TranslationsTestScreenErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get loadFailed => 'Fel vid laddning av studielista för provet.';
	@override String get noTerms => 'Inga termer tillgängliga för provet.';
	@override String get notEnoughTerms => 'Inte tillräckligt med termer för den valda studielängden.';
}

// Path: settingsScreen.exportDialog
class _TranslationsSettingsScreenExportDialogSv extends TranslationsSettingsScreenExportDialogEn {
	_TranslationsSettingsScreenExportDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exportera data';
	@override String get content => 'Hur vill du exportera din data?';
	@override String get share => 'Dela fil';
	@override String get save => 'Spara på enheten';
	@override String get shareText => 'Här är din Quizlone-säkerhetskopia.';
}

// Path: settingsScreen.importDialog
class _TranslationsSettingsScreenImportDialogSv extends TranslationsSettingsScreenImportDialogEn {
	_TranslationsSettingsScreenImportDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bekräfta import';
	@override String get content => 'Detta kommer att importera studielistor från en fil. Befintliga listor med samma namn kommer att skrivas över. Fortsätta?';
	@override String get import => 'Importera';
}

// Path: settingsScreen.deleteDialog
class _TranslationsSettingsScreenDeleteDialogSv extends TranslationsSettingsScreenDeleteDialogEn {
	_TranslationsSettingsScreenDeleteDialogSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bekräfta borttagning';
	@override String get content => 'Är du säker på att du vill ta bort ALLA studielistor? Denna åtgärd kan inte ångras.';
	@override String get deleteAll => 'Ta bort allt';
}

// Path: settingsScreen.snackbars
class _TranslationsSettingsScreenSnackbarsSv extends TranslationsSettingsScreenSnackbarsEn {
	_TranslationsSettingsScreenSnackbarsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get noDataToExport => 'Det finns ingen data att exportera.';
	@override String get exportSuccess => 'Data exporterades framgångsrikt!';
	@override String exportError({required Object error}) => 'Fel vid export av data: ${error}';
	@override String get fileSaved => 'Filen har sparats!';
	@override String importSuccess({required Object count}) => '${count} listor importerades framgångsrikt!';
	@override String importError({required Object error}) => 'Fel vid import av data: ${error}';
	@override String get allDeleted => 'Alla studielistor har tagits bort.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSv {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Quizlone';
			case 'general.back': return 'Tillbaka';
			case 'general.cancel': return 'Avbryt';
			case 'general.delete': return 'Ta bort';
			case 'general.error': return 'Fel';
			case 'general.next': return 'Nästa';
			case 'general.previous': return 'Föregående';
			case 'general.saveAndContinue': return 'Spara och fortsätt';
			case 'general.submit': return 'Skicka';
			case 'general.all': return 'Alla';
			case 'general.loading': return 'Laddar...';
			case 'general.genericError': return ({required Object error}) => 'Fel: ${error}';
			case 'general.reset': return 'Återställ';
			case 'drawer.settings': return 'Inställningar';
			case 'drawer.controls': return 'Kontroller';
			case 'drawer.about': return 'Om';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'En enkel, modern studieapplikation byggd med Flutter.';
			case 'drawer.cloudSync': return 'Molnsynkronisering';
			case 'drawer.loggedInAs': return 'Inloggad som:';
			case 'drawer.noEmail': return 'Ingen e-post';
			case 'drawer.logout': return 'Logga ut';
			case 'drawer.email': return 'E-post';
			case 'drawer.password': return 'Lösenord';
			case 'drawer.signIn': return 'Logga in';
			case 'drawer.signUp': return 'Registrera dig';
			case 'drawer.validation.emailEmpty': return 'Vänligen ange en e-postadress';
			case 'drawer.validation.passwordEmpty': return 'Vänligen ange ett lösenord';
			case 'drawer.snackbars.confirmationSent': return 'Bekräftelsemejl har skickats! Kontrollera din inkorg.';
			case 'drawer.snackbars.unexpectedError': return 'Ett oväntat fel inträffade';
			case 'aboutScreen.version': return ({required Object version}) => 'Version ${version}';
			case 'aboutScreen.viewLicenses': return 'Visa licenser';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return 'Välkommen!';
			case 'startScreen.createNewList': return 'Skapa ny lista';
			case 'startScreen.loadSavedList': return 'Ladda sparad lista';
			case 'startScreen.noLists': return 'Inga listor sparade än.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(count,
				one: '1 term',
				other: '${count} termer',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Bekräfta borttagning';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => 'Är du säker på att du vill ta bort \'${listName}\'?';
			case 'startScreen.renameListDialog.title': return 'Byt namn på listan';
			case 'startScreen.renameListDialog.rename': return 'Byt namn';
			case 'startScreen.renameListDialog.errorNameExists': return 'En lista med detta namn finns redan.';
			case 'startScreen.renameListDialog.errorNameEmpty': return 'Listnamnet kan inte vara tomt.';
			case 'inputScreen.title': return 'Skapa ny lista';
			case 'inputScreen.listName': return 'Listans namn';
			case 'inputScreen.listNameHint': return 't.ex. Kapitel 1 Ordlista';
			case 'inputScreen.pasteTerms': return 'Klistra in dina termer nedan:';
			case 'inputScreen.pasteTermsHint': return '(Term på en rad, definition på nästa)';
			case 'inputScreen.termsHint': return 'Rättvisa\nPrincipen om moralisk riktighet\nSol\nEn stjärna som är centrum i ett planetsystem';
			case 'inputScreen.saveList': return 'Spara lista';
			case 'inputScreen.errors.listNameEmpty': return 'Listans namn kan inte vara tomt.';
			case 'inputScreen.errors.noTerms': return 'Inga termer/definitioner inmatade.';
			case 'inputScreen.errors.invalidFormat': return 'Ogiltigt format. Varje term behöver en definition på nästa rad.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Formatfel nära rad ${line}. Tom term eller definition hittades.';
			case 'inputScreen.errors.noValidPairs': return 'Inga giltiga par av term/definition hittades.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'Det gick inte att spara listan: ${error}';
			case 'modeSelectionScreen.title': return 'Alternativ & Läge';
			case 'modeSelectionScreen.noActiveList': return 'Ingen aktiv studielista hittades eller listan kunde inte laddas.';
			case 'modeSelectionScreen.debugActiveId': return ({required Object id}) => 'Debug: Nuvarande aktivt ID är ${id}';
			case 'modeSelectionScreen.returnToWelcome': return 'Återgå till välkomstskärmen';
			case 'modeSelectionScreen.flashcardOptions': return 'Inställningar för bildkort';
			case 'modeSelectionScreen.showTermFirst': return 'Visa term först';
			case 'modeSelectionScreen.showDefFirst': return 'Visa definition först';
			case 'modeSelectionScreen.studyOptions': return 'Inställningar för Inlärning & Prov';
			case 'modeSelectionScreen.askForTerm': return 'Visa definition, fråga efter term';
			case 'modeSelectionScreen.askForDef': return 'Visa term, fråga efter definition';
			case 'modeSelectionScreen.studyLength': return 'Studielängd:';
			case 'modeSelectionScreen.testFormat': return 'Provformat';
			case 'modeSelectionScreen.writtenAnswer': return 'Skrivet svar';
			case 'modeSelectionScreen.multipleChoice': return 'Flerval';
			case 'modeSelectionScreen.requireOnlyOneAnswer': return 'Acceptera ett kommatecken-separerat svar';
			case 'modeSelectionScreen.requireOnlyOneAnswerSubtitle': return 'Om korrekt svar är \'a, b\', accepteras \'a\'';
			case 'modeSelectionScreen.flashcards': return 'Bildkort';
			case 'modeSelectionScreen.learn': return 'Inlärning';
			case 'modeSelectionScreen.test': return 'Prov';
			case 'modeSelectionScreen.match': return 'Matcha';
			case 'modeSelectionScreen.backToWelcome': return 'Tillbaka till välkomstskärmen';
			case 'flashcardScreen.title': return 'Bildkort';
			case 'flashcardScreen.noCards': return 'Inga bildkort att visa.';
			case 'flashcardScreen.noTerms': return 'Inga termer tillgängliga att studera.';
			case 'flashcardScreen.shuffle': return 'Blanda';
			case 'flashcardScreen.restart': return 'Starta om';
			case 'learnScreen.title': return 'Inlärning';
			case 'learnScreen.restartSession': return 'Starta om inlärningssessionen';
			case 'learnScreen.backToOptions': return 'Tillbaka till alternativ';
			case 'learnScreen.preparing': return 'Förbereder nästa fråga...';
			case 'learnScreen.answerHint': return 'Skriv ditt svar här...';
			case 'learnScreen.incorrect': return 'Felaktigt';
			case 'learnScreen.hint': return 'Ledtråd';
			case 'learnScreen.skip': return 'Hoppa över';
			case 'learnScreen.backToModeSelection': return 'Tillbaka till lägesval';
			case 'learnScreen.errors.noTerms': return 'Inga termer tillgängliga för inlärningsläget.';
			case 'learnScreen.errors.notEnoughTerms': return 'Inte tillräckligt med termer för den valda längden.';
			case 'learnScreen.feedback.correct': return 'Rätt!';
			case 'learnScreen.feedback.incorrect': return ({required Object answer}) => 'Fel. Rätt svar: ${answer}';
			case 'learnScreen.feedback.hint': return ({required Object char}) => 'Ledtråd: Börjar med "${char}"';
			case 'learnScreen.feedback.skipped': return ({required Object answer}) => 'Överhoppad. Svaret var: ${answer}';
			case 'learnScreen.progress.allLearned': return 'Alla termer inlärda!';
			case 'learnScreen.progress.cycleStatus': return ({required Object cycleNum, required Object itemNum, required Object total}) => 'Omgång ${cycleNum} | Fråga ${itemNum} av ${total}';
			case 'learnScreen.progress.sessionComplete': return 'Inlärningssessionen är klar! Bra jobbat!';
			case 'learnScreen.progress.maxCyclesReached': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(count,
				one: 'Max antal omgångar nåddes. 1 fråga kvar att repetera.',
				other: 'Max antal omgångar nåddes. ${count} frågor kvar att repetera.',
			);
			case 'learnScreen.progress.startingCycle': return ({required Object cycleNum, required Object count}) => 'Startar omgång ${cycleNum} med ${count} fråga(or)...';
			case 'matchScreen.title': return 'Matcha';
			case 'matchScreen.congratulations': return 'Grattis!';
			case 'matchScreen.timeCompleted': return ({required Object time}) => 'Du klarade det på ${time} sekunder!';
			case 'matchScreen.playAgain': return 'Spela igen';
			case 'matchScreen.backToOptions': return 'Tillbaka till alternativ';
			case 'matchScreen.leaderboard.title': return 'Topplista';
			case 'matchScreen.leaderboard.noRecords': return 'Inga rekord än. Bli den första!';
			case 'matchScreen.leaderboard.time': return ({required Object time}) => '${time} Sekunder';
			case 'matchScreen.leaderboard.rank': return ({required Object rank}) => '#${rank}';
			case 'matchScreen.leaderboard.rankOver100': return '>100';
			case 'matchScreen.errors.noTerms': return 'Inga termer tillgängliga för Matcha-läget.';
			case 'matchScreen.errors.notEnoughTerms': return 'Minst ett par med term/definition krävs för att spela.';
			case 'testScreen.title': return 'Prov';
			case 'testScreen.noQuestions': return 'Inga frågor för detta prov.';
			case 'testScreen.viewResults': return 'Visa resultat';
			case 'testScreen.submitTest': return 'Lämna in provet';
			case 'testScreen.errors.loadFailed': return 'Fel vid laddning av studielista för provet.';
			case 'testScreen.errors.noTerms': return 'Inga termer tillgängliga för provet.';
			case 'testScreen.errors.notEnoughTerms': return 'Inte tillräckligt med termer för den valda studielängden.';
			case 'resultsScreen.title': return 'Provresultat';
			case 'resultsScreen.notSubmitted': return 'Provet har inte lämnats in än.';
			case 'resultsScreen.noQuestions': return 'Det fanns inga frågor i detta prov.';
			case 'resultsScreen.yourScore': return 'Ditt resultat';
			case 'resultsScreen.scoreFraction': return ({required Object score, required Object total}) => '${score} / ${total} rätt';
			case 'resultsScreen.reviewIncorrect': return 'Granska felaktiga svar:';
			case 'resultsScreen.yourAnswerWas': return ({required Object answer}) => 'Ditt svar: ${answer}';
			case 'resultsScreen.noAnswer': return '(Inget svar)';
			case 'resultsScreen.congratulations': return 'Grattis! Du hade alla rätt!';
			case 'resultsScreen.retryTest': return 'Försök igen';
			case 'resultsScreen.reviewFlashcards': return 'Repetera med bildkort';
			case 'resultsScreen.backToWelcome': return 'Tillbaka till välkomstskärmen';
			case 'settingsScreen.title': return 'Inställningar';
			case 'settingsScreen.appearance': return 'Utseende';
			case 'settingsScreen.language': return 'Språk';
			case 'settingsScreen.languageDialogTitle': return 'Välj språk';
			case 'settingsScreen.uiScaling': return 'UI-skalning';
			case 'settingsScreen.uiScalingSubtitle': return 'Justera storleken på text och gränssnittselement';
			case 'settingsScreen.systemDefault': return 'Systemstandard';
			case 'settingsScreen.light': return 'Ljus';
			case 'settingsScreen.dark': return 'Mörk';
			case 'settingsScreen.english': return 'Engelska';
			case 'settingsScreen.finnish': return 'Finska';
			case 'settingsScreen.russian': return 'Ryska';
			case 'settingsScreen.spanish': return 'Spanska';
			case 'settingsScreen.swedish': return 'Svenska';
			case 'settingsScreen.update': return 'Uppdatering';
			case 'settingsScreen.checkForUpdate': return 'Sök efter uppdateringar';
			case 'settingsScreen.checkingForUpdate': return 'Söker efter uppdateringar...';
			case 'settingsScreen.upToDate': return 'Du har den senaste versionen';
			case 'settingsScreen.noNewVersion': return 'Ingen ny version hittades.';
			case 'settingsScreen.updateAvailable': return ({required Object version}) => 'Uppdatering tillgänglig: v${version}';
			case 'settingsScreen.tapToInstall': return 'Tryck för att ladda ner och installera';
			case 'settingsScreen.viewReleaseNotes': return 'Visa versionsinformation';
			case 'settingsScreen.downloadingUpdate': return 'Laddar ner uppdatering...';
			case 'settingsScreen.updateCheckFailed': return 'Kunde inte söka efter uppdateringar';
			case 'settingsScreen.dataManagement': return 'Datahantering';
			case 'settingsScreen.exportData': return 'Exportera data';
			case 'settingsScreen.exportDataSubtitle': return 'Spara alla listor till en fil';
			case 'settingsScreen.importData': return 'Importera data';
			case 'settingsScreen.importDataSubtitle': return 'Ladda listor från en fil';
			case 'settingsScreen.deleteAllData': return 'Ta bort all data';
			case 'settingsScreen.exportDialog.title': return 'Exportera data';
			case 'settingsScreen.exportDialog.content': return 'Hur vill du exportera din data?';
			case 'settingsScreen.exportDialog.share': return 'Dela fil';
			case 'settingsScreen.exportDialog.save': return 'Spara på enheten';
			case 'settingsScreen.exportDialog.shareText': return 'Här är din Quizlone-säkerhetskopia.';
			case 'settingsScreen.importDialog.title': return 'Bekräfta import';
			case 'settingsScreen.importDialog.content': return 'Detta kommer att importera studielistor från en fil. Befintliga listor med samma namn kommer att skrivas över. Fortsätta?';
			case 'settingsScreen.importDialog.import': return 'Importera';
			case 'settingsScreen.deleteDialog.title': return 'Bekräfta borttagning';
			case 'settingsScreen.deleteDialog.content': return 'Är du säker på att du vill ta bort ALLA studielistor? Denna åtgärd kan inte ångras.';
			case 'settingsScreen.deleteDialog.deleteAll': return 'Ta bort allt';
			case 'settingsScreen.snackbars.noDataToExport': return 'Det finns ingen data att exportera.';
			case 'settingsScreen.snackbars.exportSuccess': return 'Data exporterades framgångsrikt!';
			case 'settingsScreen.snackbars.exportError': return ({required Object error}) => 'Fel vid export av data: ${error}';
			case 'settingsScreen.snackbars.fileSaved': return 'Filen har sparats!';
			case 'settingsScreen.snackbars.importSuccess': return ({required Object count}) => '${count} listor importerades framgångsrikt!';
			case 'settingsScreen.snackbars.importError': return ({required Object error}) => 'Fel vid import av data: ${error}';
			case 'settingsScreen.snackbars.allDeleted': return 'Alla studielistor har tagits bort.';
			case 'controlsScreen.title': return 'Kontroller';
			case 'controlsScreen.gesturesTitle': return 'Gester (Bildkort)';
			case 'controlsScreen.keyboardTitle': return 'Tangentbord (Bildkort)';
			case 'controlsScreen.nextCard': return 'Nästa kort';
			case 'controlsScreen.previousCard': return 'Föregående kort';
			case 'controlsScreen.flipCard': return 'Vänd kort';
			case 'controlsScreen.swipeLeft': return 'Svep vänster';
			case 'controlsScreen.swipeRight': return 'Svep höger';
			case 'controlsScreen.swipeVertical': return 'Svep upp eller ner';
			case 'controlsScreen.arrowRight': return 'Högerpiltangent';
			case 'controlsScreen.arrowLeft': return 'Vänsterpiltangent';
			case 'controlsScreen.arrowVerticalOrSpace': return 'Upp/ner-piltangenter eller Mellanslag';
			default: return null;
		}
	}
}

