((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aSF(d,e,f){var w,v,u=null,t=new B.h_(d,x.c),s=new B.h_(d,x.c)
s=new A.V0(t,s)
s.vu(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b8X(s)
return s},
b8T(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r="Volver a la pantalla de bienvenida",q="Tarjetas",p="Aprender",o="Exportar datos"
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
case"general.genericError":return new A.aGN()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aGO()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aGP(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aGQ()
case"inputScreen.title":return t
case"inputScreen.listName":return"Nombre de la lista"
case"inputScreen.listNameHint":return"p. ej., Vocabulario del Cap\xedtulo 1"
case"inputScreen.pasteTerms":return"Pega tus t\xe9rminos a continuaci\xf3n:"
case"inputScreen.pasteTermsHint":return y.C
case"inputScreen.termsHint":return y.P
case"inputScreen.saveList":return"Guardar lista"
case"inputScreen.errors.listNameEmpty":return y.N
case"inputScreen.errors.noTerms":return y._
case"inputScreen.errors.invalidFormat":return y.n
case"inputScreen.errors.emptyTerm":return new A.aGR()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aGS()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aGT()
case"modeSelectionScreen.returnToWelcome":return r
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
case"modeSelectionScreen.flashcards":return q
case"modeSelectionScreen.learn":return p
case"modeSelectionScreen.test":return"Prueba"
case"modeSelectionScreen.backToWelcome":return r
case"flashcardScreen.title":return q
case"flashcardScreen.noCards":return"No hay tarjetas para mostrar."
case"flashcardScreen.noTerms":return y.f
case"flashcardScreen.shuffle":return"Barajar"
case"flashcardScreen.restart":return v
case"learnScreen.title":return p
case"learnScreen.restartSession":return"Reiniciar sesi\xf3n de aprendizaje"
case"learnScreen.backToOptions":return"Volver a las opciones"
case"learnScreen.preparing":return"Preparando la siguiente pregunta..."
case"learnScreen.answerHint":return"Escribe tu respuesta aqu\xed..."
case"learnScreen.incorrect":return"Incorrecto"
case"learnScreen.hint":return"Pista"
case"learnScreen.skip":return"Saltar"
case"learnScreen.backToModeSelection":return"Volver a la selecci\xf3n de modo"
case"learnScreen.errors.noTerms":return y.B
case"learnScreen.errors.notEnoughTerms":return y.h
case"learnScreen.feedback.correct":return"\xa1Correcto!"
case"learnScreen.feedback.incorrect":return new A.aGV()
case"learnScreen.feedback.hint":return new A.aGW()
case"learnScreen.feedback.skipped":return new A.aGX()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aGY()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aGZ(d)
case"learnScreen.progress.startingCycle":return new A.aH_()
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
case"resultsScreen.scoreFraction":return new A.aH0()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aH1()
case"resultsScreen.noAnswer":return"(Sin respuesta)"
case"resultsScreen.congratulations":return"\xa1Felicidades! \xa1Acertaste todo!"
case"resultsScreen.retryTest":return"Reintentar prueba"
case"resultsScreen.reviewFlashcards":return"Revisar con tarjetas"
case"resultsScreen.backToWelcome":return r
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
case"settingsScreen.exportData":return o
case"settingsScreen.exportDataSubtitle":return"Guardar todas las listas en un archivo"
case"settingsScreen.importData":return"Importar datos"
case"settingsScreen.importDataSubtitle":return"Cargar listas desde un archivo"
case"settingsScreen.deleteAllData":return"Eliminar todos los datos"
case"settingsScreen.exportDialog.title":return o
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
case"settingsScreen.snackbars.exportError":return new A.aH2()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aH3()
case"settingsScreen.snackbars.importError":return new A.aH5()
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
b8X(d){return new A.aHb(d)},
V0:function V0(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aDT:function aDT(){},
aDL:function aDL(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aDz:function aDz(){},
aEM:function aEM(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aE0:function aE0(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEk:function aEk(){},
aDP:function aDP(){},
aE8:function aE8(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aEU:function aEU(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEo:function aEo(){},
aEw:function aEw(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aDD:function aDD(){},
aDH:function aDH(){},
aEI:function aEI(){},
aDX:function aDX(){},
aE4:function aE4(){},
aE9:function aE9(){},
aEe:function aEe(d,e){this.b=d
this.a=e},
aEQ:function aEQ(){},
aEy:function aEy(){},
aEs:function aEs(){},
aED:function aED(){},
aHb:function aHb(d){this.a=d},
aGN:function aGN(){},
aGO:function aGO(){},
aGP:function aGP(d){this.a=d},
aGQ:function aGQ(){},
aGR:function aGR(){},
aGS:function aGS(){},
aGT:function aGT(){},
aGV:function aGV(){},
aGW:function aGW(){},
aGX:function aGX(){},
aGY:function aGY(){},
aGZ:function aGZ(d){this.a=d},
aH_:function aH_(){},
aH0:function aH0(){},
aH1:function aH1(){},
aH2:function aH2(){},
aH3:function aH3(){},
aH5:function aH5(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.V0.prototype={
ghW(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnt(d){return"Quizlone"},
ges(){var w=this,v=w.ch
if(v===$){w.ghW()
w.ch!==$&&B.v()
v=w.ch=new A.aDT()}return v},
glo(){var w,v=this,u=v.CW
if(u===$){w=v.ghW()
v.CW!==$&&B.v()
u=v.CW=new A.aDL(w,w)}return u},
grM(){var w=this,v=w.cx
if(v===$){w.ghW()
w.cx!==$&&B.v()
v=w.cx=new A.aDz()}return v},
git(){var w,v=this,u=v.cy
if(u===$){w=v.ghW()
v.cy!==$&&B.v()
u=v.cy=new A.aEM(w,w)}return u},
gfS(){var w,v=this,u=v.db
if(u===$){w=v.ghW()
v.db!==$&&B.v()
u=v.db=new A.aE0(w,w)}return u},
gen(){var w=this,v=w.dx
if(v===$){w.ghW()
w.dx!==$&&B.v()
v=w.dx=new A.aEk()}return v},
gmp(){var w=this,v=w.dy
if(v===$){w.ghW()
w.dy!==$&&B.v()
v=w.dy=new A.aDP()}return v},
gef(){var w,v=this,u=v.fr
if(u===$){w=v.ghW()
v.fr!==$&&B.v()
u=v.fr=new A.aE8(w,w)}return u},
gkX(){var w,v=this,u=v.fx
if(u===$){w=v.ghW()
v.fx!==$&&B.v()
u=v.fx=new A.aEU(w,w)}return u},
gfq(){var w=this,v=w.fy
if(v===$){w.ghW()
w.fy!==$&&B.v()
v=w.fy=new A.aEo()}return v},
gci(){var w,v=this,u=v.go
if(u===$){w=v.ghW()
v.go!==$&&B.v()
u=v.go=new A.aEw(w,w)}return u},
gf1(){var w=this,v=w.id
if(v===$){w.ghW()
w.id!==$&&B.v()
v=w.id=new A.aDD()}return v},
glN(){return this.ax}}
A.aDT.prototype={
gwU(d){return"Volver"},
giO(d){return"Cancelar"},
gqs(d){return"Eliminar"},
gig(d){return"Siguiente"},
goa(){return"Anterior"},
gvf(d){return"Enviar"},
gwG(){return"Todos"},
gyY(){return"Cargando..."},
l2(d){return"Error: "+d},
gzH(d){return"Reiniciar"}}
A.aDL.prototype={
guX(){return"Ajustes"},
gxd(d){return"Controles"},
grK(){return"Acerca de"},
grL(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aDH()}return w}}
A.aDz.prototype={
A5(d,e){return"Versi\xf3n "+e},
gA6(){return"Ver licencias"}}
A.aEM.prototype={
gaC(d){return"Quizlone"},
gA9(){return"\xa1Bienvenido!"},
gxp(){return"Crear nueva lista"},
gyX(){return"Cargar lista guardada"},
gze(){return"A\xfan no hay listas guardadas."},
uj(d){var w=B.eR("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gt6(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEI()}return w}}
A.aE0.prototype={
gaC(d){return"Crear nueva lista"},
gyR(){return"Nombre de la lista"},
gyT(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzs(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzt(){return y.C},
gzT(){return y.P},
guM(){return"Guardar lista"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aDX()}return w}}
A.aEk.prototype={
gaC(d){return"Opciones y Modo"},
gza(){return y.X},
xA(d){return"Depuraci\xf3n: El ID activo actual es "+d},
gzN(){return"Volver a la pantalla de bienvenida"},
gy8(){return"Opciones de tarjetas"},
gv2(){return"Mostrar t\xe9rmino primero"},
gv_(){return"Mostrar definici\xf3n primero"},
grX(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
grW(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gve(){return"Longitud de estudio:"},
gAe(){return"Respuesta escrita"},
gz8(){return"Opci\xf3n m\xfaltiple"},
gy9(){return"Tarjetas"},
gtT(){return"Aprender"},
guk(){return"Prueba"}}
A.aDP.prototype={
gaC(d){return"Tarjetas"},
gzc(){return"No hay tarjetas para mostrar."},
gep(){return y.f},
gv5(d){return"Barajar"},
gqd(){return"Reiniciar"}}
A.aE8.prototype={
gaC(d){return"Aprender"},
gzL(){return"Reiniciar sesi\xf3n de aprendizaje"},
gwV(){return"Volver a las opciones"},
gzy(){return"Preparando la siguiente pregunta..."},
gwJ(){return"Escribe tu respuesta aqu\xed..."},
gyr(){return"Incorrecto"},
gpL(d){return"Pista"},
gv6(d){return"Saltar"},
ge1(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aE4()}return w},
gnM(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aE9()}return w},
glB(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEe(w,w)}return v}}
A.aEU.prototype={
gaC(d){return"Prueba"},
gkP(){return"No hay preguntas para esta prueba."},
gA7(){return"Ver resultados"},
gvh(){return"Enviar prueba"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEQ()}return w}}
A.aEo.prototype={
gaC(d){return"Resultados de la prueba"},
gzi(){return"La prueba a\xfan no se ha enviado."},
gkP(){return"No hab\xeda preguntas en esta prueba."},
gAg(){return"Tu puntuaci\xf3n"},
uP(d,e){return""+d+" / "+e+" correctas"},
gqf(){return"Revisar respuestas incorrectas:"},
Af(d){return"Tu respuesta: "+d},
gzb(){return"(Sin respuesta)"},
gxb(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzM(){return"Reintentar prueba"},
gzP(){return"Revisar con tarjetas"},
gwW(){return"Volver a la pantalla de bienvenida"}}
A.aEw.prototype={
gaC(d){return"Ajustes"},
gwK(d){return"Apariencia"},
gtR(d){return"Idioma"},
gyK(){return"Seleccionar idioma"},
gur(){return"Escalado de la interfaz"},
gA_(){return y.L},
gr1(){return"Predeterminado del sistema"},
gyQ(){return"Claro"},
gxw(){return"Oscuro"},
gxR(){return"Ingl\xe9s"},
gy7(){return"Finland\xe9s"},
gzS(){return"Ruso"},
gv9(){return"Espa\xf1ol"},
gvo(){return"Sueco"},
gxx(){return"Gesti\xf3n de datos"},
gxV(){return"Exportar datos"},
gxW(){return"Guardar todas las listas en un archivo"},
gyn(){return"Importar datos"},
gyo(){return"Cargar listas desde un archivo"},
gxD(){return"Eliminar todos los datos"},
gpM(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aEy()}return w},
gpb(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aEs()}return w},
glX(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aED()}return w}}
A.aDD.prototype={
gaC(d){return"Controles"},
gux(){return"Gestos (Tarjetas)"},
gyH(){return"Teclado (Tarjetas)"},
go1(){return"Siguiente tarjeta"},
gob(){return"Tarjeta anterior"},
gnU(){return"Voltear tarjeta"},
gvp(){return"Deslizar a la izquierda"},
gvq(){return"Deslizar a la derecha"},
gvr(){return"Deslizar hacia arriba o abajo"},
gwP(){return"Tecla de flecha derecha"},
gwO(){return"Tecla de flecha izquierda"},
gwQ(){return y.b}}
A.aDH.prototype={
gyO(){return"\xa9 2025 Quizlone"},
gxF(d){return y.a}}
A.aEI.prototype={
gaC(d){return"Confirmar eliminaci\xf3n"},
xc(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aDX.prototype={
gyS(){return y.N},
gep(){return y._},
gyA(){return y.n},
xO(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzf(){return y.O},
uL(d){return"No se pudo guardar la lista: "+d}}
A.aE4.prototype={
gep(){return y.B},
gkQ(){return y.h}}
A.aE9.prototype={
gxk(){return"\xa1Correcto!"},
ys(d){return"Incorrecto. La respuesta correcta es: "+d},
yj(d,e){return'Pista: Empieza con "'+e+'"'},
v7(d){return"Saltado. La respuesta era: "+d}}
A.aEe.prototype={
gwI(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tb(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
guT(){return y.R},
z0(d){var w=B.eR("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vb(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aEQ.prototype={
gyW(){return y.Q},
gep(){return y.I},
gkQ(){return y.W}}
A.aEy.prototype={
gaC(d){return"Confirmar importaci\xf3n"},
gku(d){return y.s},
guK(d){return"Importar"}}
A.aEs.prototype={
gaC(d){return"Confirmar eliminaci\xf3n"},
gku(d){return y.x},
gxC(){return"Eliminar todo"}}
A.aED.prototype={
gzd(){return"No hay datos para exportar."},
xX(d){return"Error al exportar datos: "+d},
yq(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yp(d){return"Error al importar datos: "+d},
gwH(){return y.J}}
var z=a.updateTypes([])
A.aHb.prototype={
$1(d){return A.b8T(this.a,d)},
$S:53}
A.aGN.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aGO.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aGP.prototype={
$1$count(d){var w
this.a.ghW()
w=B.eR("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aGQ.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:78}
A.aGR.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:92}
A.aGS.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aGT.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:80}
A.aGV.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:22}
A.aGW.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:82}
A.aGX.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:22}
A.aGY.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:83}
A.aGZ.prototype={
$1$count(d){var w
this.a.ghW()
w=B.eR("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aH_.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:84}
A.aH0.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:85}
A.aH1.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:22}
A.aH2.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aH3.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:86}
A.aH5.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.V0,B.dh)
w(A.aDT,B.ud)
w(A.aDL,B.ub)
w(A.aDz,B.u8)
w(A.aEM,B.ur)
w(A.aE0,B.ue)
w(A.aEk,B.uk)
w(A.aDP,B.uc)
w(A.aE8,B.ug)
w(A.aEU,B.us)
w(A.aEo,B.ul)
w(A.aEw,B.un)
w(A.aDD,B.u9)
w(A.aDH,B.ua)
w(A.aEI,B.uq)
w(A.aDX,B.uf)
w(A.aE4,B.uh)
w(A.aE9,B.ui)
w(A.aEe,B.uj)
w(A.aEQ,B.ut)
w(A.aEy,B.uo)
w(A.aEs,B.um)
w(A.aED,B.up)
v(B.j8,[A.aHb,A.aGN,A.aGO,A.aGP,A.aGQ,A.aGR,A.aGS,A.aGT,A.aGV,A.aGW,A.aGX,A.aGY,A.aGZ,A.aH_,A.aH0,A.aH1,A.aH2,A.aH3,A.aH5])})()
B.a2S(b.typeUniverse,JSON.parse('{"V0":{"dh":[],"hE":["dC","dh"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("h_<dC,dh>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"nritAdsQokJZmw+PMAEYk9lGne4=");