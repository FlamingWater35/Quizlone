((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTG(d,e,f){var w,v,u=null,t=new B.h3(d,x.c),s=new B.h3(d,x.c)
s=new A.Vh(t,s)
s.vF(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9W(s)
return s},
b9S(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aHJ()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aHK()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aHL(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHM()
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
case"inputScreen.errors.emptyTerm":return new A.aHN()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aHO()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aHP()
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
case"modeSelectionScreen.backToWelcome":return q
case"flashcardScreen.title":return p
case"flashcardScreen.noCards":return"No hay tarjetas para mostrar."
case"flashcardScreen.noTerms":return y.f
case"flashcardScreen.shuffle":return"Barajar"
case"flashcardScreen.restart":return v
case"learnScreen.title":return o
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
case"learnScreen.feedback.incorrect":return new A.aHR()
case"learnScreen.feedback.hint":return new A.aHS()
case"learnScreen.feedback.skipped":return new A.aHT()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aHU()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aHV(d)
case"learnScreen.progress.startingCycle":return new A.aHW()
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
case"resultsScreen.scoreFraction":return new A.aHX()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aHY()
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
case"settingsScreen.exportData":return n
case"settingsScreen.exportDataSubtitle":return"Guardar todas las listas en un archivo"
case"settingsScreen.importData":return"Importar datos"
case"settingsScreen.importDataSubtitle":return"Cargar listas desde un archivo"
case"settingsScreen.deleteAllData":return"Eliminar todos los datos"
case"settingsScreen.exportDialog.title":return n
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
case"settingsScreen.snackbars.exportError":return new A.aHZ()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aI_()
case"settingsScreen.snackbars.importError":return new A.aI1()
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
b9W(d){return new A.aI7(d)},
Vh:function Vh(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEL:function aEL(){},
aED:function aED(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEr:function aEr(){},
aFE:function aFE(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aET:function aET(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFc:function aFc(){},
aEH:function aEH(){},
aF0:function aF0(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFQ:function aFQ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFg:function aFg(){},
aFo:function aFo(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEv:function aEv(){},
aEz:function aEz(){},
aFA:function aFA(){},
aFG:function aFG(){},
aEP:function aEP(){},
aEX:function aEX(){},
aF1:function aF1(){},
aF6:function aF6(d,e){this.b=d
this.a=e},
aFM:function aFM(){},
aFq:function aFq(){},
aFk:function aFk(){},
aFv:function aFv(){},
aI7:function aI7(d){this.a=d},
aHJ:function aHJ(){},
aHK:function aHK(){},
aHL:function aHL(d){this.a=d},
aHM:function aHM(){},
aHN:function aHN(){},
aHO:function aHO(){},
aHP:function aHP(){},
aHR:function aHR(){},
aHS:function aHS(){},
aHT:function aHT(){},
aHU:function aHU(){},
aHV:function aHV(d){this.a=d},
aHW:function aHW(){},
aHX:function aHX(){},
aHY:function aHY(){},
aHZ:function aHZ(){},
aI_:function aI_(){},
aI1:function aI1(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Vh.prototype={
gi_(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gny(d){return"Quizlone"},
gdK(){var w=this,v=w.ch
if(v===$){w.gi_()
w.ch!==$&&B.v()
v=w.ch=new A.aEL()}return v},
glu(){var w,v=this,u=v.CW
if(u===$){w=v.gi_()
v.CW!==$&&B.v()
u=v.CW=new A.aED(w,w)}return u},
grX(){var w=this,v=w.cx
if(v===$){w.gi_()
w.cx!==$&&B.v()
v=w.cx=new A.aEr()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi_()
v.cy!==$&&B.v()
u=v.cy=new A.aFE(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi_()
v.db!==$&&B.v()
u=v.db=new A.aET(w,w)}return u},
gcD(){var w=this,v=w.dx
if(v===$){w.gi_()
w.dx!==$&&B.v()
v=w.dx=new A.aFc()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.gi_()
w.dy!==$&&B.v()
v=w.dy=new A.aEH()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi_()
v.fr!==$&&B.v()
u=v.fr=new A.aF0(w,w)}return u},
gl1(){var w,v=this,u=v.fx
if(u===$){w=v.gi_()
v.fx!==$&&B.v()
u=v.fx=new A.aFQ(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi_()
w.fy!==$&&B.v()
v=w.fy=new A.aFg()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi_()
v.go!==$&&B.v()
u=v.go=new A.aFo(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi_()
w.id!==$&&B.v()
v=w.id=new A.aEv()}return v},
glS(){return this.ax}}
A.aEL.prototype={
gx4(d){return"Volver"},
gi9(d){return"Cancelar"},
gqz(d){return"Eliminar"},
giq(d){return"Siguiente"},
gof(){return"Anterior"},
gvs(d){return"Enviar"},
gwR(){return"Todos"},
gz4(){return"Cargando..."},
ix(d){return"Error: "+d},
gzN(d){return"Reiniciar"}}
A.aED.prototype={
gva(){return"Ajustes"},
gxl(d){return"Controles"},
grV(){return"Acerca de"},
grW(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEz()}return w}}
A.aEr.prototype={
Aa(d,e){return"Versi\xf3n "+e},
gAb(){return"Ver licencias"}}
A.aFE.prototype={
gaA(d){return"Quizlone"},
gAe(){return"\xa1Bienvenido!"},
gxz(){return"Crear nueva lista"},
gz3(){return"Cargar lista guardada"},
gzl(){return"A\xfan no hay listas guardadas."},
uz(d){var w=B.eX("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gth(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFA()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFG()}return w}}
A.aET.prototype={
gaA(d){return"Crear nueva lista"},
gu6(){return"Nombre de la lista"},
gz_(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzy(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzz(){return y.C},
gzY(){return y.P},
gv_(){return"Guardar lista"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEP()}return w}}
A.aFc.prototype={
gaA(d){return"Opciones y Modo"},
go6(){return y.X},
ghO(){return"Volver a la pantalla de bienvenida"},
gyh(){return"Opciones de tarjetas"},
gvf(){return"Mostrar t\xe9rmino primero"},
gvd(){return"Mostrar definici\xf3n primero"},
gt8(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gt7(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvr(){return"Longitud de estudio:"},
gAj(){return"Respuesta escrita"},
gzg(){return"Opci\xf3n m\xfaltiple"},
gyi(){return"Tarjetas"},
gu3(){return"Aprender"},
guA(){return"Prueba"}}
A.aEH.prototype={
gaA(d){return"Tarjetas"},
gzj(){return"No hay tarjetas para mostrar."},
ger(){return y.f},
gvi(d){return"Barajar"},
gqk(){return"Reiniciar"}}
A.aF0.prototype={
gaA(d){return"Aprender"},
gzR(){return"Reiniciar sesi\xf3n de aprendizaje"},
gx5(){return"Volver a las opciones"},
gt2(){return"Escribe tu respuesta aqu\xed..."},
gpR(d){return"Pista"},
gvj(d){return"Saltar"},
ge5(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEX()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aF1()}return w},
glF(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aF6(w,w)}return v}}
A.aFQ.prototype={
gaA(d){return"Prueba"},
gkU(){return"No hay preguntas para esta prueba."},
gAc(){return"Ver resultados"},
gvt(){return"Enviar prueba"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFM()}return w}}
A.aFg.prototype={
gaA(d){return"Resultados de la prueba"},
gkU(){return"No hab\xeda preguntas en esta prueba."},
gAl(){return"Tu puntuaci\xf3n"},
v2(d,e){return""+d+" / "+e+" correctas"},
gqm(){return"Revisar respuestas incorrectas:"},
Ak(d){return"Tu respuesta: "+d},
gzi(){return"(Sin respuesta)"},
gxj(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzS(){return"Reintentar prueba"},
gzU(){return"Revisar con tarjetas"}}
A.aFo.prototype={
gaA(d){return"Ajustes"},
gwU(d){return"Apariencia"},
gu1(d){return"Idioma"},
gyS(){return"Seleccionar idioma"},
guG(){return"Escalado de la interfaz"},
gA4(){return y.L},
gr9(){return"Predeterminado del sistema"},
gyY(){return"Claro"},
gxF(){return"Oscuro"},
gxZ(){return"Ingl\xe9s"},
gyg(){return"Finland\xe9s"},
gzX(){return"Ruso"},
gvm(){return"Espa\xf1ol"},
gvz(){return"Sueco"},
gxG(){return"Gesti\xf3n de datos"},
gy6(){return"Exportar datos"},
gy7(){return"Guardar todas las listas en un archivo"},
gyw(){return"Importar datos"},
gyx(){return"Cargar listas desde un archivo"},
gxL(){return"Eliminar todos los datos"},
gpS(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFq()}return w},
gph(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFk()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFv()}return w}}
A.aEv.prototype={
gaA(d){return"Controles"},
guL(){return"Gestos (Tarjetas)"},
gyP(){return"Teclado (Tarjetas)"},
go5(){return"Siguiente tarjeta"},
gog(){return"Tarjeta anterior"},
gnY(){return"Voltear tarjeta"},
gvA(){return"Deslizar a la izquierda"},
gvB(){return"Deslizar a la derecha"},
gvC(){return"Deslizar hacia arriba o abajo"},
gwY(){return"Tecla de flecha derecha"},
gwX(){return"Tecla de flecha izquierda"},
gwZ(){return y.b}}
A.aEz.prototype={
gyW(){return"\xa9 2025 Quizlone"},
gxN(d){return y.a}}
A.aFA.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xk(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aFG.prototype={
gaA(d){return"Renombrar lista"},
guq(){return"Renombrar"},
gy0(){return"Ya existe una lista con este nombre."},
gy_(){return y.N}}
A.aEP.prototype={
gyZ(){return y.N},
ger(){return y._},
gyI(){return y.n},
xW(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzm(){return y.O},
uZ(d){return"No se pudo guardar la lista: "+d}}
A.aEX.prototype={
ger(){return y.B},
gkV(){return y.h}}
A.aF1.prototype={
gxu(){return"\xa1Correcto!"},
yA(d){return"Incorrecto. La respuesta correcta es: "+d},
ys(d,e){return'Pista: Empieza con "'+e+'"'},
vk(d){return"Saltado. La respuesta era: "+d}}
A.aF6.prototype={
gwT(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tm(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gv6(){return y.R},
z8(d){var w=B.eX("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vo(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aFM.prototype={
gz2(){return y.Q},
ger(){return y.I},
gkV(){return y.W}}
A.aFq.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gky(d){return y.s},
guX(d){return"Importar"}}
A.aFk.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gky(d){return y.x},
gxK(){return"Eliminar todo"}}
A.aFv.prototype={
gzk(){return"No hay datos para exportar."},
y8(d){return"Error al exportar datos: "+d},
yz(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yy(d){return"Error al importar datos: "+d},
gwS(){return y.J}}
var z=a.updateTypes([])
A.aI7.prototype={
$1(d){return A.b9S(this.a,d)},
$S:54}
A.aHJ.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aHK.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aHL.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eX("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aHM.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:78}
A.aHN.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:79}
A.aHO.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aHP.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:92}
A.aHR.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:22}
A.aHS.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:82}
A.aHT.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:22}
A.aHU.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:83}
A.aHV.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eX("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aHW.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:84}
A.aHX.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:85}
A.aHY.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:22}
A.aHZ.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aI_.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:86}
A.aI1.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vh,B.di)
w(A.aEL,B.ub)
w(A.aED,B.u9)
w(A.aEr,B.u6)
w(A.aFE,B.up)
w(A.aET,B.uc)
w(A.aFc,B.ui)
w(A.aEH,B.ua)
w(A.aF0,B.ue)
w(A.aFQ,B.ur)
w(A.aFg,B.uj)
w(A.aFo,B.ul)
w(A.aEv,B.u7)
w(A.aEz,B.u8)
w(A.aFA,B.uo)
w(A.aFG,B.uq)
w(A.aEP,B.ud)
w(A.aEX,B.uf)
w(A.aF1,B.ug)
w(A.aF6,B.uh)
w(A.aFM,B.us)
w(A.aFq,B.um)
w(A.aFk,B.uk)
w(A.aFv,B.un)
v(B.j9,[A.aI7,A.aHJ,A.aHK,A.aHL,A.aHM,A.aHN,A.aHO,A.aHP,A.aHR,A.aHS,A.aHT,A.aHU,A.aHV,A.aHW,A.aHX,A.aHY,A.aHZ,A.aI_,A.aI1])})()
B.a3e(b.typeUniverse,JSON.parse('{"Vh":{"di":[],"hG":["dF","di"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("h3<dF,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"tLyhZOngKXx7Y3UH53XWQ0uRRWo=");