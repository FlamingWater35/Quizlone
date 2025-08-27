((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aSG(d,e,f){var w,v,u=null,t=new B.h_(d,x.c),s=new B.h_(d,x.c)
s=new A.V1(t,s)
s.vu(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b8W(s)
return s},
b8S(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Muistikortit",q="Takaisin aloitusn\xe4ytt\xf6\xf6n",p="Vie tiedot"
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
case"general.genericError":return new A.aGt()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aGu()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aGv(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aGw()
case"inputScreen.title":return t
case"inputScreen.listName":return"Listan nimi"
case"inputScreen.listNameHint":return"esim. Luvun 1 sanasto"
case"inputScreen.pasteTerms":return"Liit\xe4 termit alle:"
case"inputScreen.pasteTermsHint":return y.U
case"inputScreen.termsHint":return y.l
case"inputScreen.saveList":return"Tallenna lista"
case"inputScreen.errors.listNameEmpty":return"Listan nimi ei voi olla tyhj\xe4."
case"inputScreen.errors.noTerms":return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."
case"inputScreen.errors.invalidFormat":return y.r
case"inputScreen.errors.emptyTerm":return new A.aGx()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aGz()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aGA()
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
case"modeSelectionScreen.flashcards":return r
case"modeSelectionScreen.learn":return"Opi"
case"modeSelectionScreen.test":return"Testi"
case"modeSelectionScreen.backToWelcome":return q
case"flashcardScreen.title":return r
case"flashcardScreen.noCards":return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."
case"flashcardScreen.noTerms":return"Opiskeltavia termej\xe4 ei ole saatavilla."
case"flashcardScreen.shuffle":return"Sekoita"
case"flashcardScreen.restart":return"Aloita alusta"
case"learnScreen.title":return"Opi"
case"learnScreen.restartSession":return"Aloita oppimisistunto alusta"
case"learnScreen.backToOptions":return"Takaisin valintoihin"
case"learnScreen.preparing":return"Valmistellaan seuraavaa kysymyst\xe4..."
case"learnScreen.answerHint":return"Kirjoita vastauksesi t\xe4h\xe4n..."
case"learnScreen.incorrect":return"V\xe4\xe4rin"
case"learnScreen.hint":return"Vihje"
case"learnScreen.skip":return"Ohita"
case"learnScreen.backToModeSelection":return"Takaisin tilan valintaan"
case"learnScreen.errors.noTerms":return y.b
case"learnScreen.errors.notEnoughTerms":return y.B
case"learnScreen.feedback.correct":return"Oikein!"
case"learnScreen.feedback.incorrect":return new A.aGB()
case"learnScreen.feedback.hint":return new A.aGC()
case"learnScreen.feedback.skipped":return new A.aGD()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aGE()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aGF(d)
case"learnScreen.progress.startingCycle":return new A.aGG()
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
case"resultsScreen.scoreFraction":return new A.aGH()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aGI()
case"resultsScreen.noAnswer":return"(Ei vastausta)"
case"resultsScreen.congratulations":return"Onneksi olkoon! Sait kaiken oikein!"
case"resultsScreen.retryTest":return"Yrit\xe4 testi\xe4 uudelleen"
case"resultsScreen.reviewFlashcards":return"Kertaa muistikorteilla"
case"resultsScreen.backToWelcome":return q
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
case"settingsScreen.exportData":return p
case"settingsScreen.exportDataSubtitle":return"Tallenna kaikki listat tiedostoon"
case"settingsScreen.importData":return"Tuo tiedot"
case"settingsScreen.importDataSubtitle":return"Lataa listat tiedostosta"
case"settingsScreen.deleteAllData":return"Poista kaikki tiedot"
case"settingsScreen.exportDialog.title":return p
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
case"settingsScreen.snackbars.exportError":return new A.aGK()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aGL()
case"settingsScreen.snackbars.importError":return new A.aGM()
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
b8W(d){return new A.aHa(d)},
V1:function V1(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aDU:function aDU(){},
aDM:function aDM(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aDA:function aDA(){},
aEN:function aEN(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aE1:function aE1(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEl:function aEl(){},
aDQ:function aDQ(){},
aEd:function aEd(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aEV:function aEV(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEp:function aEp(){},
aEx:function aEx(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aDE:function aDE(){},
aDI:function aDI(){},
aEJ:function aEJ(){},
aDY:function aDY(){},
aE5:function aE5(){},
aEa:function aEa(){},
aEf:function aEf(d,e){this.b=d
this.a=e},
aER:function aER(){},
aEz:function aEz(){},
aEt:function aEt(){},
aEE:function aEE(){},
aHa:function aHa(d){this.a=d},
aGt:function aGt(){},
aGu:function aGu(){},
aGv:function aGv(d){this.a=d},
aGw:function aGw(){},
aGx:function aGx(){},
aGz:function aGz(){},
aGA:function aGA(){},
aGB:function aGB(){},
aGC:function aGC(){},
aGD:function aGD(){},
aGE:function aGE(){},
aGF:function aGF(d){this.a=d},
aGG:function aGG(){},
aGH:function aGH(){},
aGI:function aGI(){},
aGK:function aGK(){},
aGL:function aGL(){},
aGM:function aGM(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.V1.prototype={
ghX(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnt(d){return"Quizlone"},
ges(){var w=this,v=w.ch
if(v===$){w.ghX()
w.ch!==$&&B.v()
v=w.ch=new A.aDU()}return v},
glo(){var w,v=this,u=v.CW
if(u===$){w=v.ghX()
v.CW!==$&&B.v()
u=v.CW=new A.aDM(w,w)}return u},
grM(){var w=this,v=w.cx
if(v===$){w.ghX()
w.cx!==$&&B.v()
v=w.cx=new A.aDA()}return v},
git(){var w,v=this,u=v.cy
if(u===$){w=v.ghX()
v.cy!==$&&B.v()
u=v.cy=new A.aEN(w,w)}return u},
gfS(){var w,v=this,u=v.db
if(u===$){w=v.ghX()
v.db!==$&&B.v()
u=v.db=new A.aE1(w,w)}return u},
gen(){var w=this,v=w.dx
if(v===$){w.ghX()
w.dx!==$&&B.v()
v=w.dx=new A.aEl()}return v},
gmp(){var w=this,v=w.dy
if(v===$){w.ghX()
w.dy!==$&&B.v()
v=w.dy=new A.aDQ()}return v},
gef(){var w,v=this,u=v.fr
if(u===$){w=v.ghX()
v.fr!==$&&B.v()
u=v.fr=new A.aEd(w,w)}return u},
gkX(){var w,v=this,u=v.fx
if(u===$){w=v.ghX()
v.fx!==$&&B.v()
u=v.fx=new A.aEV(w,w)}return u},
gfq(){var w=this,v=w.fy
if(v===$){w.ghX()
w.fy!==$&&B.v()
v=w.fy=new A.aEp()}return v},
gci(){var w,v=this,u=v.go
if(u===$){w=v.ghX()
v.go!==$&&B.v()
u=v.go=new A.aEx(w,w)}return u},
gf1(){var w=this,v=w.id
if(v===$){w.ghX()
w.id!==$&&B.v()
v=w.id=new A.aDE()}return v},
glN(){return this.ax}}
A.aDU.prototype={
gwU(d){return"Takaisin"},
giO(d){return"Peruuta"},
gqs(d){return"Poista"},
gig(d){return"Seuraava"},
goa(){return"Edellinen"},
gvf(d){return"L\xe4het\xe4"},
gwG(){return"Kaikki"},
gyY(){return"Ladataan..."},
l2(d){return"Virhe: "+d},
gzH(d){return"Nollaa"}}
A.aDM.prototype={
guX(){return"Asetukset"},
gxd(d){return"Ohjaimet"},
grK(){return"Tietoja"},
grL(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aDI()}return w}}
A.aDA.prototype={
A5(d,e){return"Versio "+e},
gA6(){return"N\xe4yt\xe4 lisenssit"}}
A.aEN.prototype={
gaC(d){return"Quizlone"},
gA9(){return"Tervetuloa!"},
gxp(){return"Luo uusi lista"},
gyX(){return"Lataa tallennettu lista"},
gze(){return"Listoja ei ole viel\xe4 tallennettu."},
uj(d){var w=B.eR("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gt6(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEJ()}return w}}
A.aE1.prototype={
gaC(d){return"Luo uusi lista"},
gyR(){return"Listan nimi"},
gyT(){return"esim. Luvun 1 sanasto"},
gzs(){return"Liit\xe4 termit alle:"},
gzt(){return y.U},
gzT(){return y.l},
guM(){return"Tallenna lista"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aDY()}return w}}
A.aEl.prototype={
gaC(d){return"Valinnat & Tila"},
gza(){return y.j},
xA(d){return"Debug: Nykyinen aktiivinen ID on "+d},
gzN(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gy8(){return"Muistikorttien asetukset"},
gv2(){return"N\xe4yt\xe4 ensin termi"},
gv_(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
grX(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
grW(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gve(){return"Opiskelun pituus:"},
gAe(){return"Kirjallinen vastaus"},
gz8(){return"Monivalinta"},
gy9(){return"Muistikortit"},
gtT(){return"Opi"},
guk(){return"Testi"}}
A.aDQ.prototype={
gaC(d){return"Muistikortit"},
gzc(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
gep(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gv5(d){return"Sekoita"},
gqd(){return"Aloita alusta"}}
A.aEd.prototype={
gaC(d){return"Opi"},
gzL(){return"Aloita oppimisistunto alusta"},
gwV(){return"Takaisin valintoihin"},
gzy(){return"Valmistellaan seuraavaa kysymyst\xe4..."},
gwJ(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gyr(){return"V\xe4\xe4rin"},
gpL(d){return"Vihje"},
gv6(d){return"Ohita"},
ge1(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aE5()}return w},
gnM(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEa()}return w},
glB(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEf(w,w)}return v}}
A.aEV.prototype={
gaC(d){return"Testi"},
gkP(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gA7(){return"N\xe4yt\xe4 tulokset"},
gvh(){return"L\xe4het\xe4 testi"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aER()}return w}}
A.aEp.prototype={
gaC(d){return"Testin tulokset"},
gzi(){return"Testi\xe4 ei ole viel\xe4 l\xe4hetetty."},
gkP(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAg(){return"Pisteesi"},
uP(d,e){return""+d+" / "+e+" oikein"},
gqf(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Af(d){return"Vastauksesi: "+d},
gzb(){return"(Ei vastausta)"},
gxb(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzM(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzP(){return"Kertaa muistikorteilla"},
gwW(){return"Takaisin aloitusn\xe4ytt\xf6\xf6n"}}
A.aEx.prototype={
gaC(d){return"Asetukset"},
gwK(d){return"Ulkoasu"},
gtR(d){return"Kieli"},
gyK(){return"Valitse kieli"},
gur(){return"N\xe4yt\xf6n skaalaus"},
gA_(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gr1(){return"J\xe4rjestelm\xe4n oletus"},
gyQ(){return"Vaalea"},
gxw(){return"Tumma"},
gxR(){return"Englanti"},
gy7(){return"Suomi"},
gzS(){return"Ven\xe4j\xe4"},
gv9(){return"Espanja"},
gvo(){return"Ruotsi"},
gxx(){return"Tietojen hallinta"},
gxV(){return"Vie tiedot"},
gxW(){return"Tallenna kaikki listat tiedostoon"},
gyn(){return"Tuo tiedot"},
gyo(){return"Lataa listat tiedostosta"},
gxD(){return"Poista kaikki tiedot"},
gpM(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aEz()}return w},
gpb(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aEt()}return w},
glX(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aEE()}return w}}
A.aDE.prototype={
gaC(d){return"Ohjaimet"},
gux(){return"Liikkeet (Muistikortit)"},
gyH(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go1(){return"Seuraava kortti"},
gob(){return"Edellinen kortti"},
gnU(){return"K\xe4\xe4nn\xe4 kortti"},
gvp(){return"Pyyhk\xe4ise vasemmalle"},
gvq(){return"Pyyhk\xe4ise oikealle"},
gvr(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gwP(){return"Oikea nuolin\xe4pp\xe4in"},
gwO(){return"Vasen nuolin\xe4pp\xe4in"},
gwQ(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aDI.prototype={
gyO(){return"\xa9 2025 Quizlone"},
gxF(d){return y.R}}
A.aEJ.prototype={
gaC(d){return"Vahvista poisto"},
xc(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aDY.prototype={
gyS(){return"Listan nimi ei voi olla tyhj\xe4."},
gep(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyA(){return y.r},
xO(d){return"Muotovirhe rivin "+d+y.J},
gzf(){return y.c},
uL(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aE5.prototype={
gep(){return y.b},
gkQ(){return y.B}}
A.aEa.prototype={
gxk(){return"Oikein!"},
ys(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yj(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
v7(d){return"Ohitettu. Vastaus oli: "+d}}
A.aEf.prototype={
gwI(){return"Kaikki termit opittu!"},
tb(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
guT(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
z0(d){var w=B.eR("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vb(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aER.prototype={
gyW(){return y.P},
gep(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkQ(){return y._}}
A.aEz.prototype={
gaC(d){return"Vahvista tuonti"},
gku(d){return y.u},
guK(d){return"Tuo"}}
A.aEt.prototype={
gaC(d){return"Vahvista poisto"},
gku(d){return y.N},
gxC(){return"Poista kaikki"}}
A.aEE.prototype={
gzd(){return"Ei viet\xe4vi\xe4 tietoja."},
xX(d){return"Virhe tietojen vienniss\xe4: "+d},
yq(d){return""+d+" listaa tuotu onnistuneesti!"},
yp(d){return"Virhe tietojen tuonnissa: "+d},
gwH(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aHa.prototype={
$1(d){return A.b8S(this.a,d)},
$S:53}
A.aGt.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aGu.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:76}
A.aGv.prototype={
$1$count(d){var w
this.a.ghX()
w=B.eR("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aGw.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:78}
A.aGx.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:92}
A.aGz.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aGA.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:80}
A.aGB.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:22}
A.aGC.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:82}
A.aGD.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:22}
A.aGE.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:83}
A.aGF.prototype={
$1$count(d){var w
this.a.ghX()
w=B.eR("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aGG.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:84}
A.aGH.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:85}
A.aGI.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:22}
A.aGK.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aGL.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:86}
A.aGM.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.V1,B.dh)
w(A.aDU,B.ud)
w(A.aDM,B.ub)
w(A.aDA,B.u8)
w(A.aEN,B.ur)
w(A.aE1,B.ue)
w(A.aEl,B.uk)
w(A.aDQ,B.uc)
w(A.aEd,B.ug)
w(A.aEV,B.us)
w(A.aEp,B.ul)
w(A.aEx,B.un)
w(A.aDE,B.u9)
w(A.aDI,B.ua)
w(A.aEJ,B.uq)
w(A.aDY,B.uf)
w(A.aE5,B.uh)
w(A.aEa,B.ui)
w(A.aEf,B.uj)
w(A.aER,B.ut)
w(A.aEz,B.uo)
w(A.aEt,B.um)
w(A.aEE,B.up)
v(B.j8,[A.aHa,A.aGt,A.aGu,A.aGv,A.aGw,A.aGx,A.aGz,A.aGA,A.aGB,A.aGC,A.aGD,A.aGE,A.aGF,A.aGG,A.aGH,A.aGI,A.aGK,A.aGL,A.aGM])})()
B.a2S(b.typeUniverse,JSON.parse('{"V1":{"dh":[],"hE":["dC","dh"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("h_<dC,dh>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"gmqrl5KtvlUT0qbKaQBu3/dpzeE=");