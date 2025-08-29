((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTP(d,e,f){var w,v,u=null,t=new B.h4(d,x.c),s=new B.h4(d,x.c)
s=new A.Vj(t,s)
s.vH(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.ba4(s)
return s},
ba0(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aHT()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aHU()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aHV(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHW()
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
case"inputScreen.errors.emptyTerm":return new A.aHX()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aHY()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aHZ()
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
case"learnScreen.feedback.incorrect":return new A.aI0()
case"learnScreen.feedback.hint":return new A.aI1()
case"learnScreen.feedback.skipped":return new A.aI2()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aI3()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aI4(d)
case"learnScreen.progress.startingCycle":return new A.aI5()
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
case"resultsScreen.scoreFraction":return new A.aI6()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aI7()
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
case"settingsScreen.snackbars.exportError":return new A.aI8()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aI9()
case"settingsScreen.snackbars.importError":return new A.aIb()
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
ba4(d){return new A.aIh(d)},
Vj:function Vj(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEV:function aEV(){},
aEN:function aEN(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEB:function aEB(){},
aFO:function aFO(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aF2:function aF2(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFm:function aFm(){},
aER:function aER(){},
aFa:function aFa(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aG_:function aG_(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFq:function aFq(){},
aFy:function aFy(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEF:function aEF(){},
aEJ:function aEJ(){},
aFK:function aFK(){},
aFQ:function aFQ(){},
aEZ:function aEZ(){},
aF6:function aF6(){},
aFb:function aFb(){},
aFg:function aFg(d,e){this.b=d
this.a=e},
aFW:function aFW(){},
aFA:function aFA(){},
aFu:function aFu(){},
aFF:function aFF(){},
aIh:function aIh(d){this.a=d},
aHT:function aHT(){},
aHU:function aHU(){},
aHV:function aHV(d){this.a=d},
aHW:function aHW(){},
aHX:function aHX(){},
aHY:function aHY(){},
aHZ:function aHZ(){},
aI0:function aI0(){},
aI1:function aI1(){},
aI2:function aI2(){},
aI3:function aI3(){},
aI4:function aI4(d){this.a=d},
aI5:function aI5(){},
aI6:function aI6(){},
aI7:function aI7(){},
aI8:function aI8(){},
aI9:function aI9(){},
aIb:function aIb(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Vj.prototype={
gi1(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnA(d){return"Quizlone"},
gdK(){var w=this,v=w.ch
if(v===$){w.gi1()
w.ch!==$&&B.v()
v=w.ch=new A.aEV()}return v},
glw(){var w,v=this,u=v.CW
if(u===$){w=v.gi1()
v.CW!==$&&B.v()
u=v.CW=new A.aEN(w,w)}return u},
grZ(){var w=this,v=w.cx
if(v===$){w.gi1()
w.cx!==$&&B.v()
v=w.cx=new A.aEB()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi1()
v.cy!==$&&B.v()
u=v.cy=new A.aFO(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi1()
v.db!==$&&B.v()
u=v.db=new A.aF2(w,w)}return u},
gcE(){var w=this,v=w.dx
if(v===$){w.gi1()
w.dx!==$&&B.v()
v=w.dx=new A.aFm()}return v},
gmx(){var w=this,v=w.dy
if(v===$){w.gi1()
w.dy!==$&&B.v()
v=w.dy=new A.aER()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi1()
v.fr!==$&&B.v()
u=v.fr=new A.aFa(w,w)}return u},
gl3(){var w,v=this,u=v.fx
if(u===$){w=v.gi1()
v.fx!==$&&B.v()
u=v.fx=new A.aG_(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi1()
w.fy!==$&&B.v()
v=w.fy=new A.aFq()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi1()
v.go!==$&&B.v()
u=v.go=new A.aFy(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi1()
w.id!==$&&B.v()
v=w.id=new A.aEF()}return v},
glV(){return this.ax}}
A.aEV.prototype={
gx6(d){return"Volver"},
gi9(d){return"Cancelar"},
gqB(d){return"Eliminar"},
giq(d){return"Siguiente"},
goh(){return"Anterior"},
gvu(d){return"Enviar"},
gwT(){return"Todos"},
gz6(){return"Cargando..."},
ix(d){return"Error: "+d},
gzP(d){return"Reiniciar"}}
A.aEN.prototype={
gvc(){return"Ajustes"},
gxn(d){return"Controles"},
grX(){return"Acerca de"},
grY(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEJ()}return w}}
A.aEB.prototype={
Ac(d,e){return"Versi\xf3n "+e},
gAd(){return"Ver licencias"}}
A.aFO.prototype={
gaA(d){return"Quizlone"},
gAg(){return"\xa1Bienvenido!"},
gxB(){return"Crear nueva lista"},
gz5(){return"Cargar lista guardada"},
gzn(){return"A\xfan no hay listas guardadas."},
uB(d){var w=B.eY("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtj(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFK()}return w},
gmV(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFQ()}return w}}
A.aF2.prototype={
gaA(d){return"Crear nueva lista"},
gu8(){return"Nombre de la lista"},
gz1(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzA(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzB(){return y.C},
gA_(){return y.P},
gv1(){return"Guardar lista"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEZ()}return w}}
A.aFm.prototype={
gaA(d){return"Opciones y Modo"},
go8(){return y.X},
ghQ(){return"Volver a la pantalla de bienvenida"},
gyj(){return"Opciones de tarjetas"},
gvh(){return"Mostrar t\xe9rmino primero"},
gvf(){return"Mostrar definici\xf3n primero"},
gta(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gt9(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvt(){return"Longitud de estudio:"},
gAl(){return"Respuesta escrita"},
gzi(){return"Opci\xf3n m\xfaltiple"},
gyk(){return"Tarjetas"},
gu5(){return"Aprender"},
guC(){return"Prueba"}}
A.aER.prototype={
gaA(d){return"Tarjetas"},
gzl(){return"No hay tarjetas para mostrar."},
ger(){return y.f},
gvk(d){return"Barajar"},
gqm(){return"Reiniciar"}}
A.aFa.prototype={
gaA(d){return"Aprender"},
gzT(){return"Reiniciar sesi\xf3n de aprendizaje"},
gx7(){return"Volver a las opciones"},
gt4(){return"Escribe tu respuesta aqu\xed..."},
gpT(d){return"Pista"},
gvl(d){return"Saltar"},
ge5(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF6()}return w},
gnT(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aFb()}return w},
glH(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aFg(w,w)}return v}}
A.aG_.prototype={
gaA(d){return"Prueba"},
gkW(){return"No hay preguntas para esta prueba."},
gAe(){return"Ver resultados"},
gvv(){return"Enviar prueba"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFW()}return w}}
A.aFq.prototype={
gaA(d){return"Resultados de la prueba"},
gkW(){return"No hab\xeda preguntas en esta prueba."},
gAn(){return"Tu puntuaci\xf3n"},
v4(d,e){return""+d+" / "+e+" correctas"},
gqo(){return"Revisar respuestas incorrectas:"},
Am(d){return"Tu respuesta: "+d},
gzk(){return"(Sin respuesta)"},
gxl(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzU(){return"Reintentar prueba"},
gzW(){return"Revisar con tarjetas"}}
A.aFy.prototype={
gaA(d){return"Ajustes"},
gwW(d){return"Apariencia"},
gu3(d){return"Idioma"},
gyU(){return"Seleccionar idioma"},
guI(){return"Escalado de la interfaz"},
gA6(){return y.L},
grb(){return"Predeterminado del sistema"},
gz_(){return"Claro"},
gxH(){return"Oscuro"},
gy0(){return"Ingl\xe9s"},
gyi(){return"Finland\xe9s"},
gzZ(){return"Ruso"},
gvo(){return"Espa\xf1ol"},
gvB(){return"Sueco"},
gxI(){return"Gesti\xf3n de datos"},
gy8(){return"Exportar datos"},
gy9(){return"Guardar todas las listas en un archivo"},
gyy(){return"Importar datos"},
gyz(){return"Cargar listas desde un archivo"},
gxN(){return"Eliminar todos los datos"},
gpU(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFA()}return w},
gpj(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFu()}return w},
gm4(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFF()}return w}}
A.aEF.prototype={
gaA(d){return"Controles"},
guN(){return"Gestos (Tarjetas)"},
gyR(){return"Teclado (Tarjetas)"},
go7(){return"Siguiente tarjeta"},
goi(){return"Tarjeta anterior"},
go_(){return"Voltear tarjeta"},
gvC(){return"Deslizar a la izquierda"},
gvD(){return"Deslizar a la derecha"},
gvE(){return"Deslizar hacia arriba o abajo"},
gx_(){return"Tecla de flecha derecha"},
gwZ(){return"Tecla de flecha izquierda"},
gx0(){return y.b}}
A.aEJ.prototype={
gyY(){return"\xa9 2025 Quizlone"},
gxP(d){return y.a}}
A.aFK.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xm(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aFQ.prototype={
gaA(d){return"Renombrar lista"},
gus(){return"Renombrar"},
gy4(){return"Ya existe una lista con este nombre."},
gy3(){return y.N}}
A.aEZ.prototype={
gz0(){return y.N},
ger(){return y._},
gyK(){return y.n},
xY(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzo(){return y.O},
v0(d){return"No se pudo guardar la lista: "+d}}
A.aF6.prototype={
ger(){return y.B},
gkX(){return y.h}}
A.aFb.prototype={
gxw(){return"\xa1Correcto!"},
yC(d){return"Incorrecto. La respuesta correcta es: "+d},
yu(d,e){return'Pista: Empieza con "'+e+'"'},
vm(d){return"Saltado. La respuesta era: "+d}}
A.aFg.prototype={
gwV(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tp(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gv8(){return y.R},
za(d){var w=B.eY("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vq(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aFW.prototype={
gz4(){return y.Q},
ger(){return y.I},
gkX(){return y.W}}
A.aFA.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gkA(d){return y.s},
guZ(d){return"Importar"}}
A.aFu.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gkA(d){return y.x},
gxM(){return"Eliminar todo"}}
A.aFF.prototype={
gzm(){return"No hay datos para exportar."},
ya(d){return"Error al exportar datos: "+d},
yB(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yA(d){return"Error al importar datos: "+d},
gwU(){return y.J}}
var z=a.updateTypes([])
A.aIh.prototype={
$1(d){return A.ba0(this.a,d)},
$S:54}
A.aHT.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aHU.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aHV.prototype={
$1$count(d){var w
this.a.gi1()
w=B.eY("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aHW.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:78}
A.aHX.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:79}
A.aHY.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aHZ.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:92}
A.aI0.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:22}
A.aI1.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:82}
A.aI2.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:22}
A.aI3.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:83}
A.aI4.prototype={
$1$count(d){var w
this.a.gi1()
w=B.eY("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aI5.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:84}
A.aI6.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:85}
A.aI7.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:22}
A.aI8.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aI9.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:86}
A.aIb.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vj,B.dj)
w(A.aEV,B.ua)
w(A.aEN,B.u8)
w(A.aEB,B.u5)
w(A.aFO,B.uo)
w(A.aF2,B.ub)
w(A.aFm,B.uh)
w(A.aER,B.u9)
w(A.aFa,B.ud)
w(A.aG_,B.uq)
w(A.aFq,B.ui)
w(A.aFy,B.uk)
w(A.aEF,B.u6)
w(A.aEJ,B.u7)
w(A.aFK,B.un)
w(A.aFQ,B.up)
w(A.aEZ,B.uc)
w(A.aF6,B.ue)
w(A.aFb,B.uf)
w(A.aFg,B.ug)
w(A.aFW,B.ur)
w(A.aFA,B.ul)
w(A.aFu,B.uj)
w(A.aFF,B.um)
v(B.j9,[A.aIh,A.aHT,A.aHU,A.aHV,A.aHW,A.aHX,A.aHY,A.aHZ,A.aI0,A.aI1,A.aI2,A.aI3,A.aI4,A.aI5,A.aI6,A.aI7,A.aI8,A.aI9,A.aIb])})()
B.a3g(b.typeUniverse,JSON.parse('{"Vj":{"dj":[],"hG":["dG","dj"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("h4<dG,dj>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"Mv5afJKrOOQtqhnCDrh61KoF/K0=");