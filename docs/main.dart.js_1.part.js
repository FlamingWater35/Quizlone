((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aYR(d,e,f){var w,v,u=null,t=new B.hn(d,x.c),s=new B.hn(d,x.c)
s=new A.X6(t,s)
s.wa(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bfh(s)
return s},
bfd(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Combinar",m="Volver a las opciones",l="Exportar datos"
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
case"general.genericError":return new A.aMC()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aME()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aMF(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aMG()
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
case"inputScreen.errors.emptyTerm":return new A.aMH()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aMI()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aMJ()
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
case"learnScreen.feedback.incorrect":return new A.aMK()
case"learnScreen.feedback.hint":return new A.aML()
case"learnScreen.feedback.skipped":return new A.aMM()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aMN()
case"learnScreen.progress.sessionComplete":return y.k
case"learnScreen.progress.maxCyclesReached":return new A.aMP(d)
case"learnScreen.progress.startingCycle":return new A.aMQ()
case"matchScreen.title":return n
case"matchScreen.congratulations":return"\xa1Felicidades!"
case"matchScreen.timeCompleted":return new A.aMR()
case"matchScreen.playAgain":return"Jugar de nuevo"
case"matchScreen.backToOptions":return m
case"matchScreen.leaderboard.title":return"Tabla de clasificaci\xf3n"
case"matchScreen.leaderboard.noRecords":return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"
case"matchScreen.leaderboard.time":return new A.aMS()
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
case"resultsScreen.scoreFraction":return new A.aMT()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aMU()
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
case"settingsScreen.snackbars.exportError":return new A.aMV()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aMW()
case"settingsScreen.snackbars.importError":return new A.aMX()
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
bfh(d){return new A.aN2(d)},
X6:function X6(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aJf:function aJf(){},
aJ7:function aJ7(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIW:function aIW(){},
aKk:function aKk(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aJn:function aJn(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJT:function aJT(){},
aJb:function aJb(){},
aJv:function aJv(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aJL:function aJL(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKw:function aKw(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJX:function aJX(){},
aK4:function aK4(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aJ_:function aJ_(){},
aJ3:function aJ3(){},
aKg:function aKg(){},
aKm:function aKm(){},
aJj:function aJj(){},
aJr:function aJr(){},
aJw:function aJw(){},
aJB:function aJB(d,e){this.b=d
this.a=e},
aJN:function aJN(){},
aJH:function aJH(){},
aKs:function aKs(){},
aK6:function aK6(){},
aK0:function aK0(){},
aKb:function aKb(){},
aN2:function aN2(d){this.a=d},
aMC:function aMC(){},
aME:function aME(){},
aMF:function aMF(d){this.a=d},
aMG:function aMG(){},
aMH:function aMH(){},
aMI:function aMI(){},
aMJ:function aMJ(){},
aMK:function aMK(){},
aML:function aML(){},
aMM:function aMM(){},
aMN:function aMN(){},
aMP:function aMP(d){this.a=d},
aMQ:function aMQ(){},
aMR:function aMR(){},
aMS:function aMS(){},
aMT:function aMT(){},
aMU:function aMU(){},
aMV:function aMV(){},
aMW:function aMW(){},
aMX:function aMX(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
A.X6.prototype={
ghS(){var w=this.ch
return w===$?this.ch=this:w},
go7(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghS()
w.CW!==$&&B.a_()
v=w.CW=new A.aJf()}return v},
glR(){var w,v=this,u=v.cx
if(u===$){w=v.ghS()
v.cx!==$&&B.a_()
u=v.cx=new A.aJ7(w,w)}return u},
gtr(){var w=this,v=w.cy
if(v===$){w.ghS()
w.cy!==$&&B.a_()
v=w.cy=new A.aIW()}return v},
gfu(){var w,v=this,u=v.db
if(u===$){w=v.ghS()
v.db!==$&&B.a_()
u=v.db=new A.aKk(w,w)}return u},
gfG(){var w,v=this,u=v.dx
if(u===$){w=v.ghS()
v.dx!==$&&B.a_()
u=v.dx=new A.aJn(w,w)}return u},
gcr(){var w=this,v=w.dy
if(v===$){w.ghS()
w.dy!==$&&B.a_()
v=w.dy=new A.aJT()}return v},
gn3(){var w=this,v=w.fr
if(v===$){w.ghS()
w.fr!==$&&B.a_()
v=w.fr=new A.aJb()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghS()
v.fx!==$&&B.a_()
u=v.fx=new A.aJv(w,w)}return u},
gki(){var w,v=this,u=v.fy
if(u===$){w=v.ghS()
v.fy!==$&&B.a_()
u=v.fy=new A.aJL(w,w)}return u},
glj(){var w,v=this,u=v.go
if(u===$){w=v.ghS()
v.go!==$&&B.a_()
u=v.go=new A.aKw(w,w)}return u},
ghJ(){var w=this,v=w.id
if(v===$){w.ghS()
w.id!==$&&B.a_()
v=w.id=new A.aJX()}return v},
gcv(){var w,v=this,u=v.k1
if(u===$){w=v.ghS()
v.k1!==$&&B.a_()
u=v.k1=new A.aK4(w,w)}return u},
gfj(){var w=this,v=w.k2
if(v===$){w.ghS()
w.k2!==$&&B.a_()
v=w.k2=new A.aJ_()}return v},
gmm(){return this.ay}}
A.aJf.prototype={
gxF(d){return"Volver"},
goa(d){return"Cancelar"},
grd(d){return"Eliminar"},
gjq(d){return"Siguiente"},
goQ(){return"Anterior"},
gw_(d){return"Enviar"},
gxs(){return"Todos"},
gzM(){return"Cargando..."},
hh(d){return"Error: "+d},
gAC(d){return"Reiniciar"}}
A.aJ7.prototype={
gvJ(){return"Ajustes"},
gxX(d){return"Controles"},
gtp(){return"Acerca de"},
gtq(){var w=this.d
return w===$?this.d=new A.aJ3():w}}
A.aIW.prototype={
B2(d,e){return"Versi\xf3n "+e},
gB3(){return"Ver licencias"}}
A.aKk.prototype={
gau(d){return"Quizlone"},
gB6(){return"\xa1Bienvenido!"},
gyc(){return"Crear nueva lista"},
gzL(){return"Cargar lista guardada"},
gA3(){return"A\xfan no hay listas guardadas."},
v3(d){var w=B.fa("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtO(){var w=this.e
return w===$?this.e=new A.aKg():w},
gnp(){var w=this.f
return w===$?this.f=new A.aKm():w}}
A.aJn.prototype={
gau(d){return"Crear nueva lista"},
guE(){return"Nombre de la lista"},
gzG(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gAi(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gAj(){return y.C},
gAP(){return y.P},
gvx(){return"Guardar lista"},
gd1(){var w=this.d
return w===$?this.d=new A.aJj():w}}
A.aJT.prototype={
gau(d){return"Opciones y Modo"},
gng(){return y.X},
ghK(){return"Volver a la pantalla de bienvenida"},
gyY(){return"Opciones de tarjetas"},
gvO(){return"Mostrar t\xe9rmino primero"},
gvM(){return"Mostrar definici\xf3n primero"},
gtA(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtz(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvZ(){return"Longitud de estudio:"},
gBa(){return"Respuesta escrita"},
gzZ(){return"Opci\xf3n m\xfaltiple"},
gyZ(){return"Tarjetas"},
guB(){return"Aprender"},
gv4(){return"Prueba"},
gzP(d){return"Combinar"}}
A.aJb.prototype={
gau(d){return"Tarjetas"},
gA1(){return"No hay tarjetas para mostrar."},
ges(){return y.f},
gvQ(d){return"Barajar"},
gAF(){return"Reiniciar"}}
A.aJv.prototype={
gau(d){return"Aprender"},
gAG(){return"Reiniciar sesi\xf3n de aprendizaje"},
gkO(){return"Volver a las opciones"},
gtv(){return"Escribe tu respuesta aqu\xed..."},
gn7(d){return"Pista"},
gvR(d){return"Saltar"},
gd1(){var w=this.f
return w===$?this.f=new A.aJr():w},
gou(){var w=this.r
return w===$?this.r=new A.aJw():w},
gm8(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aJB(w,w)}return v}}
A.aJL.prototype={
gau(d){return"Combinar"},
gkQ(){return"\xa1Felicidades!"},
gAn(){return"Jugar de nuevo"},
gkO(){return"Volver a las opciones"},
gqF(){var w=this.e
return w===$?this.e=new A.aJN():w},
gd1(){var w=this.f
return w===$?this.f=new A.aJH():w}}
A.aKw.prototype={
gau(d){return"Prueba"},
gl9(){return"No hay preguntas para esta prueba."},
gB4(){return"Ver resultados"},
gw0(){return"Enviar prueba"},
gd1(){var w=this.d
return w===$?this.d=new A.aKs():w}}
A.aJX.prototype={
gau(d){return"Resultados de la prueba"},
gl9(){return"No hab\xeda preguntas en esta prueba."},
gBc(){return"Tu puntuaci\xf3n"},
vB(d,e){return""+d+" / "+e+" correctas"},
gqZ(){return"Revisar respuestas incorrectas:"},
Bb(d){return"Tu respuesta: "+d},
gA0(){return"(Sin respuesta)"},
gkQ(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gAJ(){return"Reintentar prueba"},
gAL(){return"Revisar con tarjetas"}}
A.aK4.prototype={
gau(d){return"Ajustes"},
gxv(d){return"Apariencia"},
guz(d){return"Idioma"},
gzy(){return"Seleccionar idioma"},
gvb(){return"Escalado de la interfaz"},
gAY(){return y.L},
grH(){return"Predeterminado del sistema"},
gzE(){return"Claro"},
gyi(){return"Oscuro"},
gyE(){return"Ingl\xe9s"},
gyX(){return"Finland\xe9s"},
gAO(){return"Ruso"},
gvU(){return"Espa\xf1ol"},
gw5(){return"Sueco"},
gyj(){return"Gesti\xf3n de datos"},
gyK(){return"Exportar datos"},
gyL(){return"Guardar todas las listas en un archivo"},
gzd(){return"Importar datos"},
gze(){return"Cargar listas desde un archivo"},
gyo(){return"Eliminar todos los datos"},
gqv(){var w=this.w
return w===$?this.w=new A.aK6():w},
gpY(){var w=this.x
return w===$?this.x=new A.aK0():w},
gmv(){var w=this.y
return w===$?this.y=new A.aKb():w}}
A.aJ_.prototype={
gau(d){return"Controles"},
gvh(){return"Gestos (Tarjetas)"},
gzv(){return"Teclado (Tarjetas)"},
goI(){return"Siguiente tarjeta"},
goR(){return"Tarjeta anterior"},
goz(){return"Voltear tarjeta"},
gw6(){return"Deslizar a la izquierda"},
gw7(){return"Deslizar a la derecha"},
gw8(){return"Deslizar hacia arriba o abajo"},
gxA(){return"Tecla de flecha derecha"},
gxz(){return"Tecla de flecha izquierda"},
gxB(){return y.b}}
A.aJ3.prototype={
gzC(){return"\xa9 2025 Quizlone"},
gyq(d){return y.a}}
A.aKg.prototype={
gau(d){return"Confirmar eliminaci\xf3n"},
xW(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aKm.prototype={
gau(d){return"Renombrar lista"},
guW(){return"Renombrar"},
gyG(){return"Ya existe una lista con este nombre."},
gyF(){return y.N}}
A.aJj.prototype={
gzF(){return y.N},
ges(){return y._},
gzp(){return y.n},
yA(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gA5(){return y.O},
vw(d){return"No se pudo guardar la lista: "+d}}
A.aJr.prototype={
ges(){return y.B},
gh9(){return y.h}}
A.aJw.prototype={
gy8(){return"\xa1Correcto!"},
zh(d){return"Incorrecto. La respuesta correcta es: "+d},
z9(d,e){return'Pista: Empieza con "'+e+'"'},
vS(d){return"Saltado. La respuesta era: "+d}}
A.aJB.prototype={
gxu(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tU(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gvG(){return y.k},
zR(d){var w=B.fa("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vW(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aJN.prototype={
gau(d){return"Tabla de clasificaci\xf3n"},
gA4(){return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"},
AT(d,e){return e+" Segundos"}}
A.aJH.prototype={
gh9(){return y.R}}
A.aKs.prototype={
gzK(){return y.Q},
ges(){return y.I},
gh9(){return y.W}}
A.aK6.prototype={
gau(d){return"Confirmar importaci\xf3n"},
gkR(d){return y.s},
gvu(d){return"Importar"}}
A.aK0.prototype={
gau(d){return"Confirmar eliminaci\xf3n"},
gkR(d){return y.x},
gyn(){return"Eliminar todo"}}
A.aKb.prototype={
gA2(){return"No hay datos para exportar."},
yM(d){return"Error al exportar datos: "+d},
zg(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
zf(d){return"Error al importar datos: "+d},
gxt(){return y.J}}
var z=a.updateTypes([])
A.aN2.prototype={
$1(d){return A.bfd(this.a,d)},
$S:54}
A.aMC.prototype={
$1$error(d){return"Error: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aME.prototype={
$1$version(d){return"Versi\xf3n "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:94}
A.aMF.prototype={
$1$count(d){var w
this.a.ghS()
w=B.fa("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.h(d)+" t\xe9rminos")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aMG.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:76}
A.aMH.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.h(d)+y.Z},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:82}
A.aMI.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMJ.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:78}
A.aMK.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aML.prototype={
$1$char(d){return'Pista: Empieza con "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:75}
A.aMM.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMN.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.h(d)+" | Elemento "+B.h(e)+" de "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:74}
A.aMP.prototype={
$1$count(d){var w
this.a.ghS()
w=B.fa("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.h(d)+" elementos por repasar.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aMQ.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.h(e)+" con "+B.h(d)+" elemento(s)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:69}
A.aMR.prototype={
$1$time(d){return"\xa1Terminaste en "+B.h(d)+" segundos!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aMS.prototype={
$1$time(d){return B.h(d)+" Segundos"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aMT.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" correctas"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:77}
A.aMU.prototype={
$1$answer(d){return"Tu respuesta: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMV.prototype={
$1$error(d){return"Error al exportar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMW.prototype={
$1$count(d){return"\xa1Se importaron "+B.h(d)+" listas con \xe9xito!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:91}
A.aMX.prototype={
$1$error(d){return"Error al importar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.X6,B.ds)
w(A.aJf,B.uX)
w(A.aJ7,B.uV)
w(A.aIW,B.uS)
w(A.aKk,B.vd)
w(A.aJn,B.uY)
w(A.aJT,B.v6)
w(A.aJb,B.uW)
w(A.aJv,B.v_)
w(A.aJL,B.v3)
w(A.aKw,B.vf)
w(A.aJX,B.v7)
w(A.aK4,B.v9)
w(A.aJ_,B.uT)
w(A.aJ3,B.uU)
w(A.aKg,B.vc)
w(A.aKm,B.ve)
w(A.aJj,B.uZ)
w(A.aJr,B.v0)
w(A.aJw,B.v1)
w(A.aJB,B.v2)
w(A.aJN,B.v5)
w(A.aJH,B.v4)
w(A.aKs,B.vg)
w(A.aK6,B.va)
w(A.aK0,B.v8)
w(A.aKb,B.vb)
v(B.jz,[A.aN2,A.aMC,A.aME,A.aMF,A.aMG,A.aMH,A.aMI,A.aMJ,A.aMK,A.aML,A.aMM,A.aMN,A.aMP,A.aMQ,A.aMR,A.aMS,A.aMT,A.aMU,A.aMV,A.aMW,A.aMX])})()
B.a5C(b.typeUniverse,JSON.parse('{"X6":{"ds":[],"i0":["dM","ds"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",R:"Se requiere al menos un par de t\xe9rmino/definici\xf3n para jugar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",k:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.ak("hn<dM,ds>")}};
(a=>{a["rljF8/tGqvM/q2b9tgbRajxVyqM="]=a.current})($__dart_deferred_initializers__);