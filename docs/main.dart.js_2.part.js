((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_2",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTr(d,e,f){var w,v,u=null,t=new B.h1(d,x.c),s=new B.h1(d,x.c)
s=new A.Vl(t,s)
s.vE(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9D(s)
return s},
b9z(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Listan nimi ei voi olla tyhj\xe4.",q="Muistikortit",p="Takaisin aloitusn\xe4ytt\xf6\xf6n",o="Vie tiedot"
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
case"general.genericError":return new A.aHc()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"aboutScreen.version":return new A.aHd()
case"aboutScreen.viewLicenses":return"N\xe4yt\xe4 lisenssit"
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aHe(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHf()
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
case"inputScreen.errors.emptyTerm":return new A.aHg()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aHi()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aHj()
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
case"learnScreen.feedback.incorrect":return new A.aHk()
case"learnScreen.feedback.hint":return new A.aHl()
case"learnScreen.feedback.skipped":return new A.aHm()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aHn()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aHo(d)
case"learnScreen.progress.startingCycle":return new A.aHp()
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
case"resultsScreen.scoreFraction":return new A.aHq()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aHr()
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
case"settingsScreen.snackbars.exportError":return new A.aHt()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aHu()
case"settingsScreen.snackbars.importError":return new A.aHv()
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
b9D(d){return new A.aHU(d)},
Vl:function Vl(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEz:function aEz(){},
aEr:function aEr(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEf:function aEf(){},
aFs:function aFs(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEH:function aEH(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aF0:function aF0(){},
aEv:function aEv(){},
aET:function aET(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFE:function aFE(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aF4:function aF4(){},
aFc:function aFc(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEj:function aEj(){},
aEn:function aEn(){},
aFo:function aFo(){},
aFu:function aFu(){},
aED:function aED(){},
aEL:function aEL(){},
aEQ:function aEQ(){},
aEV:function aEV(d,e){this.b=d
this.a=e},
aFA:function aFA(){},
aFe:function aFe(){},
aF8:function aF8(){},
aFj:function aFj(){},
aHU:function aHU(d){this.a=d},
aHc:function aHc(){},
aHd:function aHd(){},
aHe:function aHe(d){this.a=d},
aHf:function aHf(){},
aHg:function aHg(){},
aHi:function aHi(){},
aHj:function aHj(){},
aHk:function aHk(){},
aHl:function aHl(){},
aHm:function aHm(){},
aHn:function aHn(){},
aHo:function aHo(d){this.a=d},
aHp:function aHp(){},
aHq:function aHq(){},
aHr:function aHr(){},
aHt:function aHt(){},
aHu:function aHu(){},
aHv:function aHv(){}}
B=c[0]
A=a.updateHolder(c[4],A)
A.Vl.prototype={
gi0(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gnx(d){return"Quizlone"},
gej(){var w=this,v=w.ch
if(v===$){w.gi0()
w.ch!==$&&B.v()
v=w.ch=new A.aEz()}return v},
glt(){var w,v=this,u=v.CW
if(u===$){w=v.gi0()
v.CW!==$&&B.v()
u=v.CW=new A.aEr(w,w)}return u},
grW(){var w=this,v=w.cx
if(v===$){w.gi0()
w.cx!==$&&B.v()
v=w.cx=new A.aEf()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi0()
v.cy!==$&&B.v()
u=v.cy=new A.aFs(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi0()
v.db!==$&&B.v()
u=v.db=new A.aEH(w,w)}return u},
gdE(){var w=this,v=w.dx
if(v===$){w.gi0()
w.dx!==$&&B.v()
v=w.dx=new A.aF0()}return v},
gms(){var w=this,v=w.dy
if(v===$){w.gi0()
w.dy!==$&&B.v()
v=w.dy=new A.aEv()}return v},
geo(){var w,v=this,u=v.fr
if(u===$){w=v.gi0()
v.fr!==$&&B.v()
u=v.fr=new A.aET(w,w)}return u},
gl_(){var w,v=this,u=v.fx
if(u===$){w=v.gi0()
v.fx!==$&&B.v()
u=v.fx=new A.aFE(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi0()
w.fy!==$&&B.v()
v=w.fy=new A.aF4()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi0()
v.go!==$&&B.v()
u=v.go=new A.aFc(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi0()
w.id!==$&&B.v()
v=w.id=new A.aEj()}return v},
glQ(){return this.ax}}
A.aEz.prototype={
gx3(d){return"Takaisin"},
gi9(d){return"Peruuta"},
gqy(d){return"Poista"},
giq(d){return"Seuraava"},
god(){return"Edellinen"},
gvr(d){return"L\xe4het\xe4"},
gwQ(){return"Kaikki"},
gz3(){return"Ladataan..."},
l6(d){return"Virhe: "+d},
gzN(d){return"Nollaa"}}
A.aEr.prototype={
gv9(){return"Asetukset"},
gxk(d){return"Ohjaimet"},
grU(){return"Tietoja"},
grV(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEn()}return w}}
A.aEf.prototype={
Aa(d,e){return"Versio "+e},
gAb(){return"N\xe4yt\xe4 lisenssit"}}
A.aFs.prototype={
gaA(d){return"Quizlone"},
gAe(){return"Tervetuloa!"},
gxy(){return"Luo uusi lista"},
gz2(){return"Lataa tallennettu lista"},
gzl(){return"Listoja ei ole viel\xe4 tallennettu."},
uy(d){var w=B.eV("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gtg(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFo()}return w},
gmQ(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFu()}return w}}
A.aEH.prototype={
gaA(d){return"Luo uusi lista"},
gu5(){return"Listan nimi"},
gyZ(){return"esim. Luvun 1 sanasto"},
gzy(){return"Liit\xe4 termit alle:"},
gzz(){return y.U},
gzY(){return y.l},
guZ(){return"Tallenna lista"},
ge3(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aED()}return w}}
A.aF0.prototype={
gaA(d){return"Valinnat & Tila"},
gzh(){return y.j},
gmS(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gyg(){return"Muistikorttien asetukset"},
gve(){return"N\xe4yt\xe4 ensin termi"},
gvc(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gt7(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gt6(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gvq(){return"Opiskelun pituus:"},
gAj(){return"Kirjallinen vastaus"},
gzf(){return"Monivalinta"},
gyh(){return"Muistikortit"},
gu2(){return"Opi"},
guz(){return"Testi"}}
A.aEv.prototype={
gaA(d){return"Muistikortit"},
gzj(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
geq(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gvh(d){return"Sekoita"},
gqj(){return"Aloita alusta"}}
A.aET.prototype={
gaA(d){return"Opi"},
gzR(){return"Aloita oppimisistunto alusta"},
gx4(){return"Takaisin valintoihin"},
gt1(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
gpP(d){return"Vihje"},
gvi(d){return"Ohita"},
ge3(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aEL()}return w},
gnQ(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aEQ()}return w},
glE(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aEV(w,w)}return v}}
A.aFE.prototype={
gaA(d){return"Testi"},
gkS(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
gAc(){return"N\xe4yt\xe4 tulokset"},
gvs(){return"L\xe4het\xe4 testi"},
ge3(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFA()}return w}}
A.aF4.prototype={
gaA(d){return"Testin tulokset"},
gkS(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
gAl(){return"Pisteesi"},
v1(d,e){return""+d+" / "+e+" oikein"},
gql(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
Ak(d){return"Vastauksesi: "+d},
gzi(){return"(Ei vastausta)"},
gxi(){return"Onneksi olkoon! Sait kaiken oikein!"},
gzS(){return"Yrit\xe4 testi\xe4 uudelleen"},
gzU(){return"Kertaa muistikorteilla"}}
A.aFc.prototype={
gaA(d){return"Asetukset"},
gwT(d){return"Ulkoasu"},
gu0(d){return"Kieli"},
gyR(){return"Valitse kieli"},
guF(){return"N\xe4yt\xf6n skaalaus"},
gA4(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gr8(){return"J\xe4rjestelm\xe4n oletus"},
gyX(){return"Vaalea"},
gxE(){return"Tumma"},
gxY(){return"Englanti"},
gyf(){return"Suomi"},
gzX(){return"Ven\xe4j\xe4"},
gvl(){return"Espanja"},
gvy(){return"Ruotsi"},
gxF(){return"Tietojen hallinta"},
gy5(){return"Vie tiedot"},
gy6(){return"Tallenna kaikki listat tiedostoon"},
gyv(){return"Tuo tiedot"},
gyw(){return"Lataa listat tiedostosta"},
gxK(){return"Poista kaikki tiedot"},
gpQ(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFe()}return w},
gpf(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aF8()}return w},
gm_(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFj()}return w}}
A.aEj.prototype={
gaA(d){return"Ohjaimet"},
guK(){return"Liikkeet (Muistikortit)"},
gyO(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
go4(){return"Seuraava kortti"},
goe(){return"Edellinen kortti"},
gnX(){return"K\xe4\xe4nn\xe4 kortti"},
gvz(){return"Pyyhk\xe4ise vasemmalle"},
gvA(){return"Pyyhk\xe4ise oikealle"},
gvB(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gwX(){return"Oikea nuolin\xe4pp\xe4in"},
gwW(){return"Vasen nuolin\xe4pp\xe4in"},
gwY(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aEn.prototype={
gyV(){return"\xa9 2025 Quizlone"},
gxM(d){return y.R}}
A.aFo.prototype={
gaA(d){return"Vahvista poisto"},
xj(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aFu.prototype={
gaA(d){return"Nime\xe4 lista uudelleen"},
guo(){return"Nime\xe4 uudelleen"},
gy_(){return"T\xe4m\xe4nniminen lista on jo olemassa."},
gxZ(){return"Listan nimi ei voi olla tyhj\xe4."}}
A.aED.prototype={
gyY(){return"Listan nimi ei voi olla tyhj\xe4."},
geq(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
gyH(){return y.r},
xV(d){return"Muotovirhe rivin "+d+y.J},
gzm(){return y.c},
uY(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aEL.prototype={
geq(){return y.b},
gkT(){return y.B}}
A.aEQ.prototype={
gxt(){return"Oikein!"},
yz(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
yr(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
vj(d){return"Ohitettu. Vastaus oli: "+d}}
A.aEV.prototype={
gwS(){return"Kaikki termit opittu!"},
tl(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gv5(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
z7(d){var w=B.eV("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
vn(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aFA.prototype={
gz1(){return y.P},
geq(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gkT(){return y._}}
A.aFe.prototype={
gaA(d){return"Vahvista tuonti"},
gkw(d){return y.u},
guW(d){return"Tuo"}}
A.aF8.prototype={
gaA(d){return"Vahvista poisto"},
gkw(d){return y.N},
gxJ(){return"Poista kaikki"}}
A.aFj.prototype={
gzk(){return"Ei viet\xe4vi\xe4 tietoja."},
y7(d){return"Virhe tietojen vienniss\xe4: "+d},
yy(d){return""+d+" listaa tuotu onnistuneesti!"},
yx(d){return"Virhe tietojen tuonnissa: "+d},
gwR(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aHU.prototype={
$1(d){return A.b9z(this.a,d)},
$S:53}
A.aHc.prototype={
$1$error(d){return"Virhe: "+B.j(d)},
$S:11}
A.aHd.prototype={
$1$version(d){return"Versio "+B.j(d)},
$S:76}
A.aHe.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eV("fi")
return w.$3$one$other(d,"1 termi",B.j(d)+" termi\xe4")},
$S:39}
A.aHf.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.j(d)+"'?"},
$S:78}
A.aHg.prototype={
$1$line(d){return"Muotovirhe rivin "+B.j(d)+y.J},
$S:92}
A.aHi.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.j(d)},
$S:11}
A.aHj.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.j(d)},
$S:80}
A.aHk.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.j(d)},
$S:22}
A.aHl.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.j(d)+'"'},
$S:82}
A.aHm.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.j(d)},
$S:22}
A.aHn.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.j(d)+" | Kohde "+B.j(e)+" / "+B.j(f)},
$S:83}
A.aHo.prototype={
$1$count(d){var w
this.a.gi0()
w=B.eV("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.j(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:39}
A.aHp.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.j(e)+", jossa on "+B.j(d)+" kohdetta..."},
$S:84}
A.aHq.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" oikein"},
$S:85}
A.aHr.prototype={
$1$answer(d){return"Vastauksesi: "+B.j(d)},
$S:22}
A.aHt.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.j(d)},
$S:11}
A.aHu.prototype={
$1$count(d){return B.j(d)+" listaa tuotu onnistuneesti!"},
$S:86}
A.aHv.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vl,B.di)
w(A.aEz,B.ud)
w(A.aEr,B.ub)
w(A.aEf,B.u8)
w(A.aFs,B.ur)
w(A.aEH,B.ue)
w(A.aF0,B.uk)
w(A.aEv,B.uc)
w(A.aET,B.ug)
w(A.aFE,B.ut)
w(A.aF4,B.ul)
w(A.aFc,B.un)
w(A.aEj,B.u9)
w(A.aEn,B.ua)
w(A.aFo,B.uq)
w(A.aFu,B.us)
w(A.aED,B.uf)
w(A.aEL,B.uh)
w(A.aEQ,B.ui)
w(A.aEV,B.uj)
w(A.aFA,B.uu)
w(A.aFe,B.uo)
w(A.aF8,B.um)
w(A.aFj,B.up)
v(B.j6,[A.aHU,A.aHc,A.aHd,A.aHe,A.aHf,A.aHg,A.aHi,A.aHj,A.aHk,A.aHl,A.aHm,A.aHn,A.aHo,A.aHp,A.aHq,A.aHr,A.aHt,A.aHu,A.aHv])})()
B.a3h(b.typeUniverse,JSON.parse('{"Vl":{"di":[],"hD":["dE","di"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.ao("h1<dE,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_2",e:"endPart",h:b})})($__dart_deferred_initializers__,"hwqOgSeDbZjDmhxuFBF+ngXhLDg=");