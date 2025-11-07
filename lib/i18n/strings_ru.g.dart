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
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Quizlone';
	@override late final _TranslationsGeneralRu general = _TranslationsGeneralRu._(_root);
	@override late final _TranslationsDrawerRu drawer = _TranslationsDrawerRu._(_root);
	@override late final _TranslationsAboutScreenRu aboutScreen = _TranslationsAboutScreenRu._(_root);
	@override late final _TranslationsStartScreenRu startScreen = _TranslationsStartScreenRu._(_root);
	@override late final _TranslationsInputScreenRu inputScreen = _TranslationsInputScreenRu._(_root);
	@override late final _TranslationsLoadListScreenRu loadListScreen = _TranslationsLoadListScreenRu._(_root);
	@override late final _TranslationsModeSelectionScreenRu modeSelectionScreen = _TranslationsModeSelectionScreenRu._(_root);
	@override late final _TranslationsFlashcardScreenRu flashcardScreen = _TranslationsFlashcardScreenRu._(_root);
	@override late final _TranslationsLearnScreenRu learnScreen = _TranslationsLearnScreenRu._(_root);
	@override late final _TranslationsMatchScreenRu matchScreen = _TranslationsMatchScreenRu._(_root);
	@override late final _TranslationsTestScreenRu testScreen = _TranslationsTestScreenRu._(_root);
	@override late final _TranslationsResultsScreenRu resultsScreen = _TranslationsResultsScreenRu._(_root);
	@override late final _TranslationsSettingsScreenRu settingsScreen = _TranslationsSettingsScreenRu._(_root);
	@override late final _TranslationsControlsScreenRu controlsScreen = _TranslationsControlsScreenRu._(_root);
}

// Path: general
class _TranslationsGeneralRu implements TranslationsGeneralEn {
	_TranslationsGeneralRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get back => 'Назад';
	@override String get cancel => 'Отмена';
	@override String get delete => 'Удалить';
	@override String get error => 'Ошибка';
	@override String get next => 'Далее';
	@override String get previous => 'Назад';
	@override String get saveAndContinue => 'Сохранить и продолжить';
	@override String get submit => 'Отправить';
	@override String get all => 'Все';
	@override String get loading => 'Загрузка...';
	@override String genericError({required Object error}) => 'Ошибка: ${error}';
	@override String get reset => 'Сбросить';
}

// Path: drawer
class _TranslationsDrawerRu implements TranslationsDrawerEn {
	_TranslationsDrawerRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Настройки';
	@override String get controls => 'Управление';
	@override String get about => 'О приложении';
	@override late final _TranslationsDrawerAboutDialogRu aboutDialog = _TranslationsDrawerAboutDialogRu._(_root);
	@override String get cloudSync => 'Облачная синхронизация';
	@override String get loggedInAs => 'Вы вошли как:';
	@override String get noEmail => 'Нет email';
	@override String get logout => 'Выйти';
	@override String get email => 'Email';
	@override String get password => 'Пароль';
	@override String get signIn => 'Войти';
	@override String get signUp => 'Регистрация';
	@override late final _TranslationsDrawerValidationRu validation = _TranslationsDrawerValidationRu._(_root);
	@override late final _TranslationsDrawerSnackbarsRu snackbars = _TranslationsDrawerSnackbarsRu._(_root);
	@override late final _TranslationsDrawerConfirmEmailDialogRu confirmEmailDialog = _TranslationsDrawerConfirmEmailDialogRu._(_root);
	@override late final _TranslationsDrawerConfirmLogoutDialogRu confirmLogoutDialog = _TranslationsDrawerConfirmLogoutDialogRu._(_root);
}

// Path: aboutScreen
class _TranslationsAboutScreenRu implements TranslationsAboutScreenEn {
	_TranslationsAboutScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String version({required Object version}) => 'Версия ${version}';
	@override String get viewLicenses => 'Просмотреть лицензии';
}

// Path: startScreen
class _TranslationsStartScreenRu implements TranslationsStartScreenEn {
	_TranslationsStartScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quizlone';
	@override String get welcome => 'Добро пожаловать!';
	@override String get createNewList => 'Создать новый список';
	@override String get openSavedList => 'Открыть сохраненный список';
	@override String get loadSavedList => 'Загрузить сохраненный список';
	@override String get noLists => 'Сохраненных списков пока нет.';
	@override String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: '${count} термин',
		few: '${count} термина',
		many: '${count} терминов',
		other: '${count} термина',
	);
	@override late final _TranslationsStartScreenConfirmDeleteDialogRu confirmDeleteDialog = _TranslationsStartScreenConfirmDeleteDialogRu._(_root);
	@override late final _TranslationsStartScreenRenameListDialogRu renameListDialog = _TranslationsStartScreenRenameListDialogRu._(_root);
}

// Path: inputScreen
class _TranslationsInputScreenRu implements TranslationsInputScreenEn {
	_TranslationsInputScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Создать новый список';
	@override String get listName => 'Название списка';
	@override String get listNameHint => 'например, Словарь к Главе 1';
	@override String get pasteTerms => 'Вставьте ваши термины ниже:';
	@override String get pasteTermsHint => '(Термин на одной строке, определение на следующей)';
	@override String get termsHint => 'Справедливость\nПринцип моральной правоты\nСолнце\nЗвезда, являющаяся центром планетарной системы';
	@override String get saveList => 'Сохранить список';
	@override late final _TranslationsInputScreenErrorsRu errors = _TranslationsInputScreenErrorsRu._(_root);
}

