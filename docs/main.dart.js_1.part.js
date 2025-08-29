((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aWG(d,e,f){var w,v,u=null,t=new B.hi(d,x.c),s=new B.hi(d,x.c)
s=new A.Wi(t,s)
s.w5(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bd7(s)
return s},
bd3(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Combinar",m="Volver a las opciones",l="Exportar datos"
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
case"general.genericError":return new A.aKz()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aKB()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aKC(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aKD()
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
case"inputScreen.errors.emptyTerm":return new A.aKE()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aKF()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aKG()
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
case"learnScreen.feedback.incorrect":return new A.aKH()
case"learnScreen.feedback.hint":return new A.aKI()
case"learnScreen.feedback.skipped":return new A.aKJ()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aKK()
case"learnScreen.progress.sessionComplete":return y.k
case"learnScreen.progress.maxCyclesReached":return new A.aKM(d)
case"learnScreen.progress.startingCycle":return new A.aKN()
case"matchScreen.title":return n
case"matchScreen.congratulations":return"\xa1Felicidades!"
case"matchScreen.timeCompleted":return new A.aKO()
case"matchScreen.playAgain":return"Jugar de nuevo"
case"matchScreen.backToOptions":return m
case"matchScreen.leaderboard.title":return"Tabla de clasificaci\xf3n"
case"matchScreen.leaderboard.noRecords":return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"
case"matchScreen.leaderboard.time":return new A.aKP()
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
case"resultsScreen.scoreFraction":return new A.aKQ()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aKR()
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
case"settingsScreen.snackbars.exportError":return new A.aKS()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aKT()
case"settingsScreen.snackbars.importError":return new A.aKU()
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
bd7(d){return new A.aL_(d)},
Wi:function Wi(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHj:function aHj(){},
aHb:function aHb(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aH_:function aH_(){},
aIo:function aIo(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHr:function aHr(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aHX:function aHX(){},
aHf:function aHf(){},
aHz:function aHz(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aHP:function aHP(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIA:function aIA(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI0:function aI0(){},
aI8:function aI8(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aH3:function aH3(){},
aH7:function aH7(){},
aIk:function aIk(){},
aIq:function aIq(){},
aHn:function aHn(){},
aHv:function aHv(){},
aHA:function aHA(){},
aHF:function aHF(d,e){this.b=d
this.a=e},
aHR:function aHR(){},
aHL:function aHL(){},
aIw:function aIw(){},
aIa:function aIa(){},
aI4:function aI4(){},
aIf:function aIf(){},
aL_:function aL_(d){this.a=d},
aKz:function aKz(){},
aKB:function aKB(){},
aKC:function aKC(d){this.a=d},
aKD:function aKD(){},
aKE:function aKE(){},
aKF:function aKF(){},
aKG:function aKG(){},
aKH:function aKH(){},
aKI:function aKI(){},
aKJ:function aKJ(){},
aKK:function aKK(){},
aKM:function aKM(d){this.a=d},
aKN:function aKN(){},
aKO:function aKO(){},
aKP:function aKP(){},
aKQ:function aKQ(){},
aKR:function aKR(){},
aKS:function aKS(){},
aKT:function aKT(){},
aKU:function aKU(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Wi.prototype={
ghR(){var w=this.ch
if(w===$){w!==$&&B.v()
w=this.ch=this}return w},
gnR(d){return"Quizlone"},
gdk(){var w=this,v=w.CW
if(v===$){w.ghR()
w.CW!==$&&B.v()
v=w.CW=new A.aHj()}return v},
glH(){var w,v=this,u=v.cx
if(u===$){w=v.ghR()
v.cx!==$&&B.v()
u=v.cx=new A.aHb(w,w)}return u},
gtd(){var w=this,v=w.cy
if(v===$){w.ghR()
w.cy!==$&&B.v()
v=w.cy=new A.aH_()}return v},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.ghR()
v.db!==$&&B.v()
u=v.db=new A.aIo(w,w)}return u},
gfz(){var w,v=this,u=v.dx
if(u===$){w=v.ghR()
v.dx!==$&&B.v()
u=v.dx=new A.aHr(w,w)}return u},
gcn(){var w=this,v=w.dy
if(v===$){w.ghR()
w.dy!==$&&B.v()
v=w.dy=new A.aHX()}return v},
gmH(){var w=this,v=w.fr
if(v===$){w.ghR()
w.fr!==$&&B.v()
v=w.fr=new A.aHf()}return v},
geo(){var w,v=this,u=v.fx
if(u===$){w=v.ghR()
v.fx!==$&&B.v()
u=v.fx=new A.aHz(w,w)}return u},
gkh(){var w,v=this,u=v.fy
if(u===$){w=v.ghR()
v.fy!==$&&B.v()
u=v.fy=new A.aHP(w,w)}return u},
glg(){var w,v=this,u=v.go
if(u===$){w=v.ghR()
v.go!==$&&B.v()
u=v.go=new A.aIA(w,w)}return u},
ghI(){var w=this,v=w.id
if(v===$){w.ghR()
w.id!==$&&B.v()
v=w.id=new A.aI0()}return v},
gcq(){var w,v=this,u=v.k1
if(u===$){w=v.ghR()
v.k1!==$&&B.v()
u=v.k1=new A.aI8(w,w)}return u},
gfd(){var w=this,v=w.k2
if(v===$){w.ghR()
w.k2!==$&&B.v()
v=w.k2=new A.aH3()}return v},
gm1(){return this.ay}}
A.aHj.prototype={
gxz(d){return"Volver"},
gio(d){return"Cancelar"},
gqS(d){return"Eliminar"},
giE(d){return"Siguiente"},
goy(){return"Anterior"},
gvV(d){return"Enviar"},
gxl(){return"Todos"},
gzE(){return"Cargando..."},
hh(d){return"Error: "+d},
gAp(d){return"Reiniciar"}}
A.aHb.prototype={
gvD(){return"Ajustes"},
gxS(d){return"Controles"},
gtb(){return"Acerca de"},
gtc(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aH7()}return w}}
A.aH_.prototype={
AO(d,e){return"Versi\xf3n "+e},
gAP(){return"Ver licencias"}}
A.aIo.prototype={
gar(d){return"Quizlone"},
gAS(){return"\xa1Bienvenido!"},
gy7(){return"Crear nueva lista"},
gzD(){return"Cargar lista guardada"},
gzX(){return"A\xfan no hay listas guardadas."},
uY(d){var w=B.f9("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtB(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aIk()}return w},
gn6(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aIq()}return w}}
A.aHr.prototype={
gar(d){return"Crear nueva lista"},
guu(){return"Nombre de la lista"},
gzz(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gA9(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gAa(){return y.C},
gAz(){return y.P},
gvr(){return"Guardar lista"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHn()}return w}}
A.aHX.prototype={
gar(d){return"Opciones y Modo"},
gmW(){return y.X},
ghJ(){return"Volver a la pantalla de bienvenida"},
gyQ(){return"Opciones de tarjetas"},
gvI(){return"Mostrar t\xe9rmino primero"},
gvG(){return"Mostrar definici\xf3n primero"},
gtr(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtq(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvU(){return"Longitud de estudio:"},
gAW(){return"Respuesta escrita"},
gzS(){return"Opci\xf3n m\xfaltiple"},
gyR(){return"Tarjetas"},
gur(){return"Aprender"},
guZ(){return"Prueba"},
gzI(d){return"Combinar"}}
A.aHf.prototype={
gar(d){return"Tarjetas"},
gzV(){return"No hay tarjetas para mostrar."},
gep(){return y.f},
gvL(d){return"Barajar"},
gqD(){return"Reiniciar"}}
A.aHz.prototype={
gar(d){return"Aprender"},
gAs(){return"Reiniciar sesi\xf3n de aprendizaje"},
gkO(){return"Volver a las opciones"},
gtk(){return"Escribe tu respuesta aqu\xed..."},
gq6(d){return"Pista"},
gvM(d){return"Saltar"},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHv()}return w},
go8(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aHA()}return w},
glS(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aHF(w,w)}return v}}
A.aHP.prototype={
gar(d){return"Combinar"},
gkP(){return"\xa1Felicidades!"},
gAc(){return"Jugar de nuevo"},
gkO(){return"Volver a las opciones"},
gqi(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aHR()}return w},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHL()}return w}}
A.aIA.prototype={
gar(d){return"Prueba"},
gl8(){return"No hay preguntas para esta prueba."},
gAQ(){return"Ver resultados"},
gvW(){return"Enviar prueba"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aIw()}return w}}
A.aI0.prototype={
gar(d){return"Resultados de la prueba"},
gl8(){return"No hab\xeda preguntas en esta prueba."},
gAY(){return"Tu puntuaci\xf3n"},
vv(d,e){return""+d+" / "+e+" correctas"},
gqF(){return"Revisar respuestas incorrectas:"},
AX(d){return"Tu respuesta: "+d},
gzU(){return"(Sin respuesta)"},
gkP(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gAt(){return"Reintentar prueba"},
gAv(){return"Revisar con tarjetas"}}
A.aI8.prototype={
gar(d){return"Ajustes"},
gxo(d){return"Apariencia"},
guo(d){return"Idioma"},
gzr(){return"Seleccionar idioma"},
gv4(){return"Escalado de la interfaz"},
gAI(){return y.L},
grs(){return"Predeterminado del sistema"},
gzx(){return"Claro"},
gyd(){return"Oscuro"},
gyA(){return"Ingl\xe9s"},
gyP(){return"Finland\xe9s"},
gAy(){return"Ruso"},
gvP(){return"Espa\xf1ol"},
gw0(){return"Sueco"},
gye(){return"Gesti\xf3n de datos"},
gyG(){return"Exportar datos"},
gyH(){return"Guardar todas las listas en un archivo"},
gz5(){return"Importar datos"},
gz6(){return"Cargar listas desde un archivo"},
gyj(){return"Eliminar todos los datos"},
gq7(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aIa()}return w},
gpy(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aI4()}return w},
gmd(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aIf()}return w}}
A.aH3.prototype={
gar(d){return"Controles"},
gva(){return"Gestos (Tarjetas)"},
gzo(){return"Teclado (Tarjetas)"},
gop(){return"Siguiente tarjeta"},
goz(){return"Tarjeta anterior"},
gof(){return"Voltear tarjeta"},
gw1(){return"Deslizar a la izquierda"},
gw2(){return"Deslizar a la derecha"},
gw3(){return"Deslizar hacia arriba o abajo"},
gxt(){return"Tecla de flecha derecha"},
gxs(){return"Tecla de flecha izquierda"},
gxu(){return y.b}}
A.aH7.prototype={
gzv(){return"\xa9 2025 Quizlone"},
gym(d){return y.a}}
A.aIk.prototype={
gar(d){return"Confirmar eliminaci\xf3n"},
xR(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aIq.prototype={
gar(d){return"Renombrar lista"},
guM(){return"Renombrar"},
gyC(){return"Ya existe una lista con este nombre."},
gyB(){return y.N}}
A.aHn.prototype={
gzy(){return y.N},
gep(){return y._},
gzi(){return y.n},
yw(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzZ(){return y.O},
vq(d){return"No se pudo guardar la lista: "+d}}
A.aHv.prototype={
gep(){return y.B},
gh5(){return y.h}}
A.aHA.prototype={
gy0(){return"\xa1Correcto!"},
z9(d){return"Incorrecto. La respuesta correcta es: "+d},
z1(d,e){return'Pista: Empieza con "'+e+'"'},
vN(d){return"Saltado. La respuesta era: "+d}}
A.aHF.prototype={
gxn(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tG(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gvz(){return y.k},
zK(d){var w=B.f9("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vR(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aHR.prototype={
gar(d){return"Tabla de clasificaci\xf3n"},
gzY(){return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"},
AD(d,e){return e+" Segundos"}}
A.aHL.prototype={
gh5(){return y.R}}
A.aIw.prototype={
gzC(){return y.Q},
gep(){return y.I},
gh5(){return y.W}}
A.aIa.prototype={
gar(d){return"Confirmar importaci\xf3n"},
gkQ(d){return y.s},
gvo(d){return"Importar"}}
A.aI4.prototype={
gar(d){return"Confirmar eliminaci\xf3n"},
gkQ(d){return y.x},
gyi(){return"Eliminar todo"}}
A.aIf.prototype={
gzW(){return"No hay datos para exportar."},
yI(d){return"Error al exportar datos: "+d},
z8(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
z7(d){return"Error al importar datos: "+d},
gxm(){return y.J}}
var z=a.updateTypes([])
A.aL_.prototype={
$1(d){return A.bd3(this.a,d)},
$S:54}
A.aKz.prototype={
$1$error(d){return"Error: "+B.h(d)},
$S:13}
A.aKB.prototype={
$1$version(d){return"Versi\xf3n "+B.h(d)},
$S:74}
A.aKC.prototype={
$1$count(d){var w
this.a.ghR()
w=B.f9("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.h(d)+" t\xe9rminos")},
$S:38}
A.aKD.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.h(d)+"'?"},
$S:73}
A.aKE.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.h(d)+y.Z},
$S:81}
A.aKF.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.h(d)},
$S:13}
A.aKG.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.h(d)},
$S:69}
A.aKH.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.h(d)},
$S:23}
A.aKI.prototype={
$1$char(d){return'Pista: Empieza con "'+B.h(d)+'"'},
$S:92}
A.aKJ.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.h(d)},
$S:23}
A.aKK.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.h(d)+" | Elemento "+B.h(e)+" de "+B.h(f)},
$S:72}
A.aKM.prototype={
$1$count(d){var w
this.a.ghR()
w=B.f9("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.h(d)+" elementos por repasar.")},
$S:38}
A.aKN.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.h(e)+" con "+B.h(d)+" elemento(s)..."},
$S:87}
A.aKO.prototype={
$1$time(d){return"\xa1Terminaste en "+B.h(d)+" segundos!"},
$S:42}
A.aKP.prototype={
$1$time(d){return B.h(d)+" Segundos"},
$S:42}
A.aKQ.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" correctas"},
$S:94}
A.aKR.prototype={
$1$answer(d){return"Tu respuesta: "+B.h(d)},
$S:23}
A.aKS.prototype={
$1$error(d){return"Error al exportar datos: "+B.h(d)},
$S:13}
A.aKT.prototype={
$1$count(d){return"\xa1Se importaron "+B.h(d)+" listas con \xe9xito!"},
$S:91}
A.aKU.prototype={
$1$error(d){return"Error al importar datos: "+B.h(d)},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Wi,B.dv)
w(A.aHj,B.uz)
w(A.aHb,B.ux)
w(A.aH_,B.uu)
w(A.aIo,B.uQ)
w(A.aHr,B.uA)
w(A.aHX,B.uJ)
w(A.aHf,B.uy)
w(A.aHz,B.uC)
w(A.aHP,B.uG)
w(A.aIA,B.uS)
w(A.aI0,B.uK)
w(A.aI8,B.uM)
w(A.aH3,B.uv)
w(A.aH7,B.uw)
w(A.aIk,B.uP)
w(A.aIq,B.uR)
w(A.aHn,B.uB)
w(A.aHv,B.uD)
w(A.aHA,B.uE)
w(A.aHF,B.uF)
w(A.aHR,B.uI)
w(A.aHL,B.uH)
w(A.aIw,B.uT)
w(A.aIa,B.uN)
w(A.aI4,B.uL)
w(A.aIf,B.uO)
v(B.jr,[A.aL_,A.aKz,A.aKB,A.aKC,A.aKD,A.aKE,A.aKF,A.aKG,A.aKH,A.aKI,A.aKJ,A.aKK,A.aKM,A.aKN,A.aKO,A.aKP,A.aKQ,A.aKR,A.aKS,A.aKT,A.aKU])})()
B.a4l(b.typeUniverse,JSON.parse('{"Wi":{"dv":[],"hY":["dN","dv"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",R:"Se requiere al menos un par de t\xe9rmino/definici\xf3n para jugar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",k:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("hi<dN,dv>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"K8No4AoTznc3CN2j4nE9qVZQURQ=");