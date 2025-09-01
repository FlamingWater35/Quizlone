((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aYS(d,e,f){var w,v,u=null,t=new B.hn(d,x.c),s=new B.hn(d,x.c)
s=new A.X7(t,s)
s.wa(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bfg(s)
return s},
bfc(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Yhdist\xe4peli",o="Takaisin aloitusn\xe4ytt\xf6\xf6n",n="Takaisin valintoihin",m="Vie tiedot"
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
case"general.genericError":return new A.aMg()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aMi()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aMj(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aMk()
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
case"inputScreen.errors.emptyTerm":return new A.aMl()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aMm()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aMn()
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
case"learnScreen.feedback.incorrect":return new A.aMo()
case"learnScreen.feedback.hint":return new A.aMp()
case"learnScreen.feedback.skipped":return new A.aMq()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aMr()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aMt(d)
case"learnScreen.progress.startingCycle":return new A.aMu()
case"matchScreen.title":return p
case"matchScreen.congratulations":return"Onneksi olkoon!"
case"matchScreen.timeCompleted":return new A.aMv()
case"matchScreen.playAgain":return"Pelaa uudelleen"
case"matchScreen.backToOptions":return n
case"matchScreen.leaderboard.title":return"Tulostaulu"
case"matchScreen.leaderboard.noRecords":return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"
case"matchScreen.leaderboard.time":return new A.aMw()
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
case"resultsScreen.scoreFraction":return new A.aMx()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aMy()
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
case"settingsScreen.snackbars.exportError":return new A.aMz()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aMA()
case"settingsScreen.snackbars.importError":return new A.aMB()
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
bfg(d){return new A.aN1(d)},
X7:function X7(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aJg:function aJg(){},
aJ8:function aJ8(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIX:function aIX(){},
aKl:function aKl(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aJo:function aJo(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJU:function aJU(){},
aJc:function aJc(){},
aJA:function aJA(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aJM:function aJM(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aKx:function aKx(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJY:function aJY(){},
aK5:function aK5(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aJ0:function aJ0(){},
aJ4:function aJ4(){},
aKh:function aKh(){},
aKn:function aKn(){},
aJk:function aJk(){},
aJs:function aJs(){},
aJx:function aJx(){},
aJC:function aJC(d,e){this.b=d
this.a=e},
aJO:function aJO(){},
aJI:function aJI(){},
aKt:function aKt(){},
aK7:function aK7(){},
aK1:function aK1(){},
aKc:function aKc(){},
aN1:function aN1(d){this.a=d},
aMg:function aMg(){},
aMi:function aMi(){},
aMj:function aMj(d){this.a=d},
aMk:function aMk(){},
aMl:function aMl(){},
aMm:function aMm(){},
aMn:function aMn(){},
aMo:function aMo(){},
aMp:function aMp(){},
aMq:function aMq(){},
aMr:function aMr(){},
aMt:function aMt(d){this.a=d},
aMu:function aMu(){},
aMv:function aMv(){},
aMw:function aMw(){},
aMx:function aMx(){},
aMy:function aMy(){},
aMz:function aMz(){},
aMA:function aMA(){},
aMB:function aMB(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[4],A)
A.X7.prototype={
ghT(){var w=this.ch
return w===$?this.ch=this:w},
go7(d){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghT()
w.CW!==$&&B.a_()
v=w.CW=new A.aJg()}return v},
glR(){var w,v=this,u=v.cx
if(u===$){w=v.ghT()
v.cx!==$&&B.a_()
u=v.cx=new A.aJ8(w,w)}return u},
gtr(){var w=this,v=w.cy
if(v===$){w.ghT()
w.cy!==$&&B.a_()
v=w.cy=new A.aIX()}return v},
gfu(){var w,v=this,u=v.db
if(u===$){w=v.ghT()
v.db!==$&&B.a_()
u=v.db=new A.aKl(w,w)}return u},
gfG(){var w,v=this,u=v.dx
if(u===$){w=v.ghT()
v.dx!==$&&B.a_()
u=v.dx=new A.aJo(w,w)}return u},
gcr(){var w=this,v=w.dy
if(v===$){w.ghT()
w.dy!==$&&B.a_()
v=w.dy=new A.aJU()}return v},
gn3(){var w=this,v=w.fr
if(v===$){w.ghT()
w.fr!==$&&B.a_()
v=w.fr=new A.aJc()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghT()
v.fx!==$&&B.a_()
u=v.fx=new A.aJA(w,w)}return u},
gki(){var w,v=this,u=v.fy
if(u===$){w=v.ghT()
v.fy!==$&&B.a_()
u=v.fy=new A.aJM(w,w)}return u},
glj(){var w,v=this,u=v.go
if(u===$){w=v.ghT()
v.go!==$&&B.a_()
u=v.go=new A.aKx(w,w)}return u},
ghJ(){var w=this,v=w.id
if(v===$){w.ghT()
w.id!==$&&B.a_()
v=w.id=new A.aJY()}return v},
gcv(){var w,v=this,u=v.k1
if(u===$){w=v.ghT()
v.k1!==$&&B.a_()
u=v.k1=new A.aK5(w,w)}return u},
gfj(){var w=this,v=w.k2
if(v===$){w.ghT()
w.k2!==$&&B.a_()
v=w.k2=new A.aJ0()}return v},
gmm(){return this.ay}}
A.aJg.prototype={
gxF(d){return"Takaisin"},
goa(d){return"Peruuta"},
grd(d){return"Poista"},
gjq(d){return"Seuraava"},
goQ(){return"Edellinen"},
gw_(d){return"L\xe4het\xe4"},
gxs(){return"Kaikki"},
gzM(){return"Ladataan..."},
hh(d){return"Virhe: "+d},
gAC(d){return"Nollaa"}}
A.aJ8.prototype={
gvJ(){return"Asetukset"},
gxX(d){return"Ohjaimet"},
gtp(){return"Tietoja"},
gtq(){var w=this.d
return w===$?this.d=new A.aJ4():w}}
A.aIX.prototype={
B2(d,e){return"Versio "+e},
gB3(){return"N\xe4yt\xe4 lisenssit"}}
A.aKl.prototype={
gau(d){return"Quizlone"},
gB6(){return"Tervetuloa!"},
gyc(){return"Luo uusi lista"},
gzL(){return"Lataa tallennettu lista"},
gA3(){return"Listoja ei ole viel\xe4 tallennettu."},
v3(d){var w=B.fa("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtO(){var w=this.e
return w===$?this.e=new A.aKh():w},
gnp(){var w=this.f
return w===$?this.f=new A.aKn():w}}
A.aJo.prototype={
gau(d){return"Luo uusi lista"},
guE(){return"Listan nimi"},
gzG(){return"esim. Luvun 1 sanasto"},
gAi(){return"Liit\xe4 termit alle:"},
gAj(){return y.U},
gAP(){return y.l},
gvx(){return"Tallenna lista"},
gd1(){var w=this.d
return w===$?this.d=new A.aJk():w}}
A.aJU.prototype={
gau(d){return"Valinnat & Tila"},
gng(){return y.j},
ghK(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyY(){return"Muistikorttien asetukset"},
gvO(){return"N\xe4yt\xe4 ensin termi"},
gvM(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gtA(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gtz(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvZ(){return"Opiskelun pituus:"},
gBa(){return"Kirjallinen vastaus"},
gzZ(){return"Monivalinta"},
gyZ(){return"Muistikortit"},
guB(){return"Opi"},
gv4(){return"Testi"},
gzP(d){return"Yhdist\xe4peli"}}
A.aJc.prototype={
gau(d){return"Muistikortit"},
gA1(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
ges(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvQ(d){return"Sekoita"},
gAF(){return"Aloita alusta"}}
A.aJA.prototype={
gau(d){return"Opi"},
gAG(){return"Aloita oppimisistunto alusta"},
gkO(){return"Takaisin valintoihin"},
gtv(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gn7(d){return"Vihje"},
gvR(d){return"Ohita"},
gd1(){var w=this.f
return w===$?this.f=new A.aJs():w},
gou(){var w=this.r
return w===$?this.r=new A.aJx():w},
gm8(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aJC(w,w)}return v}}
A.aJM.prototype={
gau(d){return"Yhdist\xe4peli"},
gkQ(){return"Onneksi olkoon!"},
gAn(){return"Pelaa uudelleen"},
gkO(){return"Takaisin valintoihin"},
gqF(){var w=this.e
return w===$?this.e=new A.aJO():w},
gd1(){var w=this.f
return w===$?this.f=new A.aJI():w}}
A.aKx.prototype={
gau(d){return"Testi"},
gl9(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gB4(){return"N\xe4yt\xe4 tulokset"},
gw0(){return"L\xe4het\xe4 testi"},
gd1(){var w=this.d
return w===$?this.d=new A.aKt():w}}
A.aJY.prototype={
gau(d){return"Testin tulokset"},
gl9(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gBc(){return"Pisteesi"},
vB(d,e){return""+d+" / "+e+" oikein"},
gqZ(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Bb(d){return"Vastauksesi: "+d},
gA0(){return"(Ei vastausta)"},
gkQ(){return"Onneksi olkoon! Sait kaiken oikein!"},
gAJ(){return"Yrit\xe4 testi\xe4 uudelleen"},
gAL(){return"Kertaa muistikorteilla"}}
A.aK5.prototype={
gau(d){return"Asetukset"},
gxv(d){return"Ulkoasu"},
guz(d){return"Kieli"},
gzy(){return"Valitse kieli"},
gvb(){return"N\xe4yt\xf6n skaalaus"},
gAY(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
grH(){return"J\xe4rjestelm\xe4n oletus"},
gzE(){return"Vaalea"},
gyi(){return"Tumma"},
gyE(){return"Englanti"},
gyX(){return"Suomi"},
gAO(){return"Ven\xe4j\xe4"},
gvU(){return"Espanja"},
gw5(){return"Ruotsi"},
gyj(){return"Tietojen hallinta"},
gyK(){return"Vie tiedot"},
gyL(){return"Tallenna kaikki listat tiedostoon"},
gzd(){return"Tuo tiedot"},
gze(){return"Lataa listat tiedostosta"},
gyo(){return"Poista kaikki tiedot"},
gqv(){var w=this.w
return w===$?this.w=new A.aK7():w},
gpY(){var w=this.x
return w===$?this.x=new A.aK1():w},
gmv(){var w=this.y
return w===$?this.y=new A.aKc():w}}
A.aJ0.prototype={
gau(d){return"Ohjaimet"},
gvh(){return"Liikkeet (Muistikortit)"},
gzv(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
goI(){return"Seuraava kortti"},
goR(){return"Edellinen kortti"},
goz(){return"K\xe4\xe4nn\xe4 kortti"},
gw6(){return"Pyyhk\xe4ise vasemmalle"},
gw7(){return"Pyyhk\xe4ise oikealle"},
gw8(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gxA(){return"Oikea nuolin\xe4pp\xe4in"},
gxz(){return"Vasen nuolin\xe4pp\xe4in"},
gxB(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aJ4.prototype={
gzC(){return"\xa9 2025 Quizlone"},
gyq(d){return y.R}}
A.aKh.prototype={
gau(d){return"Vahvista poisto"},
xW(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aKn.prototype={
gau(d){return"Nime\xe4 lista uudelleen"},
guW(){return"Nime\xe4 uudelleen"},
gyG(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gyF(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aJk.prototype={
gzF(){return"Listan nimi ei voi olla tyhj\xe4."},
ges(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gzp(){return y.r},
yA(d){return"Muotovirhe rivin "+d+y.J},
gA5(){return y.c},
vw(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aJs.prototype={
ges(){return y.b},
gh9(){return y.B}}
A.aJx.prototype={
gy8(){return"Oikein!"},
zh(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
z9(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vS(d){return"Ohitettu. Vastaus oli: "+d}}
A.aJC.prototype={
gxu(){return"Kaikki termit opittu!"},
tU(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gvG(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
zR(d){var w=B.fa("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vW(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aJO.prototype={
gau(d){return"Tulostaulu"},
gA4(){return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"},
AT(d,e){return e+" sekuntia"}}
A.aJI.prototype={
gh9(){return y.L}}
A.aKt.prototype={
gzK(){return y.P},
ges(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gh9(){return y._}}
A.aK7.prototype={
gau(d){return"Vahvista tuonti"},
gkR(d){return y.u},
gvu(d){return"Tuo"}}
A.aK1.prototype={
gau(d){return"Vahvista poisto"},
gkR(d){return y.N},
gyn(){return"Poista kaikki"}}
A.aKc.prototype={
gA2(){return"Ei viet\xe4vi\xe4 tietoja."},
yM(d){return"Virhe tietojen vienniss\xe4: "+d},
zg(d){return""+d+" listaa tuotu onnistuneesti!"},
zf(d){return"Virhe tietojen tuonnissa: "+d},
gxt(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aN1.prototype={
$1(d){return A.bfc(this.a,d)},
$S:54}
A.aMg.prototype={
$1$error(d){return"Virhe: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMi.prototype={
$1$version(d){return"Versio "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:94}
A.aMj.prototype={
$1$count(d){var w
this.a.ghT()
w=B.fa("fi")
return w.$3$one$other(d,"1 termi",B.h(d)+" termi\xe4")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aMk.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:76}
A.aMl.prototype={
$1$line(d){return"Muotovirhe rivin "+B.h(d)+y.J},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:82}
A.aMm.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMn.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:78}
A.aMo.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMp.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:75}
A.aMq.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMr.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.h(d)+" | Kohde "+B.h(e)+" / "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:74}
A.aMt.prototype={
$1$count(d){var w
this.a.ghT()
w=B.fa("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.h(d)+" kohdetta viel\xe4 kertaamatta.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:37}
A.aMu.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.h(e)+", jossa on "+B.h(d)+" kohdetta..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:69}
A.aMv.prototype={
$1$time(d){return"Suoritit pelin "+B.h(d)+" sekunnissa!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aMw.prototype={
$1$time(d){return B.h(d)+" sekuntia"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:43}
A.aMx.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" oikein"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:77}
A.aMy.prototype={
$1$answer(d){return"Vastauksesi: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:24}
A.aMz.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aMA.prototype={
$1$count(d){return B.h(d)+" listaa tuotu onnistuneesti!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:91}
A.aMB.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.X7,B.ds)
w(A.aJg,B.uX)
w(A.aJ8,B.uV)
w(A.aIX,B.uS)
w(A.aKl,B.vd)
w(A.aJo,B.uY)
w(A.aJU,B.v6)
w(A.aJc,B.uW)
w(A.aJA,B.v_)
w(A.aJM,B.v3)
w(A.aKx,B.vf)
w(A.aJY,B.v7)
w(A.aK5,B.v9)
w(A.aJ0,B.uT)
w(A.aJ4,B.uU)
w(A.aKh,B.vc)
w(A.aKn,B.ve)
w(A.aJk,B.uZ)
w(A.aJs,B.v0)
w(A.aJx,B.v1)
w(A.aJC,B.v2)
w(A.aJO,B.v5)
w(A.aJI,B.v4)
w(A.aKt,B.vg)
w(A.aK7,B.va)
w(A.aK1,B.v8)
w(A.aKc,B.vb)
v(B.jz,[A.aN1,A.aMg,A.aMi,A.aMj,A.aMk,A.aMl,A.aMm,A.aMn,A.aMo,A.aMp,A.aMq,A.aMr,A.aMt,A.aMu,A.aMv,A.aMw,A.aMx,A.aMy,A.aMz,A.aMA,A.aMB])})()
B.a5C(b.typeUniverse,JSON.parse('{"X7":{"ds":[],"i0":["dM","ds"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",L:"Pelaamiseen tarvitaan v\xe4hint\xe4\xe4n yksi termi/m\xe4\xe4ritelm\xe4-pari.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.ak("hn<dM,ds>")}};
(a=>{a["dmIZsrQr8SRfqrHRslokLevQB9E="]=a.current})($__dart_deferred_initializers__);