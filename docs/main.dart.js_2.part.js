((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aXa(d,e,f){var w,v,u=null,t=new B.ha(d,x.c),s=new B.ha(d,x.c)
s=new A.W1(t,s)
s.wd(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.beh(s)
return s},
bed(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Yhdist\xe4peli",o="Takaisin aloitusn\xe4ytt\xf6\xf6n",n="Takaisin valintoihin",m="Vie tiedot"
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
case"general.genericError":return new A.aKz()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aKB()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aKC(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aKD()
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
case"inputScreen.errors.emptyTerm":return new A.aKE()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aKF()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aKG()
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
case"learnScreen.feedback.incorrect":return new A.aKH()
case"learnScreen.feedback.hint":return new A.aKI()
case"learnScreen.feedback.skipped":return new A.aKJ()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aKK()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aKM(d)
case"learnScreen.progress.startingCycle":return new A.aKN()
case"matchScreen.title":return p
case"matchScreen.congratulations":return"Onneksi olkoon!"
case"matchScreen.timeCompleted":return new A.aKO()
case"matchScreen.playAgain":return"Pelaa uudelleen"
case"matchScreen.backToOptions":return n
case"matchScreen.leaderboard.title":return"Tulostaulu"
case"matchScreen.leaderboard.noRecords":return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"
case"matchScreen.leaderboard.time":return new A.aKP()
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
case"resultsScreen.scoreFraction":return new A.aKQ()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aKR()
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
case"settingsScreen.snackbars.exportError":return new A.aKS()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aKT()
case"settingsScreen.snackbars.importError":return new A.aKU()
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
beh(d){return new A.aLk(d)},
W1:function W1(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aHz:function aHz(){},
aHr:function aHr(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aHf:function aHf(){},
aIE:function aIE(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aHH:function aHH(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIc:function aIc(){},
aHv:function aHv(){},
aHT:function aHT(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aI4:function aI4(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIQ:function aIQ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aIg:function aIg(){},
aIo:function aIo(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aHj:function aHj(){},
aHn:function aHn(){},
aIA:function aIA(){},
aIG:function aIG(){},
aHD:function aHD(){},
aHL:function aHL(){},
aHQ:function aHQ(){},
aHV:function aHV(d,e){this.b=d
this.a=e},
aI6:function aI6(){},
aI0:function aI0(){},
aIM:function aIM(){},
aIq:function aIq(){},
aIk:function aIk(){},
aIv:function aIv(){},
aLk:function aLk(d){this.a=d},
aKz:function aKz(){},
aKB:function aKB(){},
aKC:function aKC(d){this.a=d},
aKD:function aKD(){},
aKE:function aKE(){},
aKF:function aKF(){},
aKG:function aKG(){},
aKH:function aKH(){},
aKI:function aKI(){},
aKJ:function aKJ(){},
aKK:function aKK(){},
aKM:function aKM(d){this.a=d},
aKN:function aKN(){},
aKO:function aKO(){},
aKP:function aKP(){},
aKQ:function aKQ(){},
aKR:function aKR(){},
aKS:function aKS(){},
aKT:function aKT(){},
aKU:function aKU(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[4],A)
A.W1.prototype={
ghT(){var w=this.ch
return w===$?this.ch=this:w},
god(){return"Quizlone"},
gdq(){var w=this,v=w.CW
if(v===$){w.ghT()
w.CW!==$&&B.Y()
v=w.CW=new A.aHz()}return v},
glS(){var w,v=this,u=v.cx
if(u===$){w=v.ghT()
v.cx!==$&&B.Y()
u=v.cx=new A.aHr(w,w)}return u},
gts(){var w=this,v=w.cy
if(v===$){w.ghT()
w.cy!==$&&B.Y()
v=w.cy=new A.aHf()}return v},
gfq(){var w,v=this,u=v.db
if(u===$){w=v.ghT()
v.db!==$&&B.Y()
u=v.db=new A.aIE(w,w)}return u},
gfF(){var w,v=this,u=v.dx
if(u===$){w=v.ghT()
v.dx!==$&&B.Y()
u=v.dx=new A.aHH(w,w)}return u},
gco(){var w=this,v=w.dy
if(v===$){w.ghT()
w.dy!==$&&B.Y()
v=w.dy=new A.aIc()}return v},
gn3(){var w=this,v=w.fr
if(v===$){w.ghT()
w.fr!==$&&B.Y()
v=w.fr=new A.aHv()}return v},
geq(){var w,v=this,u=v.fx
if(u===$){w=v.ghT()
v.fx!==$&&B.Y()
u=v.fx=new A.aHT(w,w)}return u},
gkk(){var w,v=this,u=v.fy
if(u===$){w=v.ghT()
v.fy!==$&&B.Y()
u=v.fy=new A.aI4(w,w)}return u},
gll(){var w,v=this,u=v.go
if(u===$){w=v.ghT()
v.go!==$&&B.Y()
u=v.go=new A.aIQ(w,w)}return u},
ghI(){var w=this,v=w.id
if(v===$){w.ghT()
w.id!==$&&B.Y()
v=w.id=new A.aIg()}return v},
gcr(){var w,v=this,u=v.k1
if(u===$){w=v.ghT()
v.k1!==$&&B.Y()
u=v.k1=new A.aIo(w,w)}return u},
gfh(){var w=this,v=w.k2
if(v===$){w.ghT()
w.k2!==$&&B.Y()
v=w.k2=new A.aHj()}return v},
gmm(){return this.ay}}
A.aHz.prototype={
gxG(){return"Takaisin"},
gog(){return"Peruuta"},
gre(){return"Poista"},
gjs(){return"Seuraava"},
goW(){return"Edellinen"},
gw2(){return"L\xe4het\xe4"},
gxt(){return"Kaikki"},
gzO(){return"Ladataan..."},
hf(d){return"Virhe: "+d},
gAD(){return"Nollaa"}}
A.aHr.prototype={
gvM(){return"Asetukset"},
gxY(){return"Ohjaimet"},
gtq(){return"Tietoja"},
gtr(){var w=this.d
return w===$?this.d=new A.aHn():w}}
A.aHf.prototype={
B3(d){return"Versio "+d},
gB4(){return"N\xe4yt\xe4 lisenssit"}}
A.aIE.prototype={
gau(){return"Quizlone"},
gB7(){return"Tervetuloa!"},
gyd(){return"Luo uusi lista"},
gzN(){return"Lataa tallennettu lista"},
gA4(){return"Listoja ei ole viel\xe4 tallennettu."},
v5(d){var w=B.eZ("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtP(){var w=this.e
return w===$?this.e=new A.aIA():w},
gnp(){var w=this.f
return w===$?this.f=new A.aIG():w}}
A.aHH.prototype={
gau(){return"Luo uusi lista"},
guG(){return"Listan nimi"},
gzI(){return"esim. Luvun 1 sanasto"},
gAj(){return"Liit\xe4 termit alle:"},
gAk(){return y.U},
gAQ(){return y.l},
gvA(){return"Tallenna lista"},
gd0(){var w=this.d
return w===$?this.d=new A.aHD():w}}
A.aIc.prototype={
gau(){return"Valinnat & Tila"},
gng(){return y.j},
ghJ(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gz_(){return"Muistikorttien asetukset"},
gvR(){return"N\xe4yt\xe4 ensin termi"},
gvP(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gtB(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gtA(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gw1(){return"Opiskelun pituus:"},
gBa(){return"Kirjallinen vastaus"},
gA_(){return"Monivalinta"},
gz0(){return"Muistikortit"},
guD(){return"Opi"},
gv6(){return"Testi"},
gzR(){return"Yhdist\xe4peli"}}
A.aHv.prototype={
gau(){return"Muistikortit"},
gA2(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
ger(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvT(d){return"Sekoita"},
gAG(){return"Aloita alusta"}}
A.aHT.prototype={
gau(){return"Opi"},
gAH(){return"Aloita oppimisistunto alusta"},
gkP(){return"Takaisin valintoihin"},
gtw(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gn7(){return"Vihje"},
gvU(d){return"Ohita"},
gd0(){var w=this.f
return w===$?this.f=new A.aHL():w},
goB(){var w=this.r
return w===$?this.r=new A.aHQ():w},
gm8(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aHV(w,w)}return v}}
A.aI4.prototype={
gau(){return"Yhdist\xe4peli"},
gkR(){return"Onneksi olkoon!"},
gAo(){return"Pelaa uudelleen"},
gkP(){return"Takaisin valintoihin"},
gqF(){var w=this.e
return w===$?this.e=new A.aI6():w},
gd0(){var w=this.f
return w===$?this.f=new A.aI0():w}}
A.aIQ.prototype={
gau(){return"Testi"},
glb(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gB5(){return"N\xe4yt\xe4 tulokset"},
gw3(){return"L\xe4het\xe4 testi"},
gd0(){var w=this.d
return w===$?this.d=new A.aIM():w}}
A.aIg.prototype={
gau(){return"Testin tulokset"},
glb(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gBc(){return"Pisteesi"},
vE(d,e){return""+d+" / "+e+" oikein"},
gr_(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Bb(d){return"Vastauksesi: "+d},
gA1(){return"(Ei vastausta)"},
gkR(){return"Onneksi olkoon! Sait kaiken oikein!"},
gAK(){return"Yrit\xe4 testi\xe4 uudelleen"},
gAM(){return"Kertaa muistikorteilla"}}
A.aIo.prototype={
gau(){return"Asetukset"},
gxw(){return"Ulkoasu"},
guB(){return"Kieli"},
gzB(){return"Valitse kieli"},
gvc(){return"N\xe4yt\xf6n skaalaus"},
gAZ(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
grI(){return"J\xe4rjestelm\xe4n oletus"},
gzG(){return"Vaalea"},
gyj(){return"Tumma"},
gyG(){return"Englanti"},
gyZ(){return"Suomi"},
gAP(){return"Ven\xe4j\xe4"},
gvX(){return"Espanja"},
gw8(){return"Ruotsi"},
gyl(){return"Tietojen hallinta"},
gyM(){return"Vie tiedot"},
gyN(){return"Tallenna kaikki listat tiedostoon"},
gzg(){return"Tuo tiedot"},
gzh(){return"Lataa listat tiedostosta"},
gyq(){return"Poista kaikki tiedot"},
gqv(){var w=this.w
return w===$?this.w=new A.aIq():w},
gpZ(){var w=this.x
return w===$?this.x=new A.aIk():w},
gmv(){var w=this.y
return w===$?this.y=new A.aIv():w}}
A.aHj.prototype={
gau(){return"Ohjaimet"},
gvj(){return"Liikkeet (Muistikortit)"},
gzy(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
goO(){return"Seuraava kortti"},
goX(){return"Edellinen kortti"},
goF(){return"K\xe4\xe4nn\xe4 kortti"},
gw9(){return"Pyyhk\xe4ise vasemmalle"},
gwa(){return"Pyyhk\xe4ise oikealle"},
gwb(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gxB(){return"Oikea nuolin\xe4pp\xe4in"},
gxA(){return"Vasen nuolin\xe4pp\xe4in"},
gxC(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aHn.prototype={
gzE(){return"\xa9 2025 Quizlone"},
gys(){return y.R}}
A.aIA.prototype={
gau(){return"Vahvista poisto"},
xX(d){return"Haluatko varmasti poistaa listan '"+d+"'?"}}
A.aIG.prototype={
gau(){return"Nime\xe4 lista uudelleen"},
guY(){return"Nime\xe4 uudelleen"},
gyI(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gyH(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aHD.prototype={
gzH(){return"Listan nimi ei voi olla tyhj\xe4."},
ger(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gzs(){return y.r},
yC(d){return"Muotovirhe rivin "+d+y.J},
gA6(){return y.c},
vy(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aHL.prototype={
ger(){return y.b},
gh7(){return y.B}}
A.aHQ.prototype={
gy9(){return"Oikein!"},
zk(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
zc(d){return'Vihje: Alkaa kirjaimella "'+d+'"'},
vV(d){return"Ohitettu. Vastaus oli: "+d}}
A.aHV.prototype={
gxv(){return"Kaikki termit opittu!"},
tV(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gvJ(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
zT(d){var w=B.eZ("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vZ(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aI6.prototype={
gau(){return"Tulostaulu"},
gA5(){return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"},
AU(d){return d+" sekuntia"}}
A.aI0.prototype={
gh7(){return y.L}}
A.aIM.prototype={
gzM(){return y.P},
ger(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gh7(){return y._}}
A.aIq.prototype={
gau(){return"Vahvista tuonti"},
gkS(){return y.u},
gvw(){return"Tuo"}}
A.aIk.prototype={
gau(){return"Vahvista poisto"},
gkS(){return y.N},
gyp(){return"Poista kaikki"}}
A.aIv.prototype={
gA3(){return"Ei viet\xe4vi\xe4 tietoja."},
yO(d){return"Virhe tietojen vienniss\xe4: "+d},
zj(d){return""+d+" listaa tuotu onnistuneesti!"},
zi(d){return"Virhe tietojen tuonnissa: "+d},
gxu(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aLk.prototype={
$1(d){return A.bed(this.a,d)},
$S:53}
A.aKz.prototype={
$1$error(d){return"Virhe: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKB.prototype={
$1$version(d){return"Versio "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:92}
A.aKC.prototype={
$1$count(d){var w
this.a.ghT()
w=B.eZ("fi")
return w.$3$one$other(d,"1 termi",B.h(d)+" termi\xe4")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:41}
A.aKD.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:94}
A.aKE.prototype={
$1$line(d){return"Muotovirhe rivin "+B.h(d)+y.J},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:77}
A.aKF.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKG.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:88}
A.aKH.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aKI.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:74}
A.aKJ.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aKK.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.h(d)+" | Kohde "+B.h(e)+" / "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:80}
A.aKM.prototype={
$1$count(d){var w
this.a.ghT()
w=B.eZ("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.h(d)+" kohdetta viel\xe4 kertaamatta.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:41}
A.aKN.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.h(e)+", jossa on "+B.h(d)+" kohdetta..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:75}
A.aKO.prototype={
$1$time(d){return"Suoritit pelin "+B.h(d)+" sekunnissa!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aKP.prototype={
$1$time(d){return B.h(d)+" sekuntia"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aKQ.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" oikein"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:82}
A.aKR.prototype={
$1$answer(d){return"Vastauksesi: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aKS.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aKT.prototype={
$1$count(d){return B.h(d)+" listaa tuotu onnistuneesti!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:85}
A.aKU.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.W1,B.di)
w(A.aHz,B.ut)
w(A.aHr,B.ur)
w(A.aHf,B.uo)
w(A.aIE,B.uK)
w(A.aHH,B.uu)
w(A.aIc,B.uD)
w(A.aHv,B.us)
w(A.aHT,B.uw)
w(A.aI4,B.uA)
w(A.aIQ,B.uM)
w(A.aIg,B.uE)
w(A.aIo,B.uG)
w(A.aHj,B.up)
w(A.aHn,B.uq)
w(A.aIA,B.uJ)
w(A.aIG,B.uL)
w(A.aHD,B.uv)
w(A.aHL,B.ux)
w(A.aHQ,B.uy)
w(A.aHV,B.uz)
w(A.aI6,B.uC)
w(A.aI0,B.uB)
w(A.aIM,B.uN)
w(A.aIq,B.uH)
w(A.aIk,B.uF)
w(A.aIv,B.uI)
v(B.j6,[A.aLk,A.aKz,A.aKB,A.aKC,A.aKD,A.aKE,A.aKF,A.aKG,A.aKH,A.aKI,A.aKJ,A.aKK,A.aKM,A.aKN,A.aKO,A.aKP,A.aKQ,A.aKR,A.aKS,A.aKT,A.aKU])})()
B.a3W(b.typeUniverse,JSON.parse('{"W1":{"di":[],"hL":["dD","di"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",L:"Pelaamiseen tarvitaan v\xe4hint\xe4\xe4n yksi termi/m\xe4\xe4ritelm\xe4-pari.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.af("ha<dD,di>")}};
(a=>{a["Pc/WcEmtxvW4A+apgBpys3LZwpA="]=a.current})($__dart_deferred_initializers__);