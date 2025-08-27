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
class TranslationsFi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFi _root = this; // ignore: unused_field

	@override 
	TranslationsFi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFi(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Quizlone';
	@override late final _TranslationsGeneralFi general = _TranslationsGeneralFi._(_root);
	@override late final _TranslationsDrawerFi drawer = _TranslationsDrawerFi._(_root);
	@override late final _TranslationsStartScreenFi startScreen = _TranslationsStartScreenFi._(_root);
	@override late final _TranslationsInputScreenFi inputScreen = _TranslationsInputScreenFi._(_root);
	@override late final _TranslationsModeSelectionScreenFi modeSelectionScreen = _TranslationsModeSelectionScreenFi._(_root);
	@override late final _TranslationsFlashcardScreenFi flashcardScreen = _TranslationsFlashcardScreenFi._(_root);
	@override late final _TranslationsLearnScreenFi learnScreen = _TranslationsLearnScreenFi._(_root);
	@override late final _TranslationsTestScreenFi testScreen = _TranslationsTestScreenFi._(_root);
	@override late final _TranslationsResultsScreenFi resultsScreen = _TranslationsResultsScreenFi._(_root);
	@override late final _TranslationsSettingsScreenFi settingsScreen = _TranslationsSettingsScreenFi._(_root);
}

// Path: general
class _TranslationsGeneralFi extends TranslationsGeneralEn {
	_TranslationsGeneralFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get back => 'Takaisin';
	@override String get cancel => 'Peruuta';
	@override String get delete => 'Poista';
	@override String get error => 'Virhe';
	@override String get next => 'Seuraava';
	@override String get previous => 'Edellinen';
	@override String get saveAndContinue => 'Tallenna ja jatka';
	@override String get submit => 'Lähetä';
	@override String get all => 'Kaikki';
	@override String get loading => 'Ladataan...';
	@override String genericError({required Object error}) => 'Virhe: ${error}';
}

// Path: drawer
class _TranslationsDrawerFi extends TranslationsDrawerEn {
	_TranslationsDrawerFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Asetukset';
	@override String get about => 'Tietoja';
	@override late final _TranslationsDrawerAboutDialogFi aboutDialog = _TranslationsDrawerAboutDialogFi._(_root);
}

// Path: startScreen
class _TranslationsStartScreenFi extends TranslationsStartScreenEn {
	_TranslationsStartScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quizlone';
	@override String get welcome => 'Tervetuloa!';
	@override String get createNewList => 'Luo uusi lista';
	@override String get loadSavedList => 'Lataa tallennettu lista';
	@override String get noLists => 'Listoja ei ole vielä tallennettu.';
	@override String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: '1 termi',
		other: '${count} termiä',
	);
	@override late final _TranslationsStartScreenConfirmDeleteDialogFi confirmDeleteDialog = _TranslationsStartScreenConfirmDeleteDialogFi._(_root);
}

// Path: inputScreen
class _TranslationsInputScreenFi extends TranslationsInputScreenEn {
	_TranslationsInputScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Luo uusi lista';
	@override String get listName => 'Listan nimi';
	@override String get listNameHint => 'esim. Luvun 1 sanasto';
	@override String get pasteTerms => 'Liitä termit alle:';
	@override String get pasteTermsHint => '(Termi yhdelle riville, määritelmä seuraavalle)';
	@override String get termsHint => 'Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nTähti, joka on planeettajärjestelmän keskus';
	@override String get saveList => 'Tallenna lista';
	@override late final _TranslationsInputScreenErrorsFi errors = _TranslationsInputScreenErrorsFi._(_root);
}

// Path: modeSelectionScreen
class _TranslationsModeSelectionScreenFi extends TranslationsModeSelectionScreenEn {
	_TranslationsModeSelectionScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Valinnat & Tila';
	@override String get noActiveList => 'Aktiivista opiskelulistaa ei löytynyt tai listaa ei voitu ladata.';
	@override String debugActiveId({required Object id}) => 'Debug: Nykyinen aktiivinen ID on ${id}';
	@override String get returnToWelcome => 'Palaa aloitusnäyttöön';
	@override String get flashcardOptions => 'Muistikorttien asetukset';
	@override String get showTermFirst => 'Näytä ensin termi';
	@override String get showDefFirst => 'Näytä ensin määritelmä';
	@override String get studyOptions => 'Oppimisen & Testin asetukset';
	@override String get askForTerm => 'Näytä määritelmä, kysy termi';
	@override String get askForDef => 'Näytä termi, kysy määritelmä';
	@override String get studyLength => 'Opiskelun pituus:';
	@override String get testFormat => 'Testin muoto';
	@override String get writtenAnswer => 'Kirjallinen vastaus';
	@override String get multipleChoice => 'Monivalinta';
	@override String get flashcards => 'Muistikortit';
	@override String get learn => 'Opi';
	@override String get test => 'Testi';
	@override String get backToWelcome => 'Takaisin aloitusnäyttöön';
}