// Path: loadListScreen
class _TranslationsLoadListScreenRu implements TranslationsLoadListScreenEn {
	_TranslationsLoadListScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Загрузить список';
	@override String get searchHint => 'Поиск списка...';
	@override String get noMatches => 'Списки, соответствующие вашему поиску, не найдены.';
	@override String get createGroup => 'Создать группу';
	@override String get select => 'Выбрать';
	@override String get cancel => 'Отмена';
	@override String get ungrouped => 'Без группы';
	@override String get move => 'Переместить';
	@override String itemsSelected({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: 'Выбран ${count} элемент',
		few: 'Выбрано ${count} элемента',
		many: 'Выбрано ${count} элементов',
		other: 'Выбрано ${count} элемента',
	);
	@override late final _TranslationsLoadListScreenCreateGroupDialogRu createGroupDialog = _TranslationsLoadListScreenCreateGroupDialogRu._(_root);
	@override late final _TranslationsLoadListScreenMoveToGroupDialogRu moveToGroupDialog = _TranslationsLoadListScreenMoveToGroupDialogRu._(_root);
	@override late final _TranslationsLoadListScreenDeleteGroupDialogRu deleteGroupDialog = _TranslationsLoadListScreenDeleteGroupDialogRu._(_root);
	@override late final _TranslationsLoadListScreenDeleteListsDialogRu deleteListsDialog = _TranslationsLoadListScreenDeleteListsDialogRu._(_root);
	@override String get sortLabel => 'Сортировать:';
	@override late final _TranslationsLoadListScreenSortOptionsRu sortOptions = _TranslationsLoadListScreenSortOptionsRu._(_root);
}

// Path: modeSelectionScreen
class _TranslationsModeSelectionScreenRu implements TranslationsModeSelectionScreenEn {
	_TranslationsModeSelectionScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Опции и режим';
	@override String get noActiveList => 'Активный учебный список не найден или не удалось загрузить.';
	@override String debugActiveId({required Object id}) => 'Отладка: Текущий активный ID: ${id}';
	@override String get returnToWelcome => 'Вернуться на главный экран';
	@override String get flashcardOptions => 'Настройки карточек';
	@override String get showTermFirst => 'Сначала термин';
	@override String get showDefFirst => 'Сначала определение';
	@override String get studyOptions => 'Настройки обучения и теста';
	@override String get askForTerm => 'Показать определение, спросить термин';
	@override String get askForDef => 'Показать термин, спросить определение';
	@override String get studyLength => 'Длина изучения:';
	@override String get testFormat => 'Формат теста';
	@override String get writtenAnswer => 'Письменный ответ';
	@override String get multipleChoice => 'Множественный выбор';
	@override String get requireOnlyOneAnswer => 'Принимать одну часть ответа, разделенного запятыми';
	@override String get requireOnlyOneAnswerSubtitle => 'Если правильный ответ \'а, б\', то \'а\' принимается';
	@override String get flashcards => 'Карточки';
	@override String get learn => 'Обучение';
	@override String get test => 'Тест';
	@override String get match => 'Сопоставление';
	@override String get backToWelcome => 'Вернуться на главный экран';
	@override late final _TranslationsModeSelectionScreenErrorsRu errors = _TranslationsModeSelectionScreenErrorsRu._(_root);
}

// Path: flashcardScreen
class _TranslationsFlashcardScreenRu implements TranslationsFlashcardScreenEn {
	_TranslationsFlashcardScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Карточки';
	@override String get noCards => 'Нет карточек для отображения.';
	@override String get noTerms => 'Нет доступных терминов для изучения.';
	@override String get shuffle => 'Перемешать';
	@override String get restart => 'Начать заново';
}

// Path: learnScreen
class _TranslationsLearnScreenRu implements TranslationsLearnScreenEn {
	_TranslationsLearnScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Обучение';
	@override String get restartSession => 'Начать сессию заново';
	@override String get backToOptions => 'Назад к опциям';
	@override String get preparing => 'Подготовка следующего вопроса...';
	@override String get answerHint => 'Введите ваш ответ здесь...';
	@override String get incorrect => 'Неправильно';
	@override String get hint => 'Подсказка';
	@override String get skip => 'Пропустить';
	@override String get backToModeSelection => 'Назад к выбору режима';
	@override late final _TranslationsLearnScreenErrorsRu errors = _TranslationsLearnScreenErrorsRu._(_root);
	@override late final _TranslationsLearnScreenFeedbackRu feedback = _TranslationsLearnScreenFeedbackRu._(_root);
	@override late final _TranslationsLearnScreenProgressRu progress = _TranslationsLearnScreenProgressRu._(_root);
}

// Path: matchScreen
class _TranslationsMatchScreenRu implements TranslationsMatchScreenEn {
	_TranslationsMatchScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сопоставление';
	@override String get congratulations => 'Поздравляем!';
	@override String timeCompleted({required Object time}) => 'Вы закончили за ${time} секунд!';
	@override String get playAgain => 'Играть снова';
	@override String get backToOptions => 'Назад к опциям';
	@override late final _TranslationsMatchScreenLeaderboardRu leaderboard = _TranslationsMatchScreenLeaderboardRu._(_root);
	@override late final _TranslationsMatchScreenErrorsRu errors = _TranslationsMatchScreenErrorsRu._(_root);
}

// Path: testScreen
class _TranslationsTestScreenRu implements TranslationsTestScreenEn {
	_TranslationsTestScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тест';
	@override String get noQuestions => 'Нет вопросов для этого теста.';
	@override String get viewResults => 'Посмотреть результаты';
	@override String get submitTest => 'Завершить тест';
	@override late final _TranslationsTestScreenErrorsRu errors = _TranslationsTestScreenErrorsRu._(_root);
}

// Path: resultsScreen
class _TranslationsResultsScreenRu implements TranslationsResultsScreenEn {
	_TranslationsResultsScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Результаты теста';
	@override String get notSubmitted => 'Тест еще не завершен.';
	@override String get noQuestions => 'В этом тесте не было вопросов.';
	@override String get yourScore => 'Ваш результат';
	@override String scoreFraction({required Object score, required Object total}) => 'Правильно ${score} из ${total}';
	@override String get reviewIncorrect => 'Обзор неправильных ответов:';
	@override String yourAnswerWas({required Object answer}) => 'Ваш ответ: ${answer}';
	@override String get noAnswer => '(Нет ответа)';
	@override String get congratulations => 'Поздравляем! Вы ответили на все вопросы правильно!';
	@override String get retryTest => 'Попробовать снова';
	@override String get reviewFlashcards => 'Повторить с карточками';
	@override String get backToWelcome => 'Вернуться на главный экран';
}

// Path: settingsScreen
class _TranslationsSettingsScreenRu implements TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get appearance => 'Внешний вид';
	@override String get language => 'Язык';
	@override String get languageDialogTitle => 'Выберите язык';
	@override String get uiScaling => 'Масштабирование интерфейса';
	@override String get uiScalingSubtitle => 'Настройте размер текста и элементов интерфейса';
	@override String get systemDefault => 'Системный по умолчанию';
	@override String get light => 'Светлая';
	@override String get dark => 'Темная';
	@override String get english => 'Английский';
	@override String get finnish => 'Финский';
	@override String get russian => 'Русский';
	@override String get spanish => 'Испанский';
	@override String get swedish => 'Шведский';
	@override String get update => 'Обновление';
	@override String get checkForUpdate => 'Проверить обновления';
	@override String get checkingForUpdate => 'Проверка обновлений...';
	@override String get upToDate => 'У вас последняя версия';
	@override String get noNewVersion => 'Новая версия не найдена.';
	@override String updateAvailable({required Object version}) => 'Доступно обновление: v${version}';
	@override String get tapToInstall => 'Нажмите для загрузки и установки';
	@override String get viewReleaseNotes => 'Посмотреть примечания к выпуску';
	@override String get downloadingUpdate => 'Загрузка обновления...';
	@override String get updateCheckFailed => 'Ошибка проверки обновлений';
	@override String get dataManagement => 'Управление данными';
	@override String get exportData => 'Экспорт данных';
	@override String get exportDataSubtitle => 'Сохранить все списки в файл';
	@override String get importData => 'Импорт данных';
	@override String get importDataSubtitle => 'Загрузить списки из файла';
	@override String get deleteAllData => 'Удалить все данные';
	@override late final _TranslationsSettingsScreenExportDialogRu exportDialog = _TranslationsSettingsScreenExportDialogRu._(_root);
	@override late final _TranslationsSettingsScreenImportDialogRu importDialog = _TranslationsSettingsScreenImportDialogRu._(_root);
	@override late final _TranslationsSettingsScreenDeleteDialogRu deleteDialog = _TranslationsSettingsScreenDeleteDialogRu._(_root);
	@override late final _TranslationsSettingsScreenSnackbarsRu snackbars = _TranslationsSettingsScreenSnackbarsRu._(_root);
}

