((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aUL(d,e,f){var w,v,u=null,t=new B.h8(d,x.c),s=new B.h8(d,x.c)
s=new A.VG(t,s)
s.vR(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bb8(s)
return s},
bb4(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aIO()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aIP()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aIQ(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aIR()
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
case"inputScreen.errors.emptyTerm":return new A.aIS()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aIT()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aIU()
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
case"learnScreen.feedback.incorrect":return new A.aIW()
case"learnScreen.feedback.hint":return new A.aIX()
case"learnScreen.feedback.skipped":return new A.aIY()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aIZ()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aJ_(d)
case"learnScreen.progress.startingCycle":return new A.aJ0()
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
case"resultsScreen.scoreFraction":return new A.aJ1()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aJ2()
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
case"settingsScreen.snackbars.exportError":return new A.aJ3()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aJ4()
case"settingsScreen.snackbars.importError":return new A.aJ6()
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
bb8(d){return new A.aJc(d)},
VG:function VG(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aFQ:function aFQ(){},
aFI:function aFI(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFw:function aFw(){},
aGJ:function aGJ(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aFY:function aFY(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aGh:function aGh(){},
aFM:function aFM(){},
aG5:function aG5(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aGV:function aGV(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aGl:function aGl(){},
aGt:function aGt(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aFA:function aFA(){},
aFE:function aFE(){},
aGF:function aGF(){},
aGL:function aGL(){},
aFU:function aFU(){},
aG1:function aG1(){},
aG6:function aG6(){},
aGb:function aGb(d,e){this.b=d
this.a=e},
aGR:function aGR(){},
aGv:function aGv(){},
aGp:function aGp(){},
aGA:function aGA(){},
aJc:function aJc(d){this.a=d},
aIO:function aIO(){},
aIP:function aIP(){},
aIQ:function aIQ(d){this.a=d},
aIR:function aIR(){},
aIS:function aIS(){},
aIT:function aIT(){},
aIU:function aIU(){},
aIW:function aIW(){},
aIX:function aIX(){},
aIY:function aIY(){},
aIZ:function aIZ(){},
aJ_:function aJ_(d){this.a=d},
aJ0:function aJ0(){},
aJ1:function aJ1(){},
aJ2:function aJ2(){},
aJ3:function aJ3(){},
aJ4:function aJ4(){},
aJ6:function aJ6(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.VG.prototype={
gi6(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnJ(d){return"Quizlone"},
gdL(){var w=this,v=w.ch
if(v===$){w.gi6()
w.ch!==$&&B.v()
v=w.ch=new A.aFQ()}return v},
gly(){var w,v=this,u=v.CW
if(u===$){w=v.gi6()
v.CW!==$&&B.v()
u=v.CW=new A.aFI(w,w)}return u},
gt7(){var w=this,v=w.cx
if(v===$){w.gi6()
w.cx!==$&&B.v()
v=w.cx=new A.aFw()}return v},
gfm(){var w,v=this,u=v.cy
if(u===$){w=v.gi6()
v.cy!==$&&B.v()
u=v.cy=new A.aGJ(w,w)}return u},
gfs(){var w,v=this,u=v.db
if(u===$){w=v.gi6()
v.db!==$&&B.v()
u=v.db=new A.aFY(w,w)}return u},
gcI(){var w=this,v=w.dx
if(v===$){w.gi6()
w.dx!==$&&B.v()
v=w.dx=new A.aGh()}return v},
gmC(){var w=this,v=w.dy
if(v===$){w.gi6()
w.dy!==$&&B.v()
v=w.dy=new A.aFM()}return v},
geu(){var w,v=this,u=v.fr
if(u===$){w=v.gi6()
v.fr!==$&&B.v()
u=v.fr=new A.aG5(w,w)}return u},
gl7(){var w,v=this,u=v.fx
if(u===$){w=v.gi6()
v.fx!==$&&B.v()
u=v.fx=new A.aGV(w,w)}return u},
ghC(){var w=this,v=w.fy
if(v===$){w.gi6()
w.fy!==$&&B.v()
v=w.fy=new A.aGl()}return v},
gco(){var w,v=this,u=v.go
if(u===$){w=v.gi6()
v.go!==$&&B.v()
u=v.go=new A.aGt(w,w)}return u},
gfa(){var w=this,v=w.id
if(v===$){w.gi6()
w.id!==$&&B.v()
v=w.id=new A.aFA()}return v},
glW(){return this.ax}}
A.aFQ.prototype={
gxj(d){return"Volver"},
gih(d){return"Cancelar"},
gqK(d){return"Eliminar"},
gix(d){return"Siguiente"},
gos(){return"Anterior"},
gvG(d){return"Enviar"},
gx7(){return"Todos"},
gzm(){return"Cargando..."},
iE(d){return"Error: "+d},
gA4(d){return"Reiniciar"}}
A.aFI.prototype={
gvo(){return"Ajustes"},
gxC(d){return"Controles"},
gt5(){return"Acerca de"},
gt6(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFE()}return w}}
A.aFw.prototype={
As(d,e){return"Versi\xf3n "+e},
gAt(){return"Ver licencias"}}
A.aGJ.prototype={
gaA(d){return"Quizlone"},
gAw(){return"\xa1Bienvenido!"},
gxP(){return"Crear nueva lista"},
gzl(){return"Cargar lista guardada"},
gzE(){return"A\xfan no hay listas guardadas."},
uL(d){var w=B.f3("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtv(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aGF()}return w},
gn0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aGL()}return w}}
A.aFY.prototype={
gaA(d){return"Crear nueva lista"},
gui(){return"Nombre de la lista"},
gzh(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzR(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzS(){return y.C},
gAf(){return y.P},
gvd(){return"Guardar lista"},
ge9(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFU()}return w}}
A.aGh.prototype={
gaA(d){return"Opciones y Modo"},
goi(){return y.X},
ghV(){return"Volver a la pantalla de bienvenida"},
gyz(){return"Opciones de tarjetas"},
gvt(){return"Mostrar t\xe9rmino primero"},
gvr(){return"Mostrar definici\xf3n primero"},
gtk(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtj(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvF(){return"Longitud de estudio:"},
gAB(){return"Respuesta escrita"},
gzz(){return"Opci\xf3n m\xfaltiple"},
gyA(){return"Tarjetas"},
guf(){return"Aprender"},
guM(){return"Prueba"}}
A.aFM.prototype={
gaA(d){return"Tarjetas"},
gzC(){return"No hay tarjetas para mostrar."},
gew(){return y.f},
gvw(d){return"Barajar"},
gqv(){return"Reiniciar"}}
A.aG5.prototype={
gaA(d){return"Aprender"},
gA8(){return"Reiniciar sesi\xf3n de aprendizaje"},
gxk(){return"Volver a las opciones"},
gte(){return"Escribe tu respuesta aqu\xed..."},
gq0(d){return"Pista"},
gvx(d){return"Saltar"},
ge9(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aG1()}return w},
go1(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aG6()}return w},
glJ(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aGb(w,w)}return v}}
A.aGV.prototype={
gaA(d){return"Prueba"},
gl_(){return"No hay preguntas para esta prueba."},
gAu(){return"Ver resultados"},
gvH(){return"Enviar prueba"},
ge9(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aGR()}return w}}
A.aGl.prototype={
gaA(d){return"Resultados de la prueba"},
gl_(){return"No hab\xeda preguntas en esta prueba."},
gAD(){return"Tu puntuaci\xf3n"},
vg(d,e){return""+d+" / "+e+" correctas"},
gqx(){return"Revisar respuestas incorrectas:"},
AC(d){return"Tu respuesta: "+d},
gzB(){return"(Sin respuesta)"},
gxA(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gA9(){return"Reintentar prueba"},
gAb(){return"Revisar con tarjetas"}}
A.aGt.prototype={
gaA(d){return"Ajustes"},
gxa(d){return"Apariencia"},
gud(d){return"Idioma"},
gz9(){return"Seleccionar idioma"},
guS(){return"Escalado de la interfaz"},
gAm(){return y.L},
grm(){return"Predeterminado del sistema"},
gzf(){return"Claro"},
gxV(){return"Oscuro"},
gyi(){return"Ingl\xe9s"},
gyy(){return"Finland\xe9s"},
gAe(){return"Ruso"},
gvA(){return"Espa\xf1ol"},
gvM(){return"Sueco"},
gxW(){return"Gesti\xf3n de datos"},
gyo(){return"Exportar datos"},
gyp(){return"Guardar todas las listas en un archivo"},
gyO(){return"Importar datos"},
gyP(){return"Cargar listas desde un archivo"},
gy0(){return"Eliminar todos los datos"},
gq1(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aGv()}return w},
gps(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aGp()}return w},
gm6(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aGA()}return w}}
A.aFA.prototype={
gaA(d){return"Controles"},
guX(){return"Gestos (Tarjetas)"},
gz6(){return"Teclado (Tarjetas)"},
goh(){return"Siguiente tarjeta"},
got(){return"Tarjeta anterior"},
go8(){return"Voltear tarjeta"},
gvN(){return"Deslizar a la izquierda"},
gvO(){return"Deslizar a la derecha"},
gvP(){return"Deslizar hacia arriba o abajo"},
gxe(){return"Tecla de flecha derecha"},
gxd(){return"Tecla de flecha izquierda"},
gxf(){return y.b}}
A.aFE.prototype={
gzd(){return"\xa9 2025 Quizlone"},
gy5(d){return y.a}}
A.aGF.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xB(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aGL.prototype={
gaA(d){return"Renombrar lista"},
guA(){return"Renombrar"},
gyk(){return"Ya existe una lista con este nombre."},
gyj(){return y.N}}
A.aFU.prototype={
gzg(){return y.N},
gew(){return y._},
gz_(){return y.n},
ye(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzF(){return y.O},
vc(d){return"No se pudo guardar la lista: "+d}}
A.aG1.prototype={
gew(){return y.B},
gl0(){return y.h}}
A.aG6.prototype={
gxK(){return"\xa1Correcto!"},
yS(d){return"Incorrecto. La respuesta correcta es: "+d},
yK(d,e){return'Pista: Empieza con "'+e+'"'},
vy(d){return"Saltado. La respuesta era: "+d}}
A.aGb.prototype={
gx9(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tA(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gvk(){return y.R},
zr(d){var w=B.f3("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vC(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aGR.prototype={
gzk(){return y.Q},
gew(){return y.I},
gl0(){return y.W}}
A.aGv.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gkF(d){return y.s},
gva(d){return"Importar"}}
A.aGp.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gkF(d){return y.x},
gy_(){return"Eliminar todo"}}
A.aGA.prototype={
gzD(){return"No hay datos para exportar."},
yq(d){return"Error al exportar datos: "+d},
yR(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yQ(d){return"Error al importar datos: "+d},
gx8(){return y.J}}
var z=a.updateTypes([])
A.aJc.prototype={
$1(d){return A.bb4(this.a,d)},
$S:53}
A.aIO.prototype={
$1$error(d){return"Error: "+B.i(d)},
$S:12}
A.aIP.prototype={
$1$version(d){return"Versi\xf3n "+B.i(d)},
$S:86}
A.aIQ.prototype={
$1$count(d){var w
this.a.gi6()
w=B.f3("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.i(d)+" t\xe9rminos")},
$S:36}
A.aIR.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.i(d)+"'?"},
$S:89}
A.aIS.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.i(d)+y.Z},
$S:90}
A.aIT.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.i(d)},
$S:12}
A.aIU.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.i(d)},
$S:80}
A.aIW.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.i(d)},
$S:23}
A.aIX.prototype={
$1$char(d){return'Pista: Empieza con "'+B.i(d)+'"'},
$S:92}
A.aIY.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.i(d)},
$S:23}
A.aIZ.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.i(d)+" | Elemento "+B.i(e)+" de "+B.i(f)},
$S:76}
A.aJ_.prototype={
$1$count(d){var w
this.a.gi6()
w=B.f3("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.i(d)+" elementos por repasar.")},
$S:36}
A.aJ0.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.i(e)+" con "+B.i(d)+" elemento(s)..."},
$S:88}
A.aJ1.prototype={
$2$score$total(d,e){return B.i(d)+" / "+B.i(e)+" correctas"},
$S:83}
A.aJ2.prototype={
$1$answer(d){return"Tu respuesta: "+B.i(d)},
$S:23}
A.aJ3.prototype={
$1$error(d){return"Error al exportar datos: "+B.i(d)},
$S:12}
A.aJ4.prototype={
$1$count(d){return"\xa1Se importaron "+B.i(d)+" listas con \xe9xito!"},
$S:85}
A.aJ6.prototype={
$1$error(d){return"Error al importar datos: "+B.i(d)},
$S:12};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.VG,B.dp)
w(A.aFQ,B.ui)
w(A.aFI,B.ug)
w(A.aFw,B.ud)
w(A.aGJ,B.uw)
w(A.aFY,B.uj)
w(A.aGh,B.up)
w(A.aFM,B.uh)
w(A.aG5,B.ul)
w(A.aGV,B.uy)
w(A.aGl,B.uq)
w(A.aGt,B.us)
w(A.aFA,B.ue)
w(A.aFE,B.uf)
w(A.aGF,B.uv)
w(A.aGL,B.ux)
w(A.aFU,B.uk)
w(A.aG1,B.um)
w(A.aG6,B.un)
w(A.aGb,B.uo)
w(A.aGR,B.uz)
w(A.aGv,B.ut)
w(A.aGp,B.ur)
w(A.aGA,B.uu)
v(B.jg,[A.aJc,A.aIO,A.aIP,A.aIQ,A.aIR,A.aIS,A.aIT,A.aIU,A.aIW,A.aIX,A.aIY,A.aIZ,A.aJ_,A.aJ0,A.aJ1,A.aJ2,A.aJ3,A.aJ4,A.aJ6])})()
B.a3G(b.typeUniverse,JSON.parse('{"VG":{"dp":[],"hL":["dH","dp"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.am("h8<dH,dp>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"xu8V6rgRcTDUTshxXsDUtPysivw=");