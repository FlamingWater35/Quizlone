///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFi implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFi _root = this; // ignore: unused_field

	@override 
	TranslationsFi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFi(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Quizlone';
	@override late final _TranslationsGeneralFi general = _TranslationsGeneralFi._(_root);
	@override late final _TranslationsDrawerFi drawer = _TranslationsDrawerFi._(_root);
	@override late final _TranslationsAboutScreenFi aboutScreen = _TranslationsAboutScreenFi._(_root);
	@override late final _TranslationsStartScreenFi startScreen = _TranslationsStartScreenFi._(_root);
	@override late final _TranslationsInputScreenFi inputScreen = _TranslationsInputScreenFi._(_root);
	@override late final _TranslationsLoadListScreenFi loadListScreen = _TranslationsLoadListScreenFi._(_root);
	@override late final _TranslationsModeSelectionScreenFi modeSelectionScreen = _TranslationsModeSelectionScreenFi._(_root);
	@override late final _TranslationsFlashcardScreenFi flashcardScreen = _TranslationsFlashcardScreenFi._(_root);
	@override late final _TranslationsLearnScreenFi learnScreen = _TranslationsLearnScreenFi._(_root);
	@override late final _TranslationsMatchScreenFi matchScreen = _TranslationsMatchScreenFi._(_root);
	@override late final _TranslationsTestScreenFi testScreen = _TranslationsTestScreenFi._(_root);
	@override late final _TranslationsResultsScreenFi resultsScreen = _TranslationsResultsScreenFi._(_root);
	@override late final _TranslationsSettingsScreenFi settingsScreen = _TranslationsSettingsScreenFi._(_root);
	@override late final _TranslationsControlsScreenFi controlsScreen = _TranslationsControlsScreenFi._(_root);
}

// Path: general
class _TranslationsGeneralFi implements TranslationsGeneralEn {
	_TranslationsGeneralFi._(this._root);

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
	@override String get reset => 'Nollaa';
}

// Path: drawer
class _TranslationsDrawerFi implements TranslationsDrawerEn {
	_TranslationsDrawerFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Asetukset';
	@override String get controls => 'Ohjaimet';
	@override String get about => 'Tietoja';
	@override late final _TranslationsDrawerAboutDialogFi aboutDialog = _TranslationsDrawerAboutDialogFi._(_root);
	@override String get cloudSync => 'Pilvisynkronointi';
	@override String get loggedInAs => 'Kirjautuneena nimellä:';
	@override String get noEmail => 'Ei sähköpostia';
	@override String get logout => 'Kirjaudu ulos';
	@override String get email => 'Sähköposti';
	@override String get password => 'Salasana';
	@override String get signIn => 'Kirjaudu sisään';
	@override String get signUp => 'Rekisteröidy';
	@override late final _TranslationsDrawerValidationFi validation = _TranslationsDrawerValidationFi._(_root);
	@override late final _TranslationsDrawerSnackbarsFi snackbars = _TranslationsDrawerSnackbarsFi._(_root);
	@override late final _TranslationsDrawerConfirmEmailDialogFi confirmEmailDialog = _TranslationsDrawerConfirmEmailDialogFi._(_root);
	@override late final _TranslationsDrawerConfirmLogoutDialogFi confirmLogoutDialog = _TranslationsDrawerConfirmLogoutDialogFi._(_root);
}

// Path: aboutScreen
class _TranslationsAboutScreenFi implements TranslationsAboutScreenEn {
	_TranslationsAboutScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String version({required Object version}) => 'Versio ${version}';
	@override String get viewLicenses => 'Näytä lisenssit';
}

// Path: startScreen
class _TranslationsStartScreenFi implements TranslationsStartScreenEn {
	_TranslationsStartScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quizlone';
	@override String get welcome => 'Tervetuloa!';
	@override String get createNewList => 'Luo uusi lista';
	@override String get openSavedList => 'Avaa tallennettu lista';
	@override String get loadSavedList => 'Lataa tallennettu lista';
	@override String get noLists => 'Listoja ei ole vielä tallennettu.';
	@override String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: '1 termi',
		other: '${count} termiä',
	);
	@override late final _TranslationsStartScreenConfirmDeleteDialogFi confirmDeleteDialog = _TranslationsStartScreenConfirmDeleteDialogFi._(_root);
	@override late final _TranslationsStartScreenRenameListDialogFi renameListDialog = _TranslationsStartScreenRenameListDialogFi._(_root);
}

