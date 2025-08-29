((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_4",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aWO(d,e,f){var w,v,u=null,t=new B.hi(d,x.c),s=new B.hi(d,x.c)
s=new A.Wl(t,s)
s.w7(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bd8(s)
return s},
bd4(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
switch(e){case"appName":return w
case"general.back":return"Tillbaka"
case"general.cancel":return"Avbryt"
case"general.delete":return"Ta bort"
case"general.error":return"Fel"
case"general.next":return"N\xe4sta"
case"general.previous":return"F\xf6reg\xe5ende"
case"general.saveAndContinue":return"Spara och forts\xe4tt"
case"general.submit":return"Skicka"
case"general.all":return"Alla"
case"general.loading":return"Laddar..."
case"general.genericError":return new A.aJM()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aJN()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aJO(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aJZ()
case"startScreen.renameListDialog.title":return"Byt namn p\xe5 listan"
case"startScreen.renameListDialog.rename":return"Byt namn"
case"startScreen.renameListDialog.errorNameExists":return"En lista med detta namn finns redan."
case"startScreen.renameListDialog.errorNameEmpty":return"Listnamnet kan inte vara tomt."
case"inputScreen.title":return t
case"inputScreen.listName":return"Listans namn"
case"inputScreen.listNameHint":return"t.ex. Kapitel 1 Ordlista"
case"inputScreen.pasteTerms":return"Klistra in dina termer nedan:"
case"inputScreen.pasteTermsHint":return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"
case"inputScreen.termsHint":return y.a
case"inputScreen.saveList":return"Spara lista"
case"inputScreen.errors.listNameEmpty":return"Listans namn kan inte vara tomt."
case"inputScreen.errors.noTerms":return"Inga termer/definitioner inmatade."
case"inputScreen.errors.invalidFormat":return y.C
case"inputScreen.errors.emptyTerm":return new A.aK9()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aKk()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aKv()
case"modeSelectionScreen.returnToWelcome":return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"
case"modeSelectionScreen.flashcardOptions":return"Inst\xe4llningar f\xf6r bildkort"
case"modeSelectionScreen.showTermFirst":return"Visa term f\xf6rst"
case"modeSelectionScreen.showDefFirst":return"Visa definition f\xf6rst"
case"modeSelectionScreen.studyOptions":return"Inst\xe4llningar f\xf6r Inl\xe4rning & Prov"
case"modeSelectionScreen.askForTerm":return"Visa definition, fr\xe5ga efter term"
case"modeSelectionScreen.askForDef":return"Visa term, fr\xe5ga efter definition"
case"modeSelectionScreen.studyLength":return"Studiel\xe4ngd:"
case"modeSelectionScreen.testFormat":return"Provformat"
case"modeSelectionScreen.writtenAnswer":return"Skrivet svar"
case"modeSelectionScreen.multipleChoice":return"Flerval"
case"modeSelectionScreen.flashcards":return r
case"modeSelectionScreen.learn":return q
case"modeSelectionScreen.test":return"Prov"
case"modeSelectionScreen.match":return"Matcha"
case"modeSelectionScreen.backToWelcome":return p
case"flashcardScreen.title":return r
case"flashcardScreen.noCards":return"Inga bildkort att visa."
case"flashcardScreen.noTerms":return"Inga termer tillg\xe4ngliga att studera."
case"flashcardScreen.shuffle":return"Blanda"
case"flashcardScreen.restart":return"Starta om"
case"learnScreen.title":return q
case"learnScreen.restartSession":return"Starta om inl\xe4rningssessionen"
case"learnScreen.backToOptions":return o
case"learnScreen.preparing":return"F\xf6rbereder n\xe4sta fr\xe5ga..."
case"learnScreen.answerHint":return"Skriv ditt svar h\xe4r..."
case"learnScreen.incorrect":return"Felaktigt"
case"learnScreen.hint":return"Ledtr\xe5d"
case"learnScreen.skip":return"Hoppa \xf6ver"
case"learnScreen.backToModeSelection":return"Tillbaka till l\xe4gesval"
case"learnScreen.errors.noTerms":return y.g
case"learnScreen.errors.notEnoughTerms":return y.U
case"learnScreen.feedback.correct":return"R\xe4tt!"
case"learnScreen.feedback.incorrect":return new A.aKG()
case"learnScreen.feedback.hint":return new A.aKR()
case"learnScreen.feedback.skipped":return new A.aL0()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aL1()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aJP(d)
case"learnScreen.progress.startingCycle":return new A.aJQ()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aJR()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aJS()
case"matchScreen.errors.noTerms":return"Inga termer tillg\xe4ngliga f\xf6r Matcha-l\xe4get."
case"matchScreen.errors.notEnoughTerms":return y.n
case"testScreen.title":return"Prov"
case"testScreen.noQuestions":return"Inga fr\xe5gor f\xf6r detta prov."
case"testScreen.viewResults":return"Visa resultat"
case"testScreen.submitTest":return"L\xe4mna in provet"
case"testScreen.errors.loadFailed":return y.Q
case"testScreen.errors.noTerms":return"Inga termer tillg\xe4ngliga f\xf6r provet."
case"testScreen.errors.notEnoughTerms":return y.k
case"resultsScreen.title":return"Provresultat"
case"resultsScreen.notSubmitted":return"Provet har inte l\xe4mnats in \xe4n."
case"resultsScreen.noQuestions":return"Det fanns inga fr\xe5gor i detta prov."
case"resultsScreen.yourScore":return"Ditt resultat"
case"resultsScreen.scoreFraction":return new A.aJT()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aJU()
case"resultsScreen.noAnswer":return"(Inget svar)"
case"resultsScreen.congratulations":return"Grattis! Du hade alla r\xe4tt!"
case"resultsScreen.retryTest":return"F\xf6rs\xf6k igen"
case"resultsScreen.reviewFlashcards":return"Repetera med bildkort"
case"resultsScreen.backToWelcome":return p
case"settingsScreen.title":return v
case"settingsScreen.appearance":return"Utseende"
case"settingsScreen.language":return"Spr\xe5k"
case"settingsScreen.languageDialogTitle":return"V\xe4lj spr\xe5k"
case"settingsScreen.uiScaling":return"UI-skalning"
case"settingsScreen.uiScalingSubtitle":return y.H
case"settingsScreen.systemDefault":return"Systemstandard"
case"settingsScreen.light":return"Ljus"
case"settingsScreen.dark":return"M\xf6rk"
case"settingsScreen.english":return"Engelska"
case"settingsScreen.finnish":return"Finska"
case"settingsScreen.russian":return"Ryska"
case"settingsScreen.spanish":return"Spanska"
case"settingsScreen.swedish":return"Svenska"
case"settingsScreen.dataManagement":return"Datahantering"
case"settingsScreen.exportData":return n
case"settingsScreen.exportDataSubtitle":return"Spara alla listor till en fil"
case"settingsScreen.importData":return"Importera data"
case"settingsScreen.importDataSubtitle":return"Ladda listor fr\xe5n en fil"
case"settingsScreen.deleteAllData":return"Ta bort all data"
case"settingsScreen.exportDialog.title":return n
case"settingsScreen.exportDialog.content":return"Hur vill du exportera din data?"
case"settingsScreen.exportDialog.share":return"Dela fil"
case"settingsScreen.exportDialog.save":return"Spara p\xe5 enheten"
case"settingsScreen.importDialog.title":return"Bekr\xe4fta import"
case"settingsScreen.importDialog.content":return y.v
case"settingsScreen.importDialog.import":return"Importera"
case"settingsScreen.deleteDialog.title":return s
case"settingsScreen.deleteDialog.content":return y.l
case"settingsScreen.deleteDialog.deleteAll":return"Ta bort allt"
case"settingsScreen.snackbars.noDataToExport":return"Det finns ingen data att exportera."
case"settingsScreen.snackbars.exportSuccess":return"Data exporterades framg\xe5ngsrikt!"
case"settingsScreen.snackbars.exportError":return new A.aJV()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aJW()
case"settingsScreen.snackbars.importError":return new A.aJX()
case"settingsScreen.snackbars.allDeleted":return"Alla studielistor har tagits bort."
case"controlsScreen.title":return u
case"controlsScreen.gesturesTitle":return"Gester (Bildkort)"
case"controlsScreen.keyboardTitle":return"Tangentbord (Bildkort)"
case"controlsScreen.nextCard":return"N\xe4sta kort"
case"controlsScreen.previousCard":return"F\xf6reg\xe5ende kort"
case"controlsScreen.flipCard":return"V\xe4nd kort"
case"controlsScreen.swipeLeft":return"Svep v\xe4nster"
case"controlsScreen.swipeRight":return"Svep h\xf6ger"
case"controlsScreen.swipeVertical":return"Svep upp eller ner"
case"controlsScreen.arrowRight":return"H\xf6gerpiltangent"
case"controlsScreen.arrowLeft":return"V\xe4nsterpiltangent"
case"controlsScreen.arrowVerticalOrSpace":return"Upp/ner-piltangenter eller Mellanslag"
default:return null}},
bd8(d){return new A.aL2(d)},
Wl:function Wl(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHs:function aHs(){},
aHk:function aHk(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aH8:function aH8(){},
aIB:function aIB(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHA:function aHA(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI5:function aI5(){},
aHo:function aHo(){},
aHQ:function aHQ(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aI1:function aI1(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIJ:function aIJ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI9:function aI9(){},
aIp:function aIp(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aHc:function aHc(){},
aHg:function aHg(){},
aIt:function aIt(){},
aIz:function aIz(){},
aHw:function aHw(){},
aHE:function aHE(){},
aHJ:function aHJ(){},
aHO:function aHO(d,e){this.b=d
this.a=e},
aI_:function aI_(){},
aHU:function aHU(){},
aIF:function aIF(){},
aIj:function aIj(){},
aId:function aId(){},
aIo:function aIo(){},
aL2:function aL2(d){this.a=d},
aJM:function aJM(){},
aJN:function aJN(){},
aJO:function aJO(d){this.a=d},
aJZ:function aJZ(){},
aK9:function aK9(){},
aKk:function aKk(){},
aKv:function aKv(){},
aKG:function aKG(){},
aKR:function aKR(){},
aL0:function aL0(){},
aL1:function aL1(){},
aJP:function aJP(d){this.a=d},
aJQ:function aJQ(){},
aJR:function aJR(){},
aJS:function aJS(){},
aJT:function aJT(){},
aJU:function aJU(){},
aJV:function aJV(){},
aJW:function aJW(){},
aJX:function aJX(){}}
B=c[0]
A=a.updateHolder(c[6],A)
A.Wl.prototype={
ghV(){var w=this.ch
if(w===$){w!==$&&B.v()
w=this.ch=this}return w},
gnR(d){return"Quizlone"},
gdk(){var w=this,v=w.CW
if(v===$){w.ghV()
w.CW!==$&&B.v()
v=w.CW=new A.aHs()}return v},
glH(){var w,v=this,u=v.cx
if(u===$){w=v.ghV()
v.cx!==$&&B.v()
u=v.cx=new A.aHk(w,w)}return u},
gtd(){var w=this,v=w.cy
if(v===$){w.ghV()
w.cy!==$&&B.v()
v=w.cy=new A.aH8()}return v},
gfo(){var w,v=this,u=v.db
if(u===$){w=v.ghV()
v.db!==$&&B.v()
u=v.db=new A.aIB(w,w)}return u},
gfv(){var w,v=this,u=v.dx
if(u===$){w=v.ghV()
v.dx!==$&&B.v()
u=v.dx=new A.aHA(w,w)}return u},
gcn(){var w=this,v=w.dy
if(v===$){w.ghV()
w.dy!==$&&B.v()
v=w.dy=new A.aI5()}return v},
gmH(){var w=this,v=w.fr
if(v===$){w.ghV()
w.fr!==$&&B.v()
v=w.fr=new A.aHo()}return v},
geo(){var w,v=this,u=v.fx
if(u===$){w=v.ghV()
v.fx!==$&&B.v()
u=v.fx=new A.aHQ(w,w)}return u},
gkh(){var w,v=this,u=v.fy
if(u===$){w=v.ghV()
v.fy!==$&&B.v()
u=v.fy=new A.aI1(w,w)}return u},
glg(){var w,v=this,u=v.go
if(u===$){w=v.ghV()
v.go!==$&&B.v()
u=v.go=new A.aIJ(w,w)}return u},
ghJ(){var w=this,v=w.id
if(v===$){w.ghV()
w.id!==$&&B.v()
v=w.id=new A.aI9()}return v},
gcq(){var w,v=this,u=v.k1
if(u===$){w=v.ghV()
v.k1!==$&&B.v()
u=v.k1=new A.aIp(w,w)}return u},
gfd(){var w=this,v=w.k2
if(v===$){w.ghV()
w.k2!==$&&B.v()
v=w.k2=new A.aHc()}return v},
gm1(){return this.ay}}
A.aHs.prototype={
gxB(d){return"Tillbaka"},
gio(d){return"Avbryt"},
gqS(d){return"Ta bort"},
giE(d){return"N\xe4sta"},
goy(){return"F\xf6reg\xe5ende"},
gvX(d){return"Skicka"},
gxn(){return"Alla"},
gzF(){return"Laddar..."},
hh(d){return"Fel: "+d},
gAq(d){return"\xc5terst\xe4ll"}}
A.aHk.prototype={
gvF(){return"Inst\xe4llningar"},
gxU(d){return"Kontroller"},
gtb(){return"Om"},
gtc(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHg()}return w}}
A.aH8.prototype={
AP(d,e){return"Version "+e},
gAQ(){return"Visa licenser"}}
A.aIB.prototype={
gar(d){return"Quizlone"},
gAT(){return"V\xe4lkommen!"},
gy9(){return"Skapa ny lista"},
gzE(){return"Ladda sparad lista"},
gzY(){return"Inga listor sparade \xe4n."},
uY(d){var w=B.f9("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gtB(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aIt()}return w},
gn6(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aIz()}return w}}
A.aHA.prototype={
gar(d){return"Skapa ny lista"},
guv(){return"Listans namn"},
gzA(){return"t.ex. Kapitel 1 Ordlista"},
gAa(){return"Klistra in dina termer nedan:"},
gAb(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gAA(){return y.a},
gvs(){return"Spara lista"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHw()}return w}}
A.aI5.prototype={
gar(d){return"Alternativ & L\xe4ge"},
gmW(){return y.w},
ghK(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gyS(){return"Inst\xe4llningar f\xf6r bildkort"},
gvK(){return"Visa term f\xf6rst"},
gvI(){return"Visa definition f\xf6rst"},
gtr(){return"Visa definition, fr\xe5ga efter term"},
gtq(){return"Visa term, fr\xe5ga efter definition"},
gvW(){return"Studiel\xe4ngd:"},
gAX(){return"Skrivet svar"},
gzT(){return"Flerval"},
gyT(){return"Bildkort"},
gus(){return"Inl\xe4rning"},
guZ(){return"Prov"},
gzJ(d){return"Matcha"}}
A.aHo.prototype={
gar(d){return"Bildkort"},
gzW(){return"Inga bildkort att visa."},
gep(){return"Inga termer tillg\xe4ngliga att studera."},
gvN(d){return"Blanda"},
gqD(){return"Starta om"}}
A.aHQ.prototype={
gar(d){return"Inl\xe4rning"},
gAt(){return"Starta om inl\xe4rningssessionen"},
gkN(){return"Tillbaka till alternativ"},
gtk(){return"Skriv ditt svar h\xe4r..."},
gq6(d){return"Ledtr\xe5d"},
gvO(d){return"Hoppa \xf6ver"},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHE()}return w},
go8(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aHJ()}return w},
glS(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aHO(w,w)}return v}}
A.aI1.prototype={
gar(d){return"Matcha"},
gkO(){return"Grattis!"},
gAd(){return"Spela igen"},
gkN(){return"Tillbaka till alternativ"},
gqh(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aI_()}return w},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHU()}return w}}
A.aIJ.prototype={
gar(d){return"Prov"},
gl7(){return"Inga fr\xe5gor f\xf6r detta prov."},
gAR(){return"Visa resultat"},
gvY(){return"L\xe4mna in provet"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aIF()}return w}}
A.aI9.prototype={
gar(d){return"Provresultat"},
gl7(){return"Det fanns inga fr\xe5gor i detta prov."},
gAZ(){return"Ditt resultat"},
vw(d,e){return""+d+" / "+e+" r\xe4tt"},
gqF(){return"Granska felaktiga svar:"},
AY(d){return"Ditt svar: "+d},
gzV(){return"(Inget svar)"},
gkO(){return"Grattis! Du hade alla r\xe4tt!"},
gAu(){return"F\xf6rs\xf6k igen"},
gAw(){return"Repetera med bildkort"}}
A.aIp.prototype={
gar(d){return"Inst\xe4llningar"},
gxq(d){return"Utseende"},
guq(d){return"Spr\xe5k"},
gzs(){return"V\xe4lj spr\xe5k"},
gv5(){return"UI-skalning"},
gAJ(){return y.H},
grs(){return"Systemstandard"},
gzy(){return"Ljus"},
gyf(){return"M\xf6rk"},
gyC(){return"Engelska"},
gyR(){return"Finska"},
gAz(){return"Ryska"},
gvR(){return"Spanska"},
gw2(){return"Svenska"},
gyg(){return"Datahantering"},
gyI(){return"Exportera data"},
gyJ(){return"Spara alla listor till en fil"},
gz7(){return"Importera data"},
gz8(){return"Ladda listor fr\xe5n en fil"},
gym(){return"Ta bort all data"},
gq7(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aIj()}return w},
gpy(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aId()}return w},
gmd(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aIo()}return w}}
A.aHc.prototype={
gar(d){return"Kontroller"},
gvb(){return"Gester (Bildkort)"},
gzp(){return"Tangentbord (Bildkort)"},
gop(){return"N\xe4sta kort"},
goz(){return"F\xf6reg\xe5ende kort"},
gof(){return"V\xe4nd kort"},
gw3(){return"Svep v\xe4nster"},
gw4(){return"Svep h\xf6ger"},
gw5(){return"Svep upp eller ner"},
gxv(){return"H\xf6gerpiltangent"},
gxu(){return"V\xe4nsterpiltangent"},
gxw(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aHg.prototype={
gzw(){return"\xa9 2025 Quizlone"},
gyo(d){return y.t}}
A.aIt.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
xT(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aIz.prototype={
gar(d){return"Byt namn p\xe5 listan"},
guN(){return"Byt namn"},
gyE(){return"En lista med detta namn finns redan."},
gyD(){return"Listnamnet kan inte vara tomt."}}
A.aHw.prototype={
gzz(){return"Listans namn kan inte vara tomt."},
gep(){return"Inga termer/definitioner inmatade."},
gzj(){return y.C},
yy(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gA_(){return y.M},
vr(d){return"Det gick inte att spara listan: "+d}}
A.aHE.prototype={
gep(){return y.g},
gh5(){return y.U}}
A.aHJ.prototype={
gy4(){return"R\xe4tt!"},
zb(d){return"Fel. R\xe4tt svar: "+d},
z3(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
vP(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aHO.prototype={
gxp(){return"Alla termer inl\xe4rda!"},
tG(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gvB(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
zL(d){var w=B.f9("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vT(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aI_.prototype={
gar(d){return"Topplista"},
gzZ(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
AE(d,e){return e+" Sekunder"}}
A.aHU.prototype={
gh5(){return y.n}}
A.aIF.prototype={
gzD(){return y.Q},
gep(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gh5(){return y.k}}
A.aIj.prototype={
gar(d){return"Bekr\xe4fta import"},
gkP(d){return y.v},
gvp(d){return"Importera"}}
A.aId.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
gkP(d){return y.l},
gyk(){return"Ta bort allt"}}
A.aIo.prototype={
gzX(){return"Det finns ingen data att exportera."},
yK(d){return"Fel vid export av data: "+d},
za(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
z9(d){return"Fel vid import av data: "+d},
gxo(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aL2.prototype={
$1(d){return A.bd4(this.a,d)},
$S:53}
A.aJM.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$S:13}
A.aJN.prototype={
$1$version(d){return"Version "+B.h(d)},
$S:94}
A.aJO.prototype={
$1$count(d){var w
this.a.ghV()
w=B.f9("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$S:37}
A.aJZ.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$S:87}
A.aK9.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$S:86}
A.aKk.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$S:13}
A.aKv.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$S:83}
A.aKG.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$S:24}
A.aKR.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$S:75}
A.aL0.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$S:24}
A.aL1.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$S:73}
A.aJP.prototype={
$1$count(d){var w
this.a.ghV()
w=B.f9("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$S:37}
A.aJQ.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$S:72}
A.aJR.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$S:39}
A.aJS.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$S:39}
A.aJT.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$S:92}
A.aJU.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$S:24}
A.aJV.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$S:13}
A.aJW.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$S:88}
A.aJX.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Wl,B.dw)
w(A.aHs,B.uA)
w(A.aHk,B.uy)
w(A.aH8,B.uv)
w(A.aIB,B.uR)
w(A.aHA,B.uB)
w(A.aI5,B.uK)
w(A.aHo,B.uz)
w(A.aHQ,B.uD)
w(A.aI1,B.uH)
w(A.aIJ,B.uT)
w(A.aI9,B.uL)
w(A.aIp,B.uN)
w(A.aHc,B.uw)
w(A.aHg,B.ux)
w(A.aIt,B.uQ)
w(A.aIz,B.uS)
w(A.aHw,B.uC)
w(A.aHE,B.uE)
w(A.aHJ,B.uF)
w(A.aHO,B.uG)
w(A.aI_,B.uJ)
w(A.aHU,B.uI)
w(A.aIF,B.uU)
w(A.aIj,B.uO)
w(A.aId,B.uM)
w(A.aIo,B.uP)
v(B.jr,[A.aL2,A.aJM,A.aJN,A.aJO,A.aJZ,A.aK9,A.aKk,A.aKv,A.aKG,A.aKR,A.aL0,A.aL1,A.aJP,A.aJQ,A.aJR,A.aJS,A.aJT,A.aJU,A.aJV,A.aJW,A.aJX])})()
B.a4l(b.typeUniverse,JSON.parse('{"Wl":{"dw":[],"hY":["dN","dw"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.al("hi<dN,dw>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_4",e:"endPart",h:b})})($__dart_deferred_initializers__,"1FXo1CzbKKcf4o+e3AVf4m0/8yo=");