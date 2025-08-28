((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTq(d,e,f){var w,v,u=null,t=new B.h0(d,x.c),s=new B.h0(d,x.c)
s=new A.Vd(t,s)
s.vD(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9G(s)
return s},
b9C(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aHu()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aHv()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aHw(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHx()
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
case"inputScreen.errors.emptyTerm":return new A.aHy()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aHz()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aHA()
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
case"learnScreen.feedback.incorrect":return new A.aHC()
case"learnScreen.feedback.hint":return new A.aHD()
case"learnScreen.feedback.skipped":return new A.aHE()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aHF()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aHG(d)
case"learnScreen.progress.startingCycle":return new A.aHH()
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
case"resultsScreen.scoreFraction":return new A.aHI()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aHJ()
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
case"settingsScreen.snackbars.exportError":return new A.aHK()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aHL()
case"settingsScreen.snackbars.importError":return new A.aHN()
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
b9G(d){return new A.aHT(d)},
Vd:function Vd(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEw:function aEw(){},
aEo:function aEo(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEc:function aEc(){},
aFp:function aFp(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEE:function aEE(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEY:function aEY(){},
aEs:function aEs(){},
aEM:function aEM(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFB:function aFB(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aF1:function aF1(){},
aF9:function aF9(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEg:function aEg(){},
aEk:function aEk(){},
aFl:function aFl(){},
aFr:function aFr(){},
aEA:function aEA(){},
aEI:function aEI(){},
aEN:function aEN(){},
aES:function aES(d,e){this.b=d
this.a=e},
aFx:function aFx(){},
aFb:function aFb(){},
aF5:function aF5(){},
aFg:function aFg(){},
aHT:function aHT(d){this.a=d},
aHu:function aHu(){},
aHv:function aHv(){},
aHw:function aHw(d){this.a=d},
aHx:function aHx(){},
aHy:function aHy(){},
aHz:function aHz(){},
aHA:function aHA(){},
aHC:function aHC(){},
aHD:function aHD(){},
aHE:function aHE(){},
aHF:function aHF(){},
aHG:function aHG(d){this.a=d},
aHH:function aHH(){},
aHI:function aHI(){},
aHJ:function aHJ(){},
aHK:function aHK(){},
aHL:function aHL(){},
aHN:function aHN(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Vd.prototype={
ghZ(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gny(d){return"Quizlone"},
gek(){var w=this,v=w.ch
if(v===$){w.ghZ()
w.ch!==$&&B.v()
v=w.ch=new A.aEw()}return v},
glv(){var w,v=this,u=v.CW
if(u===$){w=v.ghZ()
v.CW!==$&&B.v()
u=v.CW=new A.aEo(w,w)}return u},
grU(){var w=this,v=w.cx
if(v===$){w.ghZ()
w.cx!==$&&B.v()
v=w.cx=new A.aEc()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.ghZ()
v.cy!==$&&B.v()
u=v.cy=new A.aFp(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.ghZ()
v.db!==$&&B.v()
u=v.db=new A.aEE(w,w)}return u},
gd0(){var w=this,v=w.dx
if(v===$){w.ghZ()
w.dx!==$&&B.v()
v=w.dx=new A.aEY()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.ghZ()
w.dy!==$&&B.v()
v=w.dy=new A.aEs()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.ghZ()
v.fr!==$&&B.v()
u=v.fr=new A.aEM(w,w)}return u},
gl1(){var w,v=this,u=v.fx
if(u===$){w=v.ghZ()
v.fx!==$&&B.v()
u=v.fx=new A.aFB(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.ghZ()
w.fy!==$&&B.v()
v=w.fy=new A.aF1()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.ghZ()
v.go!==$&&B.v()
u=v.go=new A.aF9(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.ghZ()
w.id!==$&&B.v()
v=w.id=new A.aEg()}return v},
glS(){return this.ax}}
A.aEw.prototype={
gx3(d){return"Volver"},
gi7(d){return"Cancelar"},
gqx(d){return"Eliminar"},
gio(d){return"Siguiente"},
goe(){return"Anterior"},
gvq(d){return"Enviar"},
gwQ(){return"Todos"},
gz4(){return"Cargando..."},
l8(d){return"Error: "+d},
gzO(d){return"Reiniciar"}}
A.aEo.prototype={
gv8(){return"Ajustes"},
gxk(d){return"Controles"},
grS(){return"Acerca de"},
grT(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEk()}return w}}
A.aEc.prototype={
Ab(d,e){return"Versi\xf3n "+e},
gAc(){return"Ver licencias"}}
A.aFp.prototype={
gaA(d){return"Quizlone"},
gAf(){return"\xa1Bienvenido!"},
gxy(){return"Crear nueva lista"},
gz3(){return"Cargar lista guardada"},
gzm(){return"A\xfan no hay listas guardadas."},
ux(d){var w=B.eV("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gte(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFl()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFr()}return w}}
A.aEE.prototype={
gaA(d){return"Crear nueva lista"},
gu3(){return"Nombre de la lista"},
gz_(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzz(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzA(){return y.C},
gzZ(){return y.P},
guY(){return"Guardar lista"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEA()}return w}}
A.aEY.prototype={
gaA(d){return"Opciones y Modo"},
gzi(){return y.X},
xI(d){return"Depuraci\xf3n: El ID activo actual es "+d},
gk5(){return"Volver a la pantalla de bienvenida"},
gyh(){return"Opciones de tarjetas"},
gvd(){return"Mostrar t\xe9rmino primero"},
gvb(){return"Mostrar definici\xf3n primero"},
gt5(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gt4(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvp(){return"Longitud de estudio:"},
gAk(){return"Respuesta escrita"},
gzg(){return"Opci\xf3n m\xfaltiple"},
gyi(){return"Tarjetas"},
gu0(){return"Aprender"},
guy(){return"Prueba"}}
A.aEs.prototype={
gaA(d){return"Tarjetas"},
gzk(){return"No hay tarjetas para mostrar."},
ger(){return y.f},
gvg(d){return"Barajar"},
gqi(){return"Reiniciar"}}
A.aEM.prototype={
gaA(d){return"Aprender"},
gzS(){return"Reiniciar sesi\xf3n de aprendizaje"},
gx4(){return"Volver a las opciones"},
gt_(){return"Escribe tu respuesta aqu\xed..."},
gpQ(d){return"Pista"},
gvh(d){return"Saltar"},
ge4(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEI()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEN()}return w},
glG(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aES(w,w)}return v}}
A.aFB.prototype={
gaA(d){return"Prueba"},
gkT(){return"No hay preguntas para esta prueba."},
gAd(){return"Ver resultados"},
gvr(){return"Enviar prueba"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFx()}return w}}
A.aF1.prototype={
gaA(d){return"Resultados de la prueba"},
gkT(){return"No hab\xeda preguntas en esta prueba."},
gAm(){return"Tu puntuaci\xf3n"},
v0(d,e){return""+d+" / "+e+" correctas"},
gqk(){return"Revisar respuestas incorrectas:"},
Al(d){return"Tu respuesta: "+d},
gzj(){return"(Sin respuesta)"},
gxi(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzT(){return"Reintentar prueba"},
gzV(){return"Revisar con tarjetas"}}
A.aF9.prototype={
gaA(d){return"Ajustes"},
gwT(d){return"Apariencia"},
gtZ(d){return"Idioma"},
gyS(){return"Seleccionar idioma"},
guE(){return"Escalado de la interfaz"},
gA5(){return y.L},
gr7(){return"Predeterminado del sistema"},
gyY(){return"Claro"},
gxE(){return"Oscuro"},
gxZ(){return"Ingl\xe9s"},
gyg(){return"Finland\xe9s"},
gzY(){return"Ruso"},
gvk(){return"Espa\xf1ol"},
gvx(){return"Sueco"},
gxF(){return"Gesti\xf3n de datos"},
gy6(){return"Exportar datos"},
gy7(){return"Guardar todas las listas en un archivo"},
gyw(){return"Importar datos"},
gyx(){return"Cargar listas desde un archivo"},
gxL(){return"Eliminar todos los datos"},
gpR(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFb()}return w},
gpg(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aF5()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFg()}return w}}
A.aEg.prototype={
gaA(d){return"Controles"},
guJ(){return"Gestos (Tarjetas)"},
gyP(){return"Teclado (Tarjetas)"},
go5(){return"Siguiente tarjeta"},
gof(){return"Tarjeta anterior"},
gnY(){return"Voltear tarjeta"},
gvy(){return"Deslizar a la izquierda"},
gvz(){return"Deslizar a la derecha"},
gvA(){return"Deslizar hacia arriba o abajo"},
gwX(){return"Tecla de flecha derecha"},
gwW(){return"Tecla de flecha izquierda"},
gwY(){return y.b}}
A.aEk.prototype={
gyW(){return"\xa9 2025 Quizlone"},
gxN(d){return y.a}}
A.aFl.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xj(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aFr.prototype={
gaA(d){return"Renombrar lista"},
gun(){return"Renombrar"},
gy0(){return"Ya existe una lista con este nombre."},
gy_(){return y.N}}
A.aEA.prototype={
gyZ(){return y.N},
ger(){return y._},
gyI(){return y.n},
xW(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzn(){return y.O},
uX(d){return"No se pudo guardar la lista: "+d}}
A.aEI.prototype={
ger(){return y.B},
gkU(){return y.h}}
A.aEN.prototype={
gxt(){return"\xa1Correcto!"},
yA(d){return"Incorrecto. La respuesta correcta es: "+d},
ys(d,e){return'Pista: Empieza con "'+e+'"'},
vi(d){return"Saltado. La respuesta era: "+d}}
A.aES.prototype={
gwS(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tj(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gv4(){return y.R},
z8(d){var w=B.eV("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vm(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aFx.prototype={
gz2(){return y.Q},
ger(){return y.I},
gkU(){return y.W}}
A.aFb.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gkx(d){return y.s},
guV(d){return"Importar"}}
A.aF5.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gkx(d){return y.x},
gxK(){return"Eliminar todo"}}
A.aFg.prototype={
gzl(){return"No hay datos para exportar."},
y8(d){return"Error al exportar datos: "+d},
yz(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yy(d){return"Error al importar datos: "+d},
gwR(){return y.J}}
var z=a.updateTypes([])
A.aHT.prototype={
$1(d){return A.b9C(this.a,d)},
$S:49}
A.aHu.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aHv.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aHw.prototype={
$1$count(d){var w
this.a.ghZ()
w=B.eV("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aHx.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:70}
A.aHy.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:88}
A.aHz.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aHA.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:87}
A.aHC.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:24}
A.aHD.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:66}
A.aHE.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:24}
A.aHF.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:74}
A.aHG.prototype={
$1$count(d){var w
this.a.ghZ()
w=B.eV("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aHH.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:73}
A.aHI.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:72}
A.aHJ.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:24}
A.aHK.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aHL.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:91}
A.aHN.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vd,B.di)
w(A.aEw,B.ue)
w(A.aEo,B.uc)
w(A.aEc,B.u9)
w(A.aFp,B.us)
w(A.aEE,B.uf)
w(A.aEY,B.ul)
w(A.aEs,B.ud)
w(A.aEM,B.uh)
w(A.aFB,B.uu)
w(A.aF1,B.um)
w(A.aF9,B.uo)
w(A.aEg,B.ua)
w(A.aEk,B.ub)
w(A.aFl,B.ur)
w(A.aFr,B.ut)
w(A.aEA,B.ug)
w(A.aEI,B.ui)
w(A.aEN,B.uj)
w(A.aES,B.uk)
w(A.aFx,B.uv)
w(A.aFb,B.up)
w(A.aF5,B.un)
w(A.aFg,B.uq)
v(B.j8,[A.aHT,A.aHu,A.aHv,A.aHw,A.aHx,A.aHy,A.aHz,A.aHA,A.aHC,A.aHD,A.aHE,A.aHF,A.aHG,A.aHH,A.aHI,A.aHJ,A.aHK,A.aHL,A.aHN])})()
B.a3a(b.typeUniverse,JSON.parse('{"Vd":{"di":[],"hE":["dD","di"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("h0<dD,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"FqJBOjdlXd1amgqsQD9PB5XHE7w=");