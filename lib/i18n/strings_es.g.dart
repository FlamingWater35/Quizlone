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
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Quizlone';
	@override late final _TranslationsGeneralEs general = _TranslationsGeneralEs._(_root);
	@override late final _TranslationsDrawerEs drawer = _TranslationsDrawerEs._(_root);
	@override late final _TranslationsAboutScreenEs aboutScreen = _TranslationsAboutScreenEs._(_root);
	@override late final _TranslationsStartScreenEs startScreen = _TranslationsStartScreenEs._(_root);
	@override late final _TranslationsInputScreenEs inputScreen = _TranslationsInputScreenEs._(_root);
	@override late final _TranslationsModeSelectionScreenEs modeSelectionScreen = _TranslationsModeSelectionScreenEs._(_root);
	@override late final _TranslationsFlashcardScreenEs flashcardScreen = _TranslationsFlashcardScreenEs._(_root);
	@override late final _TranslationsLearnScreenEs learnScreen = _TranslationsLearnScreenEs._(_root);
	@override late final _TranslationsMatchScreenEs matchScreen = _TranslationsMatchScreenEs._(_root);
	@override late final _TranslationsTestScreenEs testScreen = _TranslationsTestScreenEs._(_root);
	@override late final _TranslationsResultsScreenEs resultsScreen = _TranslationsResultsScreenEs._(_root);
	@override late final _TranslationsSettingsScreenEs settingsScreen = _TranslationsSettingsScreenEs._(_root);
	@override late final _TranslationsControlsScreenEs controlsScreen = _TranslationsControlsScreenEs._(_root);
}

// Path: general
class _TranslationsGeneralEs implements TranslationsGeneralEn {
	_TranslationsGeneralEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get back => 'Volver';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get error => 'Error';
	@override String get next => 'Siguiente';
	@override String get previous => 'Anterior';
	@override String get saveAndContinue => 'Guardar y continuar';
	@override String get submit => 'Enviar';
	@override String get all => 'Todos';
	@override String get loading => 'Cargando...';
	@override String genericError({required Object error}) => 'Error: ${error}';
	@override String get reset => 'Reiniciar';
}

// Path: drawer
class _TranslationsDrawerEs implements TranslationsDrawerEn {
	_TranslationsDrawerEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Ajustes';
	@override String get controls => 'Controles';
	@override String get about => 'Acerca de';
	@override late final _TranslationsDrawerAboutDialogEs aboutDialog = _TranslationsDrawerAboutDialogEs._(_root);
	@override String get cloudSync => 'Sincronización en la nube';
	@override String get loggedInAs => 'Sesión iniciada como:';
	@override String get noEmail => 'Sin correo electrónico';
	@override String get logout => 'Cerrar sesión';
	@override String get email => 'Correo electrónico';
	@override String get password => 'Contraseña';
	@override String get signIn => 'Iniciar sesión';
	@override String get signUp => 'Registrarse';
	@override late final _TranslationsDrawerValidationEs validation = _TranslationsDrawerValidationEs._(_root);
	@override late final _TranslationsDrawerSnackbarsEs snackbars = _TranslationsDrawerSnackbarsEs._(_root);
	@override late final _TranslationsDrawerConfirmEmailDialogEs confirmEmailDialog = _TranslationsDrawerConfirmEmailDialogEs._(_root);
	@override late final _TranslationsDrawerConfirmLogoutDialogEs confirmLogoutDialog = _TranslationsDrawerConfirmLogoutDialogEs._(_root);
}

// Path: aboutScreen
class _TranslationsAboutScreenEs implements TranslationsAboutScreenEn {
	_TranslationsAboutScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String version({required Object version}) => 'Versión ${version}';
	@override String get viewLicenses => 'Ver licencias';
}

// Path: startScreen
class _TranslationsStartScreenEs implements TranslationsStartScreenEn {
	_TranslationsStartScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quizlone';
	@override String get welcome => '¡Bienvenido!';
	@override String get createNewList => 'Crear nueva lista';
	@override String get loadSavedList => 'Cargar lista guardada';
	@override String get noLists => 'Aún no hay listas guardadas.';
	@override String termCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(count,
		one: '1 término',
		other: '${count} términos',
	);
	@override late final _TranslationsStartScreenConfirmDeleteDialogEs confirmDeleteDialog = _TranslationsStartScreenConfirmDeleteDialogEs._(_root);
	@override late final _TranslationsStartScreenRenameListDialogEs renameListDialog = _TranslationsStartScreenRenameListDialogEs._(_root);
}

// Path: inputScreen
class _TranslationsInputScreenEs implements TranslationsInputScreenEn {
	_TranslationsInputScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Crear nueva lista';
	@override String get listName => 'Nombre de la lista';
	@override String get listNameHint => 'p. ej., Vocabulario del Capítulo 1';
	@override String get pasteTerms => 'Pega tus términos a continuación:';
	@override String get pasteTermsHint => '(Término en una línea, definición en la siguiente)';
	@override String get termsHint => 'Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario';
	@override String get saveList => 'Guardar lista';
	@override late final _TranslationsInputScreenErrorsEs errors = _TranslationsInputScreenErrorsEs._(_root);
}

