((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={
aXZ(d,e,f){var w,v,u=null,t=new B.hc(d,x.c),s=new B.hc(d,x.c)
s=new A.Wf(t,s)
s.ww(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bf6(s)
return s},
bf2(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Yhdist\xe4peli",o="Takaisin aloitusn\xe4ytt\xf6\xf6n",n="Takaisin valintoihin",m="Vie tiedot"
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
case"general.genericError":return new A.aLp()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aLr()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aLs(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aLt()
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
case"inputScreen.errors.emptyTerm":return new A.aLu()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aLv()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aLw()
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
case"learnScreen.feedback.incorrect":return new A.aLx()
case"learnScreen.feedback.hint":return new A.aLy()
case"learnScreen.feedback.skipped":return new A.aLz()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aLA()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aLC(d)
case"learnScreen.progress.startingCycle":return new A.aLD()
case"matchScreen.title":return p
case"matchScreen.congratulations":return"Onneksi olkoon!"
case"matchScreen.timeCompleted":return new A.aLE()
case"matchScreen.playAgain":return"Pelaa uudelleen"
case"matchScreen.backToOptions":return n
case"matchScreen.leaderboard.title":return"Tulostaulu"
case"matchScreen.leaderboard.noRecords":return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"
case"matchScreen.leaderboard.time":return new A.aLF()
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
case"resultsScreen.scoreFraction":return new A.aLG()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aLH()
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
case"settingsScreen.snackbars.exportError":return new A.aLI()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aLJ()
case"settingsScreen.snackbars.importError":return new A.aLK()
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
bf6(d){return new A.aMa(d)},
Wf:function Wf(d,e){var _=this
_.ay=d
_.k2=_.k1=_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=$
_.a=e
_.ax=_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aIp:function aIp(){},
aIh:function aIh(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aI5:function aI5(){},
aJu:function aJu(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aIx:function aIx(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJ2:function aJ2(){},
aIl:function aIl(){},
aIJ:function aIJ(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aIV:function aIV(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aJG:function aJG(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aJ6:function aJ6(){},
aJe:function aJe(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aI9:function aI9(){},
aId:function aId(){},
aJq:function aJq(){},
aJw:function aJw(){},
aIt:function aIt(){},
aIB:function aIB(){},
aIG:function aIG(){},
aIL:function aIL(d,e){this.b=d
this.a=e},
aIX:function aIX(){},
aIR:function aIR(){},
aJC:function aJC(){},
aJg:function aJg(){},
aJa:function aJa(){},
aJl:function aJl(){},
aMa:function aMa(d){this.a=d},
aLp:function aLp(){},
aLr:function aLr(){},
aLs:function aLs(d){this.a=d},
aLt:function aLt(){},
aLu:function aLu(){},
aLv:function aLv(){},
aLw:function aLw(){},
aLx:function aLx(){},
aLy:function aLy(){},
aLz:function aLz(){},
aLA:function aLA(){},
aLC:function aLC(d){this.a=d},
aLD:function aLD(){},
aLE:function aLE(){},
aLF:function aLF(){},
aLG:function aLG(){},
aLH:function aLH(){},
aLI:function aLI(){},
aLJ:function aLJ(){},
aLK:function aLK(){}}
B=c[0]
C=c[2]
A=a.updateHolder(c[4],A)
A.Wf.prototype={
ghY(){var w=this.ch
return w===$?this.ch=this:w},
gos(){return"Quizlone"},
gds(){var w=this,v=w.CW
if(v===$){w.ghY()
w.CW!==$&&B.Y()
v=w.CW=new A.aIp()}return v},
glX(){var w,v=this,u=v.cx
if(u===$){w=v.ghY()
v.cx!==$&&B.Y()
u=v.cx=new A.aIh(w,w)}return u},
gtJ(){var w=this,v=w.cy
if(v===$){w.ghY()
w.cy!==$&&B.Y()
v=w.cy=new A.aI5()}return v},
gft(){var w,v=this,u=v.db
if(u===$){w=v.ghY()
v.db!==$&&B.Y()
u=v.db=new A.aJu(w,w)}return u},
gfI(){var w,v=this,u=v.dx
if(u===$){w=v.ghY()
v.dx!==$&&B.Y()
u=v.dx=new A.aIx(w,w)}return u},
gck(){var w=this,v=w.dy
if(v===$){w.ghY()
w.dy!==$&&B.Y()
v=w.dy=new A.aJ2()}return v},
gnd(){var w=this,v=w.fr
if(v===$){w.ghY()
w.fr!==$&&B.Y()
v=w.fr=new A.aIl()}return v},
ger(){var w,v=this,u=v.fx
if(u===$){w=v.ghY()
v.fx!==$&&B.Y()
u=v.fx=new A.aIJ(w,w)}return u},
gkr(){var w,v=this,u=v.fy
if(u===$){w=v.ghY()
v.fy!==$&&B.Y()
u=v.fy=new A.aIV(w,w)}return u},
glq(){var w,v=this,u=v.go
if(u===$){w=v.ghY()
v.go!==$&&B.Y()
u=v.go=new A.aJG(w,w)}return u},
ghN(){var w=this,v=w.id
if(v===$){w.ghY()
w.id!==$&&B.Y()
v=w.id=new A.aJ6()}return v},
gcw(){var w,v=this,u=v.k1
if(u===$){w=v.ghY()
v.k1!==$&&B.Y()
u=v.k1=new A.aJe(w,w)}return u},
gfk(){var w=this,v=w.k2
if(v===$){w.ghY()
w.k2!==$&&B.Y()
v=w.k2=new A.aI9()}return v},
gms(){return this.ay}}
A.aIp.prototype={
gy_(){return"Takaisin"},
gov(){return"Peruuta"},
grw(){return"Poista"},
gjz(){return"Seuraava"},
gpg(){return"Edellinen"},
gwl(){return"L\xe4het\xe4"},
gxN(){return"Kaikki"},
gA6(){return"Ladataan..."},
hj(d){return"Virhe: "+d},
gAX(){return"Nollaa"}}
A.aIh.prototype={
gw3(){return"Asetukset"},
gyj(){return"Ohjaimet"},
gtH(){return"Tietoja"},
gtI(){var w=this.d
return w===$?this.d=new A.aId():w}}
A.aI5.prototype={
Bn(d){return"Versio "+d},
gBo(){return"N\xe4yt\xe4 lisenssit"}}
A.aJu.prototype={
gau(){return"Quizlone"},
gBr(){return"Tervetuloa!"},
gyx(){return"Luo uusi lista"},
gA5(){return"Lataa tallennettu lista"},
gAm(){return"Listoja ei ole viel\xe4 tallennettu."},
vl(d){var w=B.f2("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gu4(){var w=this.e
return w===$?this.e=new A.aJq():w},
gnC(){var w=this.f
return w===$?this.f=new A.aJw():w}}
A.aIx.prototype={
gau(){return"Luo uusi lista"},
guW(){return"Listan nimi"},
gA0(){return"esim. Luvun 1 sanasto"},
gAB(){return"Liit\xe4 termit alle:"},
gAC(){return y.U},
gB9(){return y.l},
gvS(){return"Tallenna lista"},
gd2(){var w=this.d
return w===$?this.d=new A.aIt():w}}
A.aJ2.prototype={
gau(){return"Valinnat & Tila"},
gnt(){return y.j},
ghO(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gzh(){return"Muistikorttien asetukset"},
gw8(){return"N\xe4yt\xe4 ensin termi"},
gw6(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gwk(){return"Oppimisen & Testin asetukset"},
gtS(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gtR(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gwj(){return"Opiskelun pituus:"},
gBu(){return"Kirjallinen vastaus"},
gAh(){return"Monivalinta"},
gAV(){return"Hyv\xe4ksy yksi pilkulla erotettu vastaus"},
gAW(){return y.E},
gzi(){return"Muistikortit"},
gzW(){return"Opi"},
gvm(){return"Testi"},
gA9(){return"Yhdist\xe4peli"}}
A.aIl.prototype={
gau(){return"Muistikortit"},
gAk(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
geu(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gwa(d){return"Sekoita"},
gB_(){return"Aloita alusta"}}
A.aIJ.prototype={
gau(){return"Opi"},
gB0(){return"Aloita oppimisistunto alusta"},
gkV(){return"Takaisin valintoihin"},
gtN(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gnh(){return"Vihje"},
gwb(d){return"Ohita"},
gd2(){var w=this.f
return w===$?this.f=new A.aIB():w},
goQ(){var w=this.r
return w===$?this.r=new A.aIG():w},
gmd(){var w,v=this.w
if(v===$){w=this.e
v=this.w=new A.aIL(w,w)}return v}}
A.aIV.prototype={
gau(){return"Yhdist\xe4peli"},
gkX(){return"Onneksi olkoon!"},
gAG(){return"Pelaa uudelleen"},
gkV(){return"Takaisin valintoihin"},
gqW(){var w=this.e
return w===$?this.e=new A.aIX():w},
gd2(){var w=this.f
return w===$?this.f=new A.aIR():w}}
A.aJG.prototype={
gau(){return"Testi"},
glg(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gBp(){return"N\xe4yt\xe4 tulokset"},
gwm(){return"L\xe4het\xe4 testi"},
gd2(){var w=this.d
return w===$?this.d=new A.aJC():w}}
A.aJ6.prototype={
gau(){return"Testin tulokset"},
glg(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gBw(){return"Pisteesi"},
vW(d,e){return""+d+" / "+e+" oikein"},
grh(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Bv(d){return"Vastauksesi: "+d},
gAj(){return"(Ei vastausta)"},
gkX(){return"Onneksi olkoon! Sait kaiken oikein!"},
gB3(){return"Yrit\xe4 testi\xe4 uudelleen"},
gB5(){return"Kertaa muistikorteilla"}}
A.aJe.prototype={
gau(){return"Asetukset"},
gxQ(){return"Ulkoasu"},
guS(){return"Kieli"},
gzT(){return"Valitse kieli"},
gvu(){return"N\xe4yt\xf6n skaalaus"},
gBi(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
grZ(){return"J\xe4rjestelm\xe4n oletus"},
gzZ(){return"Vaalea"},
gyD(){return"Tumma"},
gz_(){return"Englanti"},
gzg(){return"Suomi"},
gB8(){return"Ven\xe4j\xe4"},
gwe(){return"Espanja"},
gwr(){return"Ruotsi"},
gyF(){return"Tietojen hallinta"},
gz5(){return"Vie tiedot"},
gz6(){return"Tallenna kaikki listat tiedostoon"},
gzy(){return"Tuo tiedot"},
gzz(){return"Lataa listat tiedostosta"},
gyK(){return"Poista kaikki tiedot"},
gqN(){var w=this.w
return w===$?this.w=new A.aJg():w},
gqe(){var w=this.x
return w===$?this.x=new A.aJa():w},
gmB(){var w=this.y
return w===$?this.y=new A.aJl():w}}
A.aI9.prototype={
gau(){return"Ohjaimet"},
gvB(){return"Liikkeet (Muistikortit)"},
gzQ(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
gp9(){return"Seuraava kortti"},
gph(){return"Edellinen kortti"},
goY(){return"K\xe4\xe4nn\xe4 kortti"},
gws(){return"Pyyhk\xe4ise vasemmalle"},
gwt(){return"Pyyhk\xe4ise oikealle"},
gwu(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gxV(){return"Oikea nuolin\xe4pp\xe4in"},
gxU(){return"Vasen nuolin\xe4pp\xe4in"},
gxW(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aId.prototype={
gzX(){return"\xa9 2025 Quizlone"},
gyM(){return y.R}}
A.aJq.prototype={
gau(){return"Vahvista poisto"},
yi(d){return"Haluatko varmasti poistaa listan '"+d+"'?"}}
A.aJw.prototype={
gau(){return"Nime\xe4 lista uudelleen"},
gvd(){return"Nime\xe4 uudelleen"},
gz1(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gz0(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aIt.prototype={
gA_(){return"Listan nimi ei voi olla tyhj\xe4."},
geu(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gzK(){return y.r},
yW(d){return"Muotovirhe rivin "+d+y.J},
gAo(){return y.c},
vQ(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aIB.prototype={
geu(){return y.b},
gh9(){return y.B}}
A.aIG.prototype={
gyt(){return"Oikein!"},
zC(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
zu(d){return'Vihje: Alkaa kirjaimella "'+d+'"'},
wc(d){return"Ohitettu. Vastaus oli: "+d}}
A.aIL.prototype={
gxP(){return"Kaikki termit opittu!"},
ua(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gw0(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
Aa(d){var w=B.f2("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
wg(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aIX.prototype={
gau(){return"Tulostaulu"},
gAn(){return"Ei viel\xe4 tuloksia. Ole ensimm\xe4inen!"},
Bd(d){return d+" sekuntia"}}
A.aIR.prototype={
gh9(){return y.L}}
A.aJC.prototype={
gA4(){return y.P},
geu(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gh9(){return y._}}
A.aJg.prototype={
gau(){return"Vahvista tuonti"},
gkY(){return y.u},
gvO(){return"Tuo"}}
A.aJa.prototype={
gau(){return"Vahvista poisto"},
gkY(){return y.N},
gyJ(){return"Poista kaikki"}}
A.aJl.prototype={
gAl(){return"Ei viet\xe4vi\xe4 tietoja."},
z7(d){return"Virhe tietojen vienniss\xe4: "+d},
zB(d){return""+d+" listaa tuotu onnistuneesti!"},
zA(d){return"Virhe tietojen tuonnissa: "+d},
gxO(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aMa.prototype={
$1(d){return A.bf2(this.a,d)},
$S:60}
A.aLp.prototype={
$1$error(d){return"Virhe: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLr.prototype={
$1$version(d){return"Versio "+B.h(d)},
$C:"$1$version",
$R:0,
$D(){return{version:C.j}},
$S:93}
A.aLs.prototype={
$1$count(d){var w
this.a.ghY()
w=B.f2("fi")
return w.$3$one$other(d,"1 termi",B.h(d)+" termi\xe4")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:42}
A.aLt.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.h(d)+"'?"},
$C:"$1$listName",
$R:0,
$D(){return{listName:C.j}},
$S:94}
A.aLu.prototype={
$1$line(d){return"Muotovirhe rivin "+B.h(d)+y.J},
$C:"$1$line",
$R:0,
$D(){return{line:C.j}},
$S:83}
A.aLv.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLw.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.h(d)},
$C:"$1$id",
$R:0,
$D(){return{id:C.j}},
$S:85}
A.aLx.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLy.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.h(d)+'"'},
$C:"$1$char",
$R:0,
$D(){return{char:C.j}},
$S:89}
A.aLz.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLA.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.h(d)+" | Kohde "+B.h(e)+" / "+B.h(f)},
$C:"$3$cycleNum$itemNum$total",
$R:0,
$D(){return{cycleNum:C.j,itemNum:C.j,total:C.j}},
$S:92}
A.aLC.prototype={
$1$count(d){var w
this.a.ghY()
w=B.f2("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.h(d)+" kohdetta viel\xe4 kertaamatta.")},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:42}
A.aLD.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.h(e)+", jossa on "+B.h(d)+" kohdetta..."},
$C:"$2$count$cycleNum",
$R:0,
$D(){return{count:C.j,cycleNum:C.j}},
$S:75}
A.aLE.prototype={
$1$time(d){return"Suoritit pelin "+B.h(d)+" sekunnissa!"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aLF.prototype={
$1$time(d){return B.h(d)+" sekuntia"},
$C:"$1$time",
$R:0,
$D(){return{time:C.j}},
$S:39}
A.aLG.prototype={
$2$score$total(d,e){return B.h(d)+" / "+B.h(e)+" oikein"},
$C:"$2$score$total",
$R:0,
$D(){return{score:C.j,total:C.j}},
$S:82}
A.aLH.prototype={
$1$answer(d){return"Vastauksesi: "+B.h(d)},
$C:"$1$answer",
$R:0,
$D(){return{answer:C.j}},
$S:23}
A.aLI.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13}
A.aLJ.prototype={
$1$count(d){return B.h(d)+" listaa tuotu onnistuneesti!"},
$C:"$1$count",
$R:0,
$D(){return{count:C.j}},
$S:78}
A.aLK.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.h(d)},
$C:"$1$error",
$R:0,
$D(){return{error:C.j}},
$S:13};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Wf,B.di)
w(A.aIp,B.uB)
w(A.aIh,B.uz)
w(A.aI5,B.uw)
w(A.aJu,B.uS)
w(A.aIx,B.uC)
w(A.aJ2,B.uL)
w(A.aIl,B.uA)
w(A.aIJ,B.uE)
w(A.aIV,B.uI)
w(A.aJG,B.uU)
w(A.aJ6,B.uM)
w(A.aJe,B.uO)
w(A.aI9,B.ux)
w(A.aId,B.uy)
w(A.aJq,B.uR)
w(A.aJw,B.uT)
w(A.aIt,B.uD)
w(A.aIB,B.uF)
w(A.aIG,B.uG)
w(A.aIL,B.uH)
w(A.aIX,B.uK)
w(A.aIR,B.uJ)
w(A.aJC,B.uV)
w(A.aJg,B.uP)
w(A.aJa,B.uN)
w(A.aJl,B.uQ)
v(B.jc,[A.aMa,A.aLp,A.aLr,A.aLs,A.aLt,A.aLu,A.aLv,A.aLw,A.aLx,A.aLy,A.aLz,A.aLA,A.aLC,A.aLD,A.aLE,A.aLF,A.aLG,A.aLH,A.aLI,A.aLJ,A.aLK])})()
B.a4f(b.typeUniverse,JSON.parse('{"Wf":{"di":[],"hN":["dG","di"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",E:"Jos oikea vastaus on 'a, b', 'a' hyv\xe4ksyt\xe4\xe4n",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",L:"Pelaamiseen tarvitaan v\xe4hint\xe4\xe4n yksi termi/m\xe4\xe4ritelm\xe4-pari.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.ag("hc<dG,di>")}};
(a=>{a["sbfgXzq2MNZn3At2P91Fxc3N894="]=a.current})($__dart_deferred_initializers__);