// Path: controlsScreen
class _TranslationsControlsScreenRu implements TranslationsControlsScreenEn {
	_TranslationsControlsScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Управление';
	@override String get gesturesTitle => 'Жесты (Карточки)';
	@override String get keyboardTitle => 'Клавиатура (Карточки)';
	@override String get nextCard => 'Следующая карточка';
	@override String get previousCard => 'Предыдущая карточка';
	@override String get flipCard => 'Перевернуть карточку';
	@override String get swipeLeft => 'Свайп влево';
	@override String get swipeRight => 'Свайп вправо';
	@override String get swipeVertical => 'Свайп вверх или вниз';
	@override String get arrowRight => 'Клавиша со стрелкой вправо';
	@override String get arrowLeft => 'Клавиша со стрелкой влево';
	@override String get arrowVerticalOrSpace => 'Клавиши со стрелками вверх/вниз или Пробел';
}

// Path: drawer.aboutDialog
class _TranslationsDrawerAboutDialogRu implements TranslationsDrawerAboutDialogEn {
	_TranslationsDrawerAboutDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get legalese => '© 2025 Quizlone';
	@override String get description => 'Простое, современное приложение для обучения, созданное с помощью Flutter.';
}

// Path: drawer.validation
class _TranslationsDrawerValidationRu implements TranslationsDrawerValidationEn {
	_TranslationsDrawerValidationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get emailEmpty => 'Пожалуйста, введите email';
	@override String get passwordEmpty => 'Пожалуйста, введите пароль';
}

// Path: drawer.snackbars
class _TranslationsDrawerSnackbarsRu implements TranslationsDrawerSnackbarsEn {
	_TranslationsDrawerSnackbarsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get confirmationSent => 'Письмо с подтверждением отправлено! Проверьте свой почтовый ящик.';
	@override String get unexpectedError => 'Произошла непредвиденная ошибка';
}

// Path: drawer.confirmEmailDialog
class _TranslationsDrawerConfirmEmailDialogRu implements TranslationsDrawerConfirmEmailDialogEn {
	_TranslationsDrawerConfirmEmailDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подтвердите Email';
	@override String content({required Object email}) => 'Нажимая кнопку «Подтвердить», вы соглашаетесь с тем, что ${email} — ваш правильный адрес электронной почты.';
	@override String get confirm => 'Подтвердить';
}

// Path: drawer.confirmLogoutDialog
class _TranslationsDrawerConfirmLogoutDialogRu implements TranslationsDrawerConfirmLogoutDialogEn {
	_TranslationsDrawerConfirmLogoutDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подтвердите выход';
	@override String get content => 'При выходе ваши данные останутся в облаке. Вы также хотите удалить все учебные данные с этого устройства?';
	@override String get logoutOnly => 'Только выйти';
	@override String get deleteAndLogout => 'Удалить и выйти';
}