// Path: modeSelectionScreen
class _TranslationsModeSelectionScreenEs implements TranslationsModeSelectionScreenEn {
	_TranslationsModeSelectionScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciones y Modo';
	@override String get noActiveList => 'No se encontró una lista de estudio activa o no se pudo cargar la lista.';
	@override String debugActiveId({required Object id}) => 'Depuración: El ID activo actual es ${id}';
	@override String get returnToWelcome => 'Volver a la pantalla de bienvenida';
	@override String get flashcardOptions => 'Opciones de tarjetas';
	@override String get showTermFirst => 'Mostrar término primero';
	@override String get showDefFirst => 'Mostrar definición primero';
	@override String get studyOptions => 'Opciones de aprendizaje y prueba';
	@override String get askForTerm => 'Mostrar definición, preguntar término';
	@override String get askForDef => 'Mostrar término, preguntar definición';
	@override String get studyLength => 'Longitud de estudio:';
	@override String get testFormat => 'Formato de prueba';
	@override String get writtenAnswer => 'Respuesta escrita';
	@override String get multipleChoice => 'Opción múltiple';
	@override String get requireOnlyOneAnswer => 'Aceptar una respuesta separada por comas';
	@override String get requireOnlyOneAnswerSubtitle => 'Si la respuesta correcta es \'a, b\', se acepta \'a\'';
	@override String get flashcards => 'Tarjetas';
	@override String get learn => 'Aprender';
	@override String get test => 'Prueba';
	@override String get match => 'Combinar';
	@override String get backToWelcome => 'Volver a la pantalla de bienvenida';
	@override late final _TranslationsModeSelectionScreenErrorsEs errors = _TranslationsModeSelectionScreenErrorsEs._(_root);
}

// Path: flashcardScreen
class _TranslationsFlashcardScreenEs implements TranslationsFlashcardScreenEn {
	_TranslationsFlashcardScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tarjetas';
	@override String get noCards => 'No hay tarjetas para mostrar.';
	@override String get noTerms => 'No hay términos disponibles para estudiar.';
	@override String get shuffle => 'Barajar';
	@override String get restart => 'Reiniciar';
}

// Path: learnScreen
class _TranslationsLearnScreenEs implements TranslationsLearnScreenEn {
	_TranslationsLearnScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aprender';
	@override String get restartSession => 'Reiniciar sesión de aprendizaje';
	@override String get backToOptions => 'Volver a las opciones';
	@override String get preparing => 'Preparando la siguiente pregunta...';
	@override String get answerHint => 'Escribe tu respuesta aquí...';
	@override String get incorrect => 'Incorrecto';
	@override String get hint => 'Pista';
	@override String get skip => 'Saltar';
	@override String get backToModeSelection => 'Volver a la selección de modo';
	@override late final _TranslationsLearnScreenErrorsEs errors = _TranslationsLearnScreenErrorsEs._(_root);
	@override late final _TranslationsLearnScreenFeedbackEs feedback = _TranslationsLearnScreenFeedbackEs._(_root);
	@override late final _TranslationsLearnScreenProgressEs progress = _TranslationsLearnScreenProgressEs._(_root);
}

// Path: matchScreen
class _TranslationsMatchScreenEs implements TranslationsMatchScreenEn {
	_TranslationsMatchScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Combinar';
	@override String get congratulations => '¡Felicidades!';
	@override String timeCompleted({required Object time}) => '¡Terminaste en ${time} segundos!';
	@override String get playAgain => 'Jugar de nuevo';
	@override String get backToOptions => 'Volver a las opciones';
	@override late final _TranslationsMatchScreenLeaderboardEs leaderboard = _TranslationsMatchScreenLeaderboardEs._(_root);
	@override late final _TranslationsMatchScreenErrorsEs errors = _TranslationsMatchScreenErrorsEs._(_root);
}

// Path: testScreen
class _TranslationsTestScreenEs implements TranslationsTestScreenEn {
	_TranslationsTestScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prueba';
	@override String get noQuestions => 'No hay preguntas para esta prueba.';
	@override String get viewResults => 'Ver resultados';
	@override String get submitTest => 'Enviar prueba';
	@override late final _TranslationsTestScreenErrorsEs errors = _TranslationsTestScreenErrorsEs._(_root);
}

// Path: resultsScreen
class _TranslationsResultsScreenEs implements TranslationsResultsScreenEn {
	_TranslationsResultsScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Resultados de la prueba';
	@override String get notSubmitted => 'La prueba aún no se ha enviado.';
	@override String get noQuestions => 'No había preguntas en esta prueba.';
	@override String get yourScore => 'Tu puntuación';
	@override String scoreFraction({required Object score, required Object total}) => '${score} / ${total} correctas';
	@override String get reviewIncorrect => 'Revisar respuestas incorrectas:';
	@override String yourAnswerWas({required Object answer}) => 'Tu respuesta: ${answer}';
	@override String get noAnswer => '(Sin respuesta)';
	@override String get congratulations => '¡Felicidades! ¡Acertaste todo!';
	@override String get retryTest => 'Reintentar prueba';
	@override String get reviewFlashcards => 'Revisar con tarjetas';
	@override String get backToWelcome => 'Volver a la pantalla de bienvenida';
}

