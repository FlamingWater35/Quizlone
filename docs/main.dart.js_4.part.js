((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_4",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aWE(d,e,f){var w,v,u=null,t=new B.hg(d,x.c),s=new B.hg(d,x.c)
s=new A.We(t,s)
s.vS(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bd_(s)
return s},
bcW(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
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
case"general.genericError":return new A.aJJ()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aJK()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aJL(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aJW()
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
case"inputScreen.errors.emptyTerm":return new A.aK6()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aKh()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aKs()
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
case"learnScreen.feedback.incorrect":return new A.aKD()
case"learnScreen.feedback.hint":return new A.aKO()
case"learnScreen.feedback.skipped":return new A.aKY()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aKZ()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aJM(d)
case"learnScreen.progress.startingCycle":return new A.aJN()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aJO()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aJP()
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
case"resultsScreen.scoreFraction":return new A.aJQ()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aJR()
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
case"settingsScreen.snackbars.exportError":return new A.aJS()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aJT()
case"settingsScreen.snackbars.importError":return new A.aJU()
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
bd_(d){return new A.aL_(d)},
We:function We(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHp:function aHp(){},
aHh:function aHh(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aH5:function aH5(){},
aIy:function aIy(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHx:function aHx(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI2:function aI2(){},
aHl:function aHl(){},
aHN:function aHN(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aHZ:function aHZ(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIG:function aIG(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI6:function aI6(){},
aIm:function aIm(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aH9:function aH9(){},
aHd:function aHd(){},
aIq:function aIq(){},
aIw:function aIw(){},
aHt:function aHt(){},
aHB:function aHB(){},
aHG:function aHG(){},
aHL:function aHL(d,e){this.b=d
this.a=e},
aHX:function aHX(){},
aHR:function aHR(){},
aIC:function aIC(){},
aIg:function aIg(){},
aIa:function aIa(){},
aIl:function aIl(){},
aL_:function aL_(d){this.a=d},
aJJ:function aJJ(){},
aJK:function aJK(){},
aJL:function aJL(d){this.a=d},
aJW:function aJW(){},
aK6:function aK6(){},
aKh:function aKh(){},
aKs:function aKs(){},
aKD:function aKD(){},
aKO:function aKO(){},
aKY:function aKY(){},
aKZ:function aKZ(){},
aJM:function aJM(d){this.a=d},
aJN:function aJN(){},
aJO:function aJO(){},
aJP:function aJP(){},
aJQ:function aJQ(){},
aJR:function aJR(){},
aJS:function aJS(){},
aJT:function aJT(){},
aJU:function aJU(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[6],A)
A.We.prototype={
ghS(){var w=this.ch
if(w===$){w!==$&&B.v()
w=this.ch=this}return w},
gnL(d){return"Quizlone"},
gdm(){var w=this,v=w.CW
if(v===$){w.ghS()
w.CW!==$&&B.v()
v=w.CW=new A.aHp()}return v},
glB(){var w,v=this,u=v.cx
if(u===$){w=v.ghS()
v.cx!==$&&B.v()
u=v.cx=new A.aHh(w,w)}return u},
gt3(){var w=this,v=w.cy
if(v===$){w.ghS()
w.cy!==$&&B.v()
v=w.cy=new A.aH5()}return v},
gfn(){var w,v=this,u=v.db
if(u===$){w=v.ghS()
v.db!==$&&B.v()
u=v.db=new A.aIy(w,w)}return u},
gfv(){var w,v=this,u=v.dx
if(u===$){w=v.ghS()
v.dx!==$&&B.v()
u=v.dx=new A.aHx(w,w)}return u},
gco(){var w=this,v=w.dy
if(v===$){w.ghS()
w.dy!==$&&B.v()
v=w.dy=new A.aI2()}return v},
gmG(){var w=this,v=w.fr
if(v===$){w.ghS()
w.fr!==$&&B.v()
v=w.fr=new A.aHl()}return v},
gep(){var w,v=this,u=v.fx
if(u===$){w=v.ghS()
v.fx!==$&&B.v()
u=v.fx=new A.aHN(w,w)}return u},
gka(){var w,v=this,u=v.fy
if(u===$){w=v.ghS()
v.fy!==$&&B.v()
u=v.fy=new A.aHZ(w,w)}return u},
gl8(){var w,v=this,u=v.go
if(u===$){w=v.ghS()
v.go!==$&&B.v()
u=v.go=new A.aIG(w,w)}return u},
ghF(){var w=this,v=w.id
if(v===$){w.ghS()
w.id!==$&&B.v()
v=w.id=new A.aI6()}return v},
gcr(){var w,v=this,u=v.k1
if(u===$){w=v.ghS()
v.k1!==$&&B.v()
u=v.k1=new A.aIm(w,w)}return u},
gfd(){var w=this,v=w.k2
if(v===$){w.ghS()
w.k2!==$&&B.v()
v=w.k2=new A.aH9()}return v},
gm0(){return this.ay}}
A.aHp.prototype={
gxh(d){return"Tillbaka"},
gnN(d){return"Avbryt"},
gqK(d){return"Ta bort"},
gje(d){return"N\xe4sta"},
gos(){return"F\xf6reg\xe5ende"},
gvI(d){return"Skicka"},
gx5(){return"Alla"},
gzn(){return"Laddar..."},
hf(d){return"Fel: "+d},
gAd(d){return"\xc5terst\xe4ll"}}
A.aHh.prototype={
gvq(){return"Inst\xe4llningar"},
gxC(d){return"Kontroller"},
gt1(){return"Om"},
gt2(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHd()}return w}}
A.aH5.prototype={
AF(d,e){return"Version "+e},
gAG(){return"Visa licenser"}}
A.aIy.prototype={
gar(d){return"Quizlone"},
gAJ(){return"V\xe4lkommen!"},
gxQ(){return"Skapa ny lista"},
gzm(){return"Ladda sparad lista"},
gzG(){return"Inga listor sparade \xe4n."},
uJ(d){var w=B.f8("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gtr(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aIq()}return w},
gn2(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aIw()}return w}}
A.aHx.prototype={
gar(d){return"Skapa ny lista"},
gui(){return"Listans namn"},
gzh(){return"t.ex. Kapitel 1 Ordlista"},
gzV(){return"Klistra in dina termer nedan:"},
gzW(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gAq(){return y.a},
gvd(){return"Spara lista"},
gd0(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aHt()}return w}}
A.aI2.prototype={
gar(d){return"Alternativ & L\xe4ge"},
gmT(){return y.w},
ghG(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gyz(){return"Inst\xe4llningar f\xf6r bildkort"},
gvv(){return"Visa term f\xf6rst"},
gvt(){return"Visa definition f\xf6rst"},
gtg(){return"Visa definition, fr\xe5ga efter term"},
gtf(){return"Visa term, fr\xe5ga efter definition"},
gvH(){return"Studiel\xe4ngd:"},
gAN(){return"Skrivet svar"},
gzB(){return"Flerval"},
gyA(){return"Bildkort"},
guf(){return"Inl\xe4rning"},
guK(){return"Prov"},
gzr(d){return"Matcha"}}
A.aHl.prototype={
gar(d){return"Bildkort"},
gzE(){return"Inga bildkort att visa."},
geq(){return"Inga termer tillg\xe4ngliga att studera."},
gvy(d){return"Blanda"},
gAg(){return"Starta om"}}
A.aHN.prototype={
gar(d){return"Inl\xe4rning"},
gAh(){return"Starta om inl\xe4rningssessionen"},
gkD(){return"Tillbaka till alternativ"},
gta(){return"Skriv ditt svar h\xe4r..."},
gq2(d){return"Ledtr\xe5d"},
gvz(d){return"Hoppa \xf6ver"},
gd0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHB()}return w},
go3(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aHG()}return w},
glO(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aHL(w,w)}return v}}
A.aHZ.prototype={
gar(d){return"Matcha"},
gkE(){return"Grattis!"},
gA_(){return"Spela igen"},
gkD(){return"Tillbaka till alternativ"},
gqd(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aHX()}return w},
gd0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aHR()}return w}}
A.aIG.prototype={
gar(d){return"Prov"},
gl_(){return"Inga fr\xe5gor f\xf6r detta prov."},
gAH(){return"Visa resultat"},
gvJ(){return"L\xe4mna in provet"},
gd0(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aIC()}return w}}
A.aI6.prototype={
gar(d){return"Provresultat"},
gl_(){return"Det fanns inga fr\xe5gor i detta prov."},
gAP(){return"Ditt resultat"},
vh(d,e){return""+d+" / "+e+" r\xe4tt"},
gqx(){return"Granska felaktiga svar:"},
AO(d){return"Ditt svar: "+d},
gzD(){return"(Inget svar)"},
gkE(){return"Grattis! Du hade alla r\xe4tt!"},
gAk(){return"F\xf6rs\xf6k igen"},
gAm(){return"Repetera med bildkort"}}
A.aIm.prototype={
gar(d){return"Inst\xe4llningar"},
gx8(d){return"Utseende"},
gud(d){return"Spr\xe5k"},
gz9(){return"V\xe4lj spr\xe5k"},
guR(){return"UI-skalning"},
gAz(){return y.H},
grj(){return"Systemstandard"},
gzf(){return"Ljus"},
gxW(){return"M\xf6rk"},
gyj(){return"Engelska"},
gyy(){return"Finska"},
gAp(){return"Ryska"},
gvC(){return"Spanska"},
gvN(){return"Svenska"},
gxX(){return"Datahantering"},
gyp(){return"Exportera data"},
gyq(){return"Spara alla listor till en fil"},
gyP(){return"Importera data"},
gyQ(){return"Ladda listor fr\xe5n en fil"},
gy3(){return"Ta bort all data"},
gq3(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aIg()}return w},
gpt(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aIa()}return w},
gmb(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aIl()}return w}}
A.aH9.prototype={
gar(d){return"Kontroller"},
guX(){return"Gester (Bildkort)"},
gz6(){return"Tangentbord (Bildkort)"},
gol(){return"N\xe4sta kort"},
got(){return"F\xf6reg\xe5ende kort"},
gob(){return"V\xe4nd kort"},
gvO(){return"Svep v\xe4nster"},
gvP(){return"Svep h\xf6ger"},
gvQ(){return"Svep upp eller ner"},
gxc(){return"H\xf6gerpiltangent"},
gxb(){return"V\xe4nsterpiltangent"},
gxd(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aHd.prototype={
gzd(){return"\xa9 2025 Quizlone"},
gy5(d){return y.t}}
A.aIq.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
xB(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aIw.prototype={
gar(d){return"Byt namn p\xe5 listan"},
guA(){return"Byt namn"},
gyl(){return"En lista med detta namn finns redan."},
gyk(){return"Listnamnet kan inte vara tomt."}}
A.aHt.prototype={
gzg(){return"Listans namn kan inte vara tomt."},
geq(){return"Inga termer/definitioner inmatade."},
gz0(){return y.C},
yf(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gzI(){return y.M},
vc(d){return"Det gick inte att spara listan: "+d}}
A.aHB.prototype={
geq(){return y.g},
gh4(){return y.U}}
A.aHG.prototype={
gxM(){return"R\xe4tt!"},
yT(d){return"Fel. R\xe4tt svar: "+d},
yL(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
vA(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aHL.prototype={
gx7(){return"Alla termer inl\xe4rda!"},
tw(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gvm(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
zt(d){var w=B.f8("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vE(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aHX.prototype={
gar(d){return"Topplista"},
gzH(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
Au(d,e){return e+" Sekunder"}}
A.aHR.prototype={
gh4(){return y.n}}
A.aIC.prototype={
gzl(){return y.Q},
geq(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gh4(){return y.k}}
A.aIg.prototype={
gar(d){return"Bekr\xe4fta import"},
gkF(d){return y.v},
gva(d){return"Importera"}}
A.aIa.prototype={
gar(d){return"Bekr\xe4fta borttagning"},
gkF(d){return y.l},
gy0(){return"Ta bort allt"}}
A.aIl.prototype={
gzF(){return"Det finns ingen data att exportera."},
yr(d){return"Fel vid export av data: "+d},
yS(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
yR(d){return"Fel vid import av data: "+d},
gx6(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aL_.prototype={
$1(d){return A.bcW(this.a,d)},
$S:53}
A.aJJ.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aJK.prototype={
$1$version(d){return"Version "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:88}
A.aJL.prototype={
$1$count(d){var w
this.a.ghS()
w=B.f8("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:38}
A.aJW.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:92}
A.aK6.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:93}
A.aKh.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKs.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:79}
A.aKD.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aKO.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:90}
A.aKY.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aKZ.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:89}
A.aJM.prototype={
$1$count(d){var w
this.a.ghS()
w=B.f8("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:38}
A.aJN.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:83}
A.aJO.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aJP.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aJQ.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:70}
A.aJR.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aJS.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aJT.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:84}
A.aJU.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.We,B.du)
w(A.aHp,B.uy)
w(A.aHh,B.uw)
w(A.aH5,B.ut)
w(A.aIy,B.uP)
w(A.aHx,B.uz)
w(A.aI2,B.uI)
w(A.aHl,B.ux)
w(A.aHN,B.uB)
w(A.aHZ,B.uF)
w(A.aIG,B.uR)
w(A.aI6,B.uJ)
w(A.aIm,B.uL)
w(A.aH9,B.uu)
w(A.aHd,B.uv)
w(A.aIq,B.uO)
w(A.aIw,B.uQ)
w(A.aHt,B.uA)
w(A.aHB,B.uC)
w(A.aHG,B.uD)
w(A.aHL,B.uE)
w(A.aHX,B.uH)
w(A.aHR,B.uG)
w(A.aIC,B.uS)
w(A.aIg,B.uM)
w(A.aIa,B.uK)
w(A.aIl,B.uN)
v(B.jq,[A.aL_,A.aJJ,A.aJK,A.aJL,A.aJW,A.aK6,A.aKh,A.aKs,A.aKD,A.aKO,A.aKY,A.aKZ,A.aJM,A.aJN,A.aJO,A.aJP,A.aJQ,A.aJR,A.aJS,A.aJT,A.aJU])})()
B.a4d(b.typeUniverse,JSON.parse('{"We":{"du":[],"hV":["dL","du"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.am("hg<dL,du>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_4",e:"endPart",h:b})})($__dart_deferred_initializers__,"oyTImRiUSJxLhjyJ+sa5RABADw8=");