// Path: flashcardScreen
class _TranslationsFlashcardScreenFi extends TranslationsFlashcardScreenEn {
	_TranslationsFlashcardScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Muistikortit';
	@override String get noCards => 'Ei näytettäviä muistikortteja.';
	@override String get noTerms => 'Opiskeltavia termejä ei ole saatavilla.';
	@override String get shuffle => 'Sekoita';
	@override String get restart => 'Aloita alusta';
}

// Path: learnScreen
class _TranslationsLearnScreenFi extends TranslationsLearnScreenEn {
	_TranslationsLearnScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opi';
	@override String get restartSession => 'Aloita oppimisistunto alusta';
	@override String get backToOptions => 'Takaisin valintoihin';
	@override String get preparing => 'Valmistellaan seuraavaa kysymystä...';
	@override String get answerHint => 'Kirjoita vastauksesi tähän...';
	@override String get incorrect => 'Väärin';
	@override String get hint => 'Vihje';
	@override String get skip => 'Ohita';
	@override String get backToModeSelection => 'Takaisin tilan valintaan';
	@override late final _TranslationsLearnScreenErrorsFi errors = _TranslationsLearnScreenErrorsFi._(_root);
	@override late final _TranslationsLearnScreenFeedbackFi feedback = _TranslationsLearnScreenFeedbackFi._(_root);
	@override late final _TranslationsLearnScreenProgressFi progress = _TranslationsLearnScreenProgressFi._(_root);
}

// Path: testScreen
class _TranslationsTestScreenFi extends TranslationsTestScreenEn {
	_TranslationsTestScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Testi';
	@override String get noQuestions => 'Tässä testissä ei ole kysymyksiä.';
	@override String get viewResults => 'Näytä tulokset';
	@override String get submitTest => 'Lähetä testi';
	@override late final _TranslationsTestScreenErrorsFi errors = _TranslationsTestScreenErrorsFi._(_root);
}

// Path: resultsScreen
class _TranslationsResultsScreenFi extends TranslationsResultsScreenEn {
	_TranslationsResultsScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Testin tulokset';
	@override String get notSubmitted => 'Testiä ei ole vielä lähetetty.';
	@override String get noQuestions => 'Tässä testissä ei ollut kysymyksiä.';
	@override String get yourScore => 'Pisteesi';
	@override String scoreFraction({required Object score, required Object total}) => '${score} / ${total} oikein';
	@override String get reviewIncorrect => 'Kertaa väärät vastaukset:';
	@override String yourAnswerWas({required Object answer}) => 'Vastauksesi: ${answer}';
	@override String get noAnswer => '(Ei vastausta)';
	@override String get congratulations => 'Onneksi olkoon! Sait kaiken oikein!';
	@override String get retryTest => 'Yritä testiä uudelleen';
	@override String get reviewFlashcards => 'Kertaa muistikorteilla';
	@override String get backToWelcome => 'Takaisin aloitusnäyttöön';
}

// Path: settingsScreen
class _TranslationsSettingsScreenFi extends TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asetukset';
	@override String get appearance => 'Ulkoasu';
	@override String get language => 'Kieli';
	@override String get languageDialogTitle => 'Valitse kieli';
	@override String get systemDefault => 'Järjestelmän oletus';
	@override String get light => 'Vaalea';
	@override String get dark => 'Tumma';
	@override String get english => 'Englanti';
	@override String get finnish => 'Suomi';
	@override String get dataManagement => 'Tietojen hallinta';
	@override String get exportData => 'Vie tiedot';
	@override String get exportDataSubtitle => 'Tallenna kaikki listat tiedostoon';
	@override String get importData => 'Tuo tiedot';
	@override String get importDataSubtitle => 'Lataa listat tiedostosta';
	@override String get deleteAllData => 'Poista kaikki tiedot';
	@override late final _TranslationsSettingsScreenExportDialogFi exportDialog = _TranslationsSettingsScreenExportDialogFi._(_root);
	@override late final _TranslationsSettingsScreenImportDialogFi importDialog = _TranslationsSettingsScreenImportDialogFi._(_root);
	@override late final _TranslationsSettingsScreenDeleteDialogFi deleteDialog = _TranslationsSettingsScreenDeleteDialogFi._(_root);
	@override late final _TranslationsSettingsScreenSnackbarsFi snackbars = _TranslationsSettingsScreenSnackbarsFi._(_root);
}

