((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
b_x(d,e,f){var w,v,u=null,t=new B.hr(d,x.c),s=new B.hr(d,x.c)
s=new A.XC(t,s)
s.wx(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bhO(s)
return s},
bhK(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Yhdist\xe4peli",o="Takaisin aloitusn\xe4ytt\xf6\xf6n",n="Takaisin valintoihin",m="Vie tiedot"
switch(e){case"appName":return w
case"general.back":return"Takaisin"
case"general.cancel":return"Peruuta"
case"general.delete":return"Poista"
case"general.error":return"Virhe"
case"general.next":return"Seuraava"
case"general.previous":return"Edellinen"
case"general.saveAndContinue":return"Tallenna ja jatka"
case"general.submit":return"L\xe4het\xe4"
case"general.all":return"Kaikki"
case"general.loading":return"Ladataan..."
case"general.genericError":return new A.aNN()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aNO()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aNP(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aNQ()
case"startScreen.renameListDialog.title":return"Nime\xe4 lista uudelleen"
case"startScreen.renameListDialog.rename":return"Nime\xe4 uudelleen"
case"startScreen.renameListDialog.errorNameExists":return"T\xe4m\xe4nniminen lista on jo olemassa."
case"startScreen.renameListDialog.errorNameEmpty":return r
case"inputScreen.title":return t
case"inputScreen.listName":return"Listan nimi"
case"inputScreen.listNameHint":return"esim. Luvun 1 sanasto"
case"inputScreen.pasteTerms":return"Liit\xe4 termit alle:"
case"inputScreen.pasteTermsHint":return y.U
case"inputScreen.termsHint":return y.l
case"inputScreen.saveList":return"Tallenna lista"
case"inputScreen.errors.listNameEmpty":return r
case"inputScreen.errors.noTerms":return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."
case"inputScreen.errors.invalidFormat":return y.r
case"inputScreen.errors.emptyTerm":return new A.aNR()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aNS()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aNT()
case"modeSelectionScreen.returnToWelcome":return"Palaa aloitusn\xe4ytt\xf6\xf6n"
case"modeSelectionScreen.flashcardOptions":return"Muistikorttien asetukset"
case"modeSelectionScreen.showTermFirst":return"N\xe4yt\xe4 ensin termi"
case"modeSelectionScreen.showDefFirst":return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"
case"modeSelectionScreen.studyOptions":return"Oppimisen & Testin asetukset"
case"modeSelectionScreen.askForTerm":return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"
case"modeSelectionScreen.askForDef":return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"
case"modeSelectionScreen.studyLength":return"Opiskelun pituus:"
case"modeSelectionScreen.testFormat":return"Testin muoto"
case"modeSelectionScreen.writtenAnswer":return"Kirjallinen vastaus"
case"modeSelectionScreen.multipleChoice":return"Monivalinta"
case"modeSelectionScreen.requireOnlyOneAnswer":return"Hyv\xe4ksy yksi pilkulla erotettu vastaus"
case"modeSelectionScreen.requireOnlyOneAnswerSubtitle":return y.E
case"modeSelectionScreen.flashcards":return q
case"modeSelectionScreen.learn":return"Opi"
case"modeSelectionScreen.test":return"Testi"
case"modeSelectionScreen.match":return p
case"modeSelectionScreen.backToWelcome":return o
case"flashcardScreen.title":return q
case"flashcardScreen.noCards":return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."
case"flashcardScreen.noTerms":return"Opiskeltavia termej\xe4 ei ole saatavilla."
case"flashcardScreen.shuffle":return"Sekoita"
case"flashcardScreen.restart":return"Aloita alusta"
case"learnScreen.title":return"Opi"
case"learnScreen.restartSession":return"Aloita oppimisistunto alusta"
case"learnScreen.backToOptions":return n
case"learnScreen.preparing":return"Valmistellaan seuraavaa kysymyst\xe4..."
case"learnScreen.answerHint":return"Kirjoita vastauksesi t\xe4h\xe4n..."
case"learnScreen.incorrect":return"V\xe4\xe4rin"
case"learnScreen.hint":return"Vihje"
case"learnScreen.skip":return"Ohita"
case"learnScreen.backToModeSelection":return"Takaisin tilan valintaan"
case"learnScreen.errors.noTerms":return y.b
case"learnScreen.errors.notEnoughTerms":return y.B
case"learnScreen.feedback.correct":return"Oikein!"
case"learnScreen.feedback.incorrect":return new A.aNU()
case"learnScreen.feedback.hint":return new A.aNV()
case"learnScreen.feedback.skipped":return new A.aNX()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aNY()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aNZ(d)
case"learnScreen.progress.startingCycle":return new A.aO_()
case"matchScreen.title":return p
case"matchScreen.congratulations":return"Onneksi olkoon!"
case"matchScreen.timeCompleted":return new A.aO0()
case"matchScreen.playAgain":return"Pelaa uudelleen"
case"matchScreen.backToOptions":return n
case"matchScreen.leaderboard.title":return"Tulostaulu"
case"matchScreen.leaderboard.noRecords":return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"
case"matchScreen.leaderboard.time":return new A.aO1()
case"matchScreen.errors.noTerms":return"Yhdist\xe4peliss\xe4 ei ole saatavilla termej\xe4."
case"matchScreen.errors.notEnoughTerms":return y.L
case"testScreen.title":return"Testi"
case"testScreen.noQuestions":return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."
case"testScreen.viewResults":return"N\xe4yt\xe4 tulokset"
case"testScreen.submitTest":return"L\xe4het\xe4 testi"
case"testScreen.errors.loadFailed":return y.P
case"testScreen.errors.noTerms":return"Testiss\xe4 ei ole saatavilla termej\xe4."
case"testScreen.errors.notEnoughTerms":return y._
case"resultsScreen.title":return"Testin tulokset"
case"resultsScreen.notSubmitted":return"Testi\xe4 ei ole viel\xe4 l\xe4hetetty."
case"resultsScreen.noQuestions":return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."
case"resultsScreen.yourScore":return"Pisteesi"
case"resultsScreen.scoreFraction":return new A.aO2()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aO3()
case"resultsScreen.noAnswer":return"(Ei vastausta)"
case"resultsScreen.congratulations":return"Onneksi olkoon! Sait kaiken oikein!"
case"resultsScreen.retryTest":return"Yrit\xe4 testi\xe4 uudelleen"
case"resultsScreen.reviewFlashcards":return"Kertaa muistikorteilla"
case"resultsScreen.backToWelcome":return o
case"settingsScreen.title":return v
case"settingsScreen.appearance":return"Ulkoasu"
case"settingsScreen.language":return"Kieli"
case"settingsScreen.languageDialogTitle":return"Valitse kieli"
case"settingsScreen.uiScaling":return"N\xe4yt\xf6n skaalaus"
case"settingsScreen.uiScalingSubtitle":return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"
case"settingsScreen.systemDefault":return"J\xe4rjestelm\xe4n oletus"
case"settingsScreen.light":return"Vaalea"
case"settingsScreen.dark":return"Tumma"
case"settingsScreen.english":return"Englanti"
case"settingsScreen.finnish":return"Suomi"
case"settingsScreen.russian":return"Ven\xe4j\xe4"
case"settingsScreen.spanish":return"Espanja"
case"settingsScreen.swedish":return"Ruotsi"
case"settingsScreen.update":return"P\xe4ivitys"
case"settingsScreen.checkForUpdate":return"Tarkista p\xe4ivitykset"
case"settingsScreen.checkingForUpdate":return"Tarkistetaan p\xe4ivityksi\xe4..."
case"settingsScreen.upToDate":return"Sovellus on ajan tasalla"
case"settingsScreen.noNewVersion":return"Uutta versiota ei l\xf6ytynyt."
case"settingsScreen.updateAvailable":return new A.aO4()
case"settingsScreen.tapToInstall":return"Lataa ja asenna napauttamalla"
case"settingsScreen.viewReleaseNotes":return"N\xe4yt\xe4 julkaisutiedot"
case"settingsScreen.downloadingUpdate":return"Ladataan p\xe4ivityst\xe4..."
case"settingsScreen.updateCheckFailed":return"P\xe4ivitysten tarkistus ep\xe4onnistui"
case"settingsScreen.dataManagement":return"Tietojen hallinta"
case"settingsScreen.exportData":return m
case"settingsScreen.exportDataSubtitle":return"Tallenna kaikki listat tiedostoon"
case"settingsScreen.importData":return"Tuo tiedot"
case"settingsScreen.importDataSubtitle":return"Lataa listat tiedostosta"
case"settingsScreen.deleteAllData":return"Poista kaikki tiedot"
case"settingsScreen.exportDialog.title":return m
case"settingsScreen.exportDialog.content":return"Miten haluat vied\xe4 tietosi?"
case"settingsScreen.exportDialog.share":return"Jaa tiedosto"
case"settingsScreen.exportDialog.save":return"Tallenna laitteelle"
case"settingsScreen.importDialog.title":return"Vahvista tuonti"
case"settingsScreen.importDialog.content":return y.u
case"settingsScreen.importDialog.import":return"Tuo"
case"settingsScreen.deleteDialog.title":return s
case"settingsScreen.deleteDialog.content":return y.N
case"settingsScreen.deleteDialog.deleteAll":return"Poista kaikki"
case"settingsScreen.snackbars.noDataToExport":return"Ei viet\xe4vi\xe4 tietoja."
case"settingsScreen.snackbars.exportSuccess":return"Tiedot viety onnistuneesti!"
case"settingsScreen.snackbars.exportError":return new A.aO5()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aO7()
case"settingsScreen.snackbars.importError":return new A.aO8()
case"settingsScreen.snackbars.allDeleted":return"Kaikki opiskelulistat on poistettu."
case"controlsScreen.title":return u
case"controlsScreen.gesturesTitle":return"Liikkeet (Muistikortit)"
case"controlsScreen.keyboardTitle":return"N\xe4pp\xe4imist\xf6 (Muistikortit)"
case"controlsScreen.nextCard":return"Seuraava kortti"
case"controlsScreen.previousCard":return"Edellinen kortti"
case"controlsScreen.flipCard":return"K\xe4\xe4nn\xe4 kortti"
case"controlsScreen.swipeLeft":return"Pyyhk\xe4ise vasemmalle"
case"controlsScreen.swipeRight":return"Pyyhk\xe4ise oikealle"
case"controlsScreen.swipeVertical":return"Pyyhk\xe4ise yl\xf6s tai alas"
case"controlsScreen.arrowRight":return"Oikea nuolin\xe4pp\xe4in"
case"controlsScreen.arrowLeft":return"Vasen nuolin\xe4pp\xe4in"
case"controlsScreen.arrowVerticalOrSpace":return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"
default:return null}},
bhO(d){return new A.aOz(d)},
XC:function XC(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aKK:function aKK(){},
aKC:function aKC(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aKq:function aKq(){},
aLP:function aLP(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKS:function aKS(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLn:function aLn(){},
aKG:function aKG(){},
aL3:function aL3(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aLf:function aLf(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aM0:function aM0(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aLr:function aLr(){},
aLz:function aLz(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aKu:function aKu(){},
aKy:function aKy(){},
aLL:function aLL(){},
aLR:function aLR(){},
aKO:function aKO(){},
aKW:function aKW(){},
aL0:function aL0(){},
aL5:function aL5(d,e){this.b=d
this.a=e},
aLh:function aLh(){},
aLb:function aLb(){},
aLX:function aLX(){},
aLB:function aLB(){},
aLv:function aLv(){},
aLG:function aLG(){},
aOz:function aOz(d){this.a=d},
aNN:function aNN(){},
aNO:function aNO(){},
aNP:function aNP(d){this.a=d},
aNQ:function aNQ(){},
aNR:function aNR(){},
aNS:function aNS(){},
aNT:function aNT(){},
aNU:function aNU(){},
aNV:function aNV(){},
aNX:function aNX(){},
aNY:function aNY(){},
aNZ:function aNZ(d){this.a=d},
aO_:function aO_(){},
aO0:function aO0(){},
aO1:function aO1(){},
aO2:function aO2(){},
aO3:function aO3(){},
aO4:function aO4(){},
aO5:function aO5(){},
aO7:function aO7(){},
aO8:function aO8(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[4],A)
A.XC.prototype={
ghY(){var w=this.ch
return w===$?this.ch=this:w},
got(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghY()
w.CW!==$&&B.a_()
v=w.CW=new A.aKK()}return v},
glY(){var w,v=this,u=v.cx
if(u===$){w=v.ghY()
v.cx!==$&&B.a_()
u=v.cx=new A.aKC(w,w)}return u},
gtK(){var w=this,v=w.cy
if(v===$){w.ghY()
w.cy!==$&&B.a_()
v=w.cy=new A.aKq()}return v},
gfw(){var w,v=this,u=v.db
if(u===$){w=v.ghY()
v.db!==$&&B.a_()
u=v.db=new A.aLP(w,w)}return u},
gfK(){var w,v=this,u=v.dx
if(u===$){w=v.ghY()
v.dx!==$&&B.a_()
u=v.dx=new A.aKS(w,w)}return u},
gcm(){var w=this,v=w.dy
if(v===$){w.ghY()
w.dy!==$&&B.a_()
v=w.dy=new A.aLn()}return v},
gne(){var w=this,v=w.fr
if(v===$){w.ghY()
w.fr!==$&&B.a_()
v=w.fr=new A.aKG()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghY()
v.fx!==$&&B.a_()
u=v.fx=new A.aL3(w,w)}return u},
gks(){var w,v=this,u=v.fy
if(u===$){w=v.ghY()
v.fy!==$&&B.a_()
u=v.fy=new A.aLf(w,w)}return u},
glq(){var w,v=this,u=v.go
if(u===$){w=v.ghY()
v.go!==$&&B.a_()
u=v.go=new A.aM0(w,w)}return u},
ghO(){var w=this,v=w.id
if(v===$){w.ghY()
w.id!==$&&B.a_()
v=w.id=new A.aLr()}return v},
gcB(){var w,v=this,u=v.k1
if(u===$){w=v.ghY()
v.k1!==$&&B.a_()
u=v.k1=new A.aLz(w,w)}return u},
gfm(){var w=this,v=w.k2
if(v===$){w.ghY()
w.k2!==$&&B.a_()
v=w.k2=new A.aKu()}return v},
gmt(){return this.ay}}
A.aKK.prototype={
gy0(d){return"Takaisin"},
gow(d){return"Peruuta"},
grz(d){return"Poista"},
gjy(d){return"Seuraava"},
gph(){return"Edellinen"},
gwm(d){return"L\xe4het\xe4"},
gxO(){return"Kaikki"},
gA8(){return"Ladataan..."},
hm(d){return"Virhe: "+d},
gB_(d){return"Nollaa"}}
A.aKC.prototype={
gw4(){return"Asetukset"},
gyk(d){return"Ohjaimet"},
gtI(){return"Tietoja"},
gtJ(){var w=this.d
return w===$?this.d=new A.aKy():w}}
A.aKq.prototype={
Bq(d,e){return"Versio "+e},
gBr(){return"N\xe4yt\xe4 lisenssit"}}
A.aLP.prototype={
gau(d){return"Quizlone"},
gBu(){return"Tervetuloa!"},
gyy(){return"Luo uusi lista"},
gA7(){return"Lataa tallennettu lista"},
gAp(){return"Listoja ei ole viel\xe4 tallennettu."},
vl(d){var w=B.ff("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gu5(){var w=this.e
return w===$?this.e=new A.aLL():w},
gnD(){var w=this.f
return w===$?this.f=new A.aLR():w}}
A.aKS.prototype={
gau(d){return"Luo uusi lista"},
guW(){return"Listan nimi"},
gA2(){return"esim. Luvun 1 sanasto"},
gAE(){return"Liit\xe4 termit alle:"},
gAF(){return y.U},
gBc(){return y.l},
gvT(){return"Tallenna lista"},
gd2(){var w=this.d
return w===$?this.d=new A.aKO():w}}
A.aLn.prototype={
gau(d){return"Valinnat & Tila"},
gnu(){return y.j},
ghP(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gzi(){return"Muistikorttien asetukset"},
gw9(){return"N\xe4yt\xe4 ensin termi"},
gw7(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gwl(){return"Oppimisen & Testin asetukset"},
gtT(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gtS(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gwk(){return"Opiskelun pituus:"},
gBx(){return"Kirjallinen vastaus"},
gAk(){return"Monivalinta"},
gAY(){return"Hyv\xe4ksy yksi pilkulla erotettu vastaus"},
gAZ(){return y.E},
gzj(){return"Muistikortit"},
gzX(){return"Opi"},
gvm(){return"Testi"},
gAb(d){return"Yhdist\xe4peli"}}
A.aKG.prototype={
gau(d){return"Muistikortit"},
gAn(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
geu(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gwb(d){return"Sekoita"},
gB2(){return"Aloita alusta"}}
A.aL3.prototype={
gau(d){return"Opi"},
gB3(){return"Aloita oppimisistunto alusta"},
gkV(){return"Takaisin valintoihin"},
gtO(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gni(d){return"Vihje"},
gwc(d){return"Ohita"},
gd2(){var w=this.f
return w===$?this.f=new A.aKW():w},
goR(){var w=this.r
return w===$?this.r=new A.aL0():w},
gme(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aL5(w,w)}return v}}
A.aLf.prototype={
gau(d){return"Yhdist\xe4peli"},
gkX(){return"Onneksi olkoon!"},
gAJ(){return"Pelaa uudelleen"},
gkV(){return"Takaisin valintoihin"},
gqY(){var w=this.e
return w===$?this.e=new A.aLh():w},
gd2(){var w=this.f
return w===$?this.f=new A.aLb():w}}
A.aM0.prototype={
gau(d){return"Testi"},
glg(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gBs(){return"N\xe4yt\xe4 tulokset"},
gwn(){return"L\xe4het\xe4 testi"},
gd2(){var w=this.d
return w===$?this.d=new A.aLX():w}}
A.aLr.prototype={
gau(d){return"Testin tulokset"},
glg(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gBz(){return"Pisteesi"},
vX(d,e){return""+d+" / "+e+" oikein"},
gri(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
By(d){return"Vastauksesi: "+d},
gAm(){return"(Ei vastausta)"},
gkX(){return"Onneksi olkoon! Sait kaiken oikein!"},
gB6(){return"Yrit\xe4 testi\xe4 uudelleen"},
gB8(){return"Kertaa muistikorteilla"}}
A.aLz.prototype={
gau(d){return"Asetukset"},
gxR(d){return"Ulkoasu"},
guS(d){return"Kieli"},
gzU(){return"Valitse kieli"},
gvv(){return"N\xe4yt\xf6n skaalaus"},
gBl(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gt_(){return"J\xe4rjestelm\xe4n oletus"},
gA0(){return"Vaalea"},
gyE(){return"Tumma"},
gz0(){return"Englanti"},
gzh(){return"Suomi"},
gBb(){return"Ven\xe4j\xe4"},
gwf(){return"Espanja"},
gws(){return"Ruotsi"},
gyG(){return"Tietojen hallinta"},
gz6(){return"Vie tiedot"},
gz7(){return"Tallenna kaikki listat tiedostoon"},
gzy(){return"Tuo tiedot"},
gzz(){return"Lataa listat tiedostosta"},
gyL(){return"Poista kaikki tiedot"},
gqP(){var w=this.w
return w===$?this.w=new A.aLB():w},
gqg(){var w=this.x
return w===$?this.x=new A.aLv():w},
gmC(){var w=this.y
return w===$?this.y=new A.aLG():w}}
A.aKu.prototype={
gau(d){return"Ohjaimet"},
gvC(){return"Liikkeet (Muistikortit)"},
gzR(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
gpa(){return"Seuraava kortti"},
gpi(){return"Edellinen kortti"},
goZ(){return"K\xe4\xe4nn\xe4 kortti"},
gwt(){return"Pyyhk\xe4ise vasemmalle"},
gwu(){return"Pyyhk\xe4ise oikealle"},
gwv(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gxW(){return"Oikea nuolin\xe4pp\xe4in"},
gxV(){return"Vasen nuolin\xe4pp\xe4in"},
gxX(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aKy.prototype={
gzZ(){return"\xa9 2025 Quizlone"},
gyN(d){return y.R}}
A.aLL.prototype={
gau(d){return"Vahvista poisto"},
yj(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aLR.prototype={
gau(d){return"Nime\xe4 lista uudelleen"},
gvd(){return"Nime\xe4 uudelleen"},
gz2(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gz1(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aKO.prototype={
gA1(){return"Listan nimi ei voi olla tyhj\xe4."},
geu(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gzK(){return y.r},
yX(d){return"Muotovirhe rivin "+d+y.J},
gAr(){return y.c},
vR(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aKW.prototype={
geu(){return y.b},
ghb(){return y.B}}
A.aL0.prototype={
gyu(){return"Oikein!"},
zC(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
zu(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
wd(d){return"Ohitettu. Vastaus oli: "+d}}
A.aL5.prototype={
gxQ(){return"Kaikki termit opittu!"},
uc(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gw1(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
Ac(d){var w=B.ff("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
wh(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aLh.prototype={
gau(d){return"Tulostaulu"},
gAq(){return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"},
Bg(d,e){return e+" sekuntia"}}
A.aLb.prototype={
ghb(){return y.L}}
A.aLX.prototype={
gA6(){return y.P},
geu(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
ghb(){return y._}}
A.aLB.prototype={
gau(d){return"Vahvista tuonti"},
gkY(d){return y.u},
gvP(d){return"Tuo"}}
A.aLv.prototype={
gau(d){return"Vahvista poisto"},
gkY(d){return y.N},
gyK(){return"Poista kaikki"}}
A.aLG.prototype={
gAo(){return"Ei viet\xe4vi\xe4 tietoja."},
z8(d){return"Virhe tietojen vienniss\xe4: "+d},
zB(d){return""+d+" listaa tuotu onnistuneesti!"},
zA(d){return"Virhe tietojen tuonnissa: "+d},
gxP(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aOz.prototype={
$1(d){return A.bhK(this.a,d)},
$S:59}
A.aNN.prototype={
$1$error(d){return"Virhe: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aNO.prototype={
$1$version(d){return"Versio "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aNP.prototype={
$1$count(d){var w
this.a.ghY()
w=B.ff("fi")
return w.$3$one$other(d,"1 termi",B.h(d)+" termi\xe4")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aNQ.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:72}
A.aNR.prototype={
$1$line(d){return"Muotovirhe rivin "+B.h(d)+y.J},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:86}
A.aNS.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aNT.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:87}
A.aNU.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aNV.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:88}
A.aNX.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aNY.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.h(d)+" | Kohde "+B.h(e)+" / "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:89}
A.aNZ.prototype={
$1$count(d){var w
this.a.ghY()
w=B.ff("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.h(d)+" kohdetta viel\xe4 kertaamatta.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:45}
A.aO_.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.h(e)+", jossa on "+B.h(d)+" kohdetta..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:90}
A.aO0.prototype={
$1$time(d){return"Suoritit pelin "+B.h(d)+" sekunnissa!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aO1.prototype={
$1$time(d){return B.h(d)+" sekuntia"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:44}
A.aO2.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" oikein"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:92}
A.aO3.prototype={
$1$answer(d){return"Vastauksesi: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aO4.prototype={
$1$version(d){return"P\xe4ivitys saatavilla: v"+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:38}
A.aO5.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12}
A.aO7.prototype={
$1$count(d){return B.h(d)+" listaa tuotu onnistuneesti!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:93}
A.aO8.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:12};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.XC,B.dt)
w(A.aKK,B.v7)
w(A.aKC,B.v5)
w(A.aKq,B.v2)
w(A.aLP,B.vo)
w(A.aKS,B.v8)
w(A.aLn,B.vh)
w(A.aKG,B.v6)
w(A.aL3,B.va)
w(A.aLf,B.ve)
w(A.aM0,B.vq)
w(A.aLr,B.vi)
w(A.aLz,B.vk)
w(A.aKu,B.v3)
w(A.aKy,B.v4)
w(A.aLL,B.vn)
w(A.aLR,B.vp)
w(A.aKO,B.v9)
w(A.aKW,B.vb)
w(A.aL0,B.vc)
w(A.aL5,B.vd)
w(A.aLh,B.vg)
w(A.aLb,B.vf)
w(A.aLX,B.vr)
w(A.aLB,B.vl)
w(A.aLv,B.vj)
w(A.aLG,B.vm)
v(B.jH,[A.aOz,A.aNN,A.aNO,A.aNP,A.aNQ,A.aNR,A.aNS,A.aNT,A.aNU,A.aNV,A.aNX,A.aNY,A.aNZ,A.aO_,A.aO0,A.aO1,A.aO2,A.aO3,A.aO4,A.aO5,A.aO7,A.aO8])})()
B.a6f(b.typeUniverse,JSON.parse('{"XC":{"dt":[],"ic":["dR","dt"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",E:"Jos oikea vastaus on 'a, b', 'a' hyv\xe4ksyt\xe4\xe4n",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",L:"Pelaamiseen tarvitaan v\xe4hint\xe4\xe4n yksi termi/m\xe4\xe4ritelm\xe4-pari.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.an("hr<dR,dt>")}};
(a=>{a["xkq7gVhF1wVGsNaUJEBI0C9pvQg="]=a.current})($__dart_deferred_initializers__);