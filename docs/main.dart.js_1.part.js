((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aWB(d,e,f){var w,v,u=null,t=new B.hg(d,x.c),s=new B.hg(d,x.c)
s=new A.Wb(t,s)
s.vS(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bd2(s)
return s},
bcZ(d,e){var w="Quizlone",v="Reiniciar",u="Controles",t="Crear nueva lista",s="Confirmar eliminaci\xf3n",r=y.N,q="Volver a la pantalla de bienvenida",p="Tarjetas",o="Aprender",n="Combinar",m="Volver a las opciones",l="Exportar datos"
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
case"general.genericError":return new A.aKC()
case"general.reset":return v
case"drawer.settings":return"Ajustes"
case"drawer.controls":return u
case"drawer.about":return"Acerca de"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.a
case"aboutScreen.version":return new A.aKE()
case"aboutScreen.viewLicenses":return"Ver licencias"
case"startScreen.title":return w
case"startScreen.welcome":return"\xa1Bienvenido!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Cargar lista guardada"
case"startScreen.noLists":return"A\xfan no hay listas guardadas."
case"startScreen.termCount":return new A.aKF(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aKG()
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
case"inputScreen.errors.emptyTerm":return new A.aKH()
case"inputScreen.errors.noValidPairs":return y.O
case"inputScreen.errors.saveFailed":return new A.aKI()
case"modeSelectionScreen.title":return"Opciones y Modo"
case"modeSelectionScreen.noActiveList":return y.X
case"modeSelectionScreen.debugActiveId":return new A.aKJ()
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
case"learnScreen.feedback.incorrect":return new A.aKK()
case"learnScreen.feedback.hint":return new A.aKL()
case"learnScreen.feedback.skipped":return new A.aKM()
case"learnScreen.progress.allLearned":return"\xa1Todos los t\xe9rminos aprendidos!"
case"learnScreen.progress.cycleStatus":return new A.aKN()
case"learnScreen.progress.sessionComplete":return y.k
case"learnScreen.progress.maxCyclesReached":return new A.aKP(d)
case"learnScreen.progress.startingCycle":return new A.aKQ()
case"matchScreen.title":return n
case"matchScreen.congratulations":return"\xa1Felicidades!"
case"matchScreen.timeCompleted":return new A.aKR()
case"matchScreen.playAgain":return"Jugar de nuevo"
case"matchScreen.backToOptions":return m
case"matchScreen.leaderboard.title":return"Tabla de clasificaci\xf3n"
case"matchScreen.leaderboard.noRecords":return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"
case"matchScreen.leaderboard.time":return new A.aKS()
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
case"resultsScreen.scoreFraction":return new A.aKT()
case"resultsScreen.reviewIncorrect":return"Revisar respuestas incorrectas:"
case"resultsScreen.yourAnswerWas":return new A.aKU()
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
case"settingsScreen.snackbars.exportError":return new A.aKV()
case"settingsScreen.snackbars.fileSaved":return"\xa1Archivo guardado con \xe9xito!"
case"settingsScreen.snackbars.importSuccess":return new A.aKW()
case"settingsScreen.snackbars.importError":return new A.aKX()
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
bd2(d){return new A.aL2(d)},
Wb:function Wb(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHm:function aHm(){},
aHe:function aHe(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aH2:function aH2(){},
aIr:function aIr(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHu:function aHu(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI_:function aI_(){},
aHi:function aHi(){},
aHC:function aHC(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aHS:function aHS(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aID:function aID(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI3:function aI3(){},
aIb:function aIb(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aH6:function aH6(){},
aHa:function aHa(){},
aIn:function aIn(){},
aIt:function aIt(){},
aHq:function aHq(){},
aHy:function aHy(){},
aHD:function aHD(){},
aHI:function aHI(d,e){this.b=d
this.a=e},
aHU:function aHU(){},
aHO:function aHO(){},
aIz:function aIz(){},
aId:function aId(){},
aI7:function aI7(){},
aIi:function aIi(){},
aL2:function aL2(d){this.a=d},
aKC:function aKC(){},
aKE:function aKE(){},
aKF:function aKF(d){this.a=d},
aKG:function aKG(){},
aKH:function aKH(){},
aKI:function aKI(){},
aKJ:function aKJ(){},
aKK:function aKK(){},
aKL:function aKL(){},
aKM:function aKM(){},
aKN:function aKN(){},
aKP:function aKP(d){this.a=d},
aKQ:function aKQ(){},
aKR:function aKR(){},
aKS:function aKS(){},
aKT:function aKT(){},
aKU:function aKU(){},
aKV:function aKV(){},
aKW:function aKW(){},
aKX:function aKX(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
A.Wb.prototype={
ghO(){var w=this.ch
if(w===$){w!==$&&B.v()
w=this.ch=this}return w},
gnL(d){return"Quizlone"},
gdm(){var w=this,v=w.CW
if(v===$){w.ghO()
w.CW!==$&&B.v()
v=w.CW=new A.aHm()}return v},
glB(){var w,v=this,u=v.cx
if(u===$){w=v.ghO()
v.cx!==$&&B.v()
u=v.cx=new A.aHe(w,w)}return u},
gt3(){var w=this,v=w.cy
if(v===$){w.ghO()
w.cy!==$&&B.v()
v=w.cy=new A.aH2()}return v},
gfn(){var w,v=this,u=v.db
if(u===$){w=v.ghO()
v.db!==$&&B.v()
u=v.db=new A.aIr(w,w)}return u},
gfv(){var w,v=this,u=v.dx
if(u===$){w=v.ghO()
v.dx!==$&&B.v()
u=v.dx=new A.aHu(w,w)}return u},
gco(){var w=this,v=w.dy
if(v===$){w.ghO()
w.dy!==$&&B.v()
v=w.dy=new A.aI_()}return v},
gmG(){var w=this,v=w.fr
if(v===$){w.ghO()
w.fr!==$&&B.v()
v=w.fr=new A.aHi()}return v},
gep(){var w,v=this,u=v.fx
if(u===$){w=v.ghO()
v.fx!==$&&B.v()
u=v.fx=new A.aHC(w,w)}return u},
gka(){var w,v=this,u=v.fy
if(u===$){w=v.ghO()
v.fy!==$&&B.v()
u=v.fy=new A.aHS(w,w)}return u},
gl8(){var w,v=this,u=v.go
if(u===$){w=v.ghO()
v.go!==$&&B.v()
u=v.go=new A.aID(w,w)}return u},
ghF(){var w=this,v=w.id
if(v===$){w.ghO()
w.id!==$&&B.v()
v=w.id=new A.aI3()}return v},
gcr(){var w,v=this,u=v.k1
if(u===$){w=v.ghO()
v.k1!==$&&B.v()
u=v.k1=new A.aIb(w,w)}return u},
gfd(){var w=this,v=w.k2
if(v===$){w.ghO()
w.k2!==$&&B.v()
v=w.k2=new A.aH6()}return v},
gm0(){return this.ay}}
A.aHm.prototype={
gxh(d){return"Volver"},
gnN(d){return"Cancelar"},
gqK(d){return"Eliminar"},
gje(d){return"Siguiente"},
gos(){return"Anterior"},
gvI(d){return"Enviar"},
gx5(){return"Todos"},
gzn(){return"Cargando..."},
hf(d){return"Error: "+d},
gAd(d){return"Reiniciar"}}
A.aHe.prototype={
gvq(){return"Ajustes"},
gxC(d){return"Controles"},
gt1(){return"Acerca de"},
gt2(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHa()}return w}}
A.aH2.prototype={
AF(d,e){return"Versi\xf3n "+e},
gAG(){return"Ver licencias"}}
A.aIr.prototype={
gar(d){return"Quizlone"},
gAJ(){return"\xa1Bienvenido!"},
gxQ(){return"Crear nueva lista"},
gzm(){return"Cargar lista guardada"},
gzG(){return"A\xfan no hay listas guardadas."},
uJ(d){var w=B.f8("es")
return w.$3$one$other(d,"1 t\xe9rmino",""+d+" t\xe9rminos")},
gtr(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aIn()}return w},
gn2(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aIt()}return w}}
A.aHu.prototype={
gar(d){return"Crear nueva lista"},
gui(){return"Nombre de la lista"},
gzh(){return"p. ej., Vocabulario del Cap\xedtulo 1"},
gzV(){return"Pega tus t\xe9rminos a continuaci\xf3n:"},
gzW(){return y.C},
gAq(){return y.P},
gvd(){return"Guardar lista"},
gd0(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHq()}return w}}
A.aI_.prototype={
gar(d){return"Opciones y Modo"},
gmT(){return y.X},
ghG(){return"Volver a la pantalla de bienvenida"},
gyz(){return"Opciones de tarjetas"},
gvv(){return"Mostrar t\xe9rmino primero"},
gvt(){return"Mostrar definici\xf3n primero"},
gtg(){return"Mostrar definici\xf3n, preguntar t\xe9rmino"},
gtf(){return"Mostrar t\xe9rmino, preguntar definici\xf3n"},
gvH(){return"Longitud de estudio:"},
gAN(){return"Respuesta escrita"},
gzB(){return"Opci\xf3n m\xfaltiple"},
gyA(){return"Tarjetas"},
guf(){return"Aprender"},
guK(){return"Prueba"},
gzr(d){return"Combinar"}}
A.aHi.prototype={
gar(d){return"Tarjetas"},
gzE(){return"No hay tarjetas para mostrar."},
geq(){return y.f},
gvy(d){return"Barajar"},
gAg(){return"Reiniciar"}}
A.aHC.prototype={
gar(d){return"Aprender"},
gAh(){return"Reiniciar sesi\xf3n de aprendizaje"},
gkD(){return"Volver a las opciones"},
gta(){return"Escribe tu respuesta aqu\xed..."},
gq2(d){return"Pista"},
gvz(d){return"Saltar"},
gd0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHy()}return w},
go3(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aHD()}return w},
glO(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aHI(w,w)}return v}}
A.aHS.prototype={
gar(d){return"Combinar"},
gkE(){return"\xa1Felicidades!"},
gA_(){return"Jugar de nuevo"},
gkD(){return"Volver a las opciones"},
gqd(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aHU()}return w},
gd0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHO()}return w}}
A.aID.prototype={
gar(d){return"Prueba"},
gl_(){return"No hay preguntas para esta prueba."},
gAH(){return"Ver resultados"},
gvJ(){return"Enviar prueba"},
gd0(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aIz()}return w}}
A.aI3.prototype={
gar(d){return"Resultados de la prueba"},
gl_(){return"No hab\xeda preguntas en esta prueba."},
gAP(){return"Tu puntuaci\xf3n"},
vh(d,e){return""+d+" / "+e+" correctas"},
gqx(){return"Revisar respuestas incorrectas:"},
AO(d){return"Tu respuesta: "+d},
gzD(){return"(Sin respuesta)"},
gkE(){return"\xa1Felicidades! \xa1Acertaste todo!"},
gAk(){return"Reintentar prueba"},
gAm(){return"Revisar con tarjetas"}}
A.aIb.prototype={
gar(d){return"Ajustes"},
gx8(d){return"Apariencia"},
gud(d){return"Idioma"},
gz9(){return"Seleccionar idioma"},
guR(){return"Escalado de la interfaz"},
gAz(){return y.L},
grj(){return"Predeterminado del sistema"},
gzf(){return"Claro"},
gxW(){return"Oscuro"},
gyj(){return"Ingl\xe9s"},
gyy(){return"Finland\xe9s"},
gAp(){return"Ruso"},
gvC(){return"Espa\xf1ol"},
gvN(){return"Sueco"},
gxX(){return"Gesti\xf3n de datos"},
gyp(){return"Exportar datos"},
gyq(){return"Guardar todas las listas en un archivo"},
gyP(){return"Importar datos"},
gyQ(){return"Cargar listas desde un archivo"},
gy3(){return"Eliminar todos los datos"},
gq3(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aId()}return w},
gpt(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aI7()}return w},
gmb(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aIi()}return w}}
A.aH6.prototype={
gar(d){return"Controles"},
guX(){return"Gestos (Tarjetas)"},
gz6(){return"Teclado (Tarjetas)"},
gol(){return"Siguiente tarjeta"},
got(){return"Tarjeta anterior"},
gob(){return"Voltear tarjeta"},
gvO(){return"Deslizar a la izquierda"},
gvP(){return"Deslizar a la derecha"},
gvQ(){return"Deslizar hacia arriba o abajo"},
gxc(){return"Tecla de flecha derecha"},
gxb(){return"Tecla de flecha izquierda"},
gxd(){return y.b}}
A.aHa.prototype={
gzd(){return"\xa9 2025 Quizlone"},
gy5(d){return y.a}}
A.aIn.prototype={
gar(d){return"Confirmar eliminaci\xf3n"},
xB(d,e){return"\xbfEst\xe1s seguro de que quieres eliminar '"+e+"'?"}}
A.aIt.prototype={
gar(d){return"Renombrar lista"},
guA(){return"Renombrar"},
gyl(){return"Ya existe una lista con este nombre."},
gyk(){return y.N}}
A.aHq.prototype={
gzg(){return y.N},
geq(){return y._},
gz0(){return y.n},
yf(d){return"Error de formato cerca de la l\xednea "+d+y.Z},
gzI(){return y.O},
vc(d){return"No se pudo guardar la lista: "+d}}
A.aHy.prototype={
geq(){return y.B},
gh4(){return y.h}}
A.aHD.prototype={
gxM(){return"\xa1Correcto!"},
yT(d){return"Incorrecto. La respuesta correcta es: "+d},
yL(d,e){return'Pista: Empieza con "'+e+'"'},
vA(d){return"Saltado. La respuesta era: "+d}}
A.aHI.prototype={
gx7(){return"\xa1Todos los t\xe9rminos aprendidos!"},
tw(d,e,f){return"Ciclo "+d+" | Elemento "+e+" de "+f},
gvm(){return y.k},
zt(d){var w=B.f8("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+d+" elementos por repasar.")},
vE(d,e){return"Iniciando ciclo "+e+" con "+d+" elemento(s)..."}}
A.aHU.prototype={
gar(d){return"Tabla de clasificaci\xf3n"},
gzH(){return"A\xfan no hay r\xe9cords. \xa1S\xe9 el primero!"},
Au(d,e){return e+" Segundos"}}
A.aHO.prototype={
gh4(){return y.R}}
A.aIz.prototype={
gzl(){return y.Q},
geq(){return y.I},
gh4(){return y.W}}
A.aId.prototype={
gar(d){return"Confirmar importaci\xf3n"},
gkF(d){return y.s},
gva(d){return"Importar"}}
A.aI7.prototype={
gar(d){return"Confirmar eliminaci\xf3n"},
gkF(d){return y.x},
gy0(){return"Eliminar todo"}}
A.aIi.prototype={
gzF(){return"No hay datos para exportar."},
yr(d){return"Error al exportar datos: "+d},
yS(d){return"\xa1Se importaron "+d+" listas con \xe9xito!"},
yR(d){return"Error al importar datos: "+d},
gx6(){return y.J}}
var z=a.updateTypes([])
A.aL2.prototype={
$1(d){return A.bcZ(this.a,d)},
$S:53}
A.aKC.prototype={
$1$error(d){return"Error: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKE.prototype={
$1$version(d){return"Versi\xf3n "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:88}
A.aKF.prototype={
$1$count(d){var w
this.a.ghO()
w=B.f8("es")
return w.$3$one$other(d,"1 t\xe9rmino",B.h(d)+" t\xe9rminos")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:38}
A.aKG.prototype={
$1$listName(d){return"\xbfEst\xe1s seguro de que quieres eliminar '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:92}
A.aKH.prototype={
$1$line(d){return"Error de formato cerca de la l\xednea "+B.h(d)+y.Z},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:93}
A.aKI.prototype={
$1$error(d){return"No se pudo guardar la lista: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKJ.prototype={
$1$id(d){return"Depuraci\xf3n: El ID activo actual es "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:79}
A.aKK.prototype={
$1$answer(d){return"Incorrecto. La respuesta correcta es: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aKL.prototype={
$1$char(d){return'Pista: Empieza con "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:90}
A.aKM.prototype={
$1$answer(d){return"Saltado. La respuesta era: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aKN.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Ciclo "+B.h(d)+" | Elemento "+B.h(e)+" de "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:89}
A.aKP.prototype={
$1$count(d){var w
this.a.ghO()
w=B.f8("es")
return w.$3$one$other(d,y.H,"Se alcanz\xf3 el m\xe1ximo de ciclos. Quedan "+B.h(d)+" elementos por repasar.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:38}
A.aKQ.prototype={
$2$count$cycleNum(d,e){return"Iniciando ciclo "+B.h(e)+" con "+B.h(d)+" elemento(s)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:83}
A.aKR.prototype={
$1$time(d){return"\xa1Terminaste en "+B.h(d)+" segundos!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aKS.prototype={
$1$time(d){return B.h(d)+" Segundos"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aKT.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" correctas"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:70}
A.aKU.prototype={
$1$answer(d){return"Tu respuesta: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aKV.prototype={
$1$error(d){return"Error al exportar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKW.prototype={
$1$count(d){return"\xa1Se importaron "+B.h(d)+" listas con \xe9xito!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:84}
A.aKX.prototype={
$1$error(d){return"Error al importar datos: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Wb,B.du)
w(A.aHm,B.uy)
w(A.aHe,B.uw)
w(A.aH2,B.ut)
w(A.aIr,B.uP)
w(A.aHu,B.uz)
w(A.aI_,B.uI)
w(A.aHi,B.ux)
w(A.aHC,B.uB)
w(A.aHS,B.uF)
w(A.aID,B.uR)
w(A.aI3,B.uJ)
w(A.aIb,B.uL)
w(A.aH6,B.uu)
w(A.aHa,B.uv)
w(A.aIn,B.uO)
w(A.aIt,B.uQ)
w(A.aHq,B.uA)
w(A.aHy,B.uC)
w(A.aHD,B.uD)
w(A.aHI,B.uE)
w(A.aHU,B.uH)
w(A.aHO,B.uG)
w(A.aIz,B.uS)
w(A.aId,B.uM)
w(A.aI7,B.uK)
w(A.aIi,B.uN)
v(B.jq,[A.aL2,A.aKC,A.aKE,A.aKF,A.aKG,A.aKH,A.aKI,A.aKJ,A.aKK,A.aKL,A.aKM,A.aKN,A.aKP,A.aKQ,A.aKR,A.aKS,A.aKT,A.aKU,A.aKV,A.aKW,A.aKX])})()
B.a4d(b.typeUniverse,JSON.parse('{"Wb":{"du":[],"hV":["dL","du"]}}'))
var y={C:"(T\xe9rmino en una l\xednea, definici\xf3n en la siguiente)",Z:". Se encontr\xf3 un t\xe9rmino o definici\xf3n vac\xedos.",L:"Ajusta el tama\xf1o del texto y los elementos de la interfaz",N:"El nombre de la lista no puede estar vac\xedo.",Q:"Error al cargar la lista de estudio para la prueba.",s:"Esto importar\xe1 listas de estudio desde un archivo. Cualquier lista existente con el mismo nombre ser\xe1 sobrescrita. \xbfContinuar?",n:"Formato inv\xe1lido. Cada t\xe9rmino necesita una definici\xf3n en la siguiente l\xednea.",P:"Justicia\nEl principio de rectitud moral\nSol\nUna estrella que es el centro de un sistema planetario",W:"No hay suficientes t\xe9rminos para la longitud de estudio seleccionada.",h:"No hay suficientes t\xe9rminos para la longitud seleccionada.",B:"No hay t\xe9rminos disponibles para el modo de aprendizaje.",f:"No hay t\xe9rminos disponibles para estudiar.",I:"No hay t\xe9rminos disponibles para la prueba.",O:"No se encontraron pares de t\xe9rmino/definici\xf3n v\xe1lidos.",X:"No se encontr\xf3 una lista de estudio activa o no se pudo cargar la lista.",_:"No se han introducido t\xe9rminos/definiciones.",H:"Se alcanz\xf3 el m\xe1ximo de ciclos. Queda 1 elemento por repasar.",R:"Se requiere al menos un par de t\xe9rmino/definici\xf3n para jugar.",b:"Teclas de flecha arriba/abajo o Barra espaciadora",J:"Todas las listas de estudio han sido eliminadas.",a:"Una aplicaci\xf3n de estudio simple y moderna creada con Flutter.",k:"\xa1Sesi\xf3n de aprendizaje completa! \xa1Bien hecho!",x:"\xbfEst\xe1s seguro de que quieres eliminar TODAS las listas de estudio? Esta acci\xf3n no se puede deshacer."}
var x={c:B.am("hg<dL,du>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"3DN0gbWKNxrOzCkrrOYruQggBe0=");