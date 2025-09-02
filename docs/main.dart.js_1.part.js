((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aXY(d,e,f){var w,v,u=null,t=new B.hc(d,x.c),s=new B.hc(d,x.c)
s=new A.We(t,s)
s.ww(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bf7(s)
return s},
bf3(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Combinar",m="Volver a las opciones",l="Exportar datos"
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
case"general.genericError":return new A.aLL()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aLN()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aLO(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aLP()
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
case"inputScreen.errors.emptyTerm":return new A.aLQ()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aLR()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aLS()
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
case"learnScreen.feedback.incorrect":return new A.aLT()
case"learnScreen.feedback.hint":return new A.aLU()
case"learnScreen.feedback.skipped":return new A.aLV()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aLW()
case"learnScreen.progress.sessionComplete":return y.k
case"learnScreen.progress.maxCyclesReached":return new A.aLY(d)
case"learnScreen.progress.startingCycle":return new A.aLZ()
case"matchScreen.title":return n
case"matchScreen.congratulations":return"\xa1Felicidades!"
case"matchScreen.timeCompleted":return new A.aM_()
case"matchScreen.playAgain":return"Jugar de nuevo"
case"matchScreen.backToOptions":return m
case"matchScreen.leaderboard.title":return"Tabla de clasificaci\xf3n"
case"matchScreen.leaderboard.noRecords":return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"
case"matchScreen.leaderboard.time":return new A.aM0()
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
case"resultsScreen.scoreFraction":return new A.aM1()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aM2()
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
case"settingsScreen.snackbars.exportError":return new A.aM3()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aM4()
case"settingsScreen.snackbars.importError":return new A.aM5()
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
bf7(d){return new A.aMb(d)},
We:function We(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aIo:function aIo(){},
aIg:function aIg(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI4:function aI4(){},
aJt:function aJt(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIw:function aIw(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJ1:function aJ1(){},
aIk:function aIk(){},
aIE:function aIE(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aIU:function aIU(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aJF:function aJF(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJ5:function aJ5(){},
aJd:function aJd(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aI8:function aI8(){},
aIc:function aIc(){},
aJp:function aJp(){},
aJv:function aJv(){},
aIs:function aIs(){},
aIA:function aIA(){},
aIF:function aIF(){},
aIK:function aIK(d,e){this.b=d
this.a=e},
aIW:function aIW(){},
aIQ:function aIQ(){},
aJB:function aJB(){},
aJf:function aJf(){},
aJ9:function aJ9(){},
aJk:function aJk(){},
aMb:function aMb(d){this.a=d},
aLL:function aLL(){},
aLN:function aLN(){},
aLO:function aLO(d){this.a=d},
aLP:function aLP(){},
aLQ:function aLQ(){},
aLR:function aLR(){},
aLS:function aLS(){},
aLT:function aLT(){},
aLU:function aLU(){},
aLV:function aLV(){},
aLW:function aLW(){},
aLY:function aLY(d){this.a=d},
aLZ:function aLZ(){},
aM_:function aM_(){},
aM0:function aM0(){},
aM1:function aM1(){},
aM2:function aM2(){},
aM3:function aM3(){},
aM4:function aM4(){},
aM5:function aM5(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
A.We.prototype={
ghX(){var w=this.ch
return w===$?this.ch=this:w},
gos(){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghX()
w.CW!==$&&B.Y()
v=w.CW=new A.aIo()}return v},
glX(){var w,v=this,u=v.cx
if(u===$){w=v.ghX()
v.cx!==$&&B.Y()
u=v.cx=new A.aIg(w,w)}return u},
gtJ(){var w=this,v=w.cy
if(v===$){w.ghX()
w.cy!==$&&B.Y()
v=w.cy=new A.aI4()}return v},
gft(){var w,v=this,u=v.db
if(u===$){w=v.ghX()
v.db!==$&&B.Y()
u=v.db=new A.aJt(w,w)}return u},
gfI(){var w,v=this,u=v.dx
if(u===$){w=v.ghX()
v.dx!==$&&B.Y()
u=v.dx=new A.aIw(w,w)}return u},
gck(){var w=this,v=w.dy
if(v===$){w.ghX()
w.dy!==$&&B.Y()
v=w.dy=new A.aJ1()}return v},
gnd(){var w=this,v=w.fr
if(v===$){w.ghX()
w.fr!==$&&B.Y()
v=w.fr=new A.aIk()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghX()
v.fx!==$&&B.Y()
u=v.fx=new A.aIE(w,w)}return u},
gkr(){var w,v=this,u=v.fy
if(u===$){w=v.ghX()
v.fy!==$&&B.Y()
u=v.fy=new A.aIU(w,w)}return u},
glq(){var w,v=this,u=v.go
if(u===$){w=v.ghX()
v.go!==$&&B.Y()
u=v.go=new A.aJF(w,w)}return u},
ghN(){var w=this,v=w.id
if(v===$){w.ghX()
w.id!==$&&B.Y()
v=w.id=new A.aJ5()}return v},
gcw(){var w,v=this,u=v.k1
if(u===$){w=v.ghX()
v.k1!==$&&B.Y()
u=v.k1=new A.aJd(w,w)}return u},
gfk(){var w=this,v=w.k2
if(v===$){w.ghX()
w.k2!==$&&B.Y()
v=w.k2=new A.aI8()}return v},
gms(){return this.ay}}
A.aIo.prototype={
gy_(){return"Volver"},
gov(){return"Cancelar"},
grw(){return"Eliminar"},
gjz(){return"Siguiente"},
gpg(){return"Anterior"},
gwl(){return"Enviar"},
gxN(){return"Todos"},
gA6(){return"Cargando..."},
hj(d){return"Error: "+d},
gAX(){return"Reiniciar"}}
A.aIg.prototype={
gw3(){return"Ajustes"},
gyj(){return"Controles"},
gtH(){return"Acerca de"},
gtI(){var w=this.d
return w===$?this.d=new A.aIc():w}}
A.aI4.prototype={
Bn(d){return"Versi\xf3n "+d},
gBo(){return"Ver licencias"}}
A.aJt.prototype={
gau(){return"Quizlone"},
gBr(){return"\xa1Bienvenido!"},
gyx(){return"Crear nueva lista"},
gA5(){return"Cargar lista guardada"},
gAm(){return"A\xfan no hay listas guardadas."},
vl(d){var w=B.f2("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gu4(){var w=this.e
return w===$?this.e=new A.aJp():w},
gnC(){var w=this.f
return w===$?this.f=new A.aJv():w}}
A.aIw.prototype={
gau(){return"Crear nueva lista"},
guW(){return"Nombre de la lista"},
gA0(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gAB(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gAC(){return y.C},
gB9(){return y.P},
gvS(){return"Guardar lista"},
gd2(){var w=this.d
return w===$?this.d=new A.aIs():w}}
A.aJ1.prototype={
gau(){return"Opciones y Modo"},
gnt(){return y.X},
ghO(){return"Volver a la pantalla de bienvenida"},
gzh(){return"Opciones de tarjetas"},
gw8(){return"Mostrar t\xe9rmino primero"},
gw6(){return"Mostrar definici\xf3n primero"},
gwk(){return"Opciones de aprendizaje y prueba"},
gtS(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtR(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gwj(){return"Longitud de estudio:"},
gBu(){return"Respuesta escrita"},
gAh(){return"Opci\xf3n m\xfaltiple"},
gAV(){return"Aceptar una respuesta separada por comas"},
gAW(){return y.v},
gzi(){return"Tarjetas"},
gzW(){return"Aprender"},
gvm(){return"Prueba"},
gA9(){return"Combinar"}}
A.aIk.prototype={
gau(){return"Tarjetas"},
gAk(){return"No hay tarjetas para mostrar."},
geu(){return y.f},
gwa(d){return"Barajar"},
gB_(){return"Reiniciar"}}
A.aIE.prototype={
gau(){return"Aprender"},
gB0(){return"Reiniciar sesi\xf3n de aprendizaje"},
gkV(){return"Volver a las opciones"},
gtN(){return"Escribe tu respuesta aqu\xed..."},
gnh(){return"Pista"},
gwb(d){return"Saltar"},
gd2(){var w=this.f
return w===$?this.f=new A.aIA():w},
goQ(){var w=this.r
return w===$?this.r=new A.aIF():w},
gmd(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aIK(w,w)}return v}}
A.aIU.prototype={
gau(){return"Combinar"},
gkX(){return"\xa1Felicidades!"},
gAG(){return"Jugar de nuevo"},
gkV(){return"Volver a las opciones"},
gqW(){var w=this.e
return w===$?this.e=new A.aIW():w},
gd2(){var w=this.f
return w===$?this.f=new A.aIQ():w}}
A.aJF.prototype={
gau(){return"Prueba"},
glg(){return"No hay preguntas para esta prueba."},
gBp(){return"Ver resultados"},
gwm(){return"Enviar prueba"},
gd2(){var w=this.d
return w===$?this.d=new A.aJB():w}}
A.aJ5.prototype={
gau(){return"Resultados de la prueba"},
glg(){return"No hab\xeda preguntas en esta prueba."},
gBw(){return"Tu puntuaci\xf3n"},
vW(d,e){return""+d+" / "+e+" correctas"},
grh(){return"Revisar respuestas incorrectas:"},
Bv(d){return"Tu respuesta: "+d},
gAj(){return"(Sin respuesta)"},
gkX(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gB3(){return"Reintentar prueba"},
gB5(){return"Revisar con tarjetas"}}
A.aJd.prototype={
gau(){return"Ajustes"},
gxQ(){return"Apariencia"},
guS(){return"Idioma"},
gzT(){return"Seleccionar idioma"},
gvu(){return"Escalado de la interfaz"},
gBi(){return y.L},
grZ(){return"Predeterminado del sistema"},
gzZ(){return"Claro"},
gyD(){return"Oscuro"},
gz_(){return"Ingl\xe9s"},
gzg(){return"Finland\xe9s"},
gB8(){return"Ruso"},
gwe(){return"Espa\xf1ol"},
gwr(){return"Sueco"},
gyF(){return"Gesti\xf3n de datos"},
gz5(){return"Exportar datos"},
gz6(){return"Guardar todas las listas en un archivo"},
gzy(){return"Importar datos"},
gzz(){return"Cargar listas desde un archivo"},
gyK(){return"Eliminar todos los datos"},
gqN(){var w=this.w
return w===$?this.w=new A.aJf():w},
gqe(){var w=this.x
return w===$?this.x=new A.aJ9():w},
gmB(){var w=this.y
return w===$?this.y=new A.aJk():w}}
A.aI8.prototype={
gau(){return"Controles"},
gvB(){return"Gestos (Tarjetas)"},
gzQ(){return"Teclado (Tarjetas)"},
gp9(){return"Siguiente tarjeta"},
gph(){return"Tarjeta anterior"},
goY(){return"Voltear tarjeta"},
gws(){return"Deslizar a la izquierda"},
gwt(){return"Deslizar a la derecha"},
gwu(){return"Deslizar hacia arriba o abajo"},
gxV(){return"Tecla de flecha derecha"},
gxU(){return"Tecla de flecha izquierda"},
gxW(){return y.b}}
A.aIc.prototype={
gzX(){return"\xa9 2025 Quizlone"},
gyM(){return y.a}}
A.aJp.prototype={
gau(){return"Confirmar eliminaci\xf3n"},
yi(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+d+"'?"}}
A.aJv.prototype={
gau(){return"Renombrar lista"},
gvd(){return"Renombrar"},
gz1(){return"Ya existe una lista con este nombre."},
gz0(){return y.N}}
A.aIs.prototype={
gA_(){return y.N},
geu(){return y._},
gzK(){return y.n},
yW(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gAo(){return y.O},
vQ(d){return"No se pudo guardar la lista: "+d}}
A.aIA.prototype={
geu(){return y.B},
gh9(){return y.h}}
A.aIF.prototype={
gyt(){return"\xa1Correcto!"},
zC(d){return"Incorrecto. La respuesta correcta es: "+d},
zu(d){return'Pista: Empieza con "'+d+'"'},
wc(d){return"Saltado. La respuesta era: "+d}}
A.aIK.prototype={
gxP(){return"\xa1Todos los t\xe9rminos aprendidos!"},
ua(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gw0(){return y.k},
Aa(d){var w=B.f2("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
wg(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aIW.prototype={
gau(){return"Tabla de clasificaci\xf3n"},
gAn(){return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"},
Bd(d){return d+" Segundos"}}
A.aIQ.prototype={
gh9(){return y.R}}
A.aJB.prototype={
gA4(){return y.Q},
geu(){return y.I},
gh9(){return y.W}}
A.aJf.prototype={
gau(){return"Confirmar importaci\xf3n"},
gkY(){return y.s},
gvO(){return"Importar"}}
A.aJ9.prototype={
gau(){return"Confirmar eliminaci\xf3n"},
gkY(){return y.x},
gyJ(){return"Eliminar todo"}}
A.aJk.prototype={
gAl(){return"No hay datos para exportar."},
z7(d){return"Error al exportar datos: "+d},
zB(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
zA(d){return"Error al importar datos: "+d},
gxO(){return y.J}}
var z=a.updateTypes([])
A.aMb.prototype={
$1(d){return A.bf3(this.a,d)},
$S:60}
A.aLL.prototype={
$1$error(d){return"Error: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLN.prototype={
$1$version(d){return"Versi\xf3n "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:93}
A.aLO.prototype={
$1$count(d){var w
this.a.ghX()
w=B.f2("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.h(d)+" t\xe9rminos")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:42}
A.aLP.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:94}
A.aLQ.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.h(d)+y.Z},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:83}
A.aLR.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLS.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:85}
A.aLT.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLU.prototype={
$1$char(d){return'Pista: Empieza con "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:89}
A.aLV.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLW.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.h(d)+" | Elemento "+B.h(e)+" de "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:92}
A.aLY.prototype={
$1$count(d){var w
this.a.ghX()
w=B.f2("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.h(d)+" elementos por repasar.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:42}
A.aLZ.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.h(e)+" con "+B.h(d)+" elemento(s)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:75}
A.aM_.prototype={
$1$time(d){return"\xa1Terminaste en "+B.h(d)+" segundos!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aM0.prototype={
$1$time(d){return B.h(d)+" Segundos"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aM1.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" correctas"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:82}
A.aM2.prototype={
$1$answer(d){return"Tu respuesta: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aM3.prototype={
$1$error(d){return"Error al exportar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aM4.prototype={
$1$count(d){return"\xa1Se importaron "+B.h(d)+" listas con \xe9xito!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:78}
A.aM5.prototype={
$1$error(d){return"Error al importar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.We,B.di)
w(A.aIo,B.uB)
w(A.aIg,B.uz)
w(A.aI4,B.uw)
w(A.aJt,B.uS)
w(A.aIw,B.uC)
w(A.aJ1,B.uL)
w(A.aIk,B.uA)
w(A.aIE,B.uE)
w(A.aIU,B.uI)
w(A.aJF,B.uU)
w(A.aJ5,B.uM)
w(A.aJd,B.uO)
w(A.aI8,B.ux)
w(A.aIc,B.uy)
w(A.aJp,B.uR)
w(A.aJv,B.uT)
w(A.aIs,B.uD)
w(A.aIA,B.uF)
w(A.aIF,B.uG)
w(A.aIK,B.uH)
w(A.aIW,B.uK)
w(A.aIQ,B.uJ)
w(A.aJB,B.uV)
w(A.aJf,B.uP)
w(A.aJ9,B.uN)
w(A.aJk,B.uQ)
v(B.jc,[A.aMb,A.aLL,A.aLN,A.aLO,A.aLP,A.aLQ,A.aLR,A.aLS,A.aLT,A.aLU,A.aLV,A.aLW,A.aLY,A.aLZ,A.aM_,A.aM0,A.aM1,A.aM2,A.aM3,A.aM4,A.aM5])})()
B.a4f(b.typeUniverse,JSON.parse('{"We":{"di":[],"hN":["dG","di"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",R:"Se requiere al menos un par de t\xe9rmino/definici\xf3n para jugar.",v:"Si la respuesta correcta es 'a, b', se acepta 'a'",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",k:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.ag("hc<dG,di>")}};
(a=>{a["sbTMzFS7z3EoTVBo5LsQ1LHykas="]=a.current})($__dart_deferred_initializers__);