// Path: startScreen.confirmDeleteDialog
class _TranslationsStartScreenConfirmDeleteDialogRu implements TranslationsStartScreenConfirmDeleteDialogEn {
	_TranslationsStartScreenConfirmDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подтвердите удаление';
	@override String content({required Object listName}) => 'Вы уверены, что хотите удалить \'${listName}\'?';
}

// Path: startScreen.renameListDialog
class _TranslationsStartScreenRenameListDialogRu implements TranslationsStartScreenRenameListDialogEn {
	_TranslationsStartScreenRenameListDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Переименовать список';
	@override String get rename => 'Переименовать';
	@override String get errorNameExists => 'Список с таким названием уже существует.';
	@override String get errorNameEmpty => 'Название списка не может быть пустым.';
}

// Path: inputScreen.errors
class _TranslationsInputScreenErrorsRu implements TranslationsInputScreenErrorsEn {
	_TranslationsInputScreenErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get listNameEmpty => 'Название списка не может быть пустым.';
	@override String get noTerms => 'Термины/определения не введены.';
	@override String get invalidFormat => 'Неверный формат. Каждый термин должен иметь определение на следующей строке.';
	@override String emptyTerm({required Object line}) => 'Ошибка формата около строки ${line}. Найден пустой термин или определение.';
	@override String get noValidPairs => 'Не найдено действительных пар термин/определение.';
	@override String saveFailed({required Object error}) => 'Не удалось сохранить список: ${error}';
}

// Path: loadListScreen.createGroupDialog
class _TranslationsLoadListScreenCreateGroupDialogRu implements TranslationsLoadListScreenCreateGroupDialogEn {
	_TranslationsLoadListScreenCreateGroupDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Создать новую группу';
	@override String get hint => 'Название группы';
	@override String get create => 'Создать';
	@override String get errorEmpty => 'Название группы не может быть пустым.';
}