// Path: settingsScreen
class _TranslationsSettingsScreenEs implements TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajustes';
	@override String get appearance => 'Apariencia';
	@override String get language => 'Idioma';
	@override String get languageDialogTitle => 'Seleccionar idioma';
	@override String get uiScaling => 'Escalado de la interfaz';
	@override String get uiScalingSubtitle => 'Ajusta el tamaño del texto y los elementos de la interfaz';
	@override String get systemDefault => 'Predeterminado del sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Oscuro';
	@override String get english => 'Inglés';
	@override String get finnish => 'Finlandés';
	@override String get russian => 'Ruso';
	@override String get spanish => 'Español';
	@override String get swedish => 'Sueco';
	@override String get update => 'Actualización';
	@override String get checkForUpdate => 'Buscar actualizaciones';
	@override String get checkingForUpdate => 'Buscando actualizaciones...';
	@override String get upToDate => 'Estás al día';
	@override String get noNewVersion => 'No se encontró una nueva versión.';
	@override String updateAvailable({required Object version}) => 'Actualización disponible: v${version}';
	@override String get tapToInstall => 'Toca para descargar e instalar';
	@override String get viewReleaseNotes => 'Ver notas de la versión';
	@override String get downloadingUpdate => 'Descargando actualización...';
	@override String get updateCheckFailed => 'Error al buscar actualizaciones';
	@override String get dataManagement => 'Gestión de datos';
	@override String get exportData => 'Exportar datos';
	@override String get exportDataSubtitle => 'Guardar todas las listas en un archivo';
	@override String get importData => 'Importar datos';
	@override String get importDataSubtitle => 'Cargar listas desde un archivo';
	@override String get deleteAllData => 'Eliminar todos los datos';
	@override late final _TranslationsSettingsScreenExportDialogEs exportDialog = _TranslationsSettingsScreenExportDialogEs._(_root);
	@override late final _TranslationsSettingsScreenImportDialogEs importDialog = _TranslationsSettingsScreenImportDialogEs._(_root);
	@override late final _TranslationsSettingsScreenDeleteDialogEs deleteDialog = _TranslationsSettingsScreenDeleteDialogEs._(_root);
	@override late final _TranslationsSettingsScreenSnackbarsEs snackbars = _TranslationsSettingsScreenSnackbarsEs._(_root);
}

// Path: controlsScreen
class _TranslationsControlsScreenEs implements TranslationsControlsScreenEn {
	_TranslationsControlsScreenEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Controles';
	@override String get gesturesTitle => 'Gestos (Tarjetas)';
	@override String get keyboardTitle => 'Teclado (Tarjetas)';
	@override String get nextCard => 'Siguiente tarjeta';
	@override String get previousCard => 'Tarjeta anterior';
	@override String get flipCard => 'Voltear tarjeta';
	@override String get swipeLeft => 'Deslizar a la izquierda';
	@override String get swipeRight => 'Deslizar a la derecha';
	@override String get swipeVertical => 'Deslizar hacia arriba o abajo';
	@override String get arrowRight => 'Tecla de flecha derecha';
	@override String get arrowLeft => 'Tecla de flecha izquierda';
	@override String get arrowVerticalOrSpace => 'Teclas de flecha arriba/abajo o Barra espaciadora';
}

// Path: drawer.aboutDialog
class _TranslationsDrawerAboutDialogEs implements TranslationsDrawerAboutDialogEn {
	_TranslationsDrawerAboutDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get legalese => '© 2025 Quizlone';
	@override String get description => 'Una aplicación de estudio simple y moderna creada con Flutter.';
}

// Path: drawer.validation
class _TranslationsDrawerValidationEs implements TranslationsDrawerValidationEn {
	_TranslationsDrawerValidationEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get emailEmpty => 'Por favor, introduce un correo electrónico';
	@override String get passwordEmpty => 'Por favor, introduce una contraseña';
}

// Path: drawer.snackbars
class _TranslationsDrawerSnackbarsEs implements TranslationsDrawerSnackbarsEn {
	_TranslationsDrawerSnackbarsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get confirmationSent => '¡Correo de confirmación enviado! Revisa tu bandeja de entrada.';
	@override String get unexpectedError => 'Ocurrió un error inesperado';
}

// Path: drawer.confirmEmailDialog
class _TranslationsDrawerConfirmEmailDialogEs implements TranslationsDrawerConfirmEmailDialogEn {
	_TranslationsDrawerConfirmEmailDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confirmar correo electrónico';
	@override String content({required Object email}) => 'Al hacer clic en confirmar, acepta que ${email} es su dirección de correo electrónico correcta.';
	@override String get confirm => 'Confirmar';
}

