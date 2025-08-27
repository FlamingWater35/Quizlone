((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aT2(d,e,f){var w,v,u=null,t=new B.h_(d,x.c),s=new B.h_(d,x.c)
s=new A.Va(t,s)
s.vB(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9j(s)
return s},
b9f(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aGQ()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aGR()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aGS(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aGT()
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
case"inputScreen.errors.emptyTerm":return new A.aGU()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aGW()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aGX()
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
case"modeSelectionScreen.backToWelcome":return p
case"flashcardScreen.title":return q
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
case"learnScreen.feedback.incorrect":return new A.aGY()
case"learnScreen.feedback.hint":return new A.aGZ()
case"learnScreen.feedback.skipped":return new A.aH_()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aH0()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aH1(d)
case"learnScreen.progress.startingCycle":return new A.aH2()
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
case"resultsScreen.scoreFraction":return new A.aH3()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aH4()
case"resultsScreen.noAnswer":return"(Ei vastausta)"
case"resultsScreen.congratulations":return"Onneksi olkoon! Sait kaiken oikein!"
case"resultsScreen.retryTest":return"Yrit\xe4 testi\xe4 uudelleen"
case"resultsScreen.reviewFlashcards":return"Kertaa muistikorteilla"
case"resultsScreen.backToWelcome":return p
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
case"settingsScreen.exportData":return o
case"settingsScreen.exportDataSubtitle":return"Tallenna kaikki listat tiedostoon"
case"settingsScreen.importData":return"Tuo tiedot"
case"settingsScreen.importDataSubtitle":return"Lataa listat tiedostosta"
case"settingsScreen.deleteAllData":return"Poista kaikki tiedot"
case"settingsScreen.exportDialog.title":return o
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
case"settingsScreen.snackbars.exportError":return new A.aH6()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aH7()
case"settingsScreen.snackbars.importError":return new A.aH8()
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
b9j(d){return new A.aHx(d)},
Va:function Va(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEc:function aEc(){},
aE4:function aE4(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aDT:function aDT(){},
aF5:function aF5(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEk:function aEk(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEE:function aEE(){},
aE8:function aE8(){},
aEw:function aEw(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFh:function aFh(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEI:function aEI(){},
aEQ:function aEQ(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aDX:function aDX(){},
aE0:function aE0(){},
aF1:function aF1(){},
aF7:function aF7(){},
aEg:function aEg(){},
aEo:function aEo(){},
aEt:function aEt(){},
aEy:function aEy(d,e){this.b=d
this.a=e},
aFd:function aFd(){},
aES:function aES(){},
aEM:function aEM(){},
aEX:function aEX(){},
aHx:function aHx(d){this.a=d},
aGQ:function aGQ(){},
aGR:function aGR(){},
aGS:function aGS(d){this.a=d},
aGT:function aGT(){},
aGU:function aGU(){},
aGW:function aGW(){},
aGX:function aGX(){},
aGY:function aGY(){},
aGZ:function aGZ(){},
aH_:function aH_(){},
aH0:function aH0(){},
aH1:function aH1(d){this.a=d},
aH2:function aH2(){},
aH3:function aH3(){},
aH4:function aH4(){},
aH6:function aH6(){},
aH7:function aH7(){},
aH8:function aH8(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.Va.prototype={
ghZ(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnw(d){return"Quizlone"},
gej(){var w=this,v=w.ch
if(v===$){w.ghZ()
w.ch!==$&&B.v()
v=w.ch=new A.aEc()}return v},
glp(){var w,v=this,u=v.CW
if(u===$){w=v.ghZ()
v.CW!==$&&B.v()
u=v.CW=new A.aE4(w,w)}return u},
grT(){var w=this,v=w.cx
if(v===$){w.ghZ()
w.cx!==$&&B.v()
v=w.cx=new A.aDT()}return v},
gfg(){var w,v=this,u=v.cy
if(u===$){w=v.ghZ()
v.cy!==$&&B.v()
u=v.cy=new A.aF5(w,w)}return u},
gfn(){var w,v=this,u=v.db
if(u===$){w=v.ghZ()
v.db!==$&&B.v()
u=v.db=new A.aEk(w,w)}return u},
geo(){var w=this,v=w.dx
if(v===$){w.ghZ()
w.dx!==$&&B.v()
v=w.dx=new A.aEE()}return v},
gmq(){var w=this,v=w.dy
if(v===$){w.ghZ()
w.dy!==$&&B.v()
v=w.dy=new A.aE8()}return v},
gef(){var w,v=this,u=v.fr
if(u===$){w=v.ghZ()
v.fr!==$&&B.v()
u=v.fr=new A.aEw(w,w)}return u},
gkX(){var w,v=this,u=v.fx
if(u===$){w=v.ghZ()
v.fx!==$&&B.v()
u=v.fx=new A.aFh(w,w)}return u},
gfu(){var w=this,v=w.fy
if(v===$){w.ghZ()
w.fy!==$&&B.v()
v=w.fy=new A.aEI()}return v},
gci(){var w,v=this,u=v.go
if(u===$){w=v.ghZ()
v.go!==$&&B.v()
u=v.go=new A.aEQ(w,w)}return u},
gf1(){var w=this,v=w.id
if(v===$){w.ghZ()
w.id!==$&&B.v()
v=w.id=new A.aDX()}return v},
glO(){return this.ax}}
A.aEc.prototype={
gx_(d){return"Takaisin"},
gi4(d){return"Peruuta"},
gqx(d){return"Poista"},
gik(d){return"Seuraava"},
god(){return"Edellinen"},
gvl(d){return"L\xe4het\xe4"},
gwM(){return"Kaikki"},
gz4(){return"Ladataan..."},
l3(d){return"Virhe: "+d},
gzQ(d){return"Nollaa"}}
A.aE4.prototype={
gv3(){return"Asetukset"},
gxj(d){return"Ohjaimet"},
grR(){return"Tietoja"},
grS(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aE0()}return w}}
A.aDT.prototype={
Ae(d,e){return"Versio "+e},
gAf(){return"N\xe4yt\xe4 lisenssit"}}
A.aF5.prototype={
gaA(d){return"Quizlone"},
gAi(){return"Tervetuloa!"},
gxw(){return"Luo uusi lista"},
gz3(){return"Lataa tallennettu lista"},
gzl(){return"Listoja ei ole viel\xe4 tallennettu."},
ut(d){var w=B.eR("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtd(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aF1()}return w},
gmO(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF7()}return w}}
A.aEk.prototype={
gaA(d){return"Luo uusi lista"},
gu0(){return"Listan nimi"},
gz_(){return"esim. Luvun 1 sanasto"},
gzz(){return"Liit\xe4 termit alle:"},
gzA(){return y.U},
gA1(){return y.l},
guT(){return"Tallenna lista"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEg()}return w}}
A.aEE.prototype={
gaA(d){return"Valinnat & Tila"},
gzh(){return y.j},
xG(d){return"Debug: Nykyinen aktiivinen ID on "+d},
gzW(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyg(){return"Muistikorttien asetukset"},
gv8(){return"N\xe4yt\xe4 ensin termi"},
gv6(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gt3(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gt2(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvk(){return"Opiskelun pituus:"},
gAn(){return"Kirjallinen vastaus"},
gzf(){return"Monivalinta"},
gyh(){return"Muistikortit"},
gu_(){return"Opi"},
guu(){return"Testi"}}
A.aE8.prototype={
gaA(d){return"Muistikortit"},
gzj(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
geq(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvb(d){return"Sekoita"},
gqi(){return"Aloita alusta"}}
A.aEw.prototype={
gaA(d){return"Opi"},
gzU(){return"Aloita oppimisistunto alusta"},
gx0(){return"Takaisin valintoihin"},
gzF(){return"Valmistellaan seuraavaa kysymyst\xe4..."},
gwP(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gyz(){return"V\xe4\xe4rin"},
gpQ(d){return"Vihje"},
gvc(d){return"Ohita"},
ge1(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEo()}return w},
gnP(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEt()}return w},
glC(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEy(w,w)}return v}}
A.aFh.prototype={
gaA(d){return"Testi"},
gkP(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAg(){return"N\xe4yt\xe4 tulokset"},
gvn(){return"L\xe4het\xe4 testi"},
ge1(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFd()}return w}}
A.aEI.prototype={
gaA(d){return"Testin tulokset"},
gzp(){return"Testi\xe4 ei ole viel\xe4 l\xe4hetetty."},
gkP(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAp(){return"Pisteesi"},
uW(d,e){return""+d+" / "+e+" oikein"},
gqk(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Ao(d){return"Vastauksesi: "+d},
gzi(){return"(Ei vastausta)"},
gxh(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzV(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzY(){return"Kertaa muistikorteilla"},
gx3(){return"Takaisin aloitusn\xe4ytt\xf6\xf6n"}}
A.aEQ.prototype={
gaA(d){return"Asetukset"},
gwQ(d){return"Ulkoasu"},
gtY(d){return"Kieli"},
gyS(){return"Valitse kieli"},
guA(){return"N\xe4yt\xf6n skaalaus"},
gA8(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gr7(){return"J\xe4rjestelm\xe4n oletus"},
gyY(){return"Vaalea"},
gxC(){return"Tumma"},
gxX(){return"Englanti"},
gyf(){return"Suomi"},
gA0(){return"Ven\xe4j\xe4"},
gvf(){return"Espanja"},
gvv(){return"Ruotsi"},
gxD(){return"Tietojen hallinta"},
gy4(){return"Vie tiedot"},
gy5(){return"Tallenna kaikki listat tiedostoon"},
gyv(){return"Tuo tiedot"},
gyw(){return"Lataa listat tiedostosta"},
gxJ(){return"Poista kaikki tiedot"},
gpR(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aES()}return w},
gpg(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aEM()}return w},
glY(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aEX()}return w}}
A.aDX.prototype={
gaA(d){return"Ohjaimet"},
guF(){return"Liikkeet (Muistikortit)"},
gyP(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go4(){return"Seuraava kortti"},
goe(){return"Edellinen kortti"},
gnX(){return"K\xe4\xe4nn\xe4 kortti"},
gvw(){return"Pyyhk\xe4ise vasemmalle"},
gvx(){return"Pyyhk\xe4ise oikealle"},
gvy(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gwV(){return"Oikea nuolin\xe4pp\xe4in"},
gwU(){return"Vasen nuolin\xe4pp\xe4in"},
gwW(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aE0.prototype={
gyW(){return"\xa9 2025 Quizlone"},
gxL(d){return y.R}}
A.aF1.prototype={
gaA(d){return"Vahvista poisto"},
xi(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aF7.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
guj(){return"Nime\xe4 uudelleen"},
gxZ(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gxY(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aEg.prototype={
gyZ(){return"Listan nimi ei voi olla tyhj\xe4."},
geq(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyI(){return y.r},
xU(d){return"Muotovirhe rivin "+d+y.J},
gzm(){return y.c},
uS(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aEo.prototype={
geq(){return y.b},
gkQ(){return y.B}}
A.aEt.prototype={
gxq(){return"Oikein!"},
yA(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yr(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vd(d){return"Ohitettu. Vastaus oli: "+d}}
A.aEy.prototype={
gwO(){return"Kaikki termit opittu!"},
ti(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gv_(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
z7(d){var w=B.eR("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vh(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aFd.prototype={
gz2(){return y.P},
geq(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkQ(){return y._}}
A.aES.prototype={
gaA(d){return"Vahvista tuonti"},
gku(d){return y.u},
guR(d){return"Tuo"}}
A.aEM.prototype={
gaA(d){return"Vahvista poisto"},
gku(d){return y.N},
gxI(){return"Poista kaikki"}}
A.aEX.prototype={
gzk(){return"Ei viet\xe4vi\xe4 tietoja."},
y6(d){return"Virhe tietojen vienniss\xe4: "+d},
yy(d){return""+d+" listaa tuotu onnistuneesti!"},
yx(d){return"Virhe tietojen tuonnissa: "+d},
gwN(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aHx.prototype={
$1(d){return A.b9f(this.a,d)},
$S:53}
A.aGQ.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aGR.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:76}
A.aGS.prototype={
$1$count(d){var w
this.a.ghZ()
w=B.eR("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aGT.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:78}
A.aGU.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:92}
A.aGW.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aGX.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:80}
A.aGY.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:22}
A.aGZ.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:82}
A.aH_.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:22}
A.aH0.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:83}
A.aH1.prototype={
$1$count(d){var w
this.a.ghZ()
w=B.eR("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aH2.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:84}
A.aH3.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:85}
A.aH4.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:22}
A.aH6.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aH7.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:86}
A.aH8.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Va,B.dh)
w(A.aEc,B.uf)
w(A.aE4,B.ud)
w(A.aDT,B.ua)
w(A.aF5,B.ut)
w(A.aEk,B.ug)
w(A.aEE,B.um)
w(A.aE8,B.ue)
w(A.aEw,B.ui)
w(A.aFh,B.uv)
w(A.aEI,B.un)
w(A.aEQ,B.up)
w(A.aDX,B.ub)
w(A.aE0,B.uc)
w(A.aF1,B.us)
w(A.aF7,B.uu)
w(A.aEg,B.uh)
w(A.aEo,B.uj)
w(A.aEt,B.uk)
w(A.aEy,B.ul)
w(A.aFd,B.uw)
w(A.aES,B.uq)
w(A.aEM,B.uo)
w(A.aEX,B.ur)
v(B.j9,[A.aHx,A.aGQ,A.aGR,A.aGS,A.aGT,A.aGU,A.aGW,A.aGX,A.aGY,A.aGZ,A.aH_,A.aH0,A.aH1,A.aH2,A.aH3,A.aH4,A.aH6,A.aH7,A.aH8])})()
B.a30(b.typeUniverse,JSON.parse('{"Va":{"dh":[],"hE":["dC","dh"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("h_<dC,dh>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"oiAKrMtjFB7eHgWGl0OodQ0Z1jo=");