((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
b_w(d,e,f){var w,v,u=null,t=new B.hr(d,x.c),s=new B.hr(d,x.c)
s=new A.XB(t,s)
s.wy(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bhP(s)
return s},
bhL(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Combinar",m="Volver a las opciones",l="Exportar datos"
switch(e){case"appName":return w
case"general.back":return"Volver"
case"general.cancel":return"Cancelar"
case"general.delete":return"Eliminar"
case"general.error":return"Error"
case"general.next":return"Siguiente"
case"general.previous":return"Anterior"
case"general.saveAndContinue":return"Guardar y continuar"
case"general.submit":return"Enviar"
case"general.all":return"Todos"
case"general.loading":return"Cargando..."
case"general.genericError":return new A.aO9()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aOa()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aOb(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aOc()
case"startScreen.renameListDialog.title":return"Renombrar lista"
case"startScreen.renameListDialog.rename":return"Renombrar"
case"startScreen.renameListDialog.errorNameExists":return"Ya existe una lista con este nombre."
case"startScreen.renameListDialog.errorNameEmpty":return r
case"inputScreen.title":return t
case"inputScreen.listName":return"Nombre de la lista"
case"inputScreen.listNameHint":return"p. ej., Vocabulario del Cap\xedtulo 1"
case"inputScreen.pasteTerms":return"Pega tus t\xe9rminos a continuaci\xf3n:"
case"inputScreen.pasteTermsHint":return y.C
case"inputScreen.termsHint":return y.P
case"inputScreen.saveList":return"Guardar lista"
case"inputScreen.errors.listNameEmpty":return r
case"inputScreen.errors.noTerms":return y._
case"inputScreen.errors.invalidFormat":return y.n
case"inputScreen.errors.emptyTerm":return new A.aOd()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aOe()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aOf()
case"modeSelectionScreen.returnToWelcome":return q
case"modeSelectionScreen.flashcardOptions":return"Opciones de tarjetas"
case"modeSelectionScreen.showTermFirst":return"Mostrar t\xe9rmino primero"
case"modeSelectionScreen.showDefFirst":return"Mostrar definici\xf3n primero"
case"modeSelectionScreen.studyOptions":return"Opciones de aprendizaje y prueba"
case"modeSelectionScreen.askForTerm":return"Mostrar definici\xf3n, preguntar t\xe9rmino"
case"modeSelectionScreen.askForDef":return"Mostrar t\xe9rmino, preguntar definici\xf3n"
case"modeSelectionScreen.studyLength":return"Longitud de estudio:"
case"modeSelectionScreen.testFormat":return"Formato de prueba"
case"modeSelectionScreen.writtenAnswer":return"Respuesta escrita"
case"modeSelectionScreen.multipleChoice":return"Opci\xf3n m\xfaltiple"
case"modeSelectionScreen.requireOnlyOneAnswer":return"Aceptar una respuesta separada por comas"
case"modeSelectionScreen.requireOnlyOneAnswerSubtitle":return y.v
case"modeSelectionScreen.flashcards":return p
case"modeSelectionScreen.learn":return o
case"modeSelectionScreen.test":return"Prueba"
case"modeSelectionScreen.match":return n
case"modeSelectionScreen.backToWelcome":return q
case"flashcardScreen.title":return p
case"flashcardScreen.noCards":return"No hay tarjetas para mostrar."
case"flashcardScreen.noTerms":return y.f
case"flashcardScreen.shuffle":return"Barajar"
case"flashcardScreen.restart":return v
case"learnScreen.title":return o
case"learnScreen.restartSession":return"Reiniciar sesi\xf3n de aprendizaje"
case"learnScreen.backToOptions":return m
case"learnScreen.preparing":return"Preparando la siguiente pregunta..."
case"learnScreen.answerHint":return"Escribe tu respuesta aqu\xed..."
case"learnScreen.incorrect":return"Incorrecto"
case"learnScreen.hint":return"Pista"
case"learnScreen.skip":return"Saltar"
case"learnScreen.backToModeSelection":return"Volver a la selecci\xf3n de modo"
case"learnScreen.errors.noTerms":return y.B
case"learnScreen.errors.notEnoughTerms":return y.h
case"learnScreen.feedback.correct":return"\xa1Correcto!"
case"learnScreen.feedback.incorrect":return new A.aOg()
case"learnScreen.feedback.hint":return new A.aOi()
case"learnScreen.feedback.skipped":return new A.aOj()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aOk()
case"learnScreen.progress.sessionComplete":return y.k
case"learnScreen.progress.maxCyclesReached":return new A.aOl(d)
case"learnScreen.progress.startingCycle":return new A.aOm()
case"matchScreen.title":return n
case"matchScreen.congratulations":return"\xa1Felicidades!"
case"matchScreen.timeCompleted":return new A.aOn()
case"matchScreen.playAgain":return"Jugar de nuevo"
case"matchScreen.backToOptions":return m
case"matchScreen.leaderboard.title":return"Tabla de clasificaci\xf3n"
case"matchScreen.leaderboard.noRecords":return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"
case"matchScreen.leaderboard.time":return new A.aOo()
case"matchScreen.errors.noTerms":return"No hay t\xe9rminos disponibles para el modo Combinar."
case"matchScreen.errors.notEnoughTerms":return y.R
case"testScreen.title":return"Prueba"
case"testScreen.noQuestions":return"No hay preguntas para esta prueba."
case"testScreen.viewResults":return"Ver resultados"
case"testScreen.submitTest":return"Enviar prueba"
case"testScreen.errors.loadFailed":return y.Q
case"testScreen.errors.noTerms":return y.I
case"testScreen.errors.notEnoughTerms":return y.W
case"resultsScreen.title":return"Resultados de la prueba"
case"resultsScreen.notSubmitted":return"La prueba a\xfan no se ha enviado."
case"resultsScreen.noQuestions":return"No hab\xeda preguntas en esta prueba."
case"resultsScreen.yourScore":return"Tu puntuaci\xf3n"
case"resultsScreen.scoreFraction":return new A.aOp()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aOq()
case"resultsScreen.noAnswer":return"(Sin respuesta)"
case"resultsScreen.congratulations":return"\xa1Felicidades! \xa1Acertaste todo!"
case"resultsScreen.retryTest":return"Reintentar prueba"
case"resultsScreen.reviewFlashcards":return"Revisar con tarjetas"
case"resultsScreen.backToWelcome":return q
case"settingsScreen.title":return"Ajustes"
case"settingsScreen.appearance":return"Apariencia"
case"settingsScreen.language":return"Idioma"
case"settingsScreen.languageDialogTitle":return"Seleccionar idioma"
case"settingsScreen.uiScaling":return"Escalado de la interfaz"
case"settingsScreen.uiScalingSubtitle":return y.L
case"settingsScreen.systemDefault":return"Predeterminado del sistema"
case"settingsScreen.light":return"Claro"
case"settingsScreen.dark":return"Oscuro"
case"settingsScreen.english":return"Ingl\xe9s"
case"settingsScreen.finnish":return"Finland\xe9s"
case"settingsScreen.russian":return"Ruso"
case"settingsScreen.spanish":return"Espa\xf1ol"
case"settingsScreen.swedish":return"Sueco"
case"settingsScreen.update":return"Actualizaci\xf3n"
case"settingsScreen.checkForUpdate":return"Buscar actualizaciones"
case"settingsScreen.checkingForUpdate":return"Buscando actualizaciones..."
case"settingsScreen.upToDate":return"Est\xe1s al d\xeda"
case"settingsScreen.noNewVersion":return"No se encontr\xf3 una nueva versi\xf3n."
case"settingsScreen.updateAvailable":return new A.aOr()
case"settingsScreen.tapToInstall":return"Toca para descargar e instalar"
case"settingsScreen.viewReleaseNotes":return"Ver notas de la versi\xf3n"
case"settingsScreen.downloadingUpdate":return"Descargando actualizaci\xf3n..."
case"settingsScreen.updateCheckFailed":return"Error al buscar actualizaciones"
case"settingsScreen.dataManagement":return"Gesti\xf3n de datos"
case"settingsScreen.exportData":return l
case"settingsScreen.exportDataSubtitle":return"Guardar todas las listas en un archivo"
case"settingsScreen.importData":return"Importar datos"
case"settingsScreen.importDataSubtitle":return"Cargar listas desde un archivo"
case"settingsScreen.deleteAllData":return"Eliminar todos los datos"
case"settingsScreen.exportDialog.title":return l
case"settingsScreen.exportDialog.content":return"\xbfC\xf3mo te gustar\xeda exportar tus datos?"
case"settingsScreen.exportDialog.share":return"Compartir archivo"
case"settingsScreen.exportDialog.save":return"Guardar en el dispositivo"
case"settingsScreen.importDialog.title":return"Confirmar importaci\xf3n"
case"settingsScreen.importDialog.content":return y.s
case"settingsScreen.importDialog.import":return"Importar"
case"settingsScreen.deleteDialog.title":return s
case"settingsScreen.deleteDialog.content":return y.x
case"settingsScreen.deleteDialog.deleteAll":return"Eliminar todo"
case"settingsScreen.snackbars.noDataToExport":return"No hay datos para exportar."
case"settingsScreen.snackbars.exportSuccess":return"\xa1Datos exportados con \xe9xito!"
case"settingsScreen.snackbars.exportError":return new A.aOt()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aOu()
case"settingsScreen.snackbars.importError":return new A.aOv()
case"settingsScreen.snackbars.allDeleted":return y.J
case"controlsScreen.title":return u
case"controlsScreen.gesturesTitle":return"Gestos (Tarjetas)"
case"controlsScreen.keyboardTitle":return"Teclado (Tarjetas)"
case"controlsScreen.nextCard":return"Siguiente tarjeta"
case"controlsScreen.previousCard":return"Tarjeta anterior"
case"controlsScreen.flipCard":return"Voltear tarjeta"
case"controlsScreen.swipeLeft":return"Deslizar a la izquierda"
case"controlsScreen.swipeRight":return"Deslizar a la derecha"
case"controlsScreen.swipeVertical":return"Deslizar hacia arriba o abajo"
case"controlsScreen.arrowRight":return"Tecla de flecha derecha"
case"controlsScreen.arrowLeft":return"Tecla de flecha izquierda"
case"controlsScreen.arrowVerticalOrSpace":return y.b
default:return null}},
bhP(d){return new A.aOA(d)},
XB:function XB(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aKJ:function aKJ(){},
aKB:function aKB(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aKp:function aKp(){},
aLO:function aLO(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKR:function aKR(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLm:function aLm(){},
aKF:function aKF(){},
aKZ:function aKZ(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aLe:function aLe(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aM_:function aM_(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLq:function aLq(){},
aLy:function aLy(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aKt:function aKt(){},
aKx:function aKx(){},
aLK:function aLK(){},
aLQ:function aLQ(){},
aKN:function aKN(){},
aKV:function aKV(){},
aL_:function aL_(){},
aL4:function aL4(d,e){this.b=d
this.a=e},
aLg:function aLg(){},
aLa:function aLa(){},
aLW:function aLW(){},
aLA:function aLA(){},
aLu:function aLu(){},
aLF:function aLF(){},
aOA:function aOA(d){this.a=d},
aO9:function aO9(){},
aOa:function aOa(){},
aOb:function aOb(d){this.a=d},
aOc:function aOc(){},
aOd:function aOd(){},
aOe:function aOe(){},
aOf:function aOf(){},
aOg:function aOg(){},
aOi:function aOi(){},
aOj:function aOj(){},
aOk:function aOk(){},
aOl:function aOl(d){this.a=d},
aOm:function aOm(){},
aOn:function aOn(){},
aOo:function aOo(){},
aOp:function aOp(){},
aOq:function aOq(){},
aOr:function aOr(){},
aOt:function aOt(){},
aOu:function aOu(){},
aOv:function aOv(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
A.XB.prototype={
ghX(){var w=this.ch
return w===$?this.ch=this:w},
got(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghX()
w.CW!==$&&B.a_()
v=w.CW=new A.aKJ()}return v},
glY(){var w,v=this,u=v.cx
if(u===$){w=v.ghX()
v.cx!==$&&B.a_()
u=v.cx=new A.aKB(w,w)}return u},
gtK(){var w=this,v=w.cy
if(v===$){w.ghX()
w.cy!==$&&B.a_()
v=w.cy=new A.aKp()}return v},
gfw(){var w,v=this,u=v.db
if(u===$){w=v.ghX()
v.db!==$&&B.a_()
u=v.db=new A.aLO(w,w)}return u},
gfK(){var w,v=this,u=v.dx
if(u===$){w=v.ghX()
v.dx!==$&&B.a_()
u=v.dx=new A.aKR(w,w)}return u},
gcm(){var w=this,v=w.dy
if(v===$){w.ghX()
w.dy!==$&&B.a_()
v=w.dy=new A.aLm()}return v},
gne(){var w=this,v=w.fr
if(v===$){w.ghX()
w.fr!==$&&B.a_()
v=w.fr=new A.aKF()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghX()
v.fx!==$&&B.a_()
u=v.fx=new A.aKZ(w,w)}return u},
gks(){var w,v=this,u=v.fy
if(u===$){w=v.ghX()
v.fy!==$&&B.a_()
u=v.fy=new A.aLe(w,w)}return u},
glq(){var w,v=this,u=v.go
if(u===$){w=v.ghX()
v.go!==$&&B.a_()
u=v.go=new A.aM_(w,w)}return u},
ghO(){var w=this,v=w.id
if(v===$){w.ghX()
w.id!==$&&B.a_()
v=w.id=new A.aLq()}return v},
gcB(){var w,v=this,u=v.k1
if(u===$){w=v.ghX()
v.k1!==$&&B.a_()
u=v.k1=new A.aLy(w,w)}return u},
gfm(){var w=this,v=w.k2
if(v===$){w.ghX()
w.k2!==$&&B.a_()
v=w.k2=new A.aKt()}return v},
gmt(){return this.ay}}
A.aKJ.prototype={
gy3(d){return"Volver"},
gow(d){return"Cancelar"},
grz(d){return"Eliminar"},
gjy(d){return"Siguiente"},
gph(){return"Anterior"},
gwn(d){return"Enviar"},
gxP(){return"Todos"},
gA8(){return"Cargando..."},
hm(d){return"Error: "+d},
gB_(d){return"Reiniciar"}}
A.aKB.prototype={
gw5(){return"Ajustes"},
gyl(d){return"Controles"},
gtI(){return"Acerca de"},
gtJ(){var w=this.d
return w===$?this.d=new A.aKx():w}}
A.aKp.prototype={
Bq(d,e){return"Versi\xf3n "+e},
gBr(){return"Ver licencias"}}
A.aLO.prototype={
gau(d){return"Quizlone"},
gBu(){return"\xa1Bienvenido!"},
gyz(){return"Crear nueva lista"},
gA7(){return"Cargar lista guardada"},
gAp(){return"A\xfan no hay listas guardadas."},
vm(d){var w=B.ff("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gu5(){var w=this.e
return w===$?this.e=new A.aLK():w},
gnD(){var w=this.f
return w===$?this.f=new A.aLQ():w}}
A.aKR.prototype={
gau(d){return"Crear nueva lista"},
guX(){return"Nombre de la lista"},
gA2(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gAE(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gAF(){return y.C},
gBc(){return y.P},
gvU(){return"Guardar lista"},
gd2(){var w=this.d
return w===$?this.d=new A.aKN():w}}
A.aLm.prototype={
gau(d){return"Opciones y Modo"},
gnu(){return y.X},
ghP(){return"Volver a la pantalla de bienvenida"},
gzj(){return"Opciones de tarjetas"},
gwa(){return"Mostrar t\xe9rmino primero"},
gw8(){return"Mostrar definici\xf3n primero"},
gwm(){return"Opciones de aprendizaje y prueba"},
gtT(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtS(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gwl(){return"Longitud de estudio:"},
gBx(){return"Respuesta escrita"},
gAk(){return"Opci\xf3n m\xfaltiple"},
gAY(){return"Aceptar una respuesta separada por comas"},
gAZ(){return y.v},
gzk(){return"Tarjetas"},
gzX(){return"Aprender"},
gvn(){return"Prueba"},
gAb(d){return"Combinar"}}
A.aKF.prototype={
gau(d){return"Tarjetas"},
gAn(){return"No hay tarjetas para mostrar."},
geu(){return y.f},
gwc(d){return"Barajar"},
gB2(){return"Reiniciar"}}
A.aKZ.prototype={
gau(d){return"Aprender"},
gB3(){return"Reiniciar sesi\xf3n de aprendizaje"},
gkV(){return"Volver a las opciones"},
gtO(){return"Escribe tu respuesta aqu\xed..."},
gni(d){return"Pista"},
gwd(d){return"Saltar"},
gd2(){var w=this.f
return w===$?this.f=new A.aKV():w},
goR(){var w=this.r
return w===$?this.r=new A.aL_():w},
gme(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aL4(w,w)}return v}}
A.aLe.prototype={
gau(d){return"Combinar"},
gkX(){return"\xa1Felicidades!"},
gAJ(){return"Jugar de nuevo"},
gkV(){return"Volver a las opciones"},
gqY(){var w=this.e
return w===$?this.e=new A.aLg():w},
gd2(){var w=this.f
return w===$?this.f=new A.aLa():w}}
A.aM_.prototype={
gau(d){return"Prueba"},
glg(){return"No hay preguntas para esta prueba."},
gBs(){return"Ver resultados"},
gwo(){return"Enviar prueba"},
gd2(){var w=this.d
return w===$?this.d=new A.aLW():w}}
A.aLq.prototype={
gau(d){return"Resultados de la prueba"},
glg(){return"No hab\xeda preguntas en esta prueba."},
gBz(){return"Tu puntuaci\xf3n"},
vY(d,e){return""+d+" / "+e+" correctas"},
gri(){return"Revisar respuestas incorrectas:"},
By(d){return"Tu respuesta: "+d},
gAm(){return"(Sin respuesta)"},
gkX(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gB6(){return"Reintentar prueba"},
gB8(){return"Revisar con tarjetas"}}
A.aLy.prototype={
gau(d){return"Ajustes"},
gxS(d){return"Apariencia"},
guT(d){return"Idioma"},
gzU(){return"Seleccionar idioma"},
gvw(){return"Escalado de la interfaz"},
gBl(){return y.L},
gt_(){return"Predeterminado del sistema"},
gA0(){return"Claro"},
gyF(){return"Oscuro"},
gz1(){return"Ingl\xe9s"},
gzi(){return"Finland\xe9s"},
gBb(){return"Ruso"},
gwg(){return"Espa\xf1ol"},
gwt(){return"Sueco"},
gyH(){return"Gesti\xf3n de datos"},
gz7(){return"Exportar datos"},
gz8(){return"Guardar todas las listas en un archivo"},
gzz(){return"Importar datos"},
gzA(){return"Cargar listas desde un archivo"},
gyM(){return"Eliminar todos los datos"},
gqP(){var w=this.w
return w===$?this.w=new A.aLA():w},
gqg(){var w=this.x
return w===$?this.x=new A.aLu():w},
gmC(){var w=this.y
return w===$?this.y=new A.aLF():w}}
A.aKt.prototype={
gau(d){return"Controles"},
gvD(){return"Gestos (Tarjetas)"},
gzR(){return"Teclado (Tarjetas)"},
gpa(){return"Siguiente tarjeta"},
gpi(){return"Tarjeta anterior"},
goZ(){return"Voltear tarjeta"},
gwu(){return"Deslizar a la izquierda"},
gwv(){return"Deslizar a la derecha"},
gww(){return"Deslizar hacia arriba o abajo"},
gxX(){return"Tecla de flecha derecha"},
gxW(){return"Tecla de flecha izquierda"},
gxY(){return y.b}}
A.aKx.prototype={
gzZ(){return"\xa9 2025 Quizlone"},
gyO(d){return y.a}}
A.aLK.prototype={
gau(d){return"Confirmar eliminaci\xf3n"},
yk(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aLQ.prototype={
gau(d){return"Renombrar lista"},
gve(){return"Renombrar"},
gz3(){return"Ya existe una lista con este nombre."},
gz2(){return y.N}}
A.aKN.prototype={
gA1(){return y.N},
geu(){return y._},
gzL(){return y.n},
yY(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gAr(){return y.O},
vS(d){return"No se pudo guardar la lista: "+d}}
A.aKV.prototype={
geu(){return y.B},
ghb(){return y.h}}
A.aL_.prototype={
gyv(){return"\xa1Correcto!"},
zD(d){return"Incorrecto. La respuesta correcta es: "+d},
zv(d,e){return'Pista: Empieza con "'+e+'"'},
we(d){return"Saltado. La respuesta era: "+d}}
A.aL4.prototype={
gxR(){return"\xa1Todos los t\xe9rminos aprendidos!"},
uc(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gw2(){return y.k},
Ac(d){var w=B.ff("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
wi(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aLg.prototype={
gau(d){return"Tabla de clasificaci\xf3n"},
gAq(){return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"},
Bg(d,e){return e+" Segundos"}}
A.aLa.prototype={
ghb(){return y.R}}
A.aLW.prototype={
gA6(){return y.Q},
geu(){return y.I},
ghb(){return y.W}}
A.aLA.prototype={
gau(d){return"Confirmar importaci\xf3n"},
gkY(d){return y.s},
gvQ(d){return"Importar"}}
A.aLu.prototype={
gau(d){return"Confirmar eliminaci\xf3n"},
gkY(d){return y.x},
gyL(){return"Eliminar todo"}}
A.aLF.prototype={
gAo(){return"No hay datos para exportar."},
z9(d){return"Error al exportar datos: "+d},
zC(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
zB(d){return"Error al importar datos: "+d},
gxQ(){return y.J}}
var z=a.updateTypes([])
A.aOA.prototype={
$1(d){return A.bhL(this.a,d)},
$S:59}
A.aO9.prototype={
$1$error(d){return"Error: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aOa.prototype={
$1$version(d){return"Versi\xf3n "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aOb.prototype={
$1$count(d){var w
this.a.ghX()
w=B.ff("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.h(d)+" t\xe9rminos")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aOc.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:72}
A.aOd.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.h(d)+y.Z},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:86}
A.aOe.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aOf.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:87}
A.aOg.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aOi.prototype={
$1$char(d){return'Pista: Empieza con "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:88}
A.aOj.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aOk.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.h(d)+" | Elemento "+B.h(e)+" de "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:89}
A.aOl.prototype={
$1$count(d){var w
this.a.ghX()
w=B.ff("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.h(d)+" elementos por repasar.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aOm.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.h(e)+" con "+B.h(d)+" elemento(s)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:90}
A.aOn.prototype={
$1$time(d){return"\xa1Terminaste en "+B.h(d)+" segundos!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aOo.prototype={
$1$time(d){return B.h(d)+" Segundos"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aOp.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" correctas"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:92}
A.aOq.prototype={
$1$answer(d){return"Tu respuesta: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aOr.prototype={
$1$version(d){return"Actualizaci\xf3n disponible: v"+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aOt.prototype={
$1$error(d){return"Error al exportar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aOu.prototype={
$1$count(d){return"\xa1Se importaron "+B.h(d)+" listas con \xe9xito!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:93}
A.aOv.prototype={
$1$error(d){return"Error al importar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.XB,B.dt)
w(A.aKJ,B.v7)
w(A.aKB,B.v5)
w(A.aKp,B.v2)
w(A.aLO,B.vo)
w(A.aKR,B.v8)
w(A.aLm,B.vh)
w(A.aKF,B.v6)
w(A.aKZ,B.va)
w(A.aLe,B.ve)
w(A.aM_,B.vq)
w(A.aLq,B.vi)
w(A.aLy,B.vk)
w(A.aKt,B.v3)
w(A.aKx,B.v4)
w(A.aLK,B.vn)
w(A.aLQ,B.vp)
w(A.aKN,B.v9)
w(A.aKV,B.vb)
w(A.aL_,B.vc)
w(A.aL4,B.vd)
w(A.aLg,B.vg)
w(A.aLa,B.vf)
w(A.aLW,B.vr)
w(A.aLA,B.vl)
w(A.aLu,B.vj)
w(A.aLF,B.vm)
v(B.jH,[A.aOA,A.aO9,A.aOa,A.aOb,A.aOc,A.aOd,A.aOe,A.aOf,A.aOg,A.aOi,A.aOj,A.aOk,A.aOl,A.aOm,A.aOn,A.aOo,A.aOp,A.aOq,A.aOr,A.aOt,A.aOu,A.aOv])})()
B.a6f(b.typeUniverse,JSON.parse('{"XB":{"dt":[],"ic":["dR","dt"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",R:"Se requiere al menos un par de t\xe9rmino/definici\xf3n para jugar.",v:"Si la respuesta correcta es 'a, b', se acepta 'a'",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",k:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.an("hr<dR,dt>")}};
(a=>{a["T+uI1qvAIlEinX2tgjNVko/VNQ8="]=a.current})($__dart_deferred_initializers__);