// Path: drawer.confirmLogoutDialog
class _TranslationsDrawerConfirmLogoutDialogEs implements TranslationsDrawerConfirmLogoutDialogEn {
	_TranslationsDrawerConfirmLogoutDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confirmar cierre de sesión';
	@override String get content => 'Cerrar sesión mantendrá tus datos en la nube. ¿Deseas también eliminar todos los datos de estudio de este dispositivo?';
	@override String get logoutOnly => 'Solo cerrar sesión';
	@override String get deleteAndLogout => 'Eliminar y cerrar sesión';
}

// Path: startScreen.confirmDeleteDialog
class _TranslationsStartScreenConfirmDeleteDialogEs implements TranslationsStartScreenConfirmDeleteDialogEn {
	_TranslationsStartScreenConfirmDeleteDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confirmar eliminación';
	@override String content({required Object listName}) => '¿Estás seguro de que quieres eliminar \'${listName}\'?';
}

// Path: startScreen.renameListDialog
class _TranslationsStartScreenRenameListDialogEs implements TranslationsStartScreenRenameListDialogEn {
	_TranslationsStartScreenRenameListDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renombrar lista';
	@override String get rename => 'Renombrar';
	@override String get errorNameExists => 'Ya existe una lista con este nombre.';
	@override String get errorNameEmpty => 'El nombre de la lista no puede estar vacío.';
}

// Path: inputScreen.errors
class _TranslationsInputScreenErrorsEs implements TranslationsInputScreenErrorsEn {
	_TranslationsInputScreenErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get listNameEmpty => 'El nombre de la lista no puede estar vacío.';
	@override String get noTerms => 'No se han introducido términos/definiciones.';
	@override String get invalidFormat => 'Formato inválido. Cada término necesita una definición en la siguiente línea.';
	@override String emptyTerm({required Object line}) => 'Error de formato cerca de la línea ${line}. Se encontró un término o definición vacíos.';
	@override String get noValidPairs => 'No se encontraron pares de término/definición válidos.';
	@override String saveFailed({required Object error}) => 'No se pudo guardar la lista: ${error}';
}

// Path: modeSelectionScreen.errors
class _TranslationsModeSelectionScreenErrorsEs implements TranslationsModeSelectionScreenErrorsEn {
	_TranslationsModeSelectionScreenErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String saveSettingFailed({required Object error}) => 'Error al guardar el ajuste: ${error}';
}

// Path: learnScreen.errors
class _TranslationsLearnScreenErrorsEs implements TranslationsLearnScreenErrorsEn {
	_TranslationsLearnScreenErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'No hay términos disponibles para el modo de aprendizaje.';
	@override String get notEnoughTerms => 'No hay suficientes términos para la longitud seleccionada.';
}

// Path: learnScreen.feedback
class _TranslationsLearnScreenFeedbackEs implements TranslationsLearnScreenFeedbackEn {
	_TranslationsLearnScreenFeedbackEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get correct => '¡Correcto!';
	@override String incorrect({required Object answer}) => 'Incorrecto. La respuesta correcta es: ${answer}';
	@override String hint({required Object char}) => 'Pista: Empieza con "${char}"';
	@override String skipped({required Object answer}) => 'Saltado. La respuesta era: ${answer}';
}