// Path: loadListScreen.moveToGroupDialog
class _TranslationsLoadListScreenMoveToGroupDialogRu implements TranslationsLoadListScreenMoveToGroupDialogEn {
	_TranslationsLoadListScreenMoveToGroupDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String title({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: 'Переместить ${count} элемент в...',
		few: 'Переместить ${count} элемента в...',
		many: 'Переместить ${count} элементов в...',
		other: 'Переместить ${count} элемента в...',
	);
}

// Path: loadListScreen.deleteGroupDialog
class _TranslationsLoadListScreenDeleteGroupDialogRu implements TranslationsLoadListScreenDeleteGroupDialogEn {
	_TranslationsLoadListScreenDeleteGroupDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Удалить группу';
	@override String content({required Object name}) => 'Вы уверены, что хотите удалить группу \'${name}\'?';
	@override String get warning => 'Списки в этой группе останутся без группы.';
}

// Path: loadListScreen.deleteListsDialog
class _TranslationsLoadListScreenDeleteListsDialogRu implements TranslationsLoadListScreenDeleteListsDialogEn {
	_TranslationsLoadListScreenDeleteListsDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String title({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: 'Удалить ${count} список?',
		few: 'Удалить ${count} списка?',
		many: 'Удалить ${count} списков?',
		other: 'Удалить ${count} списка?',
	);
	@override String content({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: 'Это действие необратимо.',
		other: 'Это действие необратимо.',
	);
}

// Path: loadListScreen.sortOptions
class _TranslationsLoadListScreenSortOptionsRu implements TranslationsLoadListScreenSortOptionsEn {
	_TranslationsLoadListScreenSortOptionsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get none => 'По умолчанию';
	@override String get name => 'Название';
	@override String get lastOpened => 'Дата открытия';
	@override String get createdAt => 'Дата создания';
	@override String get listLength => 'Размер';
}

// Path: modeSelectionScreen.errors
class _TranslationsModeSelectionScreenErrorsRu implements TranslationsModeSelectionScreenErrorsEn {
	_TranslationsModeSelectionScreenErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String saveSettingFailed({required Object error}) => 'Не удалось сохранить настройку: ${error}';
}

// Path: learnScreen.errors
class _TranslationsLearnScreenErrorsRu implements TranslationsLearnScreenErrorsEn {
	_TranslationsLearnScreenErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Нет доступных терминов для режима обучения.';
	@override String get notEnoughTerms => 'Недостаточно терминов для выбранной длины.';
}

// Path: learnScreen.feedback
class _TranslationsLearnScreenFeedbackRu implements TranslationsLearnScreenFeedbackEn {
	_TranslationsLearnScreenFeedbackRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Правильно!';
	@override String incorrect({required Object answer}) => 'Неправильно. Правильный ответ: ${answer}';
	@override String hint({required Object char}) => 'Подсказка: Начинается с "${char}"';
	@override String skipped({required Object answer}) => 'Пропущено. Ответ был: ${answer}';
}

// Path: learnScreen.progress
class _TranslationsLearnScreenProgressRu implements TranslationsLearnScreenProgressEn {
	_TranslationsLearnScreenProgressRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get allLearned => 'Все термины выучены!';
	@override String cycleStatus({required Object cycleNum, required Object itemNum, required Object total}) => 'Круг ${cycleNum} | Элемент ${itemNum} из ${total}';
	@override String get sessionComplete => 'Сессия обучения завершена! Отличная работа!';
	@override String maxCyclesReached({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
		one: 'Достигнуто максимальное количество кругов. Остался 1 элемент для повторения.',
		few: 'Достигнуто максимальное количество кругов. Осталось ${count} элемента для повторения.',
		many: 'Достигнуто максимальное количество кругов. Осталось ${count} элементов для повторения.',
		other: 'Достигнуто максимальное количество кругов. Осталось ${count} элемента для повторения.',
	);
	@override String startingCycle({required Object cycleNum, required Object count}) => 'Начинается круг ${cycleNum} с ${count} элементом(ами)...';
}

// Path: matchScreen.leaderboard
class _TranslationsMatchScreenLeaderboardRu implements TranslationsMatchScreenLeaderboardEn {
	_TranslationsMatchScreenLeaderboardRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Таблица лидеров';
	@override String get noRecords => 'Рекордов пока нет. Будьте первым!';
	@override String time({required Object time}) => '${time} секунд';
	@override String rank({required Object rank}) => '№${rank}';
	@override String get rankOver100 => '>100';
}

// Path: matchScreen.errors
class _TranslationsMatchScreenErrorsRu implements TranslationsMatchScreenErrorsEn {
	_TranslationsMatchScreenErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'Нет доступных терминов для режима Сопоставления.';
	@override String get notEnoughTerms => 'Для игры требуется хотя бы одна пара термин/определение.';
}

// Path: testScreen.errors
class _TranslationsTestScreenErrorsRu implements TranslationsTestScreenErrorsEn {
	_TranslationsTestScreenErrorsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get loadFailed => 'Ошибка загрузки учебного списка для теста.';
	@override String get noTerms => 'Нет доступных терминов для теста.';
	@override String get notEnoughTerms => 'Недостаточно терминов для выбранной длины изучения.';
}

// Path: settingsScreen.exportDialog
class _TranslationsSettingsScreenExportDialogRu implements TranslationsSettingsScreenExportDialogEn {
	_TranslationsSettingsScreenExportDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экспорт данных';
	@override String get content => 'Как вы хотите экспортировать ваши данные?';
	@override String get share => 'Поделиться файлом';
	@override String get save => 'Сохранить на устройство';
	@override String get shareText => 'Вот ваша резервная копия Quizlone.';
	@override String get saveFileTitle => 'Пожалуйста, выберите файл для сохранения:';
	@override String get backupFileName => 'quizlone_резервная_копия';
}

// Path: settingsScreen.importDialog
class _TranslationsSettingsScreenImportDialogRu implements TranslationsSettingsScreenImportDialogEn {
	_TranslationsSettingsScreenImportDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подтвердите импорт';
	@override String get content => 'Это импортирует учебные списки из файла. Любые существующие списки с таким же именем будут перезаписаны. Продолжить?';
	@override String get import => 'Импорт';
}

// Path: settingsScreen.deleteDialog
class _TranslationsSettingsScreenDeleteDialogRu implements TranslationsSettingsScreenDeleteDialogEn {
	_TranslationsSettingsScreenDeleteDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подтвердите удаление';
	@override String get content => 'Вы уверены, что хотите удалить ВСЕ учебные списки? Это действие необратимо.';
	@override String get deleteAll => 'Удалить все';
}

// Path: settingsScreen.snackbars
class _TranslationsSettingsScreenSnackbarsRu implements TranslationsSettingsScreenSnackbarsEn {
	_TranslationsSettingsScreenSnackbarsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get noDataToExport => 'Нет данных для экспорта.';
	@override String get exportSuccess => 'Данные успешно экспортированы!';
	@override String exportError({required Object error}) => 'Ошибка экспорта данных: ${error}';
	@override String get fileSaved => 'Файл успешно сохранен!';
	@override String importSuccess({required Object count}) => 'Успешно импортировано ${count} списков!';
	@override String importError({required Object error}) => 'Ошибка импорта данных: ${error}';
	@override String get allDeleted => 'Все учебные списки были удалены.';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'appName': return 'Quizlone';
			case 'general.back': return 'Назад';
			case 'general.cancel': return 'Отмена';
			case 'general.delete': return 'Удалить';
			case 'general.error': return 'Ошибка';
			case 'general.next': return 'Далее';
			case 'general.previous': return 'Назад';
			case 'general.saveAndContinue': return 'Сохранить и продолжить';
			case 'general.submit': return 'Отправить';
			case 'general.all': return 'Все';
			case 'general.loading': return 'Загрузка...';
			case 'general.genericError': return ({required Object error}) => 'Ошибка: ${error}';
			case 'general.reset': return 'Сбросить';
			case 'drawer.settings': return 'Настройки';
			case 'drawer.controls': return 'Управление';
			case 'drawer.about': return 'О приложении';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'Простое, современное приложение для обучения, созданное с помощью Flutter.';
			case 'drawer.cloudSync': return 'Облачная синхронизация';
			case 'drawer.loggedInAs': return 'Вы вошли как:';
			case 'drawer.noEmail': return 'Нет email';
			case 'drawer.logout': return 'Выйти';
			case 'drawer.email': return 'Email';
			case 'drawer.password': return 'Пароль';
			case 'drawer.signIn': return 'Войти';
			case 'drawer.signUp': return 'Регистрация';
			case 'drawer.validation.emailEmpty': return 'Пожалуйста, введите email';
			case 'drawer.validation.passwordEmpty': return 'Пожалуйста, введите пароль';
			case 'drawer.snackbars.confirmationSent': return 'Письмо с подтверждением отправлено! Проверьте свой почтовый ящик.';
			case 'drawer.snackbars.unexpectedError': return 'Произошла непредвиденная ошибка';
			case 'drawer.confirmEmailDialog.title': return 'Подтвердите Email';
			case 'drawer.confirmEmailDialog.content': return ({required Object email}) => 'Нажимая кнопку «Подтвердить», вы соглашаетесь с тем, что ${email} — ваш правильный адрес электронной почты.';
			case 'drawer.confirmEmailDialog.confirm': return 'Подтвердить';
			case 'drawer.confirmLogoutDialog.title': return 'Подтвердите выход';
			case 'drawer.confirmLogoutDialog.content': return 'При выходе ваши данные останутся в облаке. Вы также хотите удалить все учебные данные с этого устройства?';
			case 'drawer.confirmLogoutDialog.logoutOnly': return 'Только выйти';
			case 'drawer.confirmLogoutDialog.deleteAndLogout': return 'Удалить и выйти';
			case 'aboutScreen.version': return ({required Object version}) => 'Версия ${version}';
			case 'aboutScreen.viewLicenses': return 'Просмотреть лицензии';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return 'Добро пожаловать!';
			case 'startScreen.createNewList': return 'Создать новый список';
			case 'startScreen.openSavedList': return 'Открыть сохраненный список';
			case 'startScreen.loadSavedList': return 'Загрузить сохраненный список';
			case 'startScreen.noLists': return 'Сохраненных списков пока нет.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: '${count} термин',
				few: '${count} термина',
				many: '${count} терминов',
				other: '${count} термина',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Подтвердите удаление';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => 'Вы уверены, что хотите удалить \'${listName}\'?';
			case 'startScreen.renameListDialog.title': return 'Переименовать список';
			case 'startScreen.renameListDialog.rename': return 'Переименовать';
			case 'startScreen.renameListDialog.errorNameExists': return 'Список с таким названием уже существует.';
			case 'startScreen.renameListDialog.errorNameEmpty': return 'Название списка не может быть пустым.';
			case 'inputScreen.title': return 'Создать новый список';
			case 'inputScreen.listName': return 'Название списка';
			case 'inputScreen.listNameHint': return 'например, Словарь к Главе 1';
			case 'inputScreen.pasteTerms': return 'Вставьте ваши термины ниже:';
			case 'inputScreen.pasteTermsHint': return '(Термин на одной строке, определение на следующей)';
			case 'inputScreen.termsHint': return 'Справедливость\nПринцип моральной правоты\nСолнце\nЗвезда, являющаяся центром планетарной системы';
			case 'inputScreen.saveList': return 'Сохранить список';
			case 'inputScreen.errors.listNameEmpty': return 'Название списка не может быть пустым.';
			case 'inputScreen.errors.noTerms': return 'Термины/определения не введены.';
			case 'inputScreen.errors.invalidFormat': return 'Неверный формат. Каждый термин должен иметь определение на следующей строке.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Ошибка формата около строки ${line}. Найден пустой термин или определение.';
			case 'inputScreen.errors.noValidPairs': return 'Не найдено действительных пар термин/определение.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'Не удалось сохранить список: ${error}';
			case 'loadListScreen.title': return 'Загрузить список';
			case 'loadListScreen.searchHint': return 'Поиск списка...';
			case 'loadListScreen.noMatches': return 'Списки, соответствующие вашему поиску, не найдены.';
			case 'loadListScreen.createGroup': return 'Создать группу';
			case 'loadListScreen.select': return 'Выбрать';
			case 'loadListScreen.cancel': return 'Отмена';
			case 'loadListScreen.ungrouped': return 'Без группы';
			case 'loadListScreen.move': return 'Переместить';
			case 'loadListScreen.itemsSelected': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: 'Выбран ${count} элемент',
				few: 'Выбрано ${count} элемента',
				many: 'Выбрано ${count} элементов',
				other: 'Выбрано ${count} элемента',
			);
			case 'loadListScreen.createGroupDialog.title': return 'Создать новую группу';
			case 'loadListScreen.createGroupDialog.hint': return 'Название группы';
			case 'loadListScreen.createGroupDialog.create': return 'Создать';
			case 'loadListScreen.createGroupDialog.errorEmpty': return 'Название группы не может быть пустым.';
			case 'loadListScreen.moveToGroupDialog.title': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: 'Переместить ${count} элемент в...',
				few: 'Переместить ${count} элемента в...',
				many: 'Переместить ${count} элементов в...',
				other: 'Переместить ${count} элемента в...',
			);
			case 'loadListScreen.deleteGroupDialog.title': return 'Удалить группу';
			case 'loadListScreen.deleteGroupDialog.content': return ({required Object name}) => 'Вы уверены, что хотите удалить группу \'${name}\'?';
			case 'loadListScreen.deleteGroupDialog.warning': return 'Списки в этой группе останутся без группы.';
			case 'loadListScreen.deleteListsDialog.title': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: 'Удалить ${count} список?',
				few: 'Удалить ${count} списка?',
				many: 'Удалить ${count} списков?',
				other: 'Удалить ${count} списка?',
			);
			case 'loadListScreen.deleteListsDialog.content': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: 'Это действие необратимо.',
				other: 'Это действие необратимо.',
			);
			case 'loadListScreen.sortLabel': return 'Сортировать:';
			case 'loadListScreen.sortOptions.none': return 'По умолчанию';
			case 'loadListScreen.sortOptions.name': return 'Название';
			case 'loadListScreen.sortOptions.lastOpened': return 'Дата открытия';
			case 'loadListScreen.sortOptions.createdAt': return 'Дата создания';
			case 'loadListScreen.sortOptions.listLength': return 'Размер';
			case 'modeSelectionScreen.title': return 'Опции и режим';
			case 'modeSelectionScreen.noActiveList': return 'Активный учебный список не найден или не удалось загрузить.';
			case 'modeSelectionScreen.debugActiveId': return ({required Object id}) => 'Отладка: Текущий активный ID: ${id}';
			case 'modeSelectionScreen.returnToWelcome': return 'Вернуться на главный экран';
			case 'modeSelectionScreen.flashcardOptions': return 'Настройки карточек';
			case 'modeSelectionScreen.showTermFirst': return 'Сначала термин';
			case 'modeSelectionScreen.showDefFirst': return 'Сначала определение';
			case 'modeSelectionScreen.studyOptions': return 'Настройки обучения и теста';
			case 'modeSelectionScreen.askForTerm': return 'Показать определение, спросить термин';
			case 'modeSelectionScreen.askForDef': return 'Показать термин, спросить определение';
			case 'modeSelectionScreen.studyLength': return 'Длина изучения:';
			case 'modeSelectionScreen.testFormat': return 'Формат теста';
			case 'modeSelectionScreen.writtenAnswer': return 'Письменный ответ';
			case 'modeSelectionScreen.multipleChoice': return 'Множественный выбор';
			case 'modeSelectionScreen.requireOnlyOneAnswer': return 'Принимать одну часть ответа, разделенного запятыми';
			case 'modeSelectionScreen.requireOnlyOneAnswerSubtitle': return 'Если правильный ответ \'а, б\', то \'а\' принимается';
			case 'modeSelectionScreen.flashcards': return 'Карточки';
			case 'modeSelectionScreen.learn': return 'Обучение';
			case 'modeSelectionScreen.test': return 'Тест';
			case 'modeSelectionScreen.match': return 'Сопоставление';
			case 'modeSelectionScreen.backToWelcome': return 'Вернуться на главный экран';
			case 'modeSelectionScreen.errors.saveSettingFailed': return ({required Object error}) => 'Не удалось сохранить настройку: ${error}';
			case 'flashcardScreen.title': return 'Карточки';
			case 'flashcardScreen.noCards': return 'Нет карточек для отображения.';
			case 'flashcardScreen.noTerms': return 'Нет доступных терминов для изучения.';
			case 'flashcardScreen.shuffle': return 'Перемешать';
			case 'flashcardScreen.restart': return 'Начать заново';
			case 'learnScreen.title': return 'Обучение';
			case 'learnScreen.restartSession': return 'Начать сессию заново';
			case 'learnScreen.backToOptions': return 'Назад к опциям';
			case 'learnScreen.preparing': return 'Подготовка следующего вопроса...';
			case 'learnScreen.answerHint': return 'Введите ваш ответ здесь...';
			case 'learnScreen.incorrect': return 'Неправильно';
			case 'learnScreen.hint': return 'Подсказка';
			case 'learnScreen.skip': return 'Пропустить';
			case 'learnScreen.backToModeSelection': return 'Назад к выбору режима';
			case 'learnScreen.errors.noTerms': return 'Нет доступных терминов для режима обучения.';
			case 'learnScreen.errors.notEnoughTerms': return 'Недостаточно терминов для выбранной длины.';
			case 'learnScreen.feedback.correct': return 'Правильно!';
			case 'learnScreen.feedback.incorrect': return ({required Object answer}) => 'Неправильно. Правильный ответ: ${answer}';
			case 'learnScreen.feedback.hint': return ({required Object char}) => 'Подсказка: Начинается с "${char}"';
			case 'learnScreen.feedback.skipped': return ({required Object answer}) => 'Пропущено. Ответ был: ${answer}';
			case 'learnScreen.progress.allLearned': return 'Все термины выучены!';
			case 'learnScreen.progress.cycleStatus': return ({required Object cycleNum, required Object itemNum, required Object total}) => 'Круг ${cycleNum} | Элемент ${itemNum} из ${total}';
			case 'learnScreen.progress.sessionComplete': return 'Сессия обучения завершена! Отличная работа!';
			case 'learnScreen.progress.maxCyclesReached': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(count,
				one: 'Достигнуто максимальное количество кругов. Остался 1 элемент для повторения.',
				few: 'Достигнуто максимальное количество кругов. Осталось ${count} элемента для повторения.',
				many: 'Достигнуто максимальное количество кругов. Осталось ${count} элементов для повторения.',
				other: 'Достигнуто максимальное количество кругов. Осталось ${count} элемента для повторения.',
			);
			case 'learnScreen.progress.startingCycle': return ({required Object cycleNum, required Object count}) => 'Начинается круг ${cycleNum} с ${count} элементом(ами)...';
			case 'matchScreen.title': return 'Сопоставление';
			case 'matchScreen.congratulations': return 'Поздравляем!';
			case 'matchScreen.timeCompleted': return ({required Object time}) => 'Вы закончили за ${time} секунд!';
			case 'matchScreen.playAgain': return 'Играть снова';
			case 'matchScreen.backToOptions': return 'Назад к опциям';
			case 'matchScreen.leaderboard.title': return 'Таблица лидеров';
			case 'matchScreen.leaderboard.noRecords': return 'Рекордов пока нет. Будьте первым!';
			case 'matchScreen.leaderboard.time': return ({required Object time}) => '${time} секунд';
			case 'matchScreen.leaderboard.rank': return ({required Object rank}) => '№${rank}';
			case 'matchScreen.leaderboard.rankOver100': return '>100';
			case 'matchScreen.errors.noTerms': return 'Нет доступных терминов для режима Сопоставления.';
			case 'matchScreen.errors.notEnoughTerms': return 'Для игры требуется хотя бы одна пара термин/определение.';
			case 'testScreen.title': return 'Тест';
			case 'testScreen.noQuestions': return 'Нет вопросов для этого теста.';
			case 'testScreen.viewResults': return 'Посмотреть результаты';
			case 'testScreen.submitTest': return 'Завершить тест';
			case 'testScreen.errors.loadFailed': return 'Ошибка загрузки учебного списка для теста.';
			case 'testScreen.errors.noTerms': return 'Нет доступных терминов для теста.';
			case 'testScreen.errors.notEnoughTerms': return 'Недостаточно терминов для выбранной длины изучения.';
			case 'resultsScreen.title': return 'Результаты теста';
			case 'resultsScreen.notSubmitted': return 'Тест еще не завершен.';
			case 'resultsScreen.noQuestions': return 'В этом тесте не было вопросов.';
			case 'resultsScreen.yourScore': return 'Ваш результат';
			case 'resultsScreen.scoreFraction': return ({required Object score, required Object total}) => 'Правильно ${score} из ${total}';
			case 'resultsScreen.reviewIncorrect': return 'Обзор неправильных ответов:';
			case 'resultsScreen.yourAnswerWas': return ({required Object answer}) => 'Ваш ответ: ${answer}';
			case 'resultsScreen.noAnswer': return '(Нет ответа)';
			case 'resultsScreen.congratulations': return 'Поздравляем! Вы ответили на все вопросы правильно!';
			case 'resultsScreen.retryTest': return 'Попробовать снова';
			case 'resultsScreen.reviewFlashcards': return 'Повторить с карточками';
			case 'resultsScreen.backToWelcome': return 'Вернуться на главный экран';
			case 'settingsScreen.title': return 'Настройки';
			case 'settingsScreen.appearance': return 'Внешний вид';
			case 'settingsScreen.language': return 'Язык';
			case 'settingsScreen.languageDialogTitle': return 'Выберите язык';
			case 'settingsScreen.uiScaling': return 'Масштабирование интерфейса';
			case 'settingsScreen.uiScalingSubtitle': return 'Настройте размер текста и элементов интерфейса';
			case 'settingsScreen.systemDefault': return 'Системный по умолчанию';
			case 'settingsScreen.light': return 'Светлая';
			case 'settingsScreen.dark': return 'Темная';
			case 'settingsScreen.english': return 'Английский';
			case 'settingsScreen.finnish': return 'Финский';
			case 'settingsScreen.russian': return 'Русский';
			case 'settingsScreen.spanish': return 'Испанский';
			case 'settingsScreen.swedish': return 'Шведский';
			case 'settingsScreen.update': return 'Обновление';
			case 'settingsScreen.checkForUpdate': return 'Проверить обновления';
			case 'settingsScreen.checkingForUpdate': return 'Проверка обновлений...';
			case 'settingsScreen.upToDate': return 'У вас последняя версия';
			case 'settingsScreen.noNewVersion': return 'Новая версия не найдена.';
			case 'settingsScreen.updateAvailable': return ({required Object version}) => 'Доступно обновление: v${version}';
			case 'settingsScreen.tapToInstall': return 'Нажмите для загрузки и установки';
			case 'settingsScreen.viewReleaseNotes': return 'Посмотреть примечания к выпуску';
			case 'settingsScreen.downloadingUpdate': return 'Загрузка обновления...';
			case 'settingsScreen.updateCheckFailed': return 'Ошибка проверки обновлений';
			case 'settingsScreen.dataManagement': return 'Управление данными';
			case 'settingsScreen.exportData': return 'Экспорт данных';
			case 'settingsScreen.exportDataSubtitle': return 'Сохранить все списки в файл';
			case 'settingsScreen.importData': return 'Импорт данных';
			case 'settingsScreen.importDataSubtitle': return 'Загрузить списки из файла';
			case 'settingsScreen.deleteAllData': return 'Удалить все данные';
			case 'settingsScreen.exportDialog.title': return 'Экспорт данных';
			case 'settingsScreen.exportDialog.content': return 'Как вы хотите экспортировать ваши данные?';
			case 'settingsScreen.exportDialog.share': return 'Поделиться файлом';
			case 'settingsScreen.exportDialog.save': return 'Сохранить на устройство';
			case 'settingsScreen.exportDialog.shareText': return 'Вот ваша резервная копия Quizlone.';
			case 'settingsScreen.exportDialog.saveFileTitle': return 'Пожалуйста, выберите файл для сохранения:';
			case 'settingsScreen.exportDialog.backupFileName': return 'quizlone_резервная_копия';
			case 'settingsScreen.importDialog.title': return 'Подтвердите импорт';
			case 'settingsScreen.importDialog.content': return 'Это импортирует учебные списки из файла. Любые существующие списки с таким же именем будут перезаписаны. Продолжить?';
			case 'settingsScreen.importDialog.import': return 'Импорт';
			case 'settingsScreen.deleteDialog.title': return 'Подтвердите удаление';
			case 'settingsScreen.deleteDialog.content': return 'Вы уверены, что хотите удалить ВСЕ учебные списки? Это действие необратимо.';
			case 'settingsScreen.deleteDialog.deleteAll': return 'Удалить все';
			case 'settingsScreen.snackbars.noDataToExport': return 'Нет данных для экспорта.';
			case 'settingsScreen.snackbars.exportSuccess': return 'Данные успешно экспортированы!';
			case 'settingsScreen.snackbars.exportError': return ({required Object error}) => 'Ошибка экспорта данных: ${error}';
			case 'settingsScreen.snackbars.fileSaved': return 'Файл успешно сохранен!';
			case 'settingsScreen.snackbars.importSuccess': return ({required Object count}) => 'Успешно импортировано ${count} списков!';
			case 'settingsScreen.snackbars.importError': return ({required Object error}) => 'Ошибка импорта данных: ${error}';
			case 'settingsScreen.snackbars.allDeleted': return 'Все учебные списки были удалены.';
			case 'controlsScreen.title': return 'Управление';
			case 'controlsScreen.gesturesTitle': return 'Жесты (Карточки)';
			case 'controlsScreen.keyboardTitle': return 'Клавиатура (Карточки)';
			case 'controlsScreen.nextCard': return 'Следующая карточка';
			case 'controlsScreen.previousCard': return 'Предыдущая карточка';
			case 'controlsScreen.flipCard': return 'Перевернуть карточку';
			case 'controlsScreen.swipeLeft': return 'Свайп влево';
			case 'controlsScreen.swipeRight': return 'Свайп вправо';
			case 'controlsScreen.swipeVertical': return 'Свайп вверх или вниз';
			case 'controlsScreen.arrowRight': return 'Клавиша со стрелкой вправо';
			case 'controlsScreen.arrowLeft': return 'Клавиша со стрелкой влево';
			case 'controlsScreen.arrowVerticalOrSpace': return 'Клавиши со стрелками вверх/вниз или Пробел';
			default: return null;
		}
	}
}

