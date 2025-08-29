((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTK(d,e,f){var w,v,u=null,t=new B.h3(d,x.c),s=new B.h3(d,x.c)
s=new A.Vi(t,s)
s.vH(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9Y(s)
return s},
b9U(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aHs()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aHt()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aHu(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHv()
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
case"inputScreen.errors.emptyTerm":return new A.aHw()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aHy()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aHz()
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
case"learnScreen.feedback.incorrect":return new A.aHA()
case"learnScreen.feedback.hint":return new A.aHB()
case"learnScreen.feedback.skipped":return new A.aHC()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aHD()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aHE(d)
case"learnScreen.progress.startingCycle":return new A.aHF()
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
case"resultsScreen.scoreFraction":return new A.aHG()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aHH()
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
case"settingsScreen.snackbars.exportError":return new A.aHJ()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aHK()
case"settingsScreen.snackbars.importError":return new A.aHL()
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
b9Y(d){return new A.aI9(d)},
Vi:function Vi(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEP:function aEP(){},
aEH:function aEH(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEv:function aEv(){},
aFI:function aFI(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEX:function aEX(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFg:function aFg(){},
aEL:function aEL(){},
aF8:function aF8(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFU:function aFU(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFk:function aFk(){},
aFs:function aFs(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEz:function aEz(){},
aED:function aED(){},
aFE:function aFE(){},
aFK:function aFK(){},
aET:function aET(){},
aF0:function aF0(){},
aF5:function aF5(){},
aFa:function aFa(d,e){this.b=d
this.a=e},
aFQ:function aFQ(){},
aFu:function aFu(){},
aFo:function aFo(){},
aFz:function aFz(){},
aI9:function aI9(d){this.a=d},
aHs:function aHs(){},
aHt:function aHt(){},
aHu:function aHu(d){this.a=d},
aHv:function aHv(){},
aHw:function aHw(){},
aHy:function aHy(){},
aHz:function aHz(){},
aHA:function aHA(){},
aHB:function aHB(){},
aHC:function aHC(){},
aHD:function aHD(){},
aHE:function aHE(d){this.a=d},
aHF:function aHF(){},
aHG:function aHG(){},
aHH:function aHH(){},
aHJ:function aHJ(){},
aHK:function aHK(){},
aHL:function aHL(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.Vi.prototype={
gi0(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gny(d){return"Quizlone"},
gdK(){var w=this,v=w.ch
if(v===$){w.gi0()
w.ch!==$&&B.v()
v=w.ch=new A.aEP()}return v},
glu(){var w,v=this,u=v.CW
if(u===$){w=v.gi0()
v.CW!==$&&B.v()
u=v.CW=new A.aEH(w,w)}return u},
grZ(){var w=this,v=w.cx
if(v===$){w.gi0()
w.cx!==$&&B.v()
v=w.cx=new A.aEv()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi0()
v.cy!==$&&B.v()
u=v.cy=new A.aFI(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi0()
v.db!==$&&B.v()
u=v.db=new A.aEX(w,w)}return u},
gcD(){var w=this,v=w.dx
if(v===$){w.gi0()
w.dx!==$&&B.v()
v=w.dx=new A.aFg()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.gi0()
w.dy!==$&&B.v()
v=w.dy=new A.aEL()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi0()
v.fr!==$&&B.v()
u=v.fr=new A.aF8(w,w)}return u},
gl1(){var w,v=this,u=v.fx
if(u===$){w=v.gi0()
v.fx!==$&&B.v()
u=v.fx=new A.aFU(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi0()
w.fy!==$&&B.v()
v=w.fy=new A.aFk()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi0()
v.go!==$&&B.v()
u=v.go=new A.aFs(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi0()
w.id!==$&&B.v()
v=w.id=new A.aEz()}return v},
glS(){return this.ax}}
A.aEP.prototype={
gx6(d){return"Takaisin"},
gi9(d){return"Peruuta"},
gqB(d){return"Poista"},
giq(d){return"Seuraava"},
gof(){return"Edellinen"},
gvu(d){return"L\xe4het\xe4"},
gwT(){return"Kaikki"},
gz6(){return"Ladataan..."},
ix(d){return"Virhe: "+d},
gzP(d){return"Nollaa"}}
A.aEH.prototype={
gvc(){return"Asetukset"},
gxn(d){return"Ohjaimet"},
grX(){return"Tietoja"},
grY(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aED()}return w}}
A.aEv.prototype={
Ac(d,e){return"Versio "+e},
gAd(){return"N\xe4yt\xe4 lisenssit"}}
A.aFI.prototype={
gaA(d){return"Quizlone"},
gAg(){return"Tervetuloa!"},
gxB(){return"Luo uusi lista"},
gz5(){return"Lataa tallennettu lista"},
gzn(){return"Listoja ei ole viel\xe4 tallennettu."},
uB(d){var w=B.eY("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtj(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFE()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFK()}return w}}
A.aEX.prototype={
gaA(d){return"Luo uusi lista"},
gu8(){return"Listan nimi"},
gz1(){return"esim. Luvun 1 sanasto"},
gzA(){return"Liit\xe4 termit alle:"},
gzB(){return y.U},
gA_(){return y.l},
gv1(){return"Tallenna lista"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aET()}return w}}
A.aFg.prototype={
gaA(d){return"Valinnat & Tila"},
go6(){return y.j},
ghO(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyj(){return"Muistikorttien asetukset"},
gvh(){return"N\xe4yt\xe4 ensin termi"},
gvf(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gta(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gt9(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvt(){return"Opiskelun pituus:"},
gAl(){return"Kirjallinen vastaus"},
gzi(){return"Monivalinta"},
gyk(){return"Muistikortit"},
gu5(){return"Opi"},
guC(){return"Testi"}}
A.aEL.prototype={
gaA(d){return"Muistikortit"},
gzl(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
ger(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvk(d){return"Sekoita"},
gqm(){return"Aloita alusta"}}
A.aF8.prototype={
gaA(d){return"Opi"},
gzT(){return"Aloita oppimisistunto alusta"},
gx7(){return"Takaisin valintoihin"},
gt4(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gpS(d){return"Vihje"},
gvl(d){return"Ohita"},
ge5(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF0()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aF5()}return w},
glF(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aFa(w,w)}return v}}
A.aFU.prototype={
gaA(d){return"Testi"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAe(){return"N\xe4yt\xe4 tulokset"},
gvv(){return"L\xe4het\xe4 testi"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFQ()}return w}}
A.aFk.prototype={
gaA(d){return"Testin tulokset"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAn(){return"Pisteesi"},
v4(d,e){return""+d+" / "+e+" oikein"},
gqo(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Am(d){return"Vastauksesi: "+d},
gzk(){return"(Ei vastausta)"},
gxl(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzU(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzW(){return"Kertaa muistikorteilla"}}
A.aFs.prototype={
gaA(d){return"Asetukset"},
gwW(d){return"Ulkoasu"},
gu3(d){return"Kieli"},
gyU(){return"Valitse kieli"},
guI(){return"N\xe4yt\xf6n skaalaus"},
gA6(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
grb(){return"J\xe4rjestelm\xe4n oletus"},
gz_(){return"Vaalea"},
gxH(){return"Tumma"},
gy0(){return"Englanti"},
gyi(){return"Suomi"},
gzZ(){return"Ven\xe4j\xe4"},
gvo(){return"Espanja"},
gvB(){return"Ruotsi"},
gxI(){return"Tietojen hallinta"},
gy8(){return"Vie tiedot"},
gy9(){return"Tallenna kaikki listat tiedostoon"},
gyy(){return"Tuo tiedot"},
gyz(){return"Lataa listat tiedostosta"},
gxN(){return"Poista kaikki tiedot"},
gpT(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFu()}return w},
gpi(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFo()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFz()}return w}}
A.aEz.prototype={
gaA(d){return"Ohjaimet"},
guN(){return"Liikkeet (Muistikortit)"},
gyR(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go5(){return"Seuraava kortti"},
gog(){return"Edellinen kortti"},
gnY(){return"K\xe4\xe4nn\xe4 kortti"},
gvC(){return"Pyyhk\xe4ise vasemmalle"},
gvD(){return"Pyyhk\xe4ise oikealle"},
gvE(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gx_(){return"Oikea nuolin\xe4pp\xe4in"},
gwZ(){return"Vasen nuolin\xe4pp\xe4in"},
gx0(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aED.prototype={
gyY(){return"\xa9 2025 Quizlone"},
gxP(d){return y.R}}
A.aFE.prototype={
gaA(d){return"Vahvista poisto"},
xm(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aFK.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
gus(){return"Nime\xe4 uudelleen"},
gy4(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gy3(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aET.prototype={
gz0(){return"Listan nimi ei voi olla tyhj\xe4."},
ger(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyK(){return y.r},
xY(d){return"Muotovirhe rivin "+d+y.J},
gzo(){return y.c},
v0(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aF0.prototype={
ger(){return y.b},
gkV(){return y.B}}
A.aF5.prototype={
gxw(){return"Oikein!"},
yC(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yu(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vm(d){return"Ohitettu. Vastaus oli: "+d}}
A.aFa.prototype={
gwV(){return"Kaikki termit opittu!"},
tp(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gv8(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
za(d){var w=B.eY("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vq(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aFQ.prototype={
gz4(){return y.P},
ger(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkV(){return y._}}
A.aFu.prototype={
gaA(d){return"Vahvista tuonti"},
gky(d){return y.u},
guZ(d){return"Tuo"}}
A.aFo.prototype={
gaA(d){return"Vahvista poisto"},
gky(d){return y.N},
gxM(){return"Poista kaikki"}}
A.aFz.prototype={
gzm(){return"Ei viet\xe4vi\xe4 tietoja."},
ya(d){return"Virhe tietojen vienniss\xe4: "+d},
yB(d){return""+d+" listaa tuotu onnistuneesti!"},
yA(d){return"Virhe tietojen tuonnissa: "+d},
gwU(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aI9.prototype={
$1(d){return A.b9U(this.a,d)},
$S:54}
A.aHs.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aHt.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:76}
A.aHu.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eY("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aHv.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:78}
A.aHw.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:79}
A.aHy.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aHz.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:92}
A.aHA.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:22}
A.aHB.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:82}
A.aHC.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:22}
A.aHD.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:83}
A.aHE.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eY("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aHF.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:84}
A.aHG.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:85}
A.aHH.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:22}
A.aHJ.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aHK.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:86}
A.aHL.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vi,B.dj)
w(A.aEP,B.ub)
w(A.aEH,B.u9)
w(A.aEv,B.u6)
w(A.aFI,B.up)
w(A.aEX,B.uc)
w(A.aFg,B.ui)
w(A.aEL,B.ua)
w(A.aF8,B.ue)
w(A.aFU,B.ur)
w(A.aFk,B.uj)
w(A.aFs,B.ul)
w(A.aEz,B.u7)
w(A.aED,B.u8)
w(A.aFE,B.uo)
w(A.aFK,B.uq)
w(A.aET,B.ud)
w(A.aF0,B.uf)
w(A.aF5,B.ug)
w(A.aFa,B.uh)
w(A.aFQ,B.us)
w(A.aFu,B.um)
w(A.aFo,B.uk)
w(A.aFz,B.un)
v(B.j9,[A.aI9,A.aHs,A.aHt,A.aHu,A.aHv,A.aHw,A.aHy,A.aHz,A.aHA,A.aHB,A.aHC,A.aHD,A.aHE,A.aHF,A.aHG,A.aHH,A.aHJ,A.aHK,A.aHL])})()
B.a3e(b.typeUniverse,JSON.parse('{"Vi":{"dj":[],"hG":["dG","dj"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("h3<dG,dj>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"0pnXJxDZVE67HGFKyvW0P1YyU0A=");