// Path: learnScreen.progress
class _TranslationsLearnScreenProgressEs implements TranslationsLearnScreenProgressEn {
	_TranslationsLearnScreenProgressEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get allLearned => '¡Todos los términos aprendidos!';
	@override String cycleStatus({required Object cycleNum, required Object itemNum, required Object total}) => 'Ciclo ${cycleNum} | Elemento ${itemNum} de ${total}';
	@override String get sessionComplete => '¡Sesión de aprendizaje completa! ¡Bien hecho!';
	@override String maxCyclesReached({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(count,
		one: 'Se alcanzó el máximo de ciclos. Queda 1 elemento por repasar.',
		other: 'Se alcanzó el máximo de ciclos. Quedan ${count} elementos por repasar.',
	);
	@override String startingCycle({required Object cycleNum, required Object count}) => 'Iniciando ciclo ${cycleNum} con ${count} elemento(s)...';
}

// Path: matchScreen.leaderboard
class _TranslationsMatchScreenLeaderboardEs implements TranslationsMatchScreenLeaderboardEn {
	_TranslationsMatchScreenLeaderboardEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabla de clasificación';
	@override String get noRecords => 'Aún no hay récords. ¡Sé el primero!';
	@override String time({required Object time}) => '${time} Segundos';
	@override String rank({required Object rank}) => '#${rank}';
	@override String get rankOver100 => '>100';
}

// Path: matchScreen.errors
class _TranslationsMatchScreenErrorsEs implements TranslationsMatchScreenErrorsEn {
	_TranslationsMatchScreenErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noTerms => 'No hay términos disponibles para el modo Combinar.';
	@override String get notEnoughTerms => 'Se requiere al menos un par de término/definición para jugar.';
}

// Path: testScreen.errors
class _TranslationsTestScreenErrorsEs implements TranslationsTestScreenErrorsEn {
	_TranslationsTestScreenErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadFailed => 'Error al cargar la lista de estudio para la prueba.';
	@override String get noTerms => 'No hay términos disponibles para la prueba.';
	@override String get notEnoughTerms => 'No hay suficientes términos para la longitud de estudio seleccionada.';
}

// Path: settingsScreen.exportDialog
class _TranslationsSettingsScreenExportDialogEs implements TranslationsSettingsScreenExportDialogEn {
	_TranslationsSettingsScreenExportDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exportar datos';
	@override String get content => '¿Cómo te gustaría exportar tus datos?';
	@override String get share => 'Compartir archivo';
	@override String get save => 'Guardar en el dispositivo';
	@override String get shareText => 'Aquí está tu copia de seguridad de Quizlone.';
}

// Path: settingsScreen.importDialog
class _TranslationsSettingsScreenImportDialogEs implements TranslationsSettingsScreenImportDialogEn {
	_TranslationsSettingsScreenImportDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confirmar importación';
	@override String get content => 'Esto importará listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre será sobrescrita. ¿Continuar?';
	@override String get import => 'Importar';
}

// Path: settingsScreen.deleteDialog
class _TranslationsSettingsScreenDeleteDialogEs implements TranslationsSettingsScreenDeleteDialogEn {
	_TranslationsSettingsScreenDeleteDialogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Confirmar eliminación';
	@override String get content => '¿Estás seguro de que quieres eliminar TODAS las listas de estudio? Esta acción no se puede deshacer.';
	@override String get deleteAll => 'Eliminar todo';
}

// Path: settingsScreen.snackbars
class _TranslationsSettingsScreenSnackbarsEs implements TranslationsSettingsScreenSnackbarsEn {
	_TranslationsSettingsScreenSnackbarsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noDataToExport => 'No hay datos para exportar.';
	@override String get exportSuccess => '¡Datos exportados con éxito!';
	@override String exportError({required Object error}) => 'Error al exportar datos: ${error}';
	@override String get fileSaved => '¡Archivo guardado con éxito!';
	@override String importSuccess({required Object count}) => '¡Se importaron ${count} listas con éxito!';
	@override String importError({required Object error}) => 'Error al importar datos: ${error}';
	@override String get allDeleted => 'Todas las listas de estudio han sido eliminadas.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Quizlone';
			case 'general.back': return 'Volver';
			case 'general.cancel': return 'Cancelar';
			case 'general.delete': return 'Eliminar';
			case 'general.error': return 'Error';
			case 'general.next': return 'Siguiente';
			case 'general.previous': return 'Anterior';
			case 'general.saveAndContinue': return 'Guardar y continuar';
			case 'general.submit': return 'Enviar';
			case 'general.all': return 'Todos';
			case 'general.loading': return 'Cargando...';
			case 'general.genericError': return ({required Object error}) => 'Error: ${error}';
			case 'general.reset': return 'Reiniciar';
			case 'drawer.settings': return 'Ajustes';
			case 'drawer.controls': return 'Controles';
			case 'drawer.about': return 'Acerca de';
			case 'drawer.aboutDialog.legalese': return '© 2025 Quizlone';
			case 'drawer.aboutDialog.description': return 'Una aplicación de estudio simple y moderna creada con Flutter.';
			case 'drawer.cloudSync': return 'Sincronización en la nube';
			case 'drawer.loggedInAs': return 'Sesión iniciada como:';
			case 'drawer.noEmail': return 'Sin correo electrónico';
			case 'drawer.logout': return 'Cerrar sesión';
			case 'drawer.email': return 'Correo electrónico';
			case 'drawer.password': return 'Contraseña';
			case 'drawer.signIn': return 'Iniciar sesión';
			case 'drawer.signUp': return 'Registrarse';
			case 'drawer.validation.emailEmpty': return 'Por favor, introduce un correo electrónico';
			case 'drawer.validation.passwordEmpty': return 'Por favor, introduce una contraseña';
			case 'drawer.snackbars.confirmationSent': return '¡Correo de confirmación enviado! Revisa tu bandeja de entrada.';
			case 'drawer.snackbars.unexpectedError': return 'Ocurrió un error inesperado';
			case 'drawer.confirmEmailDialog.title': return 'Confirmar correo electrónico';
			case 'drawer.confirmEmailDialog.content': return ({required Object email}) => 'Al hacer clic en confirmar, acepta que ${email} es su dirección de correo electrónico correcta.';
			case 'drawer.confirmEmailDialog.confirm': return 'Confirmar';
			case 'drawer.confirmLogoutDialog.title': return 'Confirmar cierre de sesión';
			case 'drawer.confirmLogoutDialog.content': return 'Cerrar sesión mantendrá tus datos en la nube. ¿Deseas también eliminar todos los datos de estudio de este dispositivo?';
			case 'drawer.confirmLogoutDialog.logoutOnly': return 'Solo cerrar sesión';
			case 'drawer.confirmLogoutDialog.deleteAndLogout': return 'Eliminar y cerrar sesión';
			case 'aboutScreen.version': return ({required Object version}) => 'Versión ${version}';
			case 'aboutScreen.viewLicenses': return 'Ver licencias';
			case 'startScreen.title': return 'Quizlone';
			case 'startScreen.welcome': return '¡Bienvenido!';
			case 'startScreen.createNewList': return 'Crear nueva lista';
			case 'startScreen.loadSavedList': return 'Cargar lista guardada';
			case 'startScreen.noLists': return 'Aún no hay listas guardadas.';
			case 'startScreen.termCount': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(count,
				one: '1 término',
				other: '${count} términos',
			);
			case 'startScreen.confirmDeleteDialog.title': return 'Confirmar eliminación';
			case 'startScreen.confirmDeleteDialog.content': return ({required Object listName}) => '¿Estás seguro de que quieres eliminar \'${listName}\'?';
			case 'startScreen.renameListDialog.title': return 'Renombrar lista';
			case 'startScreen.renameListDialog.rename': return 'Renombrar';
			case 'startScreen.renameListDialog.errorNameExists': return 'Ya existe una lista con este nombre.';
			case 'startScreen.renameListDialog.errorNameEmpty': return 'El nombre de la lista no puede estar vacío.';
			case 'inputScreen.title': return 'Crear nueva lista';
			case 'inputScreen.listName': return 'Nombre de la lista';
			case 'inputScreen.listNameHint': return 'p. ej., Vocabulario del Capítulo 1';
			case 'inputScreen.pasteTerms': return 'Pega tus términos a continuación:';
			case 'inputScreen.pasteTermsHint': return '(Término en una línea, definición en la siguiente)';
			case 'inputScreen.termsHint': return 'Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario';
			case 'inputScreen.saveList': return 'Guardar lista';
			case 'inputScreen.errors.listNameEmpty': return 'El nombre de la lista no puede estar vacío.';
			case 'inputScreen.errors.noTerms': return 'No se han introducido términos/definiciones.';
			case 'inputScreen.errors.invalidFormat': return 'Formato inválido. Cada término necesita una definición en la siguiente línea.';
			case 'inputScreen.errors.emptyTerm': return ({required Object line}) => 'Error de formato cerca de la línea ${line}. Se encontró un término o definición vacíos.';
			case 'inputScreen.errors.noValidPairs': return 'No se encontraron pares de término/definición válidos.';
			case 'inputScreen.errors.saveFailed': return ({required Object error}) => 'No se pudo guardar la lista: ${error}';
			case 'modeSelectionScreen.title': return 'Opciones y Modo';
			case 'modeSelectionScreen.noActiveList': return 'No se encontró una lista de estudio activa o no se pudo cargar la lista.';
			case 'modeSelectionScreen.debugActiveId': return ({required Object id}) => 'Depuración: El ID activo actual es ${id}';
			case 'modeSelectionScreen.returnToWelcome': return 'Volver a la pantalla de bienvenida';
			case 'modeSelectionScreen.flashcardOptions': return 'Opciones de tarjetas';
			case 'modeSelectionScreen.showTermFirst': return 'Mostrar término primero';
			case 'modeSelectionScreen.showDefFirst': return 'Mostrar definición primero';
			case 'modeSelectionScreen.studyOptions': return 'Opciones de aprendizaje y prueba';
			case 'modeSelectionScreen.askForTerm': return 'Mostrar definición, preguntar término';
			case 'modeSelectionScreen.askForDef': return 'Mostrar término, preguntar definición';
			case 'modeSelectionScreen.studyLength': return 'Longitud de estudio:';
			case 'modeSelectionScreen.testFormat': return 'Formato de prueba';
			case 'modeSelectionScreen.writtenAnswer': return 'Respuesta escrita';
			case 'modeSelectionScreen.multipleChoice': return 'Opción múltiple';
			case 'modeSelectionScreen.requireOnlyOneAnswer': return 'Aceptar una respuesta separada por comas';
			case 'modeSelectionScreen.requireOnlyOneAnswerSubtitle': return 'Si la respuesta correcta es \'a, b\', se acepta \'a\'';
			case 'modeSelectionScreen.flashcards': return 'Tarjetas';
			case 'modeSelectionScreen.learn': return 'Aprender';
			case 'modeSelectionScreen.test': return 'Prueba';
			case 'modeSelectionScreen.match': return 'Combinar';
			case 'modeSelectionScreen.backToWelcome': return 'Volver a la pantalla de bienvenida';
			case 'modeSelectionScreen.errors.saveSettingFailed': return ({required Object error}) => 'Error al guardar el ajuste: ${error}';
			case 'flashcardScreen.title': return 'Tarjetas';
			case 'flashcardScreen.noCards': return 'No hay tarjetas para mostrar.';
			case 'flashcardScreen.noTerms': return 'No hay términos disponibles para estudiar.';
			case 'flashcardScreen.shuffle': return 'Barajar';
			case 'flashcardScreen.restart': return 'Reiniciar';
			case 'learnScreen.title': return 'Aprender';
			case 'learnScreen.restartSession': return 'Reiniciar sesión de aprendizaje';
			case 'learnScreen.backToOptions': return 'Volver a las opciones';
			case 'learnScreen.preparing': return 'Preparando la siguiente pregunta...';
			case 'learnScreen.answerHint': return 'Escribe tu respuesta aquí...';
			case 'learnScreen.incorrect': return 'Incorrecto';
			case 'learnScreen.hint': return 'Pista';
			case 'learnScreen.skip': return 'Saltar';
			case 'learnScreen.backToModeSelection': return 'Volver a la selección de modo';
			case 'learnScreen.errors.noTerms': return 'No hay términos disponibles para el modo de aprendizaje.';
			case 'learnScreen.errors.notEnoughTerms': return 'No hay suficientes términos para la longitud seleccionada.';
			case 'learnScreen.feedback.correct': return '¡Correcto!';
			case 'learnScreen.feedback.incorrect': return ({required Object answer}) => 'Incorrecto. La respuesta correcta es: ${answer}';
			case 'learnScreen.feedback.hint': return ({required Object char}) => 'Pista: Empieza con "${char}"';
			case 'learnScreen.feedback.skipped': return ({required Object answer}) => 'Saltado. La respuesta era: ${answer}';
			case 'learnScreen.progress.allLearned': return '¡Todos los términos aprendidos!';
			case 'learnScreen.progress.cycleStatus': return ({required Object cycleNum, required Object itemNum, required Object total}) => 'Ciclo ${cycleNum} | Elemento ${itemNum} de ${total}';
			case 'learnScreen.progress.sessionComplete': return '¡Sesión de aprendizaje completa! ¡Bien hecho!';
			case 'learnScreen.progress.maxCyclesReached': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(count,
				one: 'Se alcanzó el máximo de ciclos. Queda 1 elemento por repasar.',
				other: 'Se alcanzó el máximo de ciclos. Quedan ${count} elementos por repasar.',
			);
			case 'learnScreen.progress.startingCycle': return ({required Object cycleNum, required Object count}) => 'Iniciando ciclo ${cycleNum} con ${count} elemento(s)...';
			case 'matchScreen.title': return 'Combinar';
			case 'matchScreen.congratulations': return '¡Felicidades!';
			case 'matchScreen.timeCompleted': return ({required Object time}) => '¡Terminaste en ${time} segundos!';
			case 'matchScreen.playAgain': return 'Jugar de nuevo';
			case 'matchScreen.backToOptions': return 'Volver a las opciones';
			case 'matchScreen.leaderboard.title': return 'Tabla de clasificación';
			case 'matchScreen.leaderboard.noRecords': return 'Aún no hay récords. ¡Sé el primero!';
			case 'matchScreen.leaderboard.time': return ({required Object time}) => '${time} Segundos';
			case 'matchScreen.leaderboard.rank': return ({required Object rank}) => '#${rank}';
			case 'matchScreen.leaderboard.rankOver100': return '>100';
			case 'matchScreen.errors.noTerms': return 'No hay términos disponibles para el modo Combinar.';
			case 'matchScreen.errors.notEnoughTerms': return 'Se requiere al menos un par de término/definición para jugar.';
			case 'testScreen.title': return 'Prueba';
			case 'testScreen.noQuestions': return 'No hay preguntas para esta prueba.';
			case 'testScreen.viewResults': return 'Ver resultados';
			case 'testScreen.submitTest': return 'Enviar prueba';
			case 'testScreen.errors.loadFailed': return 'Error al cargar la lista de estudio para la prueba.';
			case 'testScreen.errors.noTerms': return 'No hay términos disponibles para la prueba.';
			case 'testScreen.errors.notEnoughTerms': return 'No hay suficientes términos para la longitud de estudio seleccionada.';
			case 'resultsScreen.title': return 'Resultados de la prueba';
			case 'resultsScreen.notSubmitted': return 'La prueba aún no se ha enviado.';
			case 'resultsScreen.noQuestions': return 'No había preguntas en esta prueba.';
			case 'resultsScreen.yourScore': return 'Tu puntuación';
			case 'resultsScreen.scoreFraction': return ({required Object score, required Object total}) => '${score} / ${total} correctas';
			case 'resultsScreen.reviewIncorrect': return 'Revisar respuestas incorrectas:';
			case 'resultsScreen.yourAnswerWas': return ({required Object answer}) => 'Tu respuesta: ${answer}';
			case 'resultsScreen.noAnswer': return '(Sin respuesta)';
			case 'resultsScreen.congratulations': return '¡Felicidades! ¡Acertaste todo!';
			case 'resultsScreen.retryTest': return 'Reintentar prueba';
			case 'resultsScreen.reviewFlashcards': return 'Revisar con tarjetas';
			case 'resultsScreen.backToWelcome': return 'Volver a la pantalla de bienvenida';
			case 'settingsScreen.title': return 'Ajustes';
			case 'settingsScreen.appearance': return 'Apariencia';
			case 'settingsScreen.language': return 'Idioma';
			case 'settingsScreen.languageDialogTitle': return 'Seleccionar idioma';
			case 'settingsScreen.uiScaling': return 'Escalado de la interfaz';
			case 'settingsScreen.uiScalingSubtitle': return 'Ajusta el tamaño del texto y los elementos de la interfaz';
			case 'settingsScreen.systemDefault': return 'Predeterminado del sistema';
			case 'settingsScreen.light': return 'Claro';
			case 'settingsScreen.dark': return 'Oscuro';
			case 'settingsScreen.english': return 'Inglés';
			case 'settingsScreen.finnish': return 'Finlandés';
			case 'settingsScreen.russian': return 'Ruso';
			case 'settingsScreen.spanish': return 'Español';
			case 'settingsScreen.swedish': return 'Sueco';
			case 'settingsScreen.update': return 'Actualización';
			case 'settingsScreen.checkForUpdate': return 'Buscar actualizaciones';
			case 'settingsScreen.checkingForUpdate': return 'Buscando actualizaciones...';
			case 'settingsScreen.upToDate': return 'Estás al día';
			case 'settingsScreen.noNewVersion': return 'No se encontró una nueva versión.';
			case 'settingsScreen.updateAvailable': return ({required Object version}) => 'Actualización disponible: v${version}';
			case 'settingsScreen.tapToInstall': return 'Toca para descargar e instalar';
			case 'settingsScreen.viewReleaseNotes': return 'Ver notas de la versión';
			case 'settingsScreen.downloadingUpdate': return 'Descargando actualización...';
			case 'settingsScreen.updateCheckFailed': return 'Error al buscar actualizaciones';
			case 'settingsScreen.dataManagement': return 'Gestión de datos';
			case 'settingsScreen.exportData': return 'Exportar datos';
			case 'settingsScreen.exportDataSubtitle': return 'Guardar todas las listas en un archivo';
			case 'settingsScreen.importData': return 'Importar datos';
			case 'settingsScreen.importDataSubtitle': return 'Cargar listas desde un archivo';
			case 'settingsScreen.deleteAllData': return 'Eliminar todos los datos';
			case 'settingsScreen.exportDialog.title': return 'Exportar datos';
			case 'settingsScreen.exportDialog.content': return '¿Cómo te gustaría exportar tus datos?';
			case 'settingsScreen.exportDialog.share': return 'Compartir archivo';
			case 'settingsScreen.exportDialog.save': return 'Guardar en el dispositivo';
			case 'settingsScreen.exportDialog.shareText': return 'Aquí está tu copia de seguridad de Quizlone.';
			case 'settingsScreen.importDialog.title': return 'Confirmar importación';
			case 'settingsScreen.importDialog.content': return 'Esto importará listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre será sobrescrita. ¿Continuar?';
			case 'settingsScreen.importDialog.import': return 'Importar';
			case 'settingsScreen.deleteDialog.title': return 'Confirmar eliminación';
			case 'settingsScreen.deleteDialog.content': return '¿Estás seguro de que quieres eliminar TODAS las listas de estudio? Esta acción no se puede deshacer.';
			case 'settingsScreen.deleteDialog.deleteAll': return 'Eliminar todo';
			case 'settingsScreen.snackbars.noDataToExport': return 'No hay datos para exportar.';
			case 'settingsScreen.snackbars.exportSuccess': return '¡Datos exportados con éxito!';
			case 'settingsScreen.snackbars.exportError': return ({required Object error}) => 'Error al exportar datos: ${error}';
			case 'settingsScreen.snackbars.fileSaved': return '¡Archivo guardado con éxito!';
			case 'settingsScreen.snackbars.importSuccess': return ({required Object count}) => '¡Se importaron ${count} listas con éxito!';
			case 'settingsScreen.snackbars.importError': return ({required Object error}) => 'Error al importar datos: ${error}';
			case 'settingsScreen.snackbars.allDeleted': return 'Todas las listas de estudio han sido eliminadas.';
			case 'controlsScreen.title': return 'Controles';
			case 'controlsScreen.gesturesTitle': return 'Gestos (Tarjetas)';
			case 'controlsScreen.keyboardTitle': return 'Teclado (Tarjetas)';
			case 'controlsScreen.nextCard': return 'Siguiente tarjeta';
			case 'controlsScreen.previousCard': return 'Tarjeta anterior';
			case 'controlsScreen.flipCard': return 'Voltear tarjeta';
			case 'controlsScreen.swipeLeft': return 'Deslizar a la izquierda';
			case 'controlsScreen.swipeRight': return 'Deslizar a la derecha';
			case 'controlsScreen.swipeVertical': return 'Deslizar hacia arriba o abajo';
			case 'controlsScreen.arrowRight': return 'Tecla de flecha derecha';
			case 'controlsScreen.arrowLeft': return 'Tecla de flecha izquierda';
			case 'controlsScreen.arrowVerticalOrSpace': return 'Teclas de flecha arriba/abajo o Barra espaciadora';
			default: return null;
		}
	}
}

