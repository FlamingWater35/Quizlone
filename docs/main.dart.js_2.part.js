((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTH(d,e,f){var w,v,u=null,t=new B.h3(d,x.c),s=new B.h3(d,x.c)
s=new A.Vi(t,s)
s.vF(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9V(s)
return s},
b9R(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aHp()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aHq()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aHr(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHs()
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
case"inputScreen.errors.emptyTerm":return new A.aHt()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aHv()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aHw()
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
case"learnScreen.feedback.incorrect":return new A.aHx()
case"learnScreen.feedback.hint":return new A.aHy()
case"learnScreen.feedback.skipped":return new A.aHz()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aHA()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aHB(d)
case"learnScreen.progress.startingCycle":return new A.aHC()
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
case"resultsScreen.scoreFraction":return new A.aHD()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aHE()
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
case"settingsScreen.snackbars.exportError":return new A.aHG()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aHH()
case"settingsScreen.snackbars.importError":return new A.aHI()
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
b9V(d){return new A.aI6(d)},
Vi:function Vi(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEM:function aEM(){},
aEE:function aEE(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEs:function aEs(){},
aFF:function aFF(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEU:function aEU(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFd:function aFd(){},
aEI:function aEI(){},
aF5:function aF5(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFR:function aFR(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFh:function aFh(){},
aFp:function aFp(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEw:function aEw(){},
aEA:function aEA(){},
aFB:function aFB(){},
aFH:function aFH(){},
aEQ:function aEQ(){},
aEY:function aEY(){},
aF2:function aF2(){},
aF7:function aF7(d,e){this.b=d
this.a=e},
aFN:function aFN(){},
aFr:function aFr(){},
aFl:function aFl(){},
aFw:function aFw(){},
aI6:function aI6(d){this.a=d},
aHp:function aHp(){},
aHq:function aHq(){},
aHr:function aHr(d){this.a=d},
aHs:function aHs(){},
aHt:function aHt(){},
aHv:function aHv(){},
aHw:function aHw(){},
aHx:function aHx(){},
aHy:function aHy(){},
aHz:function aHz(){},
aHA:function aHA(){},
aHB:function aHB(d){this.a=d},
aHC:function aHC(){},
aHD:function aHD(){},
aHE:function aHE(){},
aHG:function aHG(){},
aHH:function aHH(){},
aHI:function aHI(){}}
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
v=w.ch=new A.aEM()}return v},
glu(){var w,v=this,u=v.CW
if(u===$){w=v.gi0()
v.CW!==$&&B.v()
u=v.CW=new A.aEE(w,w)}return u},
grX(){var w=this,v=w.cx
if(v===$){w.gi0()
w.cx!==$&&B.v()
v=w.cx=new A.aEs()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi0()
v.cy!==$&&B.v()
u=v.cy=new A.aFF(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi0()
v.db!==$&&B.v()
u=v.db=new A.aEU(w,w)}return u},
gcD(){var w=this,v=w.dx
if(v===$){w.gi0()
w.dx!==$&&B.v()
v=w.dx=new A.aFd()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.gi0()
w.dy!==$&&B.v()
v=w.dy=new A.aEI()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi0()
v.fr!==$&&B.v()
u=v.fr=new A.aF5(w,w)}return u},
gl1(){var w,v=this,u=v.fx
if(u===$){w=v.gi0()
v.fx!==$&&B.v()
u=v.fx=new A.aFR(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi0()
w.fy!==$&&B.v()
v=w.fy=new A.aFh()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi0()
v.go!==$&&B.v()
u=v.go=new A.aFp(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi0()
w.id!==$&&B.v()
v=w.id=new A.aEw()}return v},
glS(){return this.ax}}
A.aEM.prototype={
gx4(d){return"Takaisin"},
gi9(d){return"Peruuta"},
gqz(d){return"Poista"},
giq(d){return"Seuraava"},
gof(){return"Edellinen"},
gvs(d){return"L\xe4het\xe4"},
gwR(){return"Kaikki"},
gz4(){return"Ladataan..."},
ix(d){return"Virhe: "+d},
gzN(d){return"Nollaa"}}
A.aEE.prototype={
gva(){return"Asetukset"},
gxl(d){return"Ohjaimet"},
grV(){return"Tietoja"},
grW(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEA()}return w}}
A.aEs.prototype={
Aa(d,e){return"Versio "+e},
gAb(){return"N\xe4yt\xe4 lisenssit"}}
A.aFF.prototype={
gaA(d){return"Quizlone"},
gAe(){return"Tervetuloa!"},
gxz(){return"Luo uusi lista"},
gz3(){return"Lataa tallennettu lista"},
gzl(){return"Listoja ei ole viel\xe4 tallennettu."},
uz(d){var w=B.eX("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gth(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFB()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFH()}return w}}
A.aEU.prototype={
gaA(d){return"Luo uusi lista"},
gu6(){return"Listan nimi"},
gz_(){return"esim. Luvun 1 sanasto"},
gzy(){return"Liit\xe4 termit alle:"},
gzz(){return y.U},
gzY(){return y.l},
gv_(){return"Tallenna lista"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEQ()}return w}}
A.aFd.prototype={
gaA(d){return"Valinnat & Tila"},
go6(){return y.j},
ghO(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyh(){return"Muistikorttien asetukset"},
gvf(){return"N\xe4yt\xe4 ensin termi"},
gvd(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gt8(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gt7(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvr(){return"Opiskelun pituus:"},
gAj(){return"Kirjallinen vastaus"},
gzg(){return"Monivalinta"},
gyi(){return"Muistikortit"},
gu3(){return"Opi"},
guA(){return"Testi"}}
A.aEI.prototype={
gaA(d){return"Muistikortit"},
gzj(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
ger(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvi(d){return"Sekoita"},
gqk(){return"Aloita alusta"}}
A.aF5.prototype={
gaA(d){return"Opi"},
gzR(){return"Aloita oppimisistunto alusta"},
gx5(){return"Takaisin valintoihin"},
gt2(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gpR(d){return"Vihje"},
gvj(d){return"Ohita"},
ge5(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEY()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aF2()}return w},
glF(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aF7(w,w)}return v}}
A.aFR.prototype={
gaA(d){return"Testi"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAc(){return"N\xe4yt\xe4 tulokset"},
gvt(){return"L\xe4het\xe4 testi"},
ge5(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFN()}return w}}
A.aFh.prototype={
gaA(d){return"Testin tulokset"},
gkU(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAl(){return"Pisteesi"},
v2(d,e){return""+d+" / "+e+" oikein"},
gqm(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Ak(d){return"Vastauksesi: "+d},
gzi(){return"(Ei vastausta)"},
gxj(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzS(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzU(){return"Kertaa muistikorteilla"}}
A.aFp.prototype={
gaA(d){return"Asetukset"},
gwU(d){return"Ulkoasu"},
gu1(d){return"Kieli"},
gyS(){return"Valitse kieli"},
guG(){return"N\xe4yt\xf6n skaalaus"},
gA4(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gr9(){return"J\xe4rjestelm\xe4n oletus"},
gyY(){return"Vaalea"},
gxF(){return"Tumma"},
gxZ(){return"Englanti"},
gyg(){return"Suomi"},
gzX(){return"Ven\xe4j\xe4"},
gvm(){return"Espanja"},
gvz(){return"Ruotsi"},
gxG(){return"Tietojen hallinta"},
gy6(){return"Vie tiedot"},
gy7(){return"Tallenna kaikki listat tiedostoon"},
gyw(){return"Tuo tiedot"},
gyx(){return"Lataa listat tiedostosta"},
gxL(){return"Poista kaikki tiedot"},
gpS(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFr()}return w},
gph(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFl()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFw()}return w}}
A.aEw.prototype={
gaA(d){return"Ohjaimet"},
guL(){return"Liikkeet (Muistikortit)"},
gyP(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go5(){return"Seuraava kortti"},
gog(){return"Edellinen kortti"},
gnY(){return"K\xe4\xe4nn\xe4 kortti"},
gvA(){return"Pyyhk\xe4ise vasemmalle"},
gvB(){return"Pyyhk\xe4ise oikealle"},
gvC(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gwY(){return"Oikea nuolin\xe4pp\xe4in"},
gwX(){return"Vasen nuolin\xe4pp\xe4in"},
gwZ(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aEA.prototype={
gyW(){return"\xa9 2025 Quizlone"},
gxN(d){return y.R}}
A.aFB.prototype={
gaA(d){return"Vahvista poisto"},
xk(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aFH.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
guq(){return"Nime\xe4 uudelleen"},
gy0(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gy_(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aEQ.prototype={
gyZ(){return"Listan nimi ei voi olla tyhj\xe4."},
ger(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyI(){return y.r},
xW(d){return"Muotovirhe rivin "+d+y.J},
gzm(){return y.c},
uZ(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aEY.prototype={
ger(){return y.b},
gkV(){return y.B}}
A.aF2.prototype={
gxu(){return"Oikein!"},
yA(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
ys(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vk(d){return"Ohitettu. Vastaus oli: "+d}}
A.aF7.prototype={
gwT(){return"Kaikki termit opittu!"},
tm(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gv6(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
z8(d){var w=B.eX("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vo(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aFN.prototype={
gz2(){return y.P},
ger(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkV(){return y._}}
A.aFr.prototype={
gaA(d){return"Vahvista tuonti"},
gky(d){return y.u},
guX(d){return"Tuo"}}
A.aFl.prototype={
gaA(d){return"Vahvista poisto"},
gky(d){return y.N},
gxK(){return"Poista kaikki"}}
A.aFw.prototype={
gzk(){return"Ei viet\xe4vi\xe4 tietoja."},
y8(d){return"Virhe tietojen vienniss\xe4: "+d},
yz(d){return""+d+" listaa tuotu onnistuneesti!"},
yy(d){return"Virhe tietojen tuonnissa: "+d},
gwS(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aI6.prototype={
$1(d){return A.b9R(this.a,d)},
$S:54}
A.aHp.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aHq.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:76}
A.aHr.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eX("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aHs.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:78}
A.aHt.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:79}
A.aHv.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aHw.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:92}
A.aHx.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:22}
A.aHy.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:82}
A.aHz.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:22}
A.aHA.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:83}
A.aHB.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eX("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aHC.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:84}
A.aHD.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:85}
A.aHE.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:22}
A.aHG.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aHH.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:86}
A.aHI.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vi,B.di)
w(A.aEM,B.ub)
w(A.aEE,B.u9)
w(A.aEs,B.u6)
w(A.aFF,B.up)
w(A.aEU,B.uc)
w(A.aFd,B.ui)
w(A.aEI,B.ua)
w(A.aF5,B.ue)
w(A.aFR,B.ur)
w(A.aFh,B.uj)
w(A.aFp,B.ul)
w(A.aEw,B.u7)
w(A.aEA,B.u8)
w(A.aFB,B.uo)
w(A.aFH,B.uq)
w(A.aEQ,B.ud)
w(A.aEY,B.uf)
w(A.aF2,B.ug)
w(A.aF7,B.uh)
w(A.aFN,B.us)
w(A.aFr,B.um)
w(A.aFl,B.uk)
w(A.aFw,B.un)
v(B.j9,[A.aI6,A.aHp,A.aHq,A.aHr,A.aHs,A.aHt,A.aHv,A.aHw,A.aHx,A.aHy,A.aHz,A.aHA,A.aHB,A.aHC,A.aHD,A.aHE,A.aHG,A.aHH,A.aHI])})()
B.a3e(b.typeUniverse,JSON.parse('{"Vi":{"di":[],"hG":["dF","di"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("h3<dF,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"syGlUv9bNb3ePzgGCmkRxKtfbFA=");