((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
b_z(d,e,f){var w,v,u=null,t=new B.hr(d,x.c),s=new B.hr(d,x.c)
s=new A.XE(t,s)
s.wy(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bhM(s)
return s},
bhI(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Tillbaka till alternativ",n="Exportera data"
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
case"general.genericError":return new A.aNc()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aNd()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aNe(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aNp()
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
case"inputScreen.errors.emptyTerm":return new A.aNA()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aNL()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return y.w
case"modeSelectionScreen.debugActiveId":return new A.aNW()
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
case"modeSelectionScreen.requireOnlyOneAnswer":return"Acceptera ett kommatecken-separerat svar"
case"modeSelectionScreen.requireOnlyOneAnswerSubtitle":return y.q
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
case"learnScreen.feedback.incorrect":return new A.aO6()
case"learnScreen.feedback.hint":return new A.aOh()
case"learnScreen.feedback.skipped":return new A.aOs()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aOw()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aNf(d)
case"learnScreen.progress.startingCycle":return new A.aNg()
case"matchScreen.title":return"Matcha"
case"matchScreen.congratulations":return"Grattis!"
case"matchScreen.timeCompleted":return new A.aNh()
case"matchScreen.playAgain":return"Spela igen"
case"matchScreen.backToOptions":return o
case"matchScreen.leaderboard.title":return"Topplista"
case"matchScreen.leaderboard.noRecords":return"Inga rekord \xe4n. Bli den f\xf6rsta!"
case"matchScreen.leaderboard.time":return new A.aNi()
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
case"resultsScreen.scoreFraction":return new A.aNj()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aNk()
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
case"settingsScreen.update":return"Uppdatering"
case"settingsScreen.checkForUpdate":return"S\xf6k efter uppdateringar"
case"settingsScreen.checkingForUpdate":return"S\xf6ker efter uppdateringar..."
case"settingsScreen.upToDate":return"Du har den senaste versionen"
case"settingsScreen.noNewVersion":return"Ingen ny version hittades."
case"settingsScreen.updateAvailable":return new A.aNl()
case"settingsScreen.tapToInstall":return"Tryck f\xf6r att ladda ner och installera"
case"settingsScreen.viewReleaseNotes":return"Visa versionsinformation"
case"settingsScreen.downloadingUpdate":return"Laddar ner uppdatering..."
case"settingsScreen.updateCheckFailed":return"Kunde inte s\xf6ka efter uppdateringar"
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
case"settingsScreen.snackbars.exportError":return new A.aNm()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aNn()
case"settingsScreen.snackbars.importError":return new A.aNo()
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
bhM(d){return new A.aOx(d)},
XE:function XE(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aKM:function aKM(){},
aKE:function aKE(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aKs:function aKs(){},
aLV:function aLV(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKU:function aKU(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLp:function aLp(){},
aKI:function aKI(){},
aL9:function aL9(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aLl:function aLl(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aM2:function aM2(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLt:function aLt(){},
aLJ:function aLJ(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aKw:function aKw(){},
aKA:function aKA(){},
aLN:function aLN(){},
aLT:function aLT(){},
aKQ:function aKQ(){},
aKY:function aKY(){},
aL2:function aL2(){},
aL7:function aL7(d,e){this.b=d
this.a=e},
aLj:function aLj(){},
aLd:function aLd(){},
aLZ:function aLZ(){},
aLD:function aLD(){},
aLx:function aLx(){},
aLI:function aLI(){},
aOx:function aOx(d){this.a=d},
aNc:function aNc(){},
aNd:function aNd(){},
aNe:function aNe(d){this.a=d},
aNp:function aNp(){},
aNA:function aNA(){},
aNL:function aNL(){},
aNW:function aNW(){},
aO6:function aO6(){},
aOh:function aOh(){},
aOs:function aOs(){},
aOw:function aOw(){},
aNf:function aNf(d){this.a=d},
aNg:function aNg(){},
aNh:function aNh(){},
aNi:function aNi(){},
aNj:function aNj(){},
aNk:function aNk(){},
aNl:function aNl(){},
aNm:function aNm(){},
aNn:function aNn(){},
aNo:function aNo(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[6],A)
A.XE.prototype={
gi0(){var w=this.ch
return w===$?this.ch=this:w},
got(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.gi0()
w.CW!==$&&B.a_()
v=w.CW=new A.aKM()}return v},
glY(){var w,v=this,u=v.cx
if(u===$){w=v.gi0()
v.cx!==$&&B.a_()
u=v.cx=new A.aKE(w,w)}return u},
gtK(){var w=this,v=w.cy
if(v===$){w.gi0()
w.cy!==$&&B.a_()
v=w.cy=new A.aKs()}return v},
gfw(){var w,v=this,u=v.db
if(u===$){w=v.gi0()
v.db!==$&&B.a_()
u=v.db=new A.aLV(w,w)}return u},
gfK(){var w,v=this,u=v.dx
if(u===$){w=v.gi0()
v.dx!==$&&B.a_()
u=v.dx=new A.aKU(w,w)}return u},
gcm(){var w=this,v=w.dy
if(v===$){w.gi0()
w.dy!==$&&B.a_()
v=w.dy=new A.aLp()}return v},
gne(){var w=this,v=w.fr
if(v===$){w.gi0()
w.fr!==$&&B.a_()
v=w.fr=new A.aKI()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.gi0()
v.fx!==$&&B.a_()
u=v.fx=new A.aL9(w,w)}return u},
gks(){var w,v=this,u=v.fy
if(u===$){w=v.gi0()
v.fy!==$&&B.a_()
u=v.fy=new A.aLl(w,w)}return u},
glq(){var w,v=this,u=v.go
if(u===$){w=v.gi0()
v.go!==$&&B.a_()
u=v.go=new A.aM2(w,w)}return u},
ghO(){var w=this,v=w.id
if(v===$){w.gi0()
w.id!==$&&B.a_()
v=w.id=new A.aLt()}return v},
gcB(){var w,v=this,u=v.k1
if(u===$){w=v.gi0()
v.k1!==$&&B.a_()
u=v.k1=new A.aLJ(w,w)}return u},
gfm(){var w=this,v=w.k2
if(v===$){w.gi0()
w.k2!==$&&B.a_()
v=w.k2=new A.aKw()}return v},
gmt(){return this.ay}}
A.aKM.prototype={
gy3(d){return"Tillbaka"},
gow(d){return"Avbryt"},
grz(d){return"Ta bort"},
gjy(d){return"N\xe4sta"},
gph(){return"F\xf6reg\xe5ende"},
gwn(d){return"Skicka"},
gxP(){return"Alla"},
gA8(){return"Laddar..."},
hm(d){return"Fel: "+d},
gB_(d){return"\xc5terst\xe4ll"}}
A.aKE.prototype={
gw5(){return"Inst\xe4llningar"},
gyl(d){return"Kontroller"},
gtI(){return"Om"},
gtJ(){var w=this.d
return w===$?this.d=new A.aKA():w}}
A.aKs.prototype={
Bq(d,e){return"Version "+e},
gBr(){return"Visa licenser"}}
A.aLV.prototype={
gau(d){return"Quizlone"},
gBu(){return"V\xe4lkommen!"},
gyz(){return"Skapa ny lista"},
gA7(){return"Ladda sparad lista"},
gAp(){return"Inga listor sparade \xe4n."},
vm(d){var w=B.ff("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gu5(){var w=this.e
return w===$?this.e=new A.aLN():w},
gnD(){var w=this.f
return w===$?this.f=new A.aLT():w}}
A.aKU.prototype={
gau(d){return"Skapa ny lista"},
guX(){return"Listans namn"},
gA2(){return"t.ex. Kapitel 1 Ordlista"},
gAE(){return"Klistra in dina termer nedan:"},
gAF(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gBc(){return y.a},
gvU(){return"Spara lista"},
gd2(){var w=this.d
return w===$?this.d=new A.aKQ():w}}
A.aLp.prototype={
gau(d){return"Alternativ & L\xe4ge"},
gnu(){return y.w},
ghP(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gzj(){return"Inst\xe4llningar f\xf6r bildkort"},
gwa(){return"Visa term f\xf6rst"},
gw8(){return"Visa definition f\xf6rst"},
gwm(){return"Inst\xe4llningar f\xf6r Inl\xe4rning & Prov"},
gtT(){return"Visa definition, fr\xe5ga efter term"},
gtS(){return"Visa term, fr\xe5ga efter definition"},
gwl(){return"Studiel\xe4ngd:"},
gBx(){return"Skrivet svar"},
gAk(){return"Flerval"},
gAY(){return"Acceptera ett kommatecken-separerat svar"},
gAZ(){return y.q},
gzk(){return"Bildkort"},
gzX(){return"Inl\xe4rning"},
gvn(){return"Prov"},
gAb(d){return"Matcha"}}
A.aKI.prototype={
gau(d){return"Bildkort"},
gAn(){return"Inga bildkort att visa."},
geu(){return"Inga termer tillg\xe4ngliga att studera."},
gwc(d){return"Blanda"},
gB2(){return"Starta om"}}
A.aL9.prototype={
gau(d){return"Inl\xe4rning"},
gB3(){return"Starta om inl\xe4rningssessionen"},
gkV(){return"Tillbaka till alternativ"},
gtO(){return"Skriv ditt svar h\xe4r..."},
gni(d){return"Ledtr\xe5d"},
gwd(d){return"Hoppa \xf6ver"},
gd2(){var w=this.f
return w===$?this.f=new A.aKY():w},
goR(){var w=this.r
return w===$?this.r=new A.aL2():w},
gme(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aL7(w,w)}return v}}
A.aLl.prototype={
gau(d){return"Matcha"},
gkX(){return"Grattis!"},
gAJ(){return"Spela igen"},
gkV(){return"Tillbaka till alternativ"},
gqY(){var w=this.e
return w===$?this.e=new A.aLj():w},
gd2(){var w=this.f
return w===$?this.f=new A.aLd():w}}
A.aM2.prototype={
gau(d){return"Prov"},
glg(){return"Inga fr\xe5gor f\xf6r detta prov."},
gBs(){return"Visa resultat"},
gwo(){return"L\xe4mna in provet"},
gd2(){var w=this.d
return w===$?this.d=new A.aLZ():w}}
A.aLt.prototype={
gau(d){return"Provresultat"},
glg(){return"Det fanns inga fr\xe5gor i detta prov."},
gBz(){return"Ditt resultat"},
vY(d,e){return""+d+" / "+e+" r\xe4tt"},
gri(){return"Granska felaktiga svar:"},
By(d){return"Ditt svar: "+d},
gAm(){return"(Inget svar)"},
gkX(){return"Grattis! Du hade alla r\xe4tt!"},
gB6(){return"F\xf6rs\xf6k igen"},
gB8(){return"Repetera med bildkort"}}
A.aLJ.prototype={
gau(d){return"Inst\xe4llningar"},
gxS(d){return"Utseende"},
guT(d){return"Spr\xe5k"},
gzU(){return"V\xe4lj spr\xe5k"},
gvw(){return"UI-skalning"},
gBl(){return y.H},
gt_(){return"Systemstandard"},
gA0(){return"Ljus"},
gyF(){return"M\xf6rk"},
gz1(){return"Engelska"},
gzi(){return"Finska"},
gBb(){return"Ryska"},
gwg(){return"Spanska"},
gwt(){return"Svenska"},
gyH(){return"Datahantering"},
gz7(){return"Exportera data"},
gz8(){return"Spara alla listor till en fil"},
gzz(){return"Importera data"},
gzA(){return"Ladda listor fr\xe5n en fil"},
gyM(){return"Ta bort all data"},
gqP(){var w=this.w
return w===$?this.w=new A.aLD():w},
gqg(){var w=this.x
return w===$?this.x=new A.aLx():w},
gmC(){var w=this.y
return w===$?this.y=new A.aLI():w}}
A.aKw.prototype={
gau(d){return"Kontroller"},
gvD(){return"Gester (Bildkort)"},
gzR(){return"Tangentbord (Bildkort)"},
gpa(){return"N\xe4sta kort"},
gpi(){return"F\xf6reg\xe5ende kort"},
goZ(){return"V\xe4nd kort"},
gwu(){return"Svep v\xe4nster"},
gwv(){return"Svep h\xf6ger"},
gww(){return"Svep upp eller ner"},
gxX(){return"H\xf6gerpiltangent"},
gxW(){return"V\xe4nsterpiltangent"},
gxY(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aKA.prototype={
gzZ(){return"\xa9 2025 Quizlone"},
gyO(d){return y.t}}
A.aLN.prototype={
gau(d){return"Bekr\xe4fta borttagning"},
yk(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aLT.prototype={
gau(d){return"Byt namn p\xe5 listan"},
gve(){return"Byt namn"},
gz3(){return"En lista med detta namn finns redan."},
gz2(){return"Listnamnet kan inte vara tomt."}}
A.aKQ.prototype={
gA1(){return"Listans namn kan inte vara tomt."},
geu(){return"Inga termer/definitioner inmatade."},
gzL(){return y.C},
yY(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gAr(){return y.M},
vS(d){return"Det gick inte att spara listan: "+d}}
A.aKY.prototype={
geu(){return y.g},
ghb(){return y.U}}
A.aL2.prototype={
gyv(){return"R\xe4tt!"},
zD(d){return"Fel. R\xe4tt svar: "+d},
zv(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
we(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aL7.prototype={
gxR(){return"Alla termer inl\xe4rda!"},
uc(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gw2(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
Ac(d){var w=B.ff("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
wi(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aLj.prototype={
gau(d){return"Topplista"},
gAq(){return"Inga rekord \xe4n. Bli den f\xf6rsta!"},
Bg(d,e){return e+" Sekunder"}}
A.aLd.prototype={
ghb(){return y.n}}
A.aLZ.prototype={
gA6(){return y.Q},
geu(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
ghb(){return y.k}}
A.aLD.prototype={
gau(d){return"Bekr\xe4fta import"},
gkY(d){return y.v},
gvQ(d){return"Importera"}}
A.aLx.prototype={
gau(d){return"Bekr\xe4fta borttagning"},
gkY(d){return y.l},
gyL(){return"Ta bort allt"}}
A.aLI.prototype={
gAo(){return"Det finns ingen data att exportera."},
z9(d){return"Fel vid export av data: "+d},
zC(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
zB(d){return"Fel vid import av data: "+d},
gxQ(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aOx.prototype={
$1(d){return A.bhI(this.a,d)},
$S:59}
A.aNc.prototype={
$1$error(d){return"Fel: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aNd.prototype={
$1$version(d){return"Version "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aNe.prototype={
$1$count(d){var w
this.a.gi0()
w=B.ff("sv")
return w.$3$one$other(d,"1 term",B.h(d)+" termer")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aNp.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:72}
A.aNA.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.h(d)+". Tom term eller definition hittades."},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:86}
A.aNL.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aNW.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:87}
A.aO6.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aOh.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:88}
A.aOs.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aOw.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.h(d)+" | Fr\xe5ga "+B.h(e)+" av "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:89}
A.aNf.prototype={
$1$count(d){var w
this.a.gi0()
w=B.ff("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.h(d)+" fr\xe5gor kvar att repetera.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aNg.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.h(e)+" med "+B.h(d)+" fr\xe5ga(or)..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:90}
A.aNh.prototype={
$1$time(d){return"Du klarade det p\xe5 "+B.h(d)+" sekunder!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aNi.prototype={
$1$time(d){return B.h(d)+" Sekunder"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aNj.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" r\xe4tt"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:92}
A.aNk.prototype={
$1$answer(d){return"Ditt svar: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aNl.prototype={
$1$version(d){return"Uppdatering tillg\xe4nglig: v"+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aNm.prototype={
$1$error(d){return"Fel vid export av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aNn.prototype={
$1$count(d){return B.h(d)+" listor importerades framg\xe5ngsrikt!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:93}
A.aNo.prototype={
$1$error(d){return"Fel vid import av data: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.XE,B.dt)
w(A.aKM,B.v7)
w(A.aKE,B.v5)
w(A.aKs,B.v2)
w(A.aLV,B.vo)
w(A.aKU,B.v8)
w(A.aLp,B.vh)
w(A.aKI,B.v6)
w(A.aL9,B.va)
w(A.aLl,B.ve)
w(A.aM2,B.vq)
w(A.aLt,B.vi)
w(A.aLJ,B.vk)
w(A.aKw,B.v3)
w(A.aKA,B.v4)
w(A.aLN,B.vn)
w(A.aLT,B.vp)
w(A.aKQ,B.v9)
w(A.aKY,B.vb)
w(A.aL2,B.vc)
w(A.aL7,B.vd)
w(A.aLj,B.vg)
w(A.aLd,B.vf)
w(A.aLZ,B.vr)
w(A.aLD,B.vl)
w(A.aLx,B.vj)
w(A.aLI,B.vm)
v(B.jH,[A.aOx,A.aNc,A.aNd,A.aNe,A.aNp,A.aNA,A.aNL,A.aNW,A.aO6,A.aOh,A.aOs,A.aOw,A.aNf,A.aNg,A.aNh,A.aNi,A.aNj,A.aNk,A.aNl,A.aNm,A.aNn,A.aNo])})()
B.a6f(b.typeUniverse,JSON.parse('{"XE":{"dt":[],"ic":["dR","dt"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",w:"Ingen aktiv studielista hittades eller listan kunde inte laddas.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",n:"Minst ett par med term/definition kr\xe4vs f\xf6r att spela.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",q:"Om korrekt svar \xe4r 'a, b', accepteras 'a'",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",l:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.an("hr<dR,dt>")}};
(a=>{a["yW6coMrFqyWqKNAdyauw3DuduvY="]=a.current})($__dart_deferred_initializers__);