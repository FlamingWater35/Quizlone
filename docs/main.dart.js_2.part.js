((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTK(d,e,f){var w,v,u=null,t=new B.h0(d,x.c),s=new B.h0(d,x.c)
s=new A.Vh(t,s)
s.vD(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9W(s)
return s},
b9S(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aHr()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aHs()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aHt(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHu()
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
case"inputScreen.errors.emptyTerm":return new A.aHv()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aHx()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata."
case"modeSelectionScreen.debugActiveId":return new A.aHy()
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
case"learnScreen.feedback.incorrect":return new A.aHz()
case"learnScreen.feedback.hint":return new A.aHA()
case"learnScreen.feedback.skipped":return new A.aHB()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aHC()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aHD(d)
case"learnScreen.progress.startingCycle":return new A.aHE()
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
case"resultsScreen.scoreFraction":return new A.aHF()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aHG()
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
case"settingsScreen.snackbars.exportError":return new A.aHI()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aHJ()
case"settingsScreen.snackbars.importError":return new A.aHK()
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
b9W(d){return new A.aI8(d)},
Vh:function Vh(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEO:function aEO(){},
aEG:function aEG(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEu:function aEu(){},
aFH:function aFH(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEW:function aEW(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFf:function aFf(){},
aEK:function aEK(){},
aF7:function aF7(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFT:function aFT(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFj:function aFj(){},
aFr:function aFr(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEy:function aEy(){},
aEC:function aEC(){},
aFD:function aFD(){},
aFJ:function aFJ(){},
aES:function aES(){},
aF_:function aF_(){},
aF4:function aF4(){},
aF9:function aF9(d,e){this.b=d
this.a=e},
aFP:function aFP(){},
aFt:function aFt(){},
aFn:function aFn(){},
aFy:function aFy(){},
aI8:function aI8(d){this.a=d},
aHr:function aHr(){},
aHs:function aHs(){},
aHt:function aHt(d){this.a=d},
aHu:function aHu(){},
aHv:function aHv(){},
aHx:function aHx(){},
aHy:function aHy(){},
aHz:function aHz(){},
aHA:function aHA(){},
aHB:function aHB(){},
aHC:function aHC(){},
aHD:function aHD(d){this.a=d},
aHE:function aHE(){},
aHF:function aHF(){},
aHG:function aHG(){},
aHI:function aHI(){},
aHJ:function aHJ(){},
aHK:function aHK(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.Vh.prototype={
gi_(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gny(d){return"Quizlone"},
gdJ(){var w=this,v=w.ch
if(v===$){w.gi_()
w.ch!==$&&B.v()
v=w.ch=new A.aEO()}return v},
glv(){var w,v=this,u=v.CW
if(u===$){w=v.gi_()
v.CW!==$&&B.v()
u=v.CW=new A.aEG(w,w)}return u},
grU(){var w=this,v=w.cx
if(v===$){w.gi_()
w.cx!==$&&B.v()
v=w.cx=new A.aEu()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi_()
v.cy!==$&&B.v()
u=v.cy=new A.aFH(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi_()
v.db!==$&&B.v()
u=v.db=new A.aEW(w,w)}return u},
gdu(){var w=this,v=w.dx
if(v===$){w.gi_()
w.dx!==$&&B.v()
v=w.dx=new A.aFf()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.gi_()
w.dy!==$&&B.v()
v=w.dy=new A.aEK()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi_()
v.fr!==$&&B.v()
u=v.fr=new A.aF7(w,w)}return u},
gl2(){var w,v=this,u=v.fx
if(u===$){w=v.gi_()
v.fx!==$&&B.v()
u=v.fx=new A.aFT(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi_()
w.fy!==$&&B.v()
v=w.fy=new A.aFj()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi_()
v.go!==$&&B.v()
u=v.go=new A.aFr(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi_()
w.id!==$&&B.v()
v=w.id=new A.aEy()}return v},
glS(){return this.ax}}
A.aEO.prototype={
gx3(d){return"Takaisin"},
gi7(d){return"Peruuta"},
gqx(d){return"Poista"},
gio(d){return"Seuraava"},
goe(){return"Edellinen"},
gvq(d){return"L\xe4het\xe4"},
gwQ(){return"Kaikki"},
gz3(){return"Ladataan..."},
iw(d){return"Virhe: "+d},
gzM(d){return"Nollaa"}}
A.aEG.prototype={
gv8(){return"Asetukset"},
gxk(d){return"Ohjaimet"},
grS(){return"Tietoja"},
grT(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEC()}return w}}
A.aEu.prototype={
A9(d,e){return"Versio "+e},
gAa(){return"N\xe4yt\xe4 lisenssit"}}
A.aFH.prototype={
gaA(d){return"Quizlone"},
gAd(){return"Tervetuloa!"},
gxy(){return"Luo uusi lista"},
gz2(){return"Lataa tallennettu lista"},
gzk(){return"Listoja ei ole viel\xe4 tallennettu."},
ux(d){var w=B.eW("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gte(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFD()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFJ()}return w}}
A.aEW.prototype={
gaA(d){return"Luo uusi lista"},
gu3(){return"Listan nimi"},
gyZ(){return"esim. Luvun 1 sanasto"},
gzx(){return"Liit\xe4 termit alle:"},
gzy(){return y.U},
gzX(){return y.l},
guY(){return"Tallenna lista"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aES()}return w}}
A.aFf.prototype={
gaA(d){return"Valinnat & Tila"},
gl1(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyg(){return"Muistikorttien asetukset"},
gvd(){return"N\xe4yt\xe4 ensin termi"},
gvb(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gt5(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gt4(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvp(){return"Opiskelun pituus:"},
gAi(){return"Kirjallinen vastaus"},
gzf(){return"Monivalinta"},
gyh(){return"Muistikortit"},
gu0(){return"Opi"},
guy(){return"Testi"}}
A.aEK.prototype={
gaA(d){return"Muistikortit"},
gzi(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
ger(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvg(d){return"Sekoita"},
gqi(){return"Aloita alusta"}}
A.aF7.prototype={
gaA(d){return"Opi"},
gzQ(){return"Aloita oppimisistunto alusta"},
gx4(){return"Takaisin valintoihin"},
gt_(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gpQ(d){return"Vihje"},
gvh(d){return"Ohita"},
ge4(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF_()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aF4()}return w},
glG(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aF9(w,w)}return v}}
A.aFT.prototype={
gaA(d){return"Testi"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAb(){return"N\xe4yt\xe4 tulokset"},
gvr(){return"L\xe4het\xe4 testi"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFP()}return w}}
A.aFj.prototype={
gaA(d){return"Testin tulokset"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAk(){return"Pisteesi"},
v0(d,e){return""+d+" / "+e+" oikein"},
gqk(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Aj(d){return"Vastauksesi: "+d},
gzh(){return"(Ei vastausta)"},
gxi(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzR(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzT(){return"Kertaa muistikorteilla"}}
A.aFr.prototype={
gaA(d){return"Asetukset"},
gwT(d){return"Ulkoasu"},
gtZ(d){return"Kieli"},
gyR(){return"Valitse kieli"},
guE(){return"N\xe4yt\xf6n skaalaus"},
gA3(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gr7(){return"J\xe4rjestelm\xe4n oletus"},
gyX(){return"Vaalea"},
gxE(){return"Tumma"},
gxY(){return"Englanti"},
gyf(){return"Suomi"},
gzW(){return"Ven\xe4j\xe4"},
gvk(){return"Espanja"},
gvx(){return"Ruotsi"},
gxF(){return"Tietojen hallinta"},
gy5(){return"Vie tiedot"},
gy6(){return"Tallenna kaikki listat tiedostoon"},
gyv(){return"Tuo tiedot"},
gyw(){return"Lataa listat tiedostosta"},
gxK(){return"Poista kaikki tiedot"},
gpR(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFt()}return w},
gpg(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFn()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFy()}return w}}
A.aEy.prototype={
gaA(d){return"Ohjaimet"},
guJ(){return"Liikkeet (Muistikortit)"},
gyO(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go5(){return"Seuraava kortti"},
gof(){return"Edellinen kortti"},
gnY(){return"K\xe4\xe4nn\xe4 kortti"},
gvy(){return"Pyyhk\xe4ise vasemmalle"},
gvz(){return"Pyyhk\xe4ise oikealle"},
gvA(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gwX(){return"Oikea nuolin\xe4pp\xe4in"},
gwW(){return"Vasen nuolin\xe4pp\xe4in"},
gwY(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aEC.prototype={
gyV(){return"\xa9 2025 Quizlone"},
gxM(d){return y.R}}
A.aFD.prototype={
gaA(d){return"Vahvista poisto"},
xj(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aFJ.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
gun(){return"Nime\xe4 uudelleen"},
gy_(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gxZ(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aES.prototype={
gyY(){return"Listan nimi ei voi olla tyhj\xe4."},
ger(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyH(){return y.r},
xV(d){return"Muotovirhe rivin "+d+y.J},
gzl(){return y.c},
uX(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aF_.prototype={
ger(){return y.b},
gkV(){return y.B}}
A.aF4.prototype={
gxt(){return"Oikein!"},
yz(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yr(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vi(d){return"Ohitettu. Vastaus oli: "+d}}
A.aF9.prototype={
gwS(){return"Kaikki termit opittu!"},
tj(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gv4(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
z7(d){var w=B.eW("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vm(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aFP.prototype={
gz1(){return y.P},
ger(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkV(){return y._}}
A.aFt.prototype={
gaA(d){return"Vahvista tuonti"},
gky(d){return y.u},
guV(d){return"Tuo"}}
A.aFn.prototype={
gaA(d){return"Vahvista poisto"},
gky(d){return y.N},
gxJ(){return"Poista kaikki"}}
A.aFy.prototype={
gzj(){return"Ei viet\xe4vi\xe4 tietoja."},
y7(d){return"Virhe tietojen vienniss\xe4: "+d},
yy(d){return""+d+" listaa tuotu onnistuneesti!"},
yx(d){return"Virhe tietojen tuonnissa: "+d},
gwR(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aI8.prototype={
$1(d){return A.b9S(this.a,d)},
$S:56}
A.aHr.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aHs.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:82}
A.aHt.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eW("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aHu.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:80}
A.aHv.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:67}
A.aHx.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aHy.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:74}
A.aHz.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:24}
A.aHA.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:69}
A.aHB.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:24}
A.aHC.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:68}
A.aHD.prototype={
$1$count(d){var w
this.a.gi_()
w=B.eW("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aHE.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:88}
A.aHF.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:87}
A.aHG.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:24}
A.aHI.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aHJ.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:84}
A.aHK.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vh,B.di)
w(A.aEO,B.ub)
w(A.aEG,B.u9)
w(A.aEu,B.u6)
w(A.aFH,B.up)
w(A.aEW,B.uc)
w(A.aFf,B.ui)
w(A.aEK,B.ua)
w(A.aF7,B.ue)
w(A.aFT,B.ur)
w(A.aFj,B.uj)
w(A.aFr,B.ul)
w(A.aEy,B.u7)
w(A.aEC,B.u8)
w(A.aFD,B.uo)
w(A.aFJ,B.uq)
w(A.aES,B.ud)
w(A.aF_,B.uf)
w(A.aF4,B.ug)
w(A.aF9,B.uh)
w(A.aFP,B.us)
w(A.aFt,B.um)
w(A.aFn,B.uk)
w(A.aFy,B.un)
v(B.j9,[A.aI8,A.aHr,A.aHs,A.aHt,A.aHu,A.aHv,A.aHx,A.aHy,A.aHz,A.aHA,A.aHB,A.aHC,A.aHD,A.aHE,A.aHF,A.aHG,A.aHI,A.aHJ,A.aHK])})()
B.a3e(b.typeUniverse,JSON.parse('{"Vh":{"di":[],"hF":["dG","di"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("h0<dG,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"pv5I8qLgCsUZa8kCS/pKCx2ztYg=");