((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aUM(d,e,f){var w,v,u=null,t=new B.h8(d,x.c),s=new B.h8(d,x.c)
s=new A.VH(t,s)
s.vR(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.bb7(s)
return s},
bb3(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aIu()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aIv()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aIw(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aIx()
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
case"inputScreen.errors.emptyTerm":return new A.aIy()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aIA()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aIB()
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
case"learnScreen.feedback.incorrect":return new A.aIC()
case"learnScreen.feedback.hint":return new A.aID()
case"learnScreen.feedback.skipped":return new A.aIE()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aIF()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aIG(d)
case"learnScreen.progress.startingCycle":return new A.aIH()
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
case"resultsScreen.scoreFraction":return new A.aII()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aIJ()
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
case"settingsScreen.snackbars.exportError":return new A.aIL()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aIM()
case"settingsScreen.snackbars.importError":return new A.aIN()
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
bb7(d){return new A.aJb(d)},
VH:function VH(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aFR:function aFR(){},
aFJ:function aFJ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFx:function aFx(){},
aGK:function aGK(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aFZ:function aFZ(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aGi:function aGi(){},
aFN:function aFN(){},
aGa:function aGa(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aGW:function aGW(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aGm:function aGm(){},
aGu:function aGu(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aFB:function aFB(){},
aFF:function aFF(){},
aGG:function aGG(){},
aGM:function aGM(){},
aFV:function aFV(){},
aG2:function aG2(){},
aG7:function aG7(){},
aGc:function aGc(d,e){this.b=d
this.a=e},
aGS:function aGS(){},
aGw:function aGw(){},
aGq:function aGq(){},
aGB:function aGB(){},
aJb:function aJb(d){this.a=d},
aIu:function aIu(){},
aIv:function aIv(){},
aIw:function aIw(d){this.a=d},
aIx:function aIx(){},
aIy:function aIy(){},
aIA:function aIA(){},
aIB:function aIB(){},
aIC:function aIC(){},
aID:function aID(){},
aIE:function aIE(){},
aIF:function aIF(){},
aIG:function aIG(d){this.a=d},
aIH:function aIH(){},
aII:function aII(){},
aIJ:function aIJ(){},
aIL:function aIL(){},
aIM:function aIM(){},
aIN:function aIN(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.VH.prototype={
gi7(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnJ(d){return"Quizlone"},
gdL(){var w=this,v=w.ch
if(v===$){w.gi7()
w.ch!==$&&B.v()
v=w.ch=new A.aFR()}return v},
gly(){var w,v=this,u=v.CW
if(u===$){w=v.gi7()
v.CW!==$&&B.v()
u=v.CW=new A.aFJ(w,w)}return u},
gt7(){var w=this,v=w.cx
if(v===$){w.gi7()
w.cx!==$&&B.v()
v=w.cx=new A.aFx()}return v},
gfm(){var w,v=this,u=v.cy
if(u===$){w=v.gi7()
v.cy!==$&&B.v()
u=v.cy=new A.aGK(w,w)}return u},
gfs(){var w,v=this,u=v.db
if(u===$){w=v.gi7()
v.db!==$&&B.v()
u=v.db=new A.aFZ(w,w)}return u},
gcI(){var w=this,v=w.dx
if(v===$){w.gi7()
w.dx!==$&&B.v()
v=w.dx=new A.aGi()}return v},
gmC(){var w=this,v=w.dy
if(v===$){w.gi7()
w.dy!==$&&B.v()
v=w.dy=new A.aFN()}return v},
geu(){var w,v=this,u=v.fr
if(u===$){w=v.gi7()
v.fr!==$&&B.v()
u=v.fr=new A.aGa(w,w)}return u},
gl7(){var w,v=this,u=v.fx
if(u===$){w=v.gi7()
v.fx!==$&&B.v()
u=v.fx=new A.aGW(w,w)}return u},
ghC(){var w=this,v=w.fy
if(v===$){w.gi7()
w.fy!==$&&B.v()
v=w.fy=new A.aGm()}return v},
gco(){var w,v=this,u=v.go
if(u===$){w=v.gi7()
v.go!==$&&B.v()
u=v.go=new A.aGu(w,w)}return u},
gfa(){var w=this,v=w.id
if(v===$){w.gi7()
w.id!==$&&B.v()
v=w.id=new A.aFB()}return v},
glW(){return this.ax}}
A.aFR.prototype={
gxj(d){return"Takaisin"},
gih(d){return"Peruuta"},
gqK(d){return"Poista"},
gix(d){return"Seuraava"},
gos(){return"Edellinen"},
gvG(d){return"L\xe4het\xe4"},
gx7(){return"Kaikki"},
gzm(){return"Ladataan..."},
iE(d){return"Virhe: "+d},
gA4(d){return"Nollaa"}}
A.aFJ.prototype={
gvo(){return"Asetukset"},
gxC(d){return"Ohjaimet"},
gt5(){return"Tietoja"},
gt6(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFF()}return w}}
A.aFx.prototype={
As(d,e){return"Versio "+e},
gAt(){return"N\xe4yt\xe4 lisenssit"}}
A.aGK.prototype={
gaA(d){return"Quizlone"},
gAw(){return"Tervetuloa!"},
gxP(){return"Luo uusi lista"},
gzl(){return"Lataa tallennettu lista"},
gzE(){return"Listoja ei ole viel\xe4 tallennettu."},
uL(d){var w=B.f3("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtv(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aGG()}return w},
gn0(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aGM()}return w}}
A.aFZ.prototype={
gaA(d){return"Luo uusi lista"},
gui(){return"Listan nimi"},
gzh(){return"esim. Luvun 1 sanasto"},
gzR(){return"Liit\xe4 termit alle:"},
gzS(){return y.U},
gAf(){return y.l},
gvd(){return"Tallenna lista"},
ge9(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFV()}return w}}
A.aGi.prototype={
gaA(d){return"Valinnat & Tila"},
goi(){return y.j},
ghV(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyz(){return"Muistikorttien asetukset"},
gvt(){return"N\xe4yt\xe4 ensin termi"},
gvr(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gtk(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gtj(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvF(){return"Opiskelun pituus:"},
gAB(){return"Kirjallinen vastaus"},
gzz(){return"Monivalinta"},
gyA(){return"Muistikortit"},
guf(){return"Opi"},
guM(){return"Testi"}}
A.aFN.prototype={
gaA(d){return"Muistikortit"},
gzC(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
gew(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvw(d){return"Sekoita"},
gqv(){return"Aloita alusta"}}
A.aGa.prototype={
gaA(d){return"Opi"},
gA8(){return"Aloita oppimisistunto alusta"},
gxk(){return"Takaisin valintoihin"},
gte(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gq0(d){return"Vihje"},
gvx(d){return"Ohita"},
ge9(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aG2()}return w},
go1(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aG7()}return w},
glJ(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aGc(w,w)}return v}}
A.aGW.prototype={
gaA(d){return"Testi"},
gl_(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAu(){return"N\xe4yt\xe4 tulokset"},
gvH(){return"L\xe4het\xe4 testi"},
ge9(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aGS()}return w}}
A.aGm.prototype={
gaA(d){return"Testin tulokset"},
gl_(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAD(){return"Pisteesi"},
vg(d,e){return""+d+" / "+e+" oikein"},
gqx(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
AC(d){return"Vastauksesi: "+d},
gzB(){return"(Ei vastausta)"},
gxA(){return"Onneksi olkoon! Sait kaiken oikein!"},
gA9(){return"Yrit\xe4 testi\xe4 uudelleen"},
gAb(){return"Kertaa muistikorteilla"}}
A.aGu.prototype={
gaA(d){return"Asetukset"},
gxa(d){return"Ulkoasu"},
gud(d){return"Kieli"},
gz9(){return"Valitse kieli"},
guS(){return"N\xe4yt\xf6n skaalaus"},
gAm(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
grm(){return"J\xe4rjestelm\xe4n oletus"},
gzf(){return"Vaalea"},
gxV(){return"Tumma"},
gyi(){return"Englanti"},
gyy(){return"Suomi"},
gAe(){return"Ven\xe4j\xe4"},
gvA(){return"Espanja"},
gvM(){return"Ruotsi"},
gxW(){return"Tietojen hallinta"},
gyo(){return"Vie tiedot"},
gyp(){return"Tallenna kaikki listat tiedostoon"},
gyO(){return"Tuo tiedot"},
gyP(){return"Lataa listat tiedostosta"},
gy0(){return"Poista kaikki tiedot"},
gq1(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aGw()}return w},
gps(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aGq()}return w},
gm6(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aGB()}return w}}
A.aFB.prototype={
gaA(d){return"Ohjaimet"},
guX(){return"Liikkeet (Muistikortit)"},
gz6(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
goh(){return"Seuraava kortti"},
got(){return"Edellinen kortti"},
go8(){return"K\xe4\xe4nn\xe4 kortti"},
gvN(){return"Pyyhk\xe4ise vasemmalle"},
gvO(){return"Pyyhk\xe4ise oikealle"},
gvP(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gxe(){return"Oikea nuolin\xe4pp\xe4in"},
gxd(){return"Vasen nuolin\xe4pp\xe4in"},
gxf(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aFF.prototype={
gzd(){return"\xa9 2025 Quizlone"},
gy5(d){return y.R}}
A.aGG.prototype={
gaA(d){return"Vahvista poisto"},
xB(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aGM.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
guA(){return"Nime\xe4 uudelleen"},
gyk(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gyj(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aFV.prototype={
gzg(){return"Listan nimi ei voi olla tyhj\xe4."},
gew(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gz_(){return y.r},
ye(d){return"Muotovirhe rivin "+d+y.J},
gzF(){return y.c},
vc(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aG2.prototype={
gew(){return y.b},
gl0(){return y.B}}
A.aG7.prototype={
gxK(){return"Oikein!"},
yS(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yK(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vy(d){return"Ohitettu. Vastaus oli: "+d}}
A.aGc.prototype={
gx9(){return"Kaikki termit opittu!"},
tA(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gvk(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
zr(d){var w=B.f3("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vC(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aGS.prototype={
gzk(){return y.P},
gew(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gl0(){return y._}}
A.aGw.prototype={
gaA(d){return"Vahvista tuonti"},
gkF(d){return y.u},
gva(d){return"Tuo"}}
A.aGq.prototype={
gaA(d){return"Vahvista poisto"},
gkF(d){return y.N},
gy_(){return"Poista kaikki"}}
A.aGB.prototype={
gzD(){return"Ei viet\xe4vi\xe4 tietoja."},
yq(d){return"Virhe tietojen vienniss\xe4: "+d},
yR(d){return""+d+" listaa tuotu onnistuneesti!"},
yQ(d){return"Virhe tietojen tuonnissa: "+d},
gx8(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aJb.prototype={
$1(d){return A.bb3(this.a,d)},
$S:53}
A.aIu.prototype={
$1$error(d){return"Virhe: "+B.i(d)},
$S:12}
A.aIv.prototype={
$1$version(d){return"Versio "+B.i(d)},
$S:86}
A.aIw.prototype={
$1$count(d){var w
this.a.gi7()
w=B.f3("fi")
return w.$3$one$other(d,"1 termi",B.i(d)+" termi\xe4")},
$S:36}
A.aIx.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.i(d)+"'?"},
$S:89}
A.aIy.prototype={
$1$line(d){return"Muotovirhe rivin "+B.i(d)+y.J},
$S:90}
A.aIA.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.i(d)},
$S:12}
A.aIB.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.i(d)},
$S:80}
A.aIC.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.i(d)},
$S:23}
A.aID.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.i(d)+'"'},
$S:92}
A.aIE.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.i(d)},
$S:23}
A.aIF.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.i(d)+" | Kohde "+B.i(e)+" / "+B.i(f)},
$S:76}
A.aIG.prototype={
$1$count(d){var w
this.a.gi7()
w=B.f3("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.i(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:36}
A.aIH.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.i(e)+", jossa on "+B.i(d)+" kohdetta..."},
$S:88}
A.aII.prototype={
$2$score$total(d,e){return B.i(d)+" / "+B.i(e)+" oikein"},
$S:83}
A.aIJ.prototype={
$1$answer(d){return"Vastauksesi: "+B.i(d)},
$S:23}
A.aIL.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.i(d)},
$S:12}
A.aIM.prototype={
$1$count(d){return B.i(d)+" listaa tuotu onnistuneesti!"},
$S:85}
A.aIN.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.i(d)},
$S:12};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.VH,B.dp)
w(A.aFR,B.ui)
w(A.aFJ,B.ug)
w(A.aFx,B.ud)
w(A.aGK,B.uw)
w(A.aFZ,B.uj)
w(A.aGi,B.up)
w(A.aFN,B.uh)
w(A.aGa,B.ul)
w(A.aGW,B.uy)
w(A.aGm,B.uq)
w(A.aGu,B.us)
w(A.aFB,B.ue)
w(A.aFF,B.uf)
w(A.aGG,B.uv)
w(A.aGM,B.ux)
w(A.aFV,B.uk)
w(A.aG2,B.um)
w(A.aG7,B.un)
w(A.aGc,B.uo)
w(A.aGS,B.uz)
w(A.aGw,B.ut)
w(A.aGq,B.ur)
w(A.aGB,B.uu)
v(B.jg,[A.aJb,A.aIu,A.aIv,A.aIw,A.aIx,A.aIy,A.aIA,A.aIB,A.aIC,A.aID,A.aIE,A.aIF,A.aIG,A.aIH,A.aII,A.aIJ,A.aIL,A.aIM,A.aIN])})()
B.a3G(b.typeUniverse,JSON.parse('{"VH":{"dp":[],"hL":["dH","dp"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.am("h8<dH,dp>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"JowlnNd6w3FyMZ1RoyhjPUU5Kbs=");