((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_4",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aWJ(d,e,f){var w,v,u=null,t=new B.hi(d,x.c),s=new B.hi(d,x.c)
s=new A.Wl(t,s)
s.w5(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bd4(s)
return s},
bd0(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
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
case"general.genericError":return new A.aJG()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aJH()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aJI(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aJT()
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
case"inputScreen.errors.emptyTerm":return new A.aK3()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aKe()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aKp()
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
case"learnScreen.feedback.incorrect":return new A.aKA()
case"learnScreen.feedback.hint":return new A.aKL()
case"learnScreen.feedback.skipped":return new A.aKV()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aKW()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aJJ(d)
case"learnScreen.progress.startingCycle":return new A.aJK()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aJL()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aJM()
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
case"resultsScreen.scoreFraction":return new A.aJN()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aJO()
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
case"settingsScreen.snackbars.exportError":return new A.aJP()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aJQ()
case"settingsScreen.snackbars.importError":return new A.aJR()
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
bd4(d){return new A.aKX(d)},
Wl:function Wl(d,e){var _=this
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
aIv:function aIv(d,e){var _=this
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
aHK:function aHK(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aHW:function aHW(d,e){var _=this
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
aIj:function aIj(d,e){var _=this
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
aKX:function aKX(d){this.a=d},
aJG:function aJG(){},
aJH:function aJH(){},
aJI:function aJI(d){this.a=d},
aJT:function aJT(){},
aK3:function aK3(){},
aKe:function aKe(){},
aKp:function aKp(){},
aKA:function aKA(){},
aKL:function aKL(){},
aKV:function aKV(){},
aKW:function aKW(){},
aJJ:function aJJ(d){this.a=d},
aJK:function aJK(){},
aJL:function aJL(){},
aJM:function aJM(){},
aJN:function aJN(){},
aJO:function aJO(){},
aJP:function aJP(){},
aJQ:function aJQ(){},
aJR:function aJR(){}}
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
v=w.CW=new A.aHm()}return v},
glH(){var w,v=this,u=v.cx
if(u===$){w=v.ghV()
v.cx!==$&&B.v()
u=v.cx=new A.aHe(w,w)}return u},
gtd(){var w=this,v=w.cy
if(v===$){w.ghV()
w.cy!==$&&B.v()
v=w.cy=new A.aH2()}return v},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.ghV()
v.db!==$&&B.v()
u=v.db=new A.aIv(w,w)}return u},
gfz(){var w,v=this,u=v.dx
if(u===$){w=v.ghV()
v.dx!==$&&B.v()
u=v.dx=new A.aHu(w,w)}return u},
gcn(){var w=this,v=w.dy
if(v===$){w.ghV()
w.dy!==$&&B.v()
v=w.dy=new A.aI_()}return v},
gmH(){var w=this,v=w.fr
if(v===$){w.ghV()
w.fr!==$&&B.v()
v=w.fr=new A.aHi()}return v},
geo(){var w,v=this,u=v.fx
if(u===$){w=v.ghV()
v.fx!==$&&B.v()
u=v.fx=new A.aHK(w,w)}return u},
gkh(){var w,v=this,u=v.fy
if(u===$){w=v.ghV()
v.fy!==$&&B.v()
u=v.fy=new A.aHW(w,w)}return u},
glg(){var w,v=this,u=v.go
if(u===$){w=v.ghV()
v.go!==$&&B.v()
u=v.go=new A.aID(w,w)}return u},
ghI(){var w=this,v=w.id
if(v===$){w.ghV()
w.id!==$&&B.v()
v=w.id=new A.aI3()}return v},
gcq(){var w,v=this,u=v.k1
if(u===$){w=v.ghV()
v.k1!==$&&B.v()
u=v.k1=new A.aIj(w,w)}return u},
gfd(){var w=this,v=w.k2
if(v===$){w.ghV()
w.k2!==$&&B.v()
v=w.k2=new A.aH6()}return v},
gm1(){return this.ay}}
A.aHm.prototype={
gxz(d){return"Tillbaka"},
gio(d){return"Avbryt"},
gqS(d){return"Ta bort"},
giE(d){return"N\xe4sta"},
goy(){return"F\xf6reg\xe5ende"},
gvV(d){return"Skicka"},
gxl(){return"Alla"},
gzE(){return"Laddar..."},
hh(d){return"Fel: "+d},
gAp(d){return"\xc5terst\xe4ll"}}
A.aHe.prototype={
gvD(){return"Inst\xe4llningar"},
gxS(d){return"Kontroller"},
gtb(){return"Om"},
gtc(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHa()}return w}}
A.aH2.prototype={
AO(d,e){return"Version "+e},
gAP(){return"Visa licenser"}}
A.aIv.prototype={
gar(d){return"Quizlone"},
gAS(){return"V\xe4lkommen!"},
gy7(){return"Skapa ny lista"},
gzD(){return"Ladda sparad lista"},
gzX(){return"Inga listor sparade \xe4n."},
uY(d){var w=B.f9("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gtB(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aIn()}return w},
gn6(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aIt()}return w}}
A.aHu.prototype={
gar(d){return"Skapa ny lista"},
guu(){return"Listans namn"},
gzz(){return"t.ex. Kapitel 1 Ordlista"},
gA9(){return"Klistra in dina termer nedan:"},
gAa(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gAz(){return y.a},
gvr(){return"Spara lista"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHq()}return w}}
A.aI_.prototype={
gar(d){return"Alternativ & L\xe4ge"},
gmW(){return y.w},
ghJ(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gyQ(){return"Inst\xe4llningar f\xf6r bildkort"},
gvI(){return"Visa term f\xf6rst"},
gvG(){return"Visa definition f\xf6rst"},
gtr(){return"Visa definition, fr\xe5ga efter term"},
gtq(){return"Visa term, fr\xe5ga efter definition"},
gvU(){return"Studiel\xe4ngd:"},
gAW(){return"Skrivet svar"},
gzS(){return"Flerval"},
gyR(){return"Bildkort"},
gur(){return"Inl\xe4rning"},
guZ(){return"Prov"},
gzI(d){return"Matcha"}}
A.aHi.prototype={
gar(d){return"Bildkort"},
gzV(){return"Inga bildkort att visa."},
gep(){return"Inga termer tillg\xe4ngliga att studera."},
gvL(d){return"Blanda"},
gqD(){return"Starta om"}}
A.aHK.prototype={
gar(d){return"Inl\xe4rning"},
gAs(){return"Starta om inl\xe4rningssessionen"},
gkO(){return"Tillbaka till alternativ"},
gtk(){return"Skriv ditt svar h\xe4r..."},
gq6(d){return"Ledtr\xe5d"},
gvM(d){return"Hoppa \xf6ver"},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHy()}return w},
go8(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aHD()}return w},
glS(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aHI(w,w)}return v}}
A.aHW.prototype={
gar(d){return"Matcha"},
gkP(){return"Grattis!"},
gAc(){return"Spela igen"},
gkO(){return"Tillbaka till alternativ"},
gqi(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aHU()}return w},
gd_(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHO()}return w}}
A.aID.prototype={
gar(d){return"Prov"},
gl8(){return"Inga fr\xe5gor f\xf6r detta prov."},
gAQ(){return"Visa resultat"},
gvW(){return"L\xe4mna in provet"},
gd_(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aIz()}return w}}
A.aI3.prototype={
gar(d){return"Provresultat"},
gl8(){return"Det fanns inga fr\xe5gor i detta prov."},
gAY(){return"Ditt resultat"},
vv(d,e){return""+d+" / "+e+" r\xe4tt"},
gqF(){return"Granska felaktiga svar:"},
AX(d){return"Ditt svar: "+d},
gzU(){return"(Inget svar)"},
gkP(){return"Grattis! Du hade alla r\xe4tt!"},
gAt(){return"F\xf6rs\xf6k igen"},
gAv(){return"Repetera med bildkort"}}
A.aIj.prototype={
gar(d){return"Inst\xe4llningar"},
gxo(d){return"Utseende"},
guo(d){return"Spr\xe5k"},
gzr(){return"V\xe4lj spr\xe5k"},
gv4(){return"UI-skalning"},
gAI(){return y.H},
grs(){return"Systemstandard"},
gzx(){return"Ljus"},
gyd(){return"M\xf6rk"},
gyA(){return"Engelska"},
gyP(){return"Finska"},
gAy(){return"Ryska"},
gvP(){return"Spanska"},
gw0(){return"Svenska"},
gye(){return"Datahantering"},
gyG(){return"Exportera data"},
gyH(){return"Spara alla listor till en fil"},
gz5(){return"Importera data"},
gz6(){return"Ladda listor fr\xe5n en fil"},
gyj(){return"Ta bort all data"},
gq7(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aId()}return w},
gpy(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aI7()}return w},
gmd(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aIi()}return w}}
A.aH6.prototype={
gar(d){return"Kontroller"},
gva(){return"Gester (Bildkort)"},
gzo(){return"Tangentbord (Bildkort)"},
gop(){return"N\xe4sta kort"},
goz(){return"F\xf6reg\xe5ende kort"},
gof(){return"V\xe4nd kort"},
gw1(){return"Svep v\xe4nster"},
gw2(){return"Svep h\xf6ger"},
gw3(){return"Svep upp eller ner"},
gxt(){return"H\xf6gerpiltangent"},
gxs(){return"V\xe4nsterpiltangent"},
gxu(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aHa.prototype={
gzv(){return"\xa9 2025 Quizlone"},
gym(d){return y.t}}
A.aIn.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
xR(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aIt.prototype={
gar(d){return"Byt namn p\xe5 listan"},
guM(){return"Byt namn"},
gyC(){return"En lista med detta namn finns redan."},
gyB(){return"Listnamnet kan inte vara tomt."}}
A.aHq.prototype={
gzy(){return"Listans namn kan inte vara tomt."},
gep(){return"Inga termer/definitioner inmatade."},
gzi(){return y.C},
yw(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gzZ(){return y.M},
vq(d){return"Det gick inte att spara listan: "+d}}
A.aHy.prototype={
gep(){return y.g},
gh5(){return y.U}}
A.aHD.prototype={
gy0(){return"R\xe4tt!"},
z9(d){return"Fel. R\xe4tt svar: "+d},
z1(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
vN(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aHI.prototype={
gxn(){return"Alla termer inl\xe4rda!"},
tG(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gvz(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
zK(d){var w=B.f9("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vR(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aHU.prototype={
gar(d){return"Topplista"},
gzY(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
AD(d,e){return e+" Sekunder"}}
A.aHO.prototype={
gh5(){return y.n}}
A.aIz.prototype={
gzC(){return y.Q},
gep(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gh5(){return y.k}}
A.aId.prototype={
gar(d){return"Bekr\xe4fta import"},
gkQ(d){return y.v},
gvo(d){return"Importera"}}
A.aI7.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
gkQ(d){return y.l},
gyi(){return"Ta bort allt"}}
A.aIi.prototype={
gzW(){return"Det finns ingen data att exportera."},
yI(d){return"Fel vid export av data: "+d},
z8(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
z7(d){return"Fel vid import av data: "+d},
gxm(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aKX.prototype={
$1(d){return A.bd0(this.a,d)},
$S:54}
A.aJG.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$S:13}
A.aJH.prototype={
$1$version(d){return"Version "+B.h(d)},
$S:74}
A.aJI.prototype={
$1$count(d){var w
this.a.ghV()
w=B.f9("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$S:38}
A.aJT.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$S:73}
A.aK3.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$S:81}
A.aKe.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$S:13}
A.aKp.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$S:69}
A.aKA.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$S:23}
A.aKL.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$S:92}
A.aKV.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$S:23}
A.aKW.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$S:72}
A.aJJ.prototype={
$1$count(d){var w
this.a.ghV()
w=B.f9("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$S:38}
A.aJK.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$S:87}
A.aJL.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$S:42}
A.aJM.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$S:42}
A.aJN.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$S:94}
A.aJO.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$S:23}
A.aJP.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$S:13}
A.aJQ.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$S:91}
A.aJR.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Wl,B.dv)
w(A.aHm,B.uz)
w(A.aHe,B.ux)
w(A.aH2,B.uu)
w(A.aIv,B.uQ)
w(A.aHu,B.uA)
w(A.aI_,B.uJ)
w(A.aHi,B.uy)
w(A.aHK,B.uC)
w(A.aHW,B.uG)
w(A.aID,B.uS)
w(A.aI3,B.uK)
w(A.aIj,B.uM)
w(A.aH6,B.uv)
w(A.aHa,B.uw)
w(A.aIn,B.uP)
w(A.aIt,B.uR)
w(A.aHq,B.uB)
w(A.aHy,B.uD)
w(A.aHD,B.uE)
w(A.aHI,B.uF)
w(A.aHU,B.uI)
w(A.aHO,B.uH)
w(A.aIz,B.uT)
w(A.aId,B.uN)
w(A.aI7,B.uL)
w(A.aIi,B.uO)
v(B.jr,[A.aKX,A.aJG,A.aJH,A.aJI,A.aJT,A.aK3,A.aKe,A.aKp,A.aKA,A.aKL,A.aKV,A.aKW,A.aJJ,A.aJK,A.aJL,A.aJM,A.aJN,A.aJO,A.aJP,A.aJQ,A.aJR])})()
B.a4l(b.typeUniverse,JSON.parse('{"Wl":{"dv":[],"hY":["dN","dv"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.al("hi<dN,dv>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_4",e:"endPart",h:b})})($__dart_deferred_initializers__,"5zIsN7NKka31AuE6YupxoNiGnPI=");