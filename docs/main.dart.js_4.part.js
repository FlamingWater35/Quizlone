((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aXc(d,e,f){var w,v,u=null,t=new B.ha(d,x.c),s=new B.ha(d,x.c)
s=new A.W3(t,s)
s.wd(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bef(s)
return s},
beb(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
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
case"general.genericError":return new A.aK1()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aK2()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aK3(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aKe()
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
case"inputScreen.errors.emptyTerm":return new A.aKp()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aKA()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aKL()
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
case"learnScreen.feedback.incorrect":return new A.aKW()
case"learnScreen.feedback.hint":return new A.aL6()
case"learnScreen.feedback.skipped":return new A.aLg()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aLh()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aK4(d)
case"learnScreen.progress.startingCycle":return new A.aK5()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aK6()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aK7()
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
case"resultsScreen.scoreFraction":return new A.aK8()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aK9()
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
case"settingsScreen.snackbars.exportError":return new A.aKa()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aKb()
case"settingsScreen.snackbars.importError":return new A.aKc()
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
bef(d){return new A.aLi(d)},
W3:function W3(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHB:function aHB(){},
aHt:function aHt(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aHh:function aHh(){},
aIK:function aIK(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHJ:function aHJ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIe:function aIe(){},
aHx:function aHx(){},
aHZ:function aHZ(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aIa:function aIa(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIS:function aIS(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIi:function aIi(){},
aIy:function aIy(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aHl:function aHl(){},
aHp:function aHp(){},
aIC:function aIC(){},
aII:function aII(){},
aHF:function aHF(){},
aHN:function aHN(){},
aHS:function aHS(){},
aHX:function aHX(d,e){this.b=d
this.a=e},
aI8:function aI8(){},
aI2:function aI2(){},
aIO:function aIO(){},
aIs:function aIs(){},
aIm:function aIm(){},
aIx:function aIx(){},
aLi:function aLi(d){this.a=d},
aK1:function aK1(){},
aK2:function aK2(){},
aK3:function aK3(d){this.a=d},
aKe:function aKe(){},
aKp:function aKp(){},
aKA:function aKA(){},
aKL:function aKL(){},
aKW:function aKW(){},
aL6:function aL6(){},
aLg:function aLg(){},
aLh:function aLh(){},
aK4:function aK4(d){this.a=d},
aK5:function aK5(){},
aK6:function aK6(){},
aK7:function aK7(){},
aK8:function aK8(){},
aK9:function aK9(){},
aKa:function aKa(){},
aKb:function aKb(){},
aKc:function aKc(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[6],A)
A.W3.prototype={
ghW(){var w=this.ch
return w===$?this.ch=this:w},
god(){return"Quizlone"},
gdq(){var w=this,v=w.CW
if(v===$){w.ghW()
w.CW!==$&&B.Y()
v=w.CW=new A.aHB()}return v},
glS(){var w,v=this,u=v.cx
if(u===$){w=v.ghW()
v.cx!==$&&B.Y()
u=v.cx=new A.aHt(w,w)}return u},
gts(){var w=this,v=w.cy
if(v===$){w.ghW()
w.cy!==$&&B.Y()
v=w.cy=new A.aHh()}return v},
gfq(){var w,v=this,u=v.db
if(u===$){w=v.ghW()
v.db!==$&&B.Y()
u=v.db=new A.aIK(w,w)}return u},
gfF(){var w,v=this,u=v.dx
if(u===$){w=v.ghW()
v.dx!==$&&B.Y()
u=v.dx=new A.aHJ(w,w)}return u},
gco(){var w=this,v=w.dy
if(v===$){w.ghW()
w.dy!==$&&B.Y()
v=w.dy=new A.aIe()}return v},
gn3(){var w=this,v=w.fr
if(v===$){w.ghW()
w.fr!==$&&B.Y()
v=w.fr=new A.aHx()}return v},
geq(){var w,v=this,u=v.fx
if(u===$){w=v.ghW()
v.fx!==$&&B.Y()
u=v.fx=new A.aHZ(w,w)}return u},
gkk(){var w,v=this,u=v.fy
if(u===$){w=v.ghW()
v.fy!==$&&B.Y()
u=v.fy=new A.aIa(w,w)}return u},
gll(){var w,v=this,u=v.go
if(u===$){w=v.ghW()
v.go!==$&&B.Y()
u=v.go=new A.aIS(w,w)}return u},
ghI(){var w=this,v=w.id
if(v===$){w.ghW()
w.id!==$&&B.Y()
v=w.id=new A.aIi()}return v},
gcr(){var w,v=this,u=v.k1
if(u===$){w=v.ghW()
v.k1!==$&&B.Y()
u=v.k1=new A.aIy(w,w)}return u},
gfh(){var w=this,v=w.k2
if(v===$){w.ghW()
w.k2!==$&&B.Y()
v=w.k2=new A.aHl()}return v},
gmm(){return this.ay}}
A.aHB.prototype={
gxG(){return"Tillbaka"},
gog(){return"Avbryt"},
gre(){return"Ta bort"},
gjs(){return"N\xe4sta"},
goW(){return"F\xf6reg\xe5ende"},
gw2(){return"Skicka"},
gxt(){return"Alla"},
gzO(){return"Laddar..."},
hf(d){return"Fel: "+d},
gAD(){return"\xc5terst\xe4ll"}}
A.aHt.prototype={
gvM(){return"Inst\xe4llningar"},
gxY(){return"Kontroller"},
gtq(){return"Om"},
gtr(){var w=this.d
return w===$?this.d=new A.aHp():w}}
A.aHh.prototype={
B3(d){return"Version "+d},
gB4(){return"Visa licenser"}}
A.aIK.prototype={
gau(){return"Quizlone"},
gB7(){return"V\xe4lkommen!"},
gyd(){return"Skapa ny lista"},
gzN(){return"Ladda sparad lista"},
gA4(){return"Inga listor sparade \xe4n."},
v5(d){var w=B.eZ("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gtP(){var w=this.e
return w===$?this.e=new A.aIC():w},
gnp(){var w=this.f
return w===$?this.f=new A.aII():w}}
A.aHJ.prototype={
gau(){return"Skapa ny lista"},
guG(){return"Listans namn"},
gzI(){return"t.ex. Kapitel 1 Ordlista"},
gAj(){return"Klistra in dina termer nedan:"},
gAk(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gAQ(){return y.a},
gvA(){return"Spara lista"},
gd0(){var w=this.d
return w===$?this.d=new A.aHF():w}}
A.aIe.prototype={
gau(){return"Alternativ & L\xe4ge"},
gng(){return y.w},
ghJ(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gz_(){return"Inst\xe4llningar f\xf6r bildkort"},
gvR(){return"Visa term f\xf6rst"},
gvP(){return"Visa definition f\xf6rst"},
gtB(){return"Visa definition, fr\xe5ga efter term"},
gtA(){return"Visa term, fr\xe5ga efter definition"},
gw1(){return"Studiel\xe4ngd:"},
gBa(){return"Skrivet svar"},
gA_(){return"Flerval"},
gz0(){return"Bildkort"},
guD(){return"Inl\xe4rning"},
gv6(){return"Prov"},
gzR(){return"Matcha"}}
A.aHx.prototype={
gau(){return"Bildkort"},
gA2(){return"Inga bildkort att visa."},
ger(){return"Inga termer tillg\xe4ngliga att studera."},
gvT(d){return"Blanda"},
gAG(){return"Starta om"}}
A.aHZ.prototype={
gau(){return"Inl\xe4rning"},
gAH(){return"Starta om inl\xe4rningssessionen"},
gkP(){return"Tillbaka till alternativ"},
gtw(){return"Skriv ditt svar h\xe4r..."},
gn7(){return"Ledtr\xe5d"},
gvU(d){return"Hoppa \xf6ver"},
gd0(){var w=this.f
return w===$?this.f=new A.aHN():w},
goB(){var w=this.r
return w===$?this.r=new A.aHS():w},
gm8(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aHX(w,w)}return v}}
A.aIa.prototype={
gau(){return"Matcha"},
gkR(){return"Grattis!"},
gAo(){return"Spela igen"},
gkP(){return"Tillbaka till alternativ"},
gqF(){var w=this.e
return w===$?this.e=new A.aI8():w},
gd0(){var w=this.f
return w===$?this.f=new A.aI2():w}}
A.aIS.prototype={
gau(){return"Prov"},
glb(){return"Inga fr\xe5gor f\xf6r detta prov."},
gB5(){return"Visa resultat"},
gw3(){return"L\xe4mna in provet"},
gd0(){var w=this.d
return w===$?this.d=new A.aIO():w}}
A.aIi.prototype={
gau(){return"Provresultat"},
glb(){return"Det fanns inga fr\xe5gor i detta prov."},
gBc(){return"Ditt resultat"},
vE(d,e){return""+d+" / "+e+" r\xe4tt"},
gr_(){return"Granska felaktiga svar:"},
Bb(d){return"Ditt svar: "+d},
gA1(){return"(Inget svar)"},
gkR(){return"Grattis! Du hade alla r\xe4tt!"},
gAK(){return"F\xf6rs\xf6k igen"},
gAM(){return"Repetera med bildkort"}}
A.aIy.prototype={
gau(){return"Inst\xe4llningar"},
gxw(){return"Utseende"},
guB(){return"Spr\xe5k"},
gzB(){return"V\xe4lj spr\xe5k"},
gvc(){return"UI-skalning"},
gAZ(){return y.H},
grI(){return"Systemstandard"},
gzG(){return"Ljus"},
gyj(){return"M\xf6rk"},
gyG(){return"Engelska"},
gyZ(){return"Finska"},
gAP(){return"Ryska"},
gvX(){return"Spanska"},
gw8(){return"Svenska"},
gyl(){return"Datahantering"},
gyM(){return"Exportera data"},
gyN(){return"Spara alla listor till en fil"},
gzg(){return"Importera data"},
gzh(){return"Ladda listor fr\xe5n en fil"},
gyq(){return"Ta bort all data"},
gqv(){var w=this.w
return w===$?this.w=new A.aIs():w},
gpZ(){var w=this.x
return w===$?this.x=new A.aIm():w},
gmv(){var w=this.y
return w===$?this.y=new A.aIx():w}}
A.aHl.prototype={
gau(){return"Kontroller"},
gvj(){return"Gester (Bildkort)"},
gzy(){return"Tangentbord (Bildkort)"},
goO(){return"N\xe4sta kort"},
goX(){return"F\xf6reg\xe5ende kort"},
goF(){return"V\xe4nd kort"},
gw9(){return"Svep v\xe4nster"},
gwa(){return"Svep h\xf6ger"},
gwb(){return"Svep upp eller ner"},
gxB(){return"H\xf6gerpiltangent"},
gxA(){return"V\xe4nsterpiltangent"},
gxC(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aHp.prototype={
gzE(){return"\xa9 2025 Quizlone"},
gys(){return y.t}}
A.aIC.prototype={
gau(){return"Bekr\xe4fta borttagning"},
xX(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+d+"'?"}}
A.aII.prototype={
gau(){return"Byt namn p\xe5 listan"},
guY(){return"Byt namn"},
gyI(){return"En lista med detta namn finns redan."},
gyH(){return"Listnamnet kan inte vara tomt."}}
A.aHF.prototype={
gzH(){return"Listans namn kan inte vara tomt."},
ger(){return"Inga termer/definitioner inmatade."},
gzs(){return y.C},
yC(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gA6(){return y.M},
vy(d){return"Det gick inte att spara listan: "+d}}
A.aHN.prototype={
ger(){return y.g},
gh7(){return y.U}}
A.aHS.prototype={
gy9(){return"R\xe4tt!"},
zk(d){return"Fel. R\xe4tt svar: "+d},
zc(d){return'Ledtr\xe5d: B\xf6rjar med "'+d+'"'},
vV(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aHX.prototype={
gxv(){return"Alla termer inl\xe4rda!"},
tV(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gvJ(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
zT(d){var w=B.eZ("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vZ(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aI8.prototype={
gau(){return"Topplista"},
gA5(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
AU(d){return d+" Sekunder"}}
A.aI2.prototype={
gh7(){return y.n}}
A.aIO.prototype={
gzM(){return y.Q},
ger(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gh7(){return y.k}}
A.aIs.prototype={
gau(){return"Bekr\xe4fta import"},
gkS(){return y.v},
gvw(){return"Importera"}}
A.aIm.prototype={
gau(){return"Bekr\xe4fta borttagning"},
gkS(){return y.l},
gyp(){return"Ta bort allt"}}
A.aIx.prototype={
gA3(){return"Det finns ingen data att exportera."},
yO(d){return"Fel vid export av data: "+d},
zj(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
zi(d){return"Fel vid import av data: "+d},
gxu(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aLi.prototype={
$1(d){return A.beb(this.a,d)},
$S:53}
A.aK1.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aK2.prototype={
$1$version(d){return"Version "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:92}
A.aK3.prototype={
$1$count(d){var w
this.a.ghW()
w=B.eZ("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:41}
A.aKe.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:94}
A.aKp.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:77}
A.aKA.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKL.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:88}
A.aKW.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aL6.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:74}
A.aLg.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLh.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:80}
A.aK4.prototype={
$1$count(d){var w
this.a.ghW()
w=B.eZ("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:41}
A.aK5.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:75}
A.aK6.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aK7.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aK8.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:82}
A.aK9.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aKa.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKb.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:85}
A.aKc.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.W3,B.di)
w(A.aHB,B.ut)
w(A.aHt,B.ur)
w(A.aHh,B.uo)
w(A.aIK,B.uK)
w(A.aHJ,B.uu)
w(A.aIe,B.uD)
w(A.aHx,B.us)
w(A.aHZ,B.uw)
w(A.aIa,B.uA)
w(A.aIS,B.uM)
w(A.aIi,B.uE)
w(A.aIy,B.uG)
w(A.aHl,B.up)
w(A.aHp,B.uq)
w(A.aIC,B.uJ)
w(A.aII,B.uL)
w(A.aHF,B.uv)
w(A.aHN,B.ux)
w(A.aHS,B.uy)
w(A.aHX,B.uz)
w(A.aI8,B.uC)
w(A.aI2,B.uB)
w(A.aIO,B.uN)
w(A.aIs,B.uH)
w(A.aIm,B.uF)
w(A.aIx,B.uI)
v(B.j6,[A.aLi,A.aK1,A.aK2,A.aK3,A.aKe,A.aKp,A.aKA,A.aKL,A.aKW,A.aL6,A.aLg,A.aLh,A.aK4,A.aK5,A.aK6,A.aK7,A.aK8,A.aK9,A.aKa,A.aKb,A.aKc])})()
B.a3W(b.typeUniverse,JSON.parse('{"W3":{"di":[],"hL":["dD","di"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.af("ha<dD,di>")}};
(a=>{a["OsLfFKnW2UWbR62PHM0W/IUKZSk="]=a.current})($__dart_deferred_initializers__);