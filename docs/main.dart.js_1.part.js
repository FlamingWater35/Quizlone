((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aNT(d,e,f){var w,v,u=null,t=new B.tK(d,x.c),s=new B.tK(d,x.c)
s=new A.Tz(t,s)
s.OE(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b3E(s)
return s},
b3D(d,e){var w="Quizlone",v="Asetukset",u="Ohjaimet",t="Luo uusi lista",s="Vahvista poisto",r="Muistikortit",q="Takaisin aloitusn\xe4ytt\xf6\xf6n",p="Vie tiedot"
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
case"general.genericError":return new A.aCn()
case"general.reset":return"Nollaa"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Tietoja"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.R
case"startScreen.title":return w
case"startScreen.welcome":return"Tervetuloa!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Lataa tallennettu lista"
case"startScreen.noLists":return"Listoja ei ole viel\xe4 tallennettu."
case"startScreen.termCount":return new A.aCo(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aCp()
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
case"inputScreen.errors.emptyTerm":return new A.aCw()
case"inputScreen.errors.noValidPairs":return y.c
case"inputScreen.errors.saveFailed":return new A.aCx()
case"modeSelectionScreen.title":return"Valinnat & Tila"
case"modeSelectionScreen.noActiveList":return y.j
case"modeSelectionScreen.debugActiveId":return new A.aCy()
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
case"learnScreen.feedback.incorrect":return new A.aCz()
case"learnScreen.feedback.hint":return new A.aCA()
case"learnScreen.feedback.skipped":return new A.aCB()
case"learnScreen.progress.allLearned":return"Kaikki termit opittu!"
case"learnScreen.progress.cycleStatus":return new A.aCC()
case"learnScreen.progress.sessionComplete":return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"
case"learnScreen.progress.maxCyclesReached":return new A.aCD(d)
case"learnScreen.progress.startingCycle":return new A.aCq()
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
case"resultsScreen.scoreFraction":return new A.aCr()
case"resultsScreen.reviewIncorrect":return"Kertaa v\xe4\xe4r\xe4t vastaukset:"
case"resultsScreen.yourAnswerWas":return new A.aCs()
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
case"settingsScreen.snackbars.exportError":return new A.aCt()
case"settingsScreen.snackbars.fileSaved":return"Tiedosto tallennettu onnistuneesti!"
case"settingsScreen.snackbars.importSuccess":return new A.aCu()
case"settingsScreen.snackbars.importError":return new A.aCv()
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
b3E(d){return new A.aCE(d)},
Tz:function Tz(d,e){var _=this
_.at=d
_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=_.ax=$
_.a=e
_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aB5:function aB5(){},
aB3:function aB3(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aBj:function aBj(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aB7:function aB7(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aBc:function aBc(){},
aB4:function aB4(){},
aBa:function aBa(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aBl:function aBl(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aBd:function aBd(){},
aBf:function aBf(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aB1:function aB1(){},
aB2:function aB2(){},
aBi:function aBi(){},
aB6:function aB6(){},
aB8:function aB8(){},
aB9:function aB9(){},
aBb:function aBb(d,e){this.b=d
this.a=e},
aBk:function aBk(){},
aBg:function aBg(){},
aBe:function aBe(){},
aBh:function aBh(){},
aCE:function aCE(d){this.a=d},
aCn:function aCn(){},
aCo:function aCo(d){this.a=d},
aCp:function aCp(){},
aCw:function aCw(){},
aCx:function aCx(){},
aCy:function aCy(){},
aCz:function aCz(){},
aCA:function aCA(){},
aCB:function aCB(){},
aCC:function aCC(){},
aCD:function aCD(d){this.a=d},
aCq:function aCq(){},
aCr:function aCr(){},
aCs:function aCs(){},
aCt:function aCt(){},
aCu:function aCu(){},
aCv:function aCv(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Tz.prototype={
gis(){var w=this.ax
if(w===$){w!==$&&B.S()
w=this.ax=this}return w},
gAI(d){return"Quizlone"},
geJ(){var w=this,v=w.ay
if(v===$){w.gis()
w.ay!==$&&B.S()
v=w.ay=new A.aB5()}return v},
grv(){var w,v=this,u=v.ch
if(u===$){w=v.gis()
v.ch!==$&&B.S()
u=v.ch=new A.aB3(w,w)}return u},
gkM(){var w,v=this,u=v.CW
if(u===$){w=v.gis()
v.CW!==$&&B.S()
u=v.CW=new A.aBj(w,w)}return u},
gi0(){var w,v=this,u=v.cx
if(u===$){w=v.gis()
v.cx!==$&&B.S()
u=v.cx=new A.aB7(w,w)}return u},
geG(){var w=this,v=w.cy
if(v===$){w.gis()
w.cy!==$&&B.S()
v=w.cy=new A.aBc()}return v},
grO(){var w=this,v=w.db
if(v===$){w.gis()
w.db!==$&&B.S()
v=w.db=new A.aB4()}return v},
gey(){var w,v=this,u=v.dx
if(u===$){w=v.gis()
v.dx!==$&&B.S()
u=v.dx=new A.aBa(w,w)}return u},
gnK(){var w,v=this,u=v.dy
if(u===$){w=v.gis()
v.dy!==$&&B.S()
u=v.dy=new A.aBl(w,w)}return u},
ghC(){var w=this,v=w.fr
if(v===$){w.gis()
w.fr!==$&&B.S()
v=w.fr=new A.aBd()}return v},
gcW(){var w,v=this,u=v.fx
if(u===$){w=v.gis()
v.fx!==$&&B.S()
u=v.fx=new A.aBf(w,w)}return u},
gfZ(){var w=this,v=w.fy
if(v===$){w.gis()
w.fy!==$&&B.S()
v=w.fy=new A.aB1()}return v},
gpQ(){return this.at}}
A.aB5.prototype={
gWT(d){return"Takaisin"},
gkb(d){return"Peruuta"},
gDz(d){return"Poista"},
gkx(d){return"Seuraava"},
gxh(){return"Edellinen"},
gNB(d){return"L\xe4het\xe4"},
gWs(){return"Kaikki"},
ga_X(){return"Ladataan..."},
nV(d){return"Virhe: "+d},
ga1p(d){return"Nollaa"}}
A.aB3.prototype={
gNi(){return"Asetukset"},
gXA(d){return"Ohjaimet"},
gWe(){return"Tietoja"},
gI8(){var w=this.d
if(w===$){w!==$&&B.S()
w=this.d=new A.aB2()}return w}}
A.aBj.prototype={
gbq(d){return"Quizlone"},
ga2b(){return"Tervetuloa!"},
gXX(){return"Luo uusi lista"},
ga_W(){return"Lataa tallennettu lista"},
ga0g(){return"Listoja ei ole viel\xe4 tallennettu."},
LM(d){var w=B.rP("fi")
return w.$3$one$other(d,"1 termi",""+d+" termi\xe4")},
gIW(){var w=this.d
if(w===$){w!==$&&B.S()
w=this.d=new A.aBi()}return w}}
A.aB7.prototype={
gbq(d){return"Luo uusi lista"},
ga_P(){return"Listan nimi"},
ga_R(){return"esim. Luvun 1 sanasto"},
ga0C(){return"Liit\xe4 termit alle:"},
ga0D(){return y.U},
ga1G(){return y.l},
gMU(){return"Tallenna lista"},
gh4(){var w=this.d
if(w===$){w!==$&&B.S()
w=this.d=new A.aB6()}return w}}
A.aBc.prototype={
gbq(d){return"Valinnat & Tila"},
ga0c(){return y.j},
Y7(d){return"Debug: Nykyinen aktiivinen ID on "+d},
ga1w(){return"Palaa aloitusn\xe4ytt\xf6\xf6n"},
gZc(){return"Muistikorttien asetukset"},
gNo(){return"N\xe4yt\xe4 ensin termi"},
gNl(){return"N\xe4yt\xe4 ensin m\xe4\xe4ritelm\xe4"},
gNA(){return"Oppimisen & Testin asetukset"},
gIs(){return"N\xe4yt\xe4 m\xe4\xe4ritelm\xe4, kysy termi"},
gIr(){return"N\xe4yt\xe4 termi, kysy m\xe4\xe4ritelm\xe4"},
gNz(){return"Opiskelun pituus:"},
gxv(){return"Testin muoto"},
ga2q(){return"Kirjallinen vastaus"},
ga0b(){return"Monivalinta"},
gZd(){return"Muistikortit"},
ga_L(){return"Opi"},
ga1H(){return"Testi"},
gvs(){return"Takaisin aloitusn\xe4ytt\xf6\xf6n"}}
A.aB4.prototype={
gbq(d){return"Muistikortit"},
ga0e(){return"Ei n\xe4ytett\xe4vi\xe4 muistikortteja."},
gky(){return"Opiskeltavia termej\xe4 ei ole saatavilla."},
gNp(d){return"Sekoita"},
gD8(){return"Aloita alusta"}}
A.aBa.prototype={
gbq(d){return"Opi"},
ga1s(){return"Aloita oppimisistunto alusta"},
gWV(){return"Takaisin valintoihin"},
ga0M(){return"Valmistellaan seuraavaa kysymyst\xe4..."},
gWy(){return"Kirjoita vastauksesi t\xe4h\xe4n..."},
ga_6(){return"V\xe4\xe4rin"},
gBZ(d){return"Vihje"},
gNt(d){return"Ohita"},
gWU(){return"Takaisin tilan valintaan"},
gh4(){var w=this.f
if(w===$){w!==$&&B.S()
w=this.f=new A.aB8()}return w},
gw8(){var w=this.r
if(w===$){w!==$&&B.S()
w=this.r=new A.aB9()}return w},
gpw(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.S()
v=this.w=new A.aBb(w,w)}return v}}
A.aBl.prototype={
gbq(d){return"Testi"},
gwW(){return"T\xe4ss\xe4 testiss\xe4 ei ole kysymyksi\xe4."},
ga28(){return"N\xe4yt\xe4 tulokset"},
gNC(){return"L\xe4het\xe4 testi"},
gh4(){var w=this.d
if(w===$){w!==$&&B.S()
w=this.d=new A.aBk()}return w}}
A.aBd.prototype={
gbq(d){return"Testin tulokset"},
ga0j(){return"Testi\xe4 ei ole viel\xe4 l\xe4hetetty."},
gwW(){return"T\xe4ss\xe4 testiss\xe4 ei ollut kysymyksi\xe4."},
ga2s(){return"Pisteesi"},
N_(d,e){return""+d+" / "+e+" oikein"},
gDa(){return"Kertaa v\xe4\xe4r\xe4t vastaukset:"},
a2r(d){return"Vastauksesi: "+d},
ga0d(){return"(Ei vastausta)"},
gXv(){return"Onneksi olkoon! Sait kaiken oikein!"},
ga1v(){return"Yrit\xe4 testi\xe4 uudelleen"},
ga1z(){return"Kertaa muistikorteilla"},
gvs(){return"Takaisin aloitusn\xe4ytt\xf6\xf6n"}}
A.aBf.prototype={
gbq(d){return"Asetukset"},
gWz(d){return"Ulkoasu"},
gKN(d){return"Kieli"},
ga_J(){return"Valitse kieli"},
ga1W(){return"N\xe4yt\xf6n skaalaus"},
ga1X(){return"S\xe4\xe4d\xe4 tekstin ja elementtien kokoa"},
gEx(){return"J\xe4rjestelm\xe4n oletus"},
ga_O(){return"Vaalea"},
gY5(){return"Tumma"},
gYS(){return"Englanti"},
gZb(){return"Suomi"},
gY6(){return"Tietojen hallinta"},
gYV(){return"Vie tiedot"},
gYW(){return"Tallenna kaikki listat tiedostoon"},
ga_1(){return"Tuo tiedot"},
ga_2(){return"Lataa listat tiedostosta"},
gYg(){return"Poista kaikki tiedot"},
gC1(){var w=this.w
if(w===$){w!==$&&B.S()
w=this.w=new A.aBg()}return w},
gBf(){var w=this.x
if(w===$){w!==$&&B.S()
w=this.x=new A.aBe()}return w},
gq9(){var w=this.y
if(w===$){w!==$&&B.S()
w=this.y=new A.aBh()}return w}}
A.aB1.prototype={
gbq(d){return"Ohjaimet"},
gMo(){return"Liikkeet (Muistikortit)"},
ga_I(){return"N\xe4pp\xe4imist\xf6 (Muistikortit)"},
gwV(){return"Seuraava kortti"},
gxi(){return"Edellinen kortti"},
gwg(){return"K\xe4\xe4nn\xe4 kortti"},
gOw(){return"Pyyhk\xe4ise vasemmalle"},
gOx(){return"Pyyhk\xe4ise oikealle"},
gOy(){return"Pyyhk\xe4ise yl\xf6s tai alas"},
gWF(){return"Oikea nuolin\xe4pp\xe4in"},
gWE(){return"Vasen nuolin\xe4pp\xe4in"},
gWG(){return"Yl\xe4-/alanuoli tai v\xe4lily\xf6nti"}}
A.aB2.prototype={
ga_M(){return"\xa9 2025 Quizlone"},
gYj(d){return y.R}}
A.aBi.prototype={
gbq(d){return"Vahvista poisto"},
Xy(d,e){return"Haluatko varmasti poistaa listan '"+e+"'?"}}
A.aB6.prototype={
ga_Q(){return"Listan nimi ei voi olla tyhj\xe4."},
gky(){return"Termej\xe4/m\xe4\xe4ritelmi\xe4 ei ole sy\xf6tetty."},
ga_m(){return y.r},
YN(d){return"Muotovirhe rivin "+d+y.J},
ga0h(){return y.c},
MT(d){return"Listan tallennus ep\xe4onnistui: "+d}}
A.aB8.prototype={
gky(){return y.b},
gwZ(){return y.B}}
A.aB9.prototype={
gXU(){return"Oikein!"},
a_7(d){return"V\xe4\xe4rin. Oikea vastaus: "+d},
ZT(d,e){return'Vihje: Alkaa kirjaimella "'+e+'"'},
Nu(d){return"Ohitettu. Vastaus oli: "+d}}
A.aBb.prototype={
gWu(){return"Kaikki termit opittu!"},
Jh(d,e,f){return"Kierros "+d+" | Kohde "+e+" / "+f},
gN7(){return"Oppimisistunto valmis! Hyv\xe4\xe4 ty\xf6t\xe4!"},
a04(d){var w=B.rP("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+d+" kohdetta viel\xe4 kertaamatta.")},
Nx(d,e){return"Aloitetaan kierros "+e+", jossa on "+d+" kohdetta..."}}
A.aBk.prototype={
ga_V(){return y.P},
gky(){return"Testiss\xe4 ei ole saatavilla termej\xe4."},
gwZ(){return y._}}
A.aBg.prototype={
gbq(d){return"Vahvista tuonti"},
gvH(d){return y.u},
gMO(d){return"Tuo"}}
A.aBe.prototype={
gbq(d){return"Vahvista poisto"},
gvH(d){return y.N},
gYf(){return"Poista kaikki"}}
A.aBh.prototype={
ga0f(){return"Ei viet\xe4vi\xe4 tietoja."},
YX(d){return"Virhe tietojen vienniss\xe4: "+d},
a_4(d){return""+d+" listaa tuotu onnistuneesti!"},
a_3(d){return"Virhe tietojen tuonnissa: "+d},
gWt(){return"Kaikki opiskelulistat on poistettu."}}
var z=a.updateTypes([])
A.aCE.prototype={
$1(d){return A.b3D(this.a,d)},
$S:84}
A.aCn.prototype={
$1$error(d){return"Virhe: "+B.m(d)},
$S:44}
A.aCo.prototype={
$1$count(d){var w
this.a.gis()
w=B.rP("fi")
return w.$3$one$other(d,"1 termi",B.m(d)+" termi\xe4")},
$S:95}
A.aCp.prototype={
$1$listName(d){return"Haluatko varmasti poistaa listan '"+B.m(d)+"'?"},
$S:218}
A.aCw.prototype={
$1$line(d){return"Muotovirhe rivin "+B.m(d)+y.J},
$S:219}
A.aCx.prototype={
$1$error(d){return"Listan tallennus ep\xe4onnistui: "+B.m(d)},
$S:44}
A.aCy.prototype={
$1$id(d){return"Debug: Nykyinen aktiivinen ID on "+B.m(d)},
$S:220}
A.aCz.prototype={
$1$answer(d){return"V\xe4\xe4rin. Oikea vastaus: "+B.m(d)},
$S:55}
A.aCA.prototype={
$1$char(d){return'Vihje: Alkaa kirjaimella "'+B.m(d)+'"'},
$S:222}
A.aCB.prototype={
$1$answer(d){return"Ohitettu. Vastaus oli: "+B.m(d)},
$S:55}
A.aCC.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Kierros "+B.m(d)+" | Kohde "+B.m(e)+" / "+B.m(f)},
$S:223}
A.aCD.prototype={
$1$count(d){var w
this.a.gis()
w=B.rP("fi")
return w.$3$one$other(d,y.K,"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. "+B.m(d)+" kohdetta viel\xe4 kertaamatta.")},
$S:95}
A.aCq.prototype={
$2$count$cycleNum(d,e){return"Aloitetaan kierros "+B.m(e)+", jossa on "+B.m(d)+" kohdetta..."},
$S:224}
A.aCr.prototype={
$2$score$total(d,e){return B.m(d)+" / "+B.m(e)+" oikein"},
$S:225}
A.aCs.prototype={
$1$answer(d){return"Vastauksesi: "+B.m(d)},
$S:55}
A.aCt.prototype={
$1$error(d){return"Virhe tietojen vienniss\xe4: "+B.m(d)},
$S:44}
A.aCu.prototype={
$1$count(d){return B.m(d)+" listaa tuotu onnistuneesti!"},
$S:226}
A.aCv.prototype={
$1$error(d){return"Virhe tietojen tuonnissa: "+B.m(d)},
$S:44};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Tz,B.hi)
w(A.aB5,B.TB)
w(A.aB3,B.Ty)
w(A.aBj,B.TP)
w(A.aB7,B.TC)
w(A.aBc,B.TI)
w(A.aB4,B.TA)
w(A.aBa,B.TE)
w(A.aBl,B.TQ)
w(A.aBd,B.TJ)
w(A.aBf,B.TL)
w(A.aB1,B.Tw)
w(A.aB2,B.Tx)
w(A.aBi,B.TO)
w(A.aB6,B.TD)
w(A.aB8,B.TF)
w(A.aB9,B.TG)
w(A.aBb,B.TH)
w(A.aBk,B.TR)
w(A.aBg,B.TM)
w(A.aBe,B.TK)
w(A.aBh,B.TN)
v(B.m0,[A.aCE,A.aCn,A.aCo,A.aCp,A.aCw,A.aCx,A.aCy,A.aCz,A.aCA,A.aCB,A.aCC,A.aCD,A.aCq,A.aCr,A.aCs,A.aCt,A.aCu,A.aCv])})()
B.aP0(b.typeUniverse,JSON.parse('{"Tz":{"hi":[],"jL":["h_","hi"]}}'))
var y={J:" l\xe4hell\xe4. L\xf6ydettiin tyhj\xe4 termi tai m\xe4\xe4ritelm\xe4.",U:"(Termi yhdelle riville, m\xe4\xe4ritelm\xe4 seuraavalle)",j:"Aktiivista opiskelulistaa ei l\xf6ytynyt tai listaa ei voitu ladata.",_:"Ei tarpeeksi termej\xe4 valitulle opiskelun pituudelle.",B:"Ei tarpeeksi termej\xe4 valitulle pituudelle.",K:"Enimm\xe4ism\xe4\xe4r\xe4 kierroksia saavutettu. 1 kohde viel\xe4 kertaamatta.",N:"Haluatko varmasti poistaa KAIKKI opiskelulistat? T\xe4t\xe4 toimintoa ei voi kumota.",c:"Kelvollisia termi/m\xe4\xe4ritelm\xe4-pareja ei l\xf6ytynyt.",l:"Oikeus\nMoraalisen oikeudenmukaisuuden periaate\nAurinko\nT\xe4hti, joka on planeettaj\xe4rjestelm\xe4n keskus",b:"Oppimistilassa ei ole saatavilla termej\xe4.",u:"T\xe4m\xe4 tuo opiskelulistat tiedostosta. Kaikki olemassa olevat listat, joilla on sama nimi, korvataan. Jatketaanko?",P:"Virhe ladattaessa opiskelulistaa testi\xe4 varten.",r:"Virheellinen muoto. Jokaisella termill\xe4 on oltava m\xe4\xe4ritelm\xe4 seuraavalla rivill\xe4.",R:"Yksinkertainen ja moderni opiskelusovellus, joka on rakennettu Flutterilla."}
var x={c:B.al("tK<h_,hi>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"owr+N7PXP9WpSB74rhLHtqzyje0=");