((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aT1(d,e,f){var w,v,u=null,t=new B.h_(d,x.c),s=new B.h_(d,x.c)
s=new A.V9(t,s)
s.vB(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9k(s)
return s},
b9g(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Exportar datos"
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
case"general.genericError":return new A.aH9()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aHa()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aHb(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHc()
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
case"inputScreen.errors.emptyTerm":return new A.aHd()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aHe()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aHf()
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
case"learnScreen.feedback.incorrect":return new A.aHh()
case"learnScreen.feedback.hint":return new A.aHi()
case"learnScreen.feedback.skipped":return new A.aHj()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aHk()
case"learnScreen.progress.sessionComplete":return y.R
case"learnScreen.progress.maxCyclesReached":return new A.aHl(d)
case"learnScreen.progress.startingCycle":return new A.aHm()
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
case"resultsScreen.scoreFraction":return new A.aHn()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aHo()
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
case"settingsScreen.snackbars.exportError":return new A.aHp()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aHq()
case"settingsScreen.snackbars.importError":return new A.aHs()
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
b9k(d){return new A.aHy(d)},
V9:function V9(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEb:function aEb(){},
aE3:function aE3(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aDS:function aDS(){},
aF4:function aF4(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEj:function aEj(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aED:function aED(){},
aE7:function aE7(){},
aEr:function aEr(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFg:function aFg(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEH:function aEH(){},
aEP:function aEP(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aDW:function aDW(){},
aE_:function aE_(){},
aF0:function aF0(){},
aF6:function aF6(){},
aEf:function aEf(){},
aEn:function aEn(){},
aEs:function aEs(){},
aEx:function aEx(d,e){this.b=d
this.a=e},
aFc:function aFc(){},
aER:function aER(){},
aEL:function aEL(){},
aEW:function aEW(){},
aHy:function aHy(d){this.a=d},
aH9:function aH9(){},
aHa:function aHa(){},
aHb:function aHb(d){this.a=d},
aHc:function aHc(){},
aHd:function aHd(){},
aHe:function aHe(){},
aHf:function aHf(){},
aHh:function aHh(){},
aHi:function aHi(){},
aHj:function aHj(){},
aHk:function aHk(){},
aHl:function aHl(d){this.a=d},
aHm:function aHm(){},
aHn:function aHn(){},
aHo:function aHo(){},
aHp:function aHp(){},
aHq:function aHq(){},
aHs:function aHs(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.V9.prototype={
ghY(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnw(d){return"Quizlone"},
gej(){var w=this,v=w.ch
if(v===$){w.ghY()
w.ch!==$&&B.v()
v=w.ch=new A.aEb()}return v},
glp(){var w,v=this,u=v.CW
if(u===$){w=v.ghY()
v.CW!==$&&B.v()
u=v.CW=new A.aE3(w,w)}return u},
grT(){var w=this,v=w.cx
if(v===$){w.ghY()
w.cx!==$&&B.v()
v=w.cx=new A.aDS()}return v},
gfg(){var w,v=this,u=v.cy
if(u===$){w=v.ghY()
v.cy!==$&&B.v()
u=v.cy=new A.aF4(w,w)}return u},
gfn(){var w,v=this,u=v.db
if(u===$){w=v.ghY()
v.db!==$&&B.v()
u=v.db=new A.aEj(w,w)}return u},
geo(){var w=this,v=w.dx
if(v===$){w.ghY()
w.dx!==$&&B.v()
v=w.dx=new A.aED()}return v},
gmq(){var w=this,v=w.dy
if(v===$){w.ghY()
w.dy!==$&&B.v()
v=w.dy=new A.aE7()}return v},
gef(){var w,v=this,u=v.fr
if(u===$){w=v.ghY()
v.fr!==$&&B.v()
u=v.fr=new A.aEr(w,w)}return u},
gkX(){var w,v=this,u=v.fx
if(u===$){w=v.ghY()
v.fx!==$&&B.v()
u=v.fx=new A.aFg(w,w)}return u},
gfu(){var w=this,v=w.fy
if(v===$){w.ghY()
w.fy!==$&&B.v()
v=w.fy=new A.aEH()}return v},
gci(){var w,v=this,u=v.go
if(u===$){w=v.ghY()
v.go!==$&&B.v()
u=v.go=new A.aEP(w,w)}return u},
gf1(){var w=this,v=w.id
if(v===$){w.ghY()
w.id!==$&&B.v()
v=w.id=new A.aDW()}return v},
glO(){return this.ax}}
A.aEb.prototype={
gx_(d){return"Volver"},
gi4(d){return"Cancelar"},
gqx(d){return"Eliminar"},
gik(d){return"Siguiente"},
god(){return"Anterior"},
gvl(d){return"Enviar"},
gwM(){return"Todos"},
gz4(){return"Cargando..."},
l3(d){return"Error: "+d},
gzQ(d){return"Reiniciar"}}
A.aE3.prototype={
gv3(){return"Ajustes"},
gxj(d){return"Controles"},
grR(){return"Acerca de"},
grS(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aE_()}return w}}
A.aDS.prototype={
Ae(d,e){return"Versi\xf3n "+e},
gAf(){return"Ver licencias"}}
A.aF4.prototype={
gaA(d){return"Quizlone"},
gAi(){return"\xa1Bienvenido!"},
gxw(){return"Crear nueva lista"},
gz3(){return"Cargar lista guardada"},
gzl(){return"A\xfan no hay listas guardadas."},
ut(d){var w=B.eR("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtd(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aF0()}return w},
gmO(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF6()}return w}}
A.aEj.prototype={
gaA(d){return"Crear nueva lista"},
gu0(){return"Nombre de la lista"},
gz_(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzz(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzA(){return y.C},
gA1(){return y.P},
guT(){return"Guardar lista"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEf()}return w}}
A.aED.prototype={
gaA(d){return"Opciones y Modo"},
gzh(){return y.X},
xG(d){return"Depuraci\xf3n: El ID activo actual es "+d},
gzW(){return"Volver a la pantalla de bienvenida"},
gyg(){return"Opciones de tarjetas"},
gv8(){return"Mostrar t\xe9rmino primero"},
gv6(){return"Mostrar definici\xf3n primero"},
gt3(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gt2(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvk(){return"Longitud de estudio:"},
gAn(){return"Respuesta escrita"},
gzf(){return"Opci\xf3n m\xfaltiple"},
gyh(){return"Tarjetas"},
gu_(){return"Aprender"},
guu(){return"Prueba"}}
A.aE7.prototype={
gaA(d){return"Tarjetas"},
gzj(){return"No hay tarjetas para mostrar."},
geq(){return y.f},
gvb(d){return"Barajar"},
gqi(){return"Reiniciar"}}
A.aEr.prototype={
gaA(d){return"Aprender"},
gzU(){return"Reiniciar sesi\xf3n de aprendizaje"},
gx0(){return"Volver a las opciones"},
gzF(){return"Preparando la siguiente pregunta..."},
gwP(){return"Escribe tu respuesta aqu\xed..."},
gyz(){return"Incorrecto"},
gpQ(d){return"Pista"},
gvc(d){return"Saltar"},
ge1(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEn()}return w},
gnP(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEs()}return w},
glC(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEx(w,w)}return v}}
A.aFg.prototype={
gaA(d){return"Prueba"},
gkP(){return"No hay preguntas para esta prueba."},
gAg(){return"Ver resultados"},
gvn(){return"Enviar prueba"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFc()}return w}}
A.aEH.prototype={
gaA(d){return"Resultados de la prueba"},
gzp(){return"La prueba a\xfan no se ha enviado."},
gkP(){return"No hab\xeda preguntas en esta prueba."},
gAp(){return"Tu puntuaci\xf3n"},
uW(d,e){return""+d+" / "+e+" correctas"},
gqk(){return"Revisar respuestas incorrectas:"},
Ao(d){return"Tu respuesta: "+d},
gzi(){return"(Sin respuesta)"},
gxh(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gzV(){return"Reintentar prueba"},
gzY(){return"Revisar con tarjetas"},
gx3(){return"Volver a la pantalla de bienvenida"}}
A.aEP.prototype={
gaA(d){return"Ajustes"},
gwQ(d){return"Apariencia"},
gtY(d){return"Idioma"},
gyS(){return"Seleccionar idioma"},
guA(){return"Escalado de la interfaz"},
gA8(){return y.L},
gr7(){return"Predeterminado del sistema"},
gyY(){return"Claro"},
gxC(){return"Oscuro"},
gxX(){return"Ingl\xe9s"},
gyf(){return"Finland\xe9s"},
gA0(){return"Ruso"},
gvf(){return"Espa\xf1ol"},
gvv(){return"Sueco"},
gxD(){return"Gesti\xf3n de datos"},
gy4(){return"Exportar datos"},
gy5(){return"Guardar todas las listas en un archivo"},
gyv(){return"Importar datos"},
gyw(){return"Cargar listas desde un archivo"},
gxJ(){return"Eliminar todos los datos"},
gpR(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aER()}return w},
gpg(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aEL()}return w},
glY(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aEW()}return w}}
A.aDW.prototype={
gaA(d){return"Controles"},
guF(){return"Gestos (Tarjetas)"},
gyP(){return"Teclado (Tarjetas)"},
go4(){return"Siguiente tarjeta"},
goe(){return"Tarjeta anterior"},
gnX(){return"Voltear tarjeta"},
gvw(){return"Deslizar a la izquierda"},
gvx(){return"Deslizar a la derecha"},
gvy(){return"Deslizar hacia arriba o abajo"},
gwV(){return"Tecla de flecha derecha"},
gwU(){return"Tecla de flecha izquierda"},
gwW(){return y.b}}
A.aE_.prototype={
gyW(){return"\xa9 2025 Quizlone"},
gxL(d){return y.a}}
A.aF0.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
xi(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aF6.prototype={
gaA(d){return"Renombrar lista"},
guj(){return"Renombrar"},
gxZ(){return"Ya existe una lista con este nombre."},
gxY(){return y.N}}
A.aEf.prototype={
gyZ(){return y.N},
geq(){return y._},
gyI(){return y.n},
xU(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzm(){return y.O},
uS(d){return"No se pudo guardar la lista: "+d}}
A.aEn.prototype={
geq(){return y.B},
gkQ(){return y.h}}
A.aEs.prototype={
gxq(){return"\xa1Correcto!"},
yA(d){return"Incorrecto. La respuesta correcta es: "+d},
yr(d,e){return'Pista: Empieza con "'+e+'"'},
vd(d){return"Saltado. La respuesta era: "+d}}
A.aEx.prototype={
gwO(){return"\xa1Todos los t\xe9rminos aprendidos!"},
ti(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gv_(){return y.R},
z7(d){var w=B.eR("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vh(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aFc.prototype={
gz2(){return y.Q},
geq(){return y.I},
gkQ(){return y.W}}
A.aER.prototype={
gaA(d){return"Confirmar importaci\xf3n"},
gku(d){return y.s},
guR(d){return"Importar"}}
A.aEL.prototype={
gaA(d){return"Confirmar eliminaci\xf3n"},
gku(d){return y.x},
gxI(){return"Eliminar todo"}}
A.aEW.prototype={
gzk(){return"No hay datos para exportar."},
y6(d){return"Error al exportar datos: "+d},
yy(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yx(d){return"Error al importar datos: "+d},
gwN(){return y.J}}
var z=a.updateTypes([])
A.aHy.prototype={
$1(d){return A.b9g(this.a,d)},
$S:53}
A.aH9.prototype={
$1$error(d){return"Error: "+B.j(d)},
$S:11}
A.aHa.prototype={
$1$version(d){return"Versi\xf3n "+B.j(d)},
$S:76}
A.aHb.prototype={
$1$count(d){var w
this.a.ghY()
w=B.eR("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.j(d)+" t\xe9rminos")},
$S:39}
A.aHc.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.j(d)+"'?"},
$S:78}
A.aHd.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.j(d)+y.Z},
$S:92}
A.aHe.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.j(d)},
$S:11}
A.aHf.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.j(d)},
$S:80}
A.aHh.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.j(d)},
$S:22}
A.aHi.prototype={
$1$char(d){return'Pista: Empieza con "'+B.j(d)+'"'},
$S:82}
A.aHj.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.j(d)},
$S:22}
A.aHk.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.j(d)+" | Elemento "+B.j(e)+" de "+B.j(f)},
$S:83}
A.aHl.prototype={
$1$count(d){var w
this.a.ghY()
w=B.eR("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.j(d)+" elementos por repasar.")},
$S:39}
A.aHm.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.j(e)+" con "+B.j(d)+" elemento(s)..."},
$S:84}
A.aHn.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" correctas"},
$S:85}
A.aHo.prototype={
$1$answer(d){return"Tu respuesta: "+B.j(d)},
$S:22}
A.aHp.prototype={
$1$error(d){return"Error al exportar datos: "+B.j(d)},
$S:11}
A.aHq.prototype={
$1$count(d){return"\xa1Se importaron "+B.j(d)+" listas con \xe9xito!"},
$S:86}
A.aHs.prototype={
$1$error(d){return"Error al importar datos: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.V9,B.dh)
w(A.aEb,B.uf)
w(A.aE3,B.ud)
w(A.aDS,B.ua)
w(A.aF4,B.ut)
w(A.aEj,B.ug)
w(A.aED,B.um)
w(A.aE7,B.ue)
w(A.aEr,B.ui)
w(A.aFg,B.uv)
w(A.aEH,B.un)
w(A.aEP,B.up)
w(A.aDW,B.ub)
w(A.aE_,B.uc)
w(A.aF0,B.us)
w(A.aF6,B.uu)
w(A.aEf,B.uh)
w(A.aEn,B.uj)
w(A.aEs,B.uk)
w(A.aEx,B.ul)
w(A.aFc,B.uw)
w(A.aER,B.uq)
w(A.aEL,B.uo)
w(A.aEW,B.ur)
v(B.j9,[A.aHy,A.aH9,A.aHa,A.aHb,A.aHc,A.aHd,A.aHe,A.aHf,A.aHh,A.aHi,A.aHj,A.aHk,A.aHl,A.aHm,A.aHn,A.aHo,A.aHp,A.aHq,A.aHs])})()
B.a30(b.typeUniverse,JSON.parse('{"V9":{"dh":[],"hE":["dC","dh"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",R:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.al("h_<dC,dh>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"DMG6JRGDCprmLzF6tulSJcsgJCY=");