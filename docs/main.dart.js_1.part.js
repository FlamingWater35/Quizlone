((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTq(d,e,f){var w,v,u=null,t=new B.h1(d,x.c),s=new B.h1(d,x.c)
s=new A.Vk(t,s)
s.vE(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9E(s)
return s},
b9A(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aHw()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aHx()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aHy(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHz()
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
case"inputScreen.errors.emptyTerm":return new A.aHA()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aHB()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aHC()
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
case"learnScreen.feedback.incorrect":return new A.aHE()
case"learnScreen.feedback.hint":return new A.aHF()
case"learnScreen.feedback.skipped":return new A.aHG()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aHH()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aHI(d)
case"learnScreen.progress.startingCycle":return new A.aHJ()
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
case"resultsScreen.scoreFraction":return new A.aHK()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aHL()
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
case"settingsScreen.snackbars.exportError":return new A.aHM()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aHN()
case"settingsScreen.snackbars.importError":return new A.aHP()
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
b9E(d){return new A.aHV(d)},
Vk:function Vk(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEy:function aEy(){},
aEq:function aEq(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEe:function aEe(){},
aFr:function aFr(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEG:function aEG(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aF_:function aF_(){},
aEu:function aEu(){},
aEO:function aEO(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFD:function aFD(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aF3:function aF3(){},
aFb:function aFb(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEi:function aEi(){},
aEm:function aEm(){},
aFn:function aFn(){},
aFt:function aFt(){},
aEC:function aEC(){},
aEK:function aEK(){},
aEP:function aEP(){},
aEU:function aEU(d,e){this.b=d
this.a=e},
aFz:function aFz(){},
aFd:function aFd(){},
aF7:function aF7(){},
aFi:function aFi(){},
aHV:function aHV(d){this.a=d},
aHw:function aHw(){},
aHx:function aHx(){},
aHy:function aHy(d){this.a=d},
aHz:function aHz(){},
aHA:function aHA(){},
aHB:function aHB(){},
aHC:function aHC(){},
aHE:function aHE(){},
aHF:function aHF(){},
aHG:function aHG(){},
aHH:function aHH(){},
aHI:function aHI(d){this.a=d},
aHJ:function aHJ(){},
aHK:function aHK(){},
aHL:function aHL(){},
aHM:function aHM(){},
aHN:function aHN(){},
aHP:function aHP(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Vk.prototype={
gi_(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnx(d){return"Quizlone"},
gej(){var w=this,v=w.ch
if(v===$){w.gi_()
w.ch!==$&&B.v()
v=w.ch=new A.aEy()}return v},
glt(){var w,v=this,u=v.CW
if(u===$){w=v.gi_()
v.CW!==$&&B.v()
u=v.CW=new A.aEq(w,w)}return u},
grW(){var w=this,v=w.cx
if(v===$){w.gi_()
w.cx!==$&&B.v()
v=w.cx=new A.aEe()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi_()
v.cy!==$&&B.v()
u=v.cy=new A.aFr(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi_()
v.db!==$&&B.v()
u=v.db=new A.aEG(w,w)}return u},
gdE(){var w=this,v=w.dx
if(v===$){w.gi_()
w.dx!==$&&B.v()
v=w.dx=new A.aF_()}return v},
gms(){var w=this,v=w.dy
if(v===$){w.gi_()
w.dy!==$&&B.v()
v=w.dy=new A.aEu()}return v},
geo(){var w,v=this,u=v.fr
if(u===$){w=v.gi_()
v.fr!==$&&B.v()
u=v.fr=new A.aEO(w,w)}return u},
gl_(){var w,v=this,u=v.fx
if(u===$){w=v.gi_()
v.fx!==$&&B.v()
u=v.fx=new A.aFD(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi_()
w.fy!==$&&B.v()
v=w.fy=new A.aF3()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi_()
v.go!==$&&B.v()
u=v.go=new A.aFb(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi_()
w.id!==$&&B.v()
v=w.id=new A.aEi()}return v},
glQ(){return this.ax}}
A.aEy.prototype={
gx3(d){return"Volver"},
gi9(d){return"Cancelar"},
gqy(d){return"Eliminar"},
giq(d){return"Siguiente"},
god(){return"Anterior"},
gvr(d){return"Enviar"},
gwQ(){return"Todos"},
gz3(){return"Cargando..."},
l6(d){return"Error: "+d},
gzN(d){return"Reiniciar"}}
A.aEq.prototype={
gv9(){return"Ajustes"},
gxk(d){return"Controles"},
grU(){return"Acerca de"},
grV(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEm()}return w}}
A.aEe.prototype={
Aa(d,e){return"Versi\xf3n "+e},
gAb(){return"Ver licencias"}}
A.aFr.prototype={
gaA(d){return"Quizlone"},
gAe(){return"\xa1Bienvenido!"},
gxy(){return"Crear nueva lista"},
gz2(){return"Cargar lista guardada"},
gzl(){return"A\xfan no hay listas guardadas."},
uy(d){var w=B.eV("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtg(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFn()}return w},
gmQ(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFt()}return w}}
A.aEG.prototype={
gaA(d){return"Crear nueva lista"},
gu5(){return"Nombre de la lista"},
gyZ(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzy(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzz(){return y.C},
gzY(){return y.P},
guZ(){return"Guardar lista"},
ge3(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEC()}return w}}
A.aF_.prototype={
gaA(d){return"Opciones y Modo"},
gzh(){return y.X},
gmS(){return"Volver a la pantalla de bienvenida"},
gyg(){return"Opciones de tarjetas"},
gve(){return"Mostrar t\xe9rmino primero"},
gvc(){return"Mostrar definici\xf3n primero"},
gt7(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gt6(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvq(){return"Longitud de estudio:"},
gAj(){return"Respuesta escrita"},
gzf(){return"Opci\xf3n m\xfaltiple"},
gyh(){return"Tarjetas"},
gu2(){return"Aprender"},
guz(){return"Prueba"}}
A.aEu.prototype={
gaA(d){return"Tarjetas"},
gzj(){return"No hay tarjetas para mostrar."},
geq(){return y.f},
gvh(d){return"Barajar"},
gqj(){return"Reiniciar"}}
A.aEO.prototype={
gaA(d){return"Aprender"},
gzR(){return"Reiniciar sesi\xf3n de aprendizaje"},
gx4(){return"Volver a las opciones"},
gt1(){return"Escribe tu respuesta aqu\xed..."},
gpP(d){return"Pista"},
gvi(d){return"Saltar"},
ge3(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEK()}return w},
gnQ(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEP()}return w},
glE(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEU(w,w)}return v}}
A.aFD.prototype={
gaA(d){return"Prueba"},
gkS(){return"No hay preguntas para esta prueba."},
gAc(){return"Ver resultados"},
gvs(){return"Enviar prueba"},
ge3(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFz()}return w}}
A.aF3.prototype={
gaA(d){return"Resultados de la prueba"},
gkS(){return"No hab\xeda preguntas en esta prueba."},
gAl(){return"Tu puntuaci\xf3n"},
v1(d,e){return""+d+" / "+e+" correctas"},
gql(){return"Revisar respuestas incorrectas:"},
Ak(d){return"Tu respuesta: "+d},
gzi(){return"(Sin respuesta)"},
gxi(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzS(){return"Reintentar prueba"},
gzU(){return"Revisar con tarjetas"}}
A.aFb.prototype={
gaA(d){return"Ajustes"},
gwT(d){return"Apariencia"},
gu0(d){return"Idioma"},
gyR(){return"Seleccionar idioma"},
guF(){return"Escalado de la interfaz"},
gA4(){return y.L},
gr8(){return"Predeterminado del sistema"},
gyX(){return"Claro"},
gxE(){return"Oscuro"},
gxY(){return"Ingl\xe9s"},
gyf(){return"Finland\xe9s"},
gzX(){return"Ruso"},
gvl(){return"Espa\xf1ol"},
gvy(){return"Sueco"},
gxF(){return"Gesti\xf3n de datos"},
gy5(){return"Exportar datos"},
gy6(){return"Guardar todas las listas en un archivo"},
gyv(){return"Importar datos"},
gyw(){return"Cargar listas desde un archivo"},
gxK(){return"Eliminar todos los datos"},
gpQ(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFd()}return w},
gpf(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aF7()}return w},
gm_(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFi()}return w}}
A.aEi.prototype={
gaA(d){return"Controles"},
guK(){return"Gestos (Tarjetas)"},
gyO(){return"Teclado (Tarjetas)"},
go4(){return"Siguiente tarjeta"},
goe(){return"Tarjeta anterior"},
gnX(){return"Voltear tarjeta"},
gvz(){return"Deslizar a la izquierda"},
gvA(){return"Deslizar a la derecha"},
gvB(){return"Deslizar hacia arriba o abajo"},
gwX(){return"Tecla de flecha derecha"},
gwW(){return"Tecla de flecha izquierda"},
gwY(){return y.b}}
A.aEm.prototype={
gyV(){return"\xa9 2025 Quizlone"},
gxM(d){return y.a}}
A.aFn.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xj(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aFt.prototype={
gaA(d){return"Renombrar lista"},
guo(){return"Renombrar"},
gy_(){return"Ya existe una lista con este nombre."},
gxZ(){return y.N}}
A.aEC.prototype={
gyY(){return y.N},
geq(){return y._},
gyH(){return y.n},
xV(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzm(){return y.O},
uY(d){return"No se pudo guardar la lista: "+d}}
A.aEK.prototype={
geq(){return y.B},
gkT(){return y.h}}
A.aEP.prototype={
gxt(){return"\xa1Correcto!"},
yz(d){return"Incorrecto. La respuesta correcta es: "+d},
yr(d,e){return'Pista: Empieza con "'+e+'"'},
vj(d){return"Saltado. La respuesta era: "+d}}
A.aEU.prototype={
gwS(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tl(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gv5(){return y.R},
z7(d){var w=B.eV("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vn(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aFz.prototype={
gz1(){return y.Q},
geq(){return y.I},
gkT(){return y.W}}
A.aFd.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gkw(d){return y.s},
guW(d){return"Importar"}}
A.aF7.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gkw(d){return y.x},
gxJ(){return"Eliminar todo"}}
A.aFi.prototype={
gzk(){return"No hay datos para exportar."},
y7(d){return"Error al exportar datos: "+d},
yy(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yx(d){return"Error al importar datos: "+d},
gwR(){return y.J}}
var z=a.updateTypes([])
A.aHV.prototype={
$1(d){return A.b9A(this.a,d)},
$S:53}
A.aHw.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aHx.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aHy.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eV("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aHz.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:78}
A.aHA.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:92}
A.aHB.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aHC.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:80}
A.aHE.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:22}
A.aHF.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:82}
A.aHG.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:22}
A.aHH.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:83}
A.aHI.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eV("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aHJ.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:84}
A.aHK.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:85}
A.aHL.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:22}
A.aHM.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aHN.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:86}
A.aHP.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vk,B.di)
w(A.aEy,B.ud)
w(A.aEq,B.ub)
w(A.aEe,B.u8)
w(A.aFr,B.ur)
w(A.aEG,B.ue)
w(A.aF_,B.uk)
w(A.aEu,B.uc)
w(A.aEO,B.ug)
w(A.aFD,B.ut)
w(A.aF3,B.ul)
w(A.aFb,B.un)
w(A.aEi,B.u9)
w(A.aEm,B.ua)
w(A.aFn,B.uq)
w(A.aFt,B.us)
w(A.aEC,B.uf)
w(A.aEK,B.uh)
w(A.aEP,B.ui)
w(A.aEU,B.uj)
w(A.aFz,B.uu)
w(A.aFd,B.uo)
w(A.aF7,B.um)
w(A.aFi,B.up)
v(B.j6,[A.aHV,A.aHw,A.aHx,A.aHy,A.aHz,A.aHA,A.aHB,A.aHC,A.aHE,A.aHF,A.aHG,A.aHH,A.aHI,A.aHJ,A.aHK,A.aHL,A.aHM,A.aHN,A.aHP])})()
B.a3h(b.typeUniverse,JSON.parse('{"Vk":{"di":[],"hD":["dE","di"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.ao("h1<dE,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"Sv4kLWW+UYmPPH7mQhRBPnCy1kw=");