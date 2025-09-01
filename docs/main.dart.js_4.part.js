((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aYU(d,e,f){var w,v,u=null,t=new B.hn(d,x.c),s=new B.hn(d,x.c)
s=new A.X9(t,s)
s.wa(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bfe(s)
return s},
bfa(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
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
case"general.genericError":return new A.aLJ()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aLK()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aLL(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aLW()
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
case"inputScreen.errors.emptyTerm":return new A.aM6()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aMh()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aMs()
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
case"learnScreen.feedback.incorrect":return new A.aMD()
case"learnScreen.feedback.hint":return new A.aMO()
case"learnScreen.feedback.skipped":return new A.aMY()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aMZ()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aLM(d)
case"learnScreen.progress.startingCycle":return new A.aLN()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aLO()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aLP()
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
case"resultsScreen.scoreFraction":return new A.aLQ()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aLR()
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
case"settingsScreen.snackbars.exportError":return new A.aLS()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aLT()
case"settingsScreen.snackbars.importError":return new A.aLU()
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
bfe(d){return new A.aN_(d)},
X9:function X9(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aJi:function aJi(){},
aJa:function aJa(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIZ:function aIZ(){},
aKr:function aKr(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aJq:function aJq(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJW:function aJW(){},
aJe:function aJe(){},
aJG:function aJG(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aJS:function aJS(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKz:function aKz(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aK_:function aK_(){},
aKf:function aKf(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aJ2:function aJ2(){},
aJ6:function aJ6(){},
aKj:function aKj(){},
aKp:function aKp(){},
aJm:function aJm(){},
aJu:function aJu(){},
aJz:function aJz(){},
aJE:function aJE(d,e){this.b=d
this.a=e},
aJQ:function aJQ(){},
aJK:function aJK(){},
aKv:function aKv(){},
aK9:function aK9(){},
aK3:function aK3(){},
aKe:function aKe(){},
aN_:function aN_(d){this.a=d},
aLJ:function aLJ(){},
aLK:function aLK(){},
aLL:function aLL(d){this.a=d},
aLW:function aLW(){},
aM6:function aM6(){},
aMh:function aMh(){},
aMs:function aMs(){},
aMD:function aMD(){},
aMO:function aMO(){},
aMY:function aMY(){},
aMZ:function aMZ(){},
aLM:function aLM(d){this.a=d},
aLN:function aLN(){},
aLO:function aLO(){},
aLP:function aLP(){},
aLQ:function aLQ(){},
aLR:function aLR(){},
aLS:function aLS(){},
aLT:function aLT(){},
aLU:function aLU(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[6],A)
A.X9.prototype={
ghW(){var w=this.ch
return w===$?this.ch=this:w},
go7(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghW()
w.CW!==$&&B.a_()
v=w.CW=new A.aJi()}return v},
glR(){var w,v=this,u=v.cx
if(u===$){w=v.ghW()
v.cx!==$&&B.a_()
u=v.cx=new A.aJa(w,w)}return u},
gtr(){var w=this,v=w.cy
if(v===$){w.ghW()
w.cy!==$&&B.a_()
v=w.cy=new A.aIZ()}return v},
gfu(){var w,v=this,u=v.db
if(u===$){w=v.ghW()
v.db!==$&&B.a_()
u=v.db=new A.aKr(w,w)}return u},
gfG(){var w,v=this,u=v.dx
if(u===$){w=v.ghW()
v.dx!==$&&B.a_()
u=v.dx=new A.aJq(w,w)}return u},
gcr(){var w=this,v=w.dy
if(v===$){w.ghW()
w.dy!==$&&B.a_()
v=w.dy=new A.aJW()}return v},
gn3(){var w=this,v=w.fr
if(v===$){w.ghW()
w.fr!==$&&B.a_()
v=w.fr=new A.aJe()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghW()
v.fx!==$&&B.a_()
u=v.fx=new A.aJG(w,w)}return u},
gki(){var w,v=this,u=v.fy
if(u===$){w=v.ghW()
v.fy!==$&&B.a_()
u=v.fy=new A.aJS(w,w)}return u},
glj(){var w,v=this,u=v.go
if(u===$){w=v.ghW()
v.go!==$&&B.a_()
u=v.go=new A.aKz(w,w)}return u},
ghJ(){var w=this,v=w.id
if(v===$){w.ghW()
w.id!==$&&B.a_()
v=w.id=new A.aK_()}return v},
gcv(){var w,v=this,u=v.k1
if(u===$){w=v.ghW()
v.k1!==$&&B.a_()
u=v.k1=new A.aKf(w,w)}return u},
gfj(){var w=this,v=w.k2
if(v===$){w.ghW()
w.k2!==$&&B.a_()
v=w.k2=new A.aJ2()}return v},
gmm(){return this.ay}}
A.aJi.prototype={
gxF(d){return"Tillbaka"},
goa(d){return"Avbryt"},
grd(d){return"Ta bort"},
gjq(d){return"N\xe4sta"},
goQ(){return"F\xf6reg\xe5ende"},
gw_(d){return"Skicka"},
gxs(){return"Alla"},
gzM(){return"Laddar..."},
hh(d){return"Fel: "+d},
gAC(d){return"\xc5terst\xe4ll"}}
A.aJa.prototype={
gvJ(){return"Inst\xe4llningar"},
gxX(d){return"Kontroller"},
gtp(){return"Om"},
gtq(){var w=this.d
return w===$?this.d=new A.aJ6():w}}
A.aIZ.prototype={
B2(d,e){return"Version "+e},
gB3(){return"Visa licenser"}}
A.aKr.prototype={
gau(d){return"Quizlone"},
gB6(){return"V\xe4lkommen!"},
gyc(){return"Skapa ny lista"},
gzL(){return"Ladda sparad lista"},
gA3(){return"Inga listor sparade \xe4n."},
v3(d){var w=B.fa("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gtO(){var w=this.e
return w===$?this.e=new A.aKj():w},
gnp(){var w=this.f
return w===$?this.f=new A.aKp():w}}
A.aJq.prototype={
gau(d){return"Skapa ny lista"},
guE(){return"Listans namn"},
gzG(){return"t.ex. Kapitel 1 Ordlista"},
gAi(){return"Klistra in dina termer nedan:"},
gAj(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gAP(){return y.a},
gvx(){return"Spara lista"},
gd1(){var w=this.d
return w===$?this.d=new A.aJm():w}}
A.aJW.prototype={
gau(d){return"Alternativ & L\xe4ge"},
gng(){return y.w},
ghK(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gyY(){return"Inst\xe4llningar f\xf6r bildkort"},
gvO(){return"Visa term f\xf6rst"},
gvM(){return"Visa definition f\xf6rst"},
gtA(){return"Visa definition, fr\xe5ga efter term"},
gtz(){return"Visa term, fr\xe5ga efter definition"},
gvZ(){return"Studiel\xe4ngd:"},
gBa(){return"Skrivet svar"},
gzZ(){return"Flerval"},
gyZ(){return"Bildkort"},
guB(){return"Inl\xe4rning"},
gv4(){return"Prov"},
gzP(d){return"Matcha"}}
A.aJe.prototype={
gau(d){return"Bildkort"},
gA1(){return"Inga bildkort att visa."},
ges(){return"Inga termer tillg\xe4ngliga att studera."},
gvQ(d){return"Blanda"},
gAF(){return"Starta om"}}
A.aJG.prototype={
gau(d){return"Inl\xe4rning"},
gAG(){return"Starta om inl\xe4rningssessionen"},
gkO(){return"Tillbaka till alternativ"},
gtv(){return"Skriv ditt svar h\xe4r..."},
gn7(d){return"Ledtr\xe5d"},
gvR(d){return"Hoppa \xf6ver"},
gd1(){var w=this.f
return w===$?this.f=new A.aJu():w},
gou(){var w=this.r
return w===$?this.r=new A.aJz():w},
gm8(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aJE(w,w)}return v}}
A.aJS.prototype={
gau(d){return"Matcha"},
gkQ(){return"Grattis!"},
gAn(){return"Spela igen"},
gkO(){return"Tillbaka till alternativ"},
gqF(){var w=this.e
return w===$?this.e=new A.aJQ():w},
gd1(){var w=this.f
return w===$?this.f=new A.aJK():w}}
A.aKz.prototype={
gau(d){return"Prov"},
gl9(){return"Inga fr\xe5gor f\xf6r detta prov."},
gB4(){return"Visa resultat"},
gw0(){return"L\xe4mna in provet"},
gd1(){var w=this.d
return w===$?this.d=new A.aKv():w}}
A.aK_.prototype={
gau(d){return"Provresultat"},
gl9(){return"Det fanns inga fr\xe5gor i detta prov."},
gBc(){return"Ditt resultat"},
vB(d,e){return""+d+" / "+e+" r\xe4tt"},
gqZ(){return"Granska felaktiga svar:"},
Bb(d){return"Ditt svar: "+d},
gA0(){return"(Inget svar)"},
gkQ(){return"Grattis! Du hade alla r\xe4tt!"},
gAJ(){return"F\xf6rs\xf6k igen"},
gAL(){return"Repetera med bildkort"}}
A.aKf.prototype={
gau(d){return"Inst\xe4llningar"},
gxv(d){return"Utseende"},
guz(d){return"Spr\xe5k"},
gzy(){return"V\xe4lj spr\xe5k"},
gvb(){return"UI-skalning"},
gAY(){return y.H},
grH(){return"Systemstandard"},
gzE(){return"Ljus"},
gyi(){return"M\xf6rk"},
gyE(){return"Engelska"},
gyX(){return"Finska"},
gAO(){return"Ryska"},
gvU(){return"Spanska"},
gw5(){return"Svenska"},
gyj(){return"Datahantering"},
gyK(){return"Exportera data"},
gyL(){return"Spara alla listor till en fil"},
gzd(){return"Importera data"},
gze(){return"Ladda listor fr\xe5n en fil"},
gyo(){return"Ta bort all data"},
gqv(){var w=this.w
return w===$?this.w=new A.aK9():w},
gpY(){var w=this.x
return w===$?this.x=new A.aK3():w},
gmv(){var w=this.y
return w===$?this.y=new A.aKe():w}}
A.aJ2.prototype={
gau(d){return"Kontroller"},
gvh(){return"Gester (Bildkort)"},
gzv(){return"Tangentbord (Bildkort)"},
goI(){return"N\xe4sta kort"},
goR(){return"F\xf6reg\xe5ende kort"},
goz(){return"V\xe4nd kort"},
gw6(){return"Svep v\xe4nster"},
gw7(){return"Svep h\xf6ger"},
gw8(){return"Svep upp eller ner"},
gxA(){return"H\xf6gerpiltangent"},
gxz(){return"V\xe4nsterpiltangent"},
gxB(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aJ6.prototype={
gzC(){return"\xa9 2025 Quizlone"},
gyq(d){return y.t}}
A.aKj.prototype={
gau(d){return"Bekr\xe4fta borttagning"},
xW(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aKp.prototype={
gau(d){return"Byt namn p\xe5 listan"},
guW(){return"Byt namn"},
gyG(){return"En lista med detta namn finns redan."},
gyF(){return"Listnamnet kan inte vara tomt."}}
A.aJm.prototype={
gzF(){return"Listans namn kan inte vara tomt."},
ges(){return"Inga termer/definitioner inmatade."},
gzp(){return y.C},
yA(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gA5(){return y.M},
vw(d){return"Det gick inte att spara listan: "+d}}
A.aJu.prototype={
ges(){return y.g},
gh9(){return y.U}}
A.aJz.prototype={
gy8(){return"R\xe4tt!"},
zh(d){return"Fel. R\xe4tt svar: "+d},
z9(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
vS(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aJE.prototype={
gxu(){return"Alla termer inl\xe4rda!"},
tU(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gvG(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
zR(d){var w=B.fa("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vW(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aJQ.prototype={
gau(d){return"Topplista"},
gA4(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
AT(d,e){return e+" Sekunder"}}
A.aJK.prototype={
gh9(){return y.n}}
A.aKv.prototype={
gzK(){return y.Q},
ges(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gh9(){return y.k}}
A.aK9.prototype={
gau(d){return"Bekr\xe4fta import"},
gkR(d){return y.v},
gvu(d){return"Importera"}}
A.aK3.prototype={
gau(d){return"Bekr\xe4fta borttagning"},
gkR(d){return y.l},
gyn(){return"Ta bort allt"}}
A.aKe.prototype={
gA2(){return"Det finns ingen data att exportera."},
yM(d){return"Fel vid export av data: "+d},
zg(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
zf(d){return"Fel vid import av data: "+d},
gxt(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aN_.prototype={
$1(d){return A.bfa(this.a,d)},
$S:54}
A.aLJ.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLK.prototype={
$1$version(d){return"Version "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:94}
A.aLL.prototype={
$1$count(d){var w
this.a.ghW()
w=B.fa("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aLW.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:76}
A.aM6.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:82}
A.aMh.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMs.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:78}
A.aMD.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMO.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:75}
A.aMY.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMZ.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:74}
A.aLM.prototype={
$1$count(d){var w
this.a.ghW()
w=B.fa("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aLN.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:69}
A.aLO.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aLP.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aLQ.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:77}
A.aLR.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aLS.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLT.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:91}
A.aLU.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.X9,B.ds)
w(A.aJi,B.uX)
w(A.aJa,B.uV)
w(A.aIZ,B.uS)
w(A.aKr,B.vd)
w(A.aJq,B.uY)
w(A.aJW,B.v6)
w(A.aJe,B.uW)
w(A.aJG,B.v_)
w(A.aJS,B.v3)
w(A.aKz,B.vf)
w(A.aK_,B.v7)
w(A.aKf,B.v9)
w(A.aJ2,B.uT)
w(A.aJ6,B.uU)
w(A.aKj,B.vc)
w(A.aKp,B.ve)
w(A.aJm,B.uZ)
w(A.aJu,B.v0)
w(A.aJz,B.v1)
w(A.aJE,B.v2)
w(A.aJQ,B.v5)
w(A.aJK,B.v4)
w(A.aKv,B.vg)
w(A.aK9,B.va)
w(A.aK3,B.v8)
w(A.aKe,B.vb)
v(B.jz,[A.aN_,A.aLJ,A.aLK,A.aLL,A.aLW,A.aM6,A.aMh,A.aMs,A.aMD,A.aMO,A.aMY,A.aMZ,A.aLM,A.aLN,A.aLO,A.aLP,A.aLQ,A.aLR,A.aLS,A.aLT,A.aLU])})()
B.a5C(b.typeUniverse,JSON.parse('{"X9":{"ds":[],"i0":["dM","ds"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.ak("hn<dM,ds>")}};
(a=>{a["C05kjOp7vUw/hTPQomXT8UKURoM="]=a.current})($__dart_deferred_initializers__);