// Path: drawer.aboutDialog
class _TranslationsDrawerAboutDialogFi extends TranslationsDrawerAboutDialogEn {
	_TranslationsDrawerAboutDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get legalese => '© 2025 Quizlone';
	@override String get description => 'Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla.';
}

// Path: startScreen.confirmDeleteDialog
class _TranslationsStartScreenConfirmDeleteDialogFi extends TranslationsStartScreenConfirmDeleteDialogEn {
	_TranslationsStartScreenConfirmDeleteDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista poisto';
	@override String content({required Object listName}) => 'Haluatko varmasti poistaa listan \'${listName}\'?';
}

// Path: inputScreen.errors
class _TranslationsInputScreenErrorsFi extends TranslationsInputScreenErrorsEn {
	_TranslationsInputScreenErrorsFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get listNameEmpty => 'Listan nimi ei voi olla tyhjä.';
	@override String get noTerms => 'Termejä/määritelmiä ei ole syötetty.';
	@override String get invalidFormat => 'Virheellinen muoto. Jokaisella termillä on oltava määritelmä seuraavalla rivillä.';
	@override String emptyTerm({required Object line}) => 'Muotovirhe rivin ${line} lähellä. Löydettiin tyhjä termi tai määritelmä.';
	@override String get noValidPairs => 'Kelvollisia termi/määritelmä-pareja ei löytynyt.';
	@override String saveFailed({required Object error}) => 'Listan tallennus epäonnistui: ${error}';
}

// Path: learnScreen.errors
class _TranslationsLearnScreenErrorsFi extends TranslationsLearnScreenErrorsEn {
	_TranslationsLearnScreenErrorsFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Oppimistilassa ei ole saatavilla termejä.';
	@override String get notEnoughTerms => 'Ei tarpeeksi termejä valitulle pituudelle.';
}

// Path: learnScreen.feedback
class _TranslationsLearnScreenFeedbackFi extends TranslationsLearnScreenFeedbackEn {
	_TranslationsLearnScreenFeedbackFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Oikein!';
	@override String incorrect({required Object answer}) => 'Väärin. Oikea vastaus: ${answer}';
	@override String hint({required Object char}) => 'Vihje: Alkaa kirjaimella "${char}"';
	@override String skipped({required Object answer}) => 'Ohitettu. Vastaus oli: ${answer}';
}