// Path: inputScreen
class _TranslationsInputScreenFi implements TranslationsInputScreenEn {
	_TranslationsInputScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Luo uusi lista';
	@override String get listName => 'Listan nimi';
	@override String get listNameHint => 'esim. Luvun 1 sanasto';
	@override String get pasteTerms => 'Liitä termit alle:';
	@override String get pasteTermsHint => '(Termi yhdelle riville, määritelmä seuraavalle)';
	@override String get termsHint => 'Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nTähti, joka on planeettajärjestelmän keskus';
	@override String get saveList => 'Tallenna lista';
	@override String get assignToGroup => 'Määritä ryhmään';
	@override late final _TranslationsInputScreenErrorsFi errors = _TranslationsInputScreenErrorsFi._(_root);
}

// Path: loadListScreen
class _TranslationsLoadListScreenFi implements TranslationsLoadListScreenEn {
	_TranslationsLoadListScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lataa lista';
	@override String get searchHint => 'Etsi listaa...';
	@override String get noMatches => 'Hakuasi vastaavia listoja ei löytynyt.';
	@override String get createGroup => 'Luo ryhmä';
	@override String get select => 'Valitse';
	@override String get cancel => 'Peruuta';
	@override String get ungrouped => 'Ryhmittämättömät';
	@override String get move => 'Siirrä';
	@override String itemsSelected({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: '1 kohde valittu',
		other: '${count} kohdetta valittu',
	);
	@override late final _TranslationsLoadListScreenCreateGroupDialogFi createGroupDialog = _TranslationsLoadListScreenCreateGroupDialogFi._(_root);
	@override late final _TranslationsLoadListScreenMoveToGroupDialogFi moveToGroupDialog = _TranslationsLoadListScreenMoveToGroupDialogFi._(_root);
	@override late final _TranslationsLoadListScreenDeleteGroupDialogFi deleteGroupDialog = _TranslationsLoadListScreenDeleteGroupDialogFi._(_root);
	@override late final _TranslationsLoadListScreenDeleteListsDialogFi deleteListsDialog = _TranslationsLoadListScreenDeleteListsDialogFi._(_root);
	@override String get sortLabel => 'Lajittele:';
	@override late final _TranslationsLoadListScreenSortOptionsFi sortOptions = _TranslationsLoadListScreenSortOptionsFi._(_root);
}

// Path: modeSelectionScreen
class _TranslationsModeSelectionScreenFi implements TranslationsModeSelectionScreenEn {
	_TranslationsModeSelectionScreenFi._(this._root);

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
	@override String get requireOnlyOneAnswer => 'Hyväksy yksi pilkulla erotettu vastaus';
	@override String get requireOnlyOneAnswerSubtitle => 'Jos oikea vastaus on \'a, b\', \'a\' hyväksytään';
	@override String get flashcards => 'Muistikortit';
	@override String get learn => 'Opi';
	@override String get test => 'Testi';
	@override String get match => 'Yhdistä';
	@override String get backToWelcome => 'Takaisin aloitusnäyttöön';
	@override late final _TranslationsModeSelectionScreenErrorsFi errors = _TranslationsModeSelectionScreenErrorsFi._(_root);
}

// Path: flashcardScreen
class _TranslationsFlashcardScreenFi implements TranslationsFlashcardScreenEn {
	_TranslationsFlashcardScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Muistikortit';
	@override String get noCards => 'Ei näytettäviä muistikortteja.';
	@override String get noTerms => 'Opiskeltavia termejä ei ole saatavilla.';
	@override String get shuffle => 'Sekoita';
	@override String get restart => 'Aloita alusta';
}

// Path: learnScreen
class _TranslationsLearnScreenFi implements TranslationsLearnScreenEn {
	_TranslationsLearnScreenFi._(this._root);

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

// Path: matchScreen
class _TranslationsMatchScreenFi implements TranslationsMatchScreenEn {
	_TranslationsMatchScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yhdistä';
	@override String get congratulations => 'Onneksi olkoon!';
	@override String timeCompleted({required Object time}) => 'Suoritit pelin ${time} sekunnissa!';
	@override String get playAgain => 'Pelaa uudelleen';
	@override String get backToOptions => 'Takaisin valintoihin';
	@override late final _TranslationsMatchScreenLeaderboardFi leaderboard = _TranslationsMatchScreenLeaderboardFi._(_root);
	@override late final _TranslationsMatchScreenErrorsFi errors = _TranslationsMatchScreenErrorsFi._(_root);
}

// Path: testScreen
class _TranslationsTestScreenFi implements TranslationsTestScreenEn {
	_TranslationsTestScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Testi';
	@override String get noQuestions => 'Tässä testissä ei ole kysymyksiä.';
	@override String get viewResults => 'Näytä tulokset';
	@override String get submitTest => 'Lähetä testi';
	@override late final _TranslationsTestScreenErrorsFi errors = _TranslationsTestScreenErrorsFi._(_root);
}

// Path: resultsScreen
class _TranslationsResultsScreenFi implements TranslationsResultsScreenEn {
	_TranslationsResultsScreenFi._(this._root);

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
class _TranslationsSettingsScreenFi implements TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asetukset';
	@override String get appearance => 'Ulkoasu';
	@override String get language => 'Kieli';
	@override String get languageDialogTitle => 'Valitse kieli';
	@override String get uiScaling => 'Näytön skaalaus';
	@override String get uiScalingSubtitle => 'Säädä tekstin ja elementtien kokoa';
	@override String get systemDefault => 'Järjestelmän oletus';
	@override String get light => 'Vaalea';
	@override String get dark => 'Tumma';
	@override String get english => 'Englanti';
	@override String get finnish => 'Suomi';
	@override String get russian => 'Venäjä';
	@override String get spanish => 'Espanja';
	@override String get swedish => 'Ruotsi';
	@override String get update => 'Päivitys';
	@override String get checkForUpdate => 'Tarkista päivitykset';
	@override String get checkingForUpdate => 'Tarkistetaan päivityksiä...';
	@override String get upToDate => 'Sovellus on ajan tasalla';
	@override String get noNewVersion => 'Uutta versiota ei löytynyt.';
	@override String updateAvailable({required Object version}) => 'Päivitys saatavilla: v${version}';
	@override String get tapToInstall => 'Lataa ja asenna napauttamalla';
	@override String get viewReleaseNotes => 'Näytä julkaisutiedot';
	@override String get downloadingUpdate => 'Ladataan päivitystä...';
	@override String get updateCheckFailed => 'Päivitysten tarkistus epäonnistui';
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

// Path: controlsScreen
class _TranslationsControlsScreenFi implements TranslationsControlsScreenEn {
	_TranslationsControlsScreenFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ohjaimet';
	@override String get gesturesTitle => 'Eleet (muistikortit)';
	@override String get keyboardTitle => 'Näppäimistö (muistikortit)';
	@override String get nextCard => 'Seuraava kortti';
	@override String get previousCard => 'Edellinen kortti';
	@override String get flipCard => 'Käännä kortti';
	@override String get swipeLeft => 'Pyyhkäise vasemmalle';
	@override String get swipeRight => 'Pyyhkäise oikealle';
	@override String get swipeVertical => 'Pyyhkäise ylös tai alas';
	@override String get arrowRight => 'Oikea nuolinäppäin';
	@override String get arrowLeft => 'Vasen nuolinäppäin';
	@override String get arrowVerticalOrSpace => 'Ylä-/alanuoli tai välilyönti';
}

// Path: drawer.aboutDialog
class _TranslationsDrawerAboutDialogFi implements TranslationsDrawerAboutDialogEn {
	_TranslationsDrawerAboutDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get legalese => '© 2025 Quizlone';
	@override String get description => 'Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla.';
}

// Path: drawer.validation
class _TranslationsDrawerValidationFi implements TranslationsDrawerValidationEn {
	_TranslationsDrawerValidationFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get emailEmpty => 'Syötä sähköpostiosoite';
	@override String get passwordEmpty => 'Syötä salasana';
}

// Path: drawer.snackbars
class _TranslationsDrawerSnackbarsFi implements TranslationsDrawerSnackbarsEn {
	_TranslationsDrawerSnackbarsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get confirmationSent => 'Vahvistusviesti lähetetty! Tarkista sähköpostisi.';
	@override String get unexpectedError => 'Tapahtui odottamaton virhe';
}

// Path: drawer.confirmEmailDialog
class _TranslationsDrawerConfirmEmailDialogFi implements TranslationsDrawerConfirmEmailDialogEn {
	_TranslationsDrawerConfirmEmailDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista sähköposti';
	@override String content({required Object email}) => 'Vahvista-painiketta napsauttamalla hyväksyt, että ${email} on oikea sähköpostiosoitteesi.';
	@override String get confirm => 'Vahvista';
}

// Path: drawer.confirmLogoutDialog
class _TranslationsDrawerConfirmLogoutDialogFi implements TranslationsDrawerConfirmLogoutDialogEn {
	_TranslationsDrawerConfirmLogoutDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista uloskirjautuminen';
	@override String get content => 'Uloskirjautuminen säilyttää tietosi pilvessä. Haluatko myös poistaa kaikki opiskelutiedot tältä laitteelta?';
	@override String get logoutOnly => 'Vain uloskirjautuminen';
	@override String get deleteAndLogout => 'Poista ja kirjaudu ulos';
}

// Path: startScreen.confirmDeleteDialog
class _TranslationsStartScreenConfirmDeleteDialogFi implements TranslationsStartScreenConfirmDeleteDialogEn {
	_TranslationsStartScreenConfirmDeleteDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista poisto';
	@override String content({required Object listName}) => 'Haluatko varmasti poistaa listan \'${listName}\'?';
}

// Path: startScreen.renameListDialog
class _TranslationsStartScreenRenameListDialogFi implements TranslationsStartScreenRenameListDialogEn {
	_TranslationsStartScreenRenameListDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nimeä lista uudelleen';
	@override String get rename => 'Nimeä uudelleen';
	@override String get errorNameExists => 'Tämänniminen lista on jo olemassa.';
	@override String get errorNameEmpty => 'Listan nimi ei voi olla tyhjä.';
}

// Path: inputScreen.errors
class _TranslationsInputScreenErrorsFi implements TranslationsInputScreenErrorsEn {
	_TranslationsInputScreenErrorsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get listNameEmpty => 'Listan nimi ei voi olla tyhjä.';
	@override String get noTerms => 'Termejä/määritelmiä ei ole syötetty.';
	@override String get invalidFormat => 'Virheellinen muoto. Jokaisella termillä on oltava määritelmä seuraavalla rivillä.';
	@override String emptyTerm({required Object line}) => 'Muotovirhe rivin ${line} lähellä. Löydettiin tyhjä termi tai määritelmä.';
	@override String get noValidPairs => 'Kelvollisia termi/määritelmä-pareja ei löytynyt.';
	@override String saveFailed({required Object error}) => 'Listan tallennus epäonnistui: ${error}';
}

// Path: loadListScreen.createGroupDialog
class _TranslationsLoadListScreenCreateGroupDialogFi implements TranslationsLoadListScreenCreateGroupDialogEn {
	_TranslationsLoadListScreenCreateGroupDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Luo uusi ryhmä';
	@override String get hint => 'Ryhmän nimi';
	@override String get create => 'Luo';
	@override String get errorEmpty => 'Ryhmän nimi ei voi olla tyhjä.';
}

// Path: loadListScreen.moveToGroupDialog
class _TranslationsLoadListScreenMoveToGroupDialogFi implements TranslationsLoadListScreenMoveToGroupDialogEn {
	_TranslationsLoadListScreenMoveToGroupDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String title({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: 'Siirrä 1 kohde kohteeseen...',
		other: 'Siirrä ${count} kohdetta kohteeseen...',
	);
}

// Path: loadListScreen.deleteGroupDialog
class _TranslationsLoadListScreenDeleteGroupDialogFi implements TranslationsLoadListScreenDeleteGroupDialogEn {
	_TranslationsLoadListScreenDeleteGroupDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Poista ryhmä';
	@override String content({required Object name}) => 'Haluatko varmasti poistaa ryhmän \'${name}\'?';
	@override String get warning => 'Tämän ryhmän sisällä olevat listat siirretään ryhmittämättömiin.';
}

// Path: loadListScreen.deleteListsDialog
class _TranslationsLoadListScreenDeleteListsDialogFi implements TranslationsLoadListScreenDeleteListsDialogEn {
	_TranslationsLoadListScreenDeleteListsDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String title({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: 'Poistetaanko 1 lista?',
		other: 'Poistetaanko ${count} listaa?',
	);
	@override String content({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
		one: 'Tämä toiminto on pysyvä, eikä sitä voi kumota.',
		other: 'Tämä toiminto on pysyvä, eikä sitä voi kumota.',
	);
}

// Path: loadListScreen.sortOptions
class _TranslationsLoadListScreenSortOptionsFi implements TranslationsLoadListScreenSortOptionsEn {
	_TranslationsLoadListScreenSortOptionsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get none => 'Oletus';
	@override String get name => 'Nimi';
	@override String get lastOpened => 'Viimeksi avattu';
	@override String get createdAt => 'Luontipäivä';
	@override String get listLength => 'Pituus';
}

// Path: modeSelectionScreen.errors
class _TranslationsModeSelectionScreenErrorsFi implements TranslationsModeSelectionScreenErrorsEn {
	_TranslationsModeSelectionScreenErrorsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String saveSettingFailed({required Object error}) => 'Asetuksen tallennus epäonnistui: ${error}';
}

// Path: learnScreen.errors
class _TranslationsLearnScreenErrorsFi implements TranslationsLearnScreenErrorsEn {
	_TranslationsLearnScreenErrorsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Oppimistilassa ei ole saatavilla termejä.';
	@override String get notEnoughTerms => 'Ei tarpeeksi termejä valitulle pituudelle.';
}

// Path: learnScreen.feedback
class _TranslationsLearnScreenFeedbackFi implements TranslationsLearnScreenFeedbackEn {
	_TranslationsLearnScreenFeedbackFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Oikein!';
	@override String incorrect({required Object answer}) => 'Väärin. Oikea vastaus: ${answer}';
	@override String hint({required Object char}) => 'Vihje: Alkaa kirjaimella "${char}"';
	@override String skipped({required Object answer}) => 'Ohitettu. Vastaus oli: ${answer}';
}

// Path: learnScreen.progress
class _TranslationsLearnScreenProgressFi implements TranslationsLearnScreenProgressEn {
	_TranslationsLearnScreenProgressFi._(this._root);

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

// Path: matchScreen.leaderboard
class _TranslationsMatchScreenLeaderboardFi implements TranslationsMatchScreenLeaderboardEn {
	_TranslationsMatchScreenLeaderboardFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tulostaulu';
	@override String get noRecords => 'Ei vielä tuloksia. Ole ensimmäinen!';
	@override String time({required Object time}) => '${time} sekuntia';
	@override String rank({required Object rank}) => '#${rank}';
	@override String get rankOver100 => '>100';
}

// Path: matchScreen.errors
class _TranslationsMatchScreenErrorsFi implements TranslationsMatchScreenErrorsEn {
	_TranslationsMatchScreenErrorsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Yhdistä-pelissä ei ole saatavilla termejä.';
	@override String get notEnoughTerms => 'Pelaamiseen tarvitaan vähintään yksi termi/määritelmä-pari.';
}

// Path: testScreen.errors
class _TranslationsTestScreenErrorsFi implements TranslationsTestScreenErrorsEn {
	_TranslationsTestScreenErrorsFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get loadFailed => 'Virhe ladattaessa opiskelulistaa testiä varten.';
	@override String get noTerms => 'Testissä ei ole saatavilla termejä.';
	@override String get notEnoughTerms => 'Ei tarpeeksi termejä valitulle opiskelun pituudelle.';
}

// Path: settingsScreen.exportDialog
class _TranslationsSettingsScreenExportDialogFi implements TranslationsSettingsScreenExportDialogEn {
	_TranslationsSettingsScreenExportDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vie tiedot';
	@override String get content => 'Miten haluat viedä tietosi?';
	@override String get share => 'Jaa tiedosto';
	@override String get save => 'Tallenna laitteelle';
	@override String get shareText => 'Tässä on Quizlone-varmuuskopiosi.';
	@override String get saveFileTitle => 'Valitse tallennustiedosto:';
	@override String get backupFileName => 'quizlone_varmuuskopio';
}

// Path: settingsScreen.importDialog
class _TranslationsSettingsScreenImportDialogFi implements TranslationsSettingsScreenImportDialogEn {
	_TranslationsSettingsScreenImportDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista tuonti';
	@override String get content => 'Tämä tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?';
	@override String get import => 'Tuo';
}

// Path: settingsScreen.deleteDialog
class _TranslationsSettingsScreenDeleteDialogFi implements TranslationsSettingsScreenDeleteDialogEn {
	_TranslationsSettingsScreenDeleteDialogFi._(this._root);

	final TranslationsFi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vahvista poisto';
	@override String get content => 'Haluatko varmasti poistaa KAIKKI opiskelulistat? Tätä toimintoa ei voi kumota.';
	@override String get deleteAll => 'Poista kaikki';
}

// Path: settingsScreen.snackbars
class _TranslationsSettingsScreenSnackbarsFi implements TranslationsSettingsScreenSnackbarsEn {
	_TranslationsSettingsScreenSnackbarsFi._(this._root);

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

/// The flat map containing all translations for locale <fi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFi {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
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
			case 'general.reset': return 'Nollaa';
			case 'drawer.settings': return 'Asetukset';
			case 'drawer.controls': return 'Ohjaimet';
			case 'drawer.about': return 'Tietoja';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla.';
			case 'drawer.cloudSync': return 'Pilvisynkronointi';
			case 'drawer.loggedInAs': return 'Kirjautuneena nimellä:';
			case 'drawer.noEmail': return 'Ei sähköpostia';
			case 'drawer.logout': return 'Kirjaudu ulos';
			case 'drawer.email': return 'Sähköposti';
			case 'drawer.password': return 'Salasana';
			case 'drawer.signIn': return 'Kirjaudu sisään';
			case 'drawer.signUp': return 'Rekisteröidy';
			case 'drawer.validation.emailEmpty': return 'Syötä sähköpostiosoite';
			case 'drawer.validation.passwordEmpty': return 'Syötä salasana';
			case 'drawer.snackbars.confirmationSent': return 'Vahvistusviesti lähetetty! Tarkista sähköpostisi.';
			case 'drawer.snackbars.unexpectedError': return 'Tapahtui odottamaton virhe';
			case 'drawer.confirmEmailDialog.title': return 'Vahvista sähköposti';
			case 'drawer.confirmEmailDialog.content': return ({required Object email}) => 'Vahvista-painiketta napsauttamalla hyväksyt, että ${email} on oikea sähköpostiosoitteesi.';
			case 'drawer.confirmEmailDialog.confirm': return 'Vahvista';
			case 'drawer.confirmLogoutDialog.title': return 'Vahvista uloskirjautuminen';
			case 'drawer.confirmLogoutDialog.content': return 'Uloskirjautuminen säilyttää tietosi pilvessä. Haluatko myös poistaa kaikki opiskelutiedot tältä laitteelta?';
			case 'drawer.confirmLogoutDialog.logoutOnly': return 'Vain uloskirjautuminen';
			case 'drawer.confirmLogoutDialog.deleteAndLogout': return 'Poista ja kirjaudu ulos';
			case 'aboutScreen.version': return ({required Object version}) => 'Versio ${version}';
			case 'aboutScreen.viewLicenses': return 'Näytä lisenssit';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return 'Tervetuloa!';
			case 'startScreen.createNewList': return 'Luo uusi lista';
			case 'startScreen.openSavedList': return 'Avaa tallennettu lista';
			case 'startScreen.loadSavedList': return 'Lataa tallennettu lista';
			case 'startScreen.noLists': return 'Listoja ei ole vielä tallennettu.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: '1 termi',
				other: '${count} termiä',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Vahvista poisto';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => 'Haluatko varmasti poistaa listan \'${listName}\'?';
			case 'startScreen.renameListDialog.title': return 'Nimeä lista uudelleen';
			case 'startScreen.renameListDialog.rename': return 'Nimeä uudelleen';
			case 'startScreen.renameListDialog.errorNameExists': return 'Tämänniminen lista on jo olemassa.';
			case 'startScreen.renameListDialog.errorNameEmpty': return 'Listan nimi ei voi olla tyhjä.';
			case 'inputScreen.title': return 'Luo uusi lista';
			case 'inputScreen.listName': return 'Listan nimi';
			case 'inputScreen.listNameHint': return 'esim. Luvun 1 sanasto';
			case 'inputScreen.pasteTerms': return 'Liitä termit alle:';
			case 'inputScreen.pasteTermsHint': return '(Termi yhdelle riville, määritelmä seuraavalle)';
			case 'inputScreen.termsHint': return 'Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nTähti, joka on planeettajärjestelmän keskus';
			case 'inputScreen.saveList': return 'Tallenna lista';
			case 'inputScreen.assignToGroup': return 'Määritä ryhmään';
			case 'inputScreen.errors.listNameEmpty': return 'Listan nimi ei voi olla tyhjä.';
			case 'inputScreen.errors.noTerms': return 'Termejä/määritelmiä ei ole syötetty.';
			case 'inputScreen.errors.invalidFormat': return 'Virheellinen muoto. Jokaisella termillä on oltava määritelmä seuraavalla rivillä.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Muotovirhe rivin ${line} lähellä. Löydettiin tyhjä termi tai määritelmä.';
			case 'inputScreen.errors.noValidPairs': return 'Kelvollisia termi/määritelmä-pareja ei löytynyt.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'Listan tallennus epäonnistui: ${error}';
			case 'loadListScreen.title': return 'Lataa lista';
			case 'loadListScreen.searchHint': return 'Etsi listaa...';
			case 'loadListScreen.noMatches': return 'Hakuasi vastaavia listoja ei löytynyt.';
			case 'loadListScreen.createGroup': return 'Luo ryhmä';
			case 'loadListScreen.select': return 'Valitse';
			case 'loadListScreen.cancel': return 'Peruuta';
			case 'loadListScreen.ungrouped': return 'Ryhmittämättömät';
			case 'loadListScreen.move': return 'Siirrä';
			case 'loadListScreen.itemsSelected': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: '1 kohde valittu',
				other: '${count} kohdetta valittu',
			);
			case 'loadListScreen.createGroupDialog.title': return 'Luo uusi ryhmä';
			case 'loadListScreen.createGroupDialog.hint': return 'Ryhmän nimi';
			case 'loadListScreen.createGroupDialog.create': return 'Luo';
			case 'loadListScreen.createGroupDialog.errorEmpty': return 'Ryhmän nimi ei voi olla tyhjä.';
			case 'loadListScreen.moveToGroupDialog.title': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: 'Siirrä 1 kohde kohteeseen...',
				other: 'Siirrä ${count} kohdetta kohteeseen...',
			);
			case 'loadListScreen.deleteGroupDialog.title': return 'Poista ryhmä';
			case 'loadListScreen.deleteGroupDialog.content': return ({required Object name}) => 'Haluatko varmasti poistaa ryhmän \'${name}\'?';
			case 'loadListScreen.deleteGroupDialog.warning': return 'Tämän ryhmän sisällä olevat listat siirretään ryhmittämättömiin.';
			case 'loadListScreen.deleteListsDialog.title': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: 'Poistetaanko 1 lista?',
				other: 'Poistetaanko ${count} listaa?',
			);
			case 'loadListScreen.deleteListsDialog.content': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fi'))(count,
				one: 'Tämä toiminto on pysyvä, eikä sitä voi kumota.',
				other: 'Tämä toiminto on pysyvä, eikä sitä voi kumota.',
			);
			case 'loadListScreen.sortLabel': return 'Lajittele:';
			case 'loadListScreen.sortOptions.none': return 'Oletus';
			case 'loadListScreen.sortOptions.name': return 'Nimi';
			case 'loadListScreen.sortOptions.lastOpened': return 'Viimeksi avattu';
			case 'loadListScreen.sortOptions.createdAt': return 'Luontipäivä';
			case 'loadListScreen.sortOptions.listLength': return 'Pituus';
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
			case 'modeSelectionScreen.requireOnlyOneAnswer': return 'Hyväksy yksi pilkulla erotettu vastaus';
			case 'modeSelectionScreen.requireOnlyOneAnswerSubtitle': return 'Jos oikea vastaus on \'a, b\', \'a\' hyväksytään';
			case 'modeSelectionScreen.flashcards': return 'Muistikortit';
			case 'modeSelectionScreen.learn': return 'Opi';
			case 'modeSelectionScreen.test': return 'Testi';
			case 'modeSelectionScreen.match': return 'Yhdistä';
			case 'modeSelectionScreen.backToWelcome': return 'Takaisin aloitusnäyttöön';
			case 'modeSelectionScreen.errors.saveSettingFailed': return ({required Object error}) => 'Asetuksen tallennus epäonnistui: ${error}';
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
			case 'matchScreen.title': return 'Yhdistä';
			case 'matchScreen.congratulations': return 'Onneksi olkoon!';
			case 'matchScreen.timeCompleted': return ({required Object time}) => 'Suoritit pelin ${time} sekunnissa!';
			case 'matchScreen.playAgain': return 'Pelaa uudelleen';
			case 'matchScreen.backToOptions': return 'Takaisin valintoihin';
			case 'matchScreen.leaderboard.title': return 'Tulostaulu';
			case 'matchScreen.leaderboard.noRecords': return 'Ei vielä tuloksia. Ole ensimmäinen!';
			case 'matchScreen.leaderboard.time': return ({required Object time}) => '${time} sekuntia';
			case 'matchScreen.leaderboard.rank': return ({required Object rank}) => '#${rank}';
			case 'matchScreen.leaderboard.rankOver100': return '>100';
			case 'matchScreen.errors.noTerms': return 'Yhdistä-pelissä ei ole saatavilla termejä.';
			case 'matchScreen.errors.notEnoughTerms': return 'Pelaamiseen tarvitaan vähintään yksi termi/määritelmä-pari.';
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
			case 'settingsScreen.uiScaling': return 'Näytön skaalaus';
			case 'settingsScreen.uiScalingSubtitle': return 'Säädä tekstin ja elementtien kokoa';
			case 'settingsScreen.systemDefault': return 'Järjestelmän oletus';
			case 'settingsScreen.light': return 'Vaalea';
			case 'settingsScreen.dark': return 'Tumma';
			case 'settingsScreen.english': return 'Englanti';
			case 'settingsScreen.finnish': return 'Suomi';
			case 'settingsScreen.russian': return 'Venäjä';
			case 'settingsScreen.spanish': return 'Espanja';
			case 'settingsScreen.swedish': return 'Ruotsi';
			case 'settingsScreen.update': return 'Päivitys';
			case 'settingsScreen.checkForUpdate': return 'Tarkista päivitykset';
			case 'settingsScreen.checkingForUpdate': return 'Tarkistetaan päivityksiä...';
			case 'settingsScreen.upToDate': return 'Sovellus on ajan tasalla';
			case 'settingsScreen.noNewVersion': return 'Uutta versiota ei löytynyt.';
			case 'settingsScreen.updateAvailable': return ({required Object version}) => 'Päivitys saatavilla: v${version}';
			case 'settingsScreen.tapToInstall': return 'Lataa ja asenna napauttamalla';
			case 'settingsScreen.viewReleaseNotes': return 'Näytä julkaisutiedot';
			case 'settingsScreen.downloadingUpdate': return 'Ladataan päivitystä...';
			case 'settingsScreen.updateCheckFailed': return 'Päivitysten tarkistus epäonnistui';
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
			case 'settingsScreen.exportDialog.shareText': return 'Tässä on Quizlone-varmuuskopiosi.';
			case 'settingsScreen.exportDialog.saveFileTitle': return 'Valitse tallennustiedosto:';
			case 'settingsScreen.exportDialog.backupFileName': return 'quizlone_varmuuskopio';
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
			case 'controlsScreen.title': return 'Ohjaimet';
			case 'controlsScreen.gesturesTitle': return 'Eleet (muistikortit)';
			case 'controlsScreen.keyboardTitle': return 'Näppäimistö (muistikortit)';
			case 'controlsScreen.nextCard': return 'Seuraava kortti';
			case 'controlsScreen.previousCard': return 'Edellinen kortti';
			case 'controlsScreen.flipCard': return 'Käännä kortti';
			case 'controlsScreen.swipeLeft': return 'Pyyhkäise vasemmalle';
			case 'controlsScreen.swipeRight': return 'Pyyhkäise oikealle';
			case 'controlsScreen.swipeVertical': return 'Pyyhkäise ylös tai alas';
			case 'controlsScreen.arrowRight': return 'Oikea nuolinäppäin';
			case 'controlsScreen.arrowLeft': return 'Vasen nuolinäppäin';
			case 'controlsScreen.arrowVerticalOrSpace': return 'Ylä-/alanuoli tai välilyönti';
			default: return null;
		}
	}
}