// Path: learnScreen.progress
class _TranslationsLearnScreenProgressFi extends TranslationsLearnScreenProgressEn {
	_TranslationsLearnScreenProgressFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get allLearned => 'Kaikki termit opittu!';
	@override String cycleStatus({required Object cycleNum, required Object itemNum, required Object total}) => 'Kierros ${cycleNum} | Kohde ${itemNum} / ${total}';
	@override String get sessionComplete => 'Oppimisistunto valmis! Hyvää työtä!';
	@override String maxCyclesReached({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: 'Enimmäismäärä kierroksia saavutettu. 1 kohde vielä kertaamatta.',
		other: 'Enimmäismäärä kierroksia saavutettu. ${count} kohdetta vielä kertaamatta.',
	);
	@override String startingCycle({required Object cycleNum, required Object count}) => 'Aloitetaan kierros ${cycleNum}, jossa on ${count} kohdetta...';
}

// Path: testScreen.errors
class _TranslationsTestScreenErrorsFi extends TranslationsTestScreenErrorsEn {
	_TranslationsTestScreenErrorsFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get loadFailed => 'Virhe ladattaessa opiskelulistaa testiä varten.';
	@override String get noTerms => 'Testissä ei ole saatavilla termejä.';
	@override String get notEnoughTerms => 'Ei tarpeeksi termejä valitulle opiskelun pituudelle.';
}

// Path: settingsScreen.exportDialog
class _TranslationsSettingsScreenExportDialogFi extends TranslationsSettingsScreenExportDialogEn {
	_TranslationsSettingsScreenExportDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vie tiedot';
	@override String get content => 'Miten haluat viedä tietosi?';
	@override String get share => 'Jaa tiedosto';
	@override String get save => 'Tallenna laitteelle';
}

// Path: settingsScreen.importDialog
class _TranslationsSettingsScreenImportDialogFi extends TranslationsSettingsScreenImportDialogEn {
	_TranslationsSettingsScreenImportDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista tuonti';
	@override String get content => 'Tämä tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?';
	@override String get import => 'Tuo';
}

// Path: settingsScreen.deleteDialog
class _TranslationsSettingsScreenDeleteDialogFi extends TranslationsSettingsScreenDeleteDialogEn {
	_TranslationsSettingsScreenDeleteDialogFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista poisto';
	@override String get content => 'Haluatko varmasti poistaa KAIKKI opiskelulistat? Tätä toimintoa ei voi kumota.';
	@override String get deleteAll => 'Poista kaikki';
}

// Path: settingsScreen.snackbars
class _TranslationsSettingsScreenSnackbarsFi extends TranslationsSettingsScreenSnackbarsEn {
	_TranslationsSettingsScreenSnackbarsFi._(TranslationsFi root) : this._root = root, super.internal(root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get noDataToExport => 'Ei vietäviä tietoja.';
	@override String get exportSuccess => 'Tiedot viety onnistuneesti!';
	@override String exportError({required Object error}) => 'Virhe tietojen viennissä: ${error}';
	@override String get fileSaved => 'Tiedosto tallennettu onnistuneesti!';
	@override String importSuccess({required Object count}) => '${count} listaa tuotu onnistuneesti!';
	@override String importError({required Object error}) => 'Virhe tietojen tuonnissa: ${error}';
	@override String get allDeleted => 'Kaikki opiskelulistat on poistettu.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Quizlone';
			case 'general.back': return 'Takaisin';
			case 'general.cancel': return 'Peruuta';
			case 'general.delete': return 'Poista';
			case 'general.error': return 'Virhe';
			case 'general.next': return 'Seuraava';
			case 'general.previous': return 'Edellinen';
			case 'general.saveAndContinue': return 'Tallenna ja jatka';
			case 'general.submit': return 'Lähetä';
			case 'general.all': return 'Kaikki';
			case 'general.loading': return 'Ladataan...';
			case 'general.genericError': return ({required Object error}) => 'Virhe: ${error}';
			case 'drawer.settings': return 'Asetukset';
			case 'drawer.about': return 'Tietoja';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla.';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return 'Tervetuloa!';
			case 'startScreen.createNewList': return 'Luo uusi lista';
			case 'startScreen.loadSavedList': return 'Lataa tallennettu lista';
			case 'startScreen.noLists': return 'Listoja ei ole vielä tallennettu.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: '1 termi',
				other: '${count} termiä',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Vahvista poisto';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => 'Haluatko varmasti poistaa listan \'${listName}\'?';
			case 'inputScreen.title': return 'Luo uusi lista';
			case 'inputScreen.listName': return 'Listan nimi';
			case 'inputScreen.listNameHint': return 'esim. Luvun 1 sanasto';
			case 'inputScreen.pasteTerms': return 'Liitä termit alle:';
			case 'inputScreen.pasteTermsHint': return '(Termi yhdelle riville, määritelmä seuraavalle)';
			case 'inputScreen.termsHint': return 'Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nTähti, joka on planeettajärjestelmän keskus';
			case 'inputScreen.saveList': return 'Tallenna lista';
			case 'inputScreen.errors.listNameEmpty': return 'Listan nimi ei voi olla tyhjä.';
			case 'inputScreen.errors.noTerms': return 'Termejä/määritelmiä ei ole syötetty.';
			case 'inputScreen.errors.invalidFormat': return 'Virheellinen muoto. Jokaisella termillä on oltava määritelmä seuraavalla rivillä.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Muotovirhe rivin ${line} lähellä. Löydettiin tyhjä termi tai määritelmä.';
			case 'inputScreen.errors.noValidPairs': return 'Kelvollisia termi/määritelmä-pareja ei löytynyt.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'Listan tallennus epäonnistui: ${error}';
			case 'modeSelectionScreen.title': return 'Valinnat & Tila';
			case 'modeSelectionScreen.noActiveList': return 'Aktiivista opiskelulistaa ei löytynyt tai listaa ei voitu ladata.';
			case 'modeSelectionScreen.debugActiveId': return ({required Object id}) => 'Debug: Nykyinen aktiivinen ID on ${id}';
			case 'modeSelectionScreen.returnToWelcome': return 'Palaa aloitusnäyttöön';
			case 'modeSelectionScreen.flashcardOptions': return 'Muistikorttien asetukset';
			case 'modeSelectionScreen.showTermFirst': return 'Näytä ensin termi';
			case 'modeSelectionScreen.showDefFirst': return 'Näytä ensin määritelmä';
			case 'modeSelectionScreen.studyOptions': return 'Oppimisen & Testin asetukset';
			case 'modeSelectionScreen.askForTerm': return 'Näytä määritelmä, kysy termi';
			case 'modeSelectionScreen.askForDef': return 'Näytä termi, kysy määritelmä';
			case 'modeSelectionScreen.studyLength': return 'Opiskelun pituus:';
			case 'modeSelectionScreen.testFormat': return 'Testin muoto';
			case 'modeSelectionScreen.writtenAnswer': return 'Kirjallinen vastaus';
			case 'modeSelectionScreen.multipleChoice': return 'Monivalinta';
			case 'modeSelectionScreen.flashcards': return 'Muistikortit';
			case 'modeSelectionScreen.learn': return 'Opi';
			case 'modeSelectionScreen.test': return 'Testi';
			case 'modeSelectionScreen.backToWelcome': return 'Takaisin aloitusnäyttöön';
			case 'flashcardScreen.title': return 'Muistikortit';
			case 'flashcardScreen.noCards': return 'Ei näytettäviä muistikortteja.';
			case 'flashcardScreen.noTerms': return 'Opiskeltavia termejä ei ole saatavilla.';
			case 'flashcardScreen.shuffle': return 'Sekoita';
			case 'flashcardScreen.restart': return 'Aloita alusta';
			case 'learnScreen.title': return 'Opi';
			case 'learnScreen.restartSession': return 'Aloita oppimisistunto alusta';
			case 'learnScreen.backToOptions': return 'Takaisin valintoihin';
			case 'learnScreen.preparing': return 'Valmistellaan seuraavaa kysymystä...';
			case 'learnScreen.answerHint': return 'Kirjoita vastauksesi tähän...';
			case 'learnScreen.incorrect': return 'Väärin';
			case 'learnScreen.hint': return 'Vihje';
			case 'learnScreen.skip': return 'Ohita';
			case 'learnScreen.backToModeSelection': return 'Takaisin tilan valintaan';
			case 'learnScreen.errors.noTerms': return 'Oppimistilassa ei ole saatavilla termejä.';
			case 'learnScreen.errors.notEnoughTerms': return 'Ei tarpeeksi termejä valitulle pituudelle.';
			case 'learnScreen.feedback.correct': return 'Oikein!';
			case 'learnScreen.feedback.incorrect': return ({required Object answer}) => 'Väärin. Oikea vastaus: ${answer}';
			case 'learnScreen.feedback.hint': return ({required Object char}) => 'Vihje: Alkaa kirjaimella "${char}"';
			case 'learnScreen.feedback.skipped': return ({required Object answer}) => 'Ohitettu. Vastaus oli: ${answer}';
			case 'learnScreen.progress.allLearned': return 'Kaikki termit opittu!';
			case 'learnScreen.progress.cycleStatus': return ({required Object cycleNum, required Object itemNum, required Object total}) => 'Kierros ${cycleNum} | Kohde ${itemNum} / ${total}';
			case 'learnScreen.progress.sessionComplete': return 'Oppimisistunto valmis! Hyvää työtä!';
			case 'learnScreen.progress.maxCyclesReached': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: 'Enimmäismäärä kierroksia saavutettu. 1 kohde vielä kertaamatta.',
				other: 'Enimmäismäärä kierroksia saavutettu. ${count} kohdetta vielä kertaamatta.',
			);
			case 'learnScreen.progress.startingCycle': return ({required Object cycleNum, required Object count}) => 'Aloitetaan kierros ${cycleNum}, jossa on ${count} kohdetta...';
			case 'testScreen.title': return 'Testi';
			case 'testScreen.noQuestions': return 'Tässä testissä ei ole kysymyksiä.';
			case 'testScreen.viewResults': return 'Näytä tulokset';
			case 'testScreen.submitTest': return 'Lähetä testi';
			case 'testScreen.errors.loadFailed': return 'Virhe ladattaessa opiskelulistaa testiä varten.';
			case 'testScreen.errors.noTerms': return 'Testissä ei ole saatavilla termejä.';
			case 'testScreen.errors.notEnoughTerms': return 'Ei tarpeeksi termejä valitulle opiskelun pituudelle.';
			case 'resultsScreen.title': return 'Testin tulokset';
			case 'resultsScreen.notSubmitted': return 'Testiä ei ole vielä lähetetty.';
			case 'resultsScreen.noQuestions': return 'Tässä testissä ei ollut kysymyksiä.';
			case 'resultsScreen.yourScore': return 'Pisteesi';
			case 'resultsScreen.scoreFraction': return ({required Object score, required Object total}) => '${score} / ${total} oikein';
			case 'resultsScreen.reviewIncorrect': return 'Kertaa väärät vastaukset:';
			case 'resultsScreen.yourAnswerWas': return ({required Object answer}) => 'Vastauksesi: ${answer}';
			case 'resultsScreen.noAnswer': return '(Ei vastausta)';
			case 'resultsScreen.congratulations': return 'Onneksi olkoon! Sait kaiken oikein!';
			case 'resultsScreen.retryTest': return 'Yritä testiä uudelleen';
			case 'resultsScreen.reviewFlashcards': return 'Kertaa muistikorteilla';
			case 'resultsScreen.backToWelcome': return 'Takaisin aloitusnäyttöön';
			case 'settingsScreen.title': return 'Asetukset';
			case 'settingsScreen.appearance': return 'Ulkoasu';
			case 'settingsScreen.language': return 'Kieli';
			case 'settingsScreen.languageDialogTitle': return 'Valitse kieli';
			case 'settingsScreen.systemDefault': return 'Järjestelmän oletus';
			case 'settingsScreen.light': return 'Vaalea';
			case 'settingsScreen.dark': return 'Tumma';
			case 'settingsScreen.english': return 'Englanti';
			case 'settingsScreen.finnish': return 'Suomi';
			case 'settingsScreen.dataManagement': return 'Tietojen hallinta';
			case 'settingsScreen.exportData': return 'Vie tiedot';
			case 'settingsScreen.exportDataSubtitle': return 'Tallenna kaikki listat tiedostoon';
			case 'settingsScreen.importData': return 'Tuo tiedot';
			case 'settingsScreen.importDataSubtitle': return 'Lataa listat tiedostosta';
			case 'settingsScreen.deleteAllData': return 'Poista kaikki tiedot';
			case 'settingsScreen.exportDialog.title': return 'Vie tiedot';
			case 'settingsScreen.exportDialog.content': return 'Miten haluat viedä tietosi?';
			case 'settingsScreen.exportDialog.share': return 'Jaa tiedosto';
			case 'settingsScreen.exportDialog.save': return 'Tallenna laitteelle';
			case 'settingsScreen.importDialog.title': return 'Vahvista tuonti';
			case 'settingsScreen.importDialog.content': return 'Tämä tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?';
			case 'settingsScreen.importDialog.import': return 'Tuo';
			case 'settingsScreen.deleteDialog.title': return 'Vahvista poisto';
			case 'settingsScreen.deleteDialog.content': return 'Haluatko varmasti poistaa KAIKKI opiskelulistat? Tätä toimintoa ei voi kumota.';
			case 'settingsScreen.deleteDialog.deleteAll': return 'Poista kaikki';
			case 'settingsScreen.snackbars.noDataToExport': return 'Ei vietäviä tietoja.';
			case 'settingsScreen.snackbars.exportSuccess': return 'Tiedot viety onnistuneesti!';
			case 'settingsScreen.snackbars.exportError': return ({required Object error}) => 'Virhe tietojen viennissä: ${error}';
			case 'settingsScreen.snackbars.fileSaved': return 'Tiedosto tallennettu onnistuneesti!';
			case 'settingsScreen.snackbars.importSuccess': return ({required Object count}) => '${count} listaa tuotu onnistuneesti!';
			case 'settingsScreen.snackbars.importError': return ({required Object error}) => 'Virhe tietojen tuonnissa: ${error}';
			case 'settingsScreen.snackbars.allDeleted': return 'Kaikki opiskelulistat on poistettu.';
			default: return null;
		}
	}
}

