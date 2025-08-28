((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_4",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aTM(d,e,f){var w,v,u=null,t=new B.h0(d,x.c),s=new B.h0(d,x.c)
s=new A.Vj(t,s)
s.vD(d,u,e,u)
w=s.a
v=t.r
v.toString
w.r=v
t.r=A.b9U(s)
return s},
b9Q(d,e){var w="Quizlone",v="Inst\xe4llningar",u="Kontroller",t="Skapa ny lista",s="Bekr\xe4fta borttagning",r="Bildkort",q="Inl\xe4rning",p="Tillbaka till v\xe4lkomstsk\xe4rmen",o="Exportera data"
switch(e){case"appName":return w
case"general.back":return"Tillbaka"
case"general.cancel":return"Avbryt"
case"general.delete":return"Ta bort"
case"general.error":return"Fel"
case"general.next":return"N\xe4sta"
case"general.previous":return"F\xf6reg\xe5ende"
case"general.saveAndContinue":return"Spara och forts\xe4tt"
case"general.submit":return"Skicka"
case"general.all":return"Alla"
case"general.loading":return"Laddar..."
case"general.genericError":return new A.aGY()
case"general.reset":return"\xc5terst\xe4ll"
case"drawer.settings":return v
case"drawer.controls":return u
case"drawer.about":return"Om"
case"drawer.aboutDialog.legalese":return"\xa9 2025 Quizlone"
case"drawer.aboutDialog.description":return y.t
case"aboutScreen.version":return new A.aGZ()
case"aboutScreen.viewLicenses":return"Visa licenser"
case"startScreen.title":return w
case"startScreen.welcome":return"V\xe4lkommen!"
case"startScreen.createNewList":return t
case"startScreen.loadSavedList":return"Ladda sparad lista"
case"startScreen.noLists":return"Inga listor sparade \xe4n."
case"startScreen.termCount":return new A.aH_(d)
case"startScreen.confirmDeleteDialog.title":return s
case"startScreen.confirmDeleteDialog.content":return new A.aHa()
case"startScreen.renameListDialog.title":return"Byt namn p\xe5 listan"
case"startScreen.renameListDialog.rename":return"Byt namn"
case"startScreen.renameListDialog.errorNameExists":return"En lista med detta namn finns redan."
case"startScreen.renameListDialog.errorNameEmpty":return"Listnamnet kan inte vara tomt."
case"inputScreen.title":return t
case"inputScreen.listName":return"Listans namn"
case"inputScreen.listNameHint":return"t.ex. Kapitel 1 Ordlista"
case"inputScreen.pasteTerms":return"Klistra in dina termer nedan:"
case"inputScreen.pasteTermsHint":return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"
case"inputScreen.termsHint":return y.a
case"inputScreen.saveList":return"Spara lista"
case"inputScreen.errors.listNameEmpty":return"Listans namn kan inte vara tomt."
case"inputScreen.errors.noTerms":return"Inga termer/definitioner inmatade."
case"inputScreen.errors.invalidFormat":return y.C
case"inputScreen.errors.emptyTerm":return new A.aHl()
case"inputScreen.errors.noValidPairs":return y.M
case"inputScreen.errors.saveFailed":return new A.aHw()
case"modeSelectionScreen.title":return"Alternativ & L\xe4ge"
case"modeSelectionScreen.noActiveList":return"Ingen aktiv studielista hittades eller listan kunde inte laddas."
case"modeSelectionScreen.debugActiveId":return new A.aHH()
case"modeSelectionScreen.returnToWelcome":return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"
case"modeSelectionScreen.flashcardOptions":return"Inst\xe4llningar f\xf6r bildkort"
case"modeSelectionScreen.showTermFirst":return"Visa term f\xf6rst"
case"modeSelectionScreen.showDefFirst":return"Visa definition f\xf6rst"
case"modeSelectionScreen.studyOptions":return"Inst\xe4llningar f\xf6r Inl\xe4rning & Prov"
case"modeSelectionScreen.askForTerm":return"Visa definition, fr\xe5ga efter term"
case"modeSelectionScreen.askForDef":return"Visa term, fr\xe5ga efter definition"
case"modeSelectionScreen.studyLength":return"Studiel\xe4ngd:"
case"modeSelectionScreen.testFormat":return"Provformat"
case"modeSelectionScreen.writtenAnswer":return"Skrivet svar"
case"modeSelectionScreen.multipleChoice":return"Flerval"
case"modeSelectionScreen.flashcards":return r
case"modeSelectionScreen.learn":return q
case"modeSelectionScreen.test":return"Prov"
case"modeSelectionScreen.backToWelcome":return p
case"flashcardScreen.title":return r
case"flashcardScreen.noCards":return"Inga bildkort att visa."
case"flashcardScreen.noTerms":return"Inga termer tillg\xe4ngliga att studera."
case"flashcardScreen.shuffle":return"Blanda"
case"flashcardScreen.restart":return"Starta om"
case"learnScreen.title":return q
case"learnScreen.restartSession":return"Starta om inl\xe4rningssessionen"
case"learnScreen.backToOptions":return"Tillbaka till alternativ"
case"learnScreen.preparing":return"F\xf6rbereder n\xe4sta fr\xe5ga..."
case"learnScreen.answerHint":return"Skriv ditt svar h\xe4r..."
case"learnScreen.incorrect":return"Felaktigt"
case"learnScreen.hint":return"Ledtr\xe5d"
case"learnScreen.skip":return"Hoppa \xf6ver"
case"learnScreen.backToModeSelection":return"Tillbaka till l\xe4gesval"
case"learnScreen.errors.noTerms":return y.g
case"learnScreen.errors.notEnoughTerms":return y.U
case"learnScreen.feedback.correct":return"R\xe4tt!"
case"learnScreen.feedback.incorrect":return new A.aHS()
case"learnScreen.feedback.hint":return new A.aI2()
case"learnScreen.feedback.skipped":return new A.aI4()
case"learnScreen.progress.allLearned":return"Alla termer inl\xe4rda!"
case"learnScreen.progress.cycleStatus":return new A.aI5()
case"learnScreen.progress.sessionComplete":return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"
case"learnScreen.progress.maxCyclesReached":return new A.aH0(d)
case"learnScreen.progress.startingCycle":return new A.aH1()
case"testScreen.title":return"Prov"
case"testScreen.noQuestions":return"Inga fr\xe5gor f\xf6r detta prov."
case"testScreen.viewResults":return"Visa resultat"
case"testScreen.submitTest":return"L\xe4mna in provet"
case"testScreen.errors.loadFailed":return y.Q
case"testScreen.errors.noTerms":return"Inga termer tillg\xe4ngliga f\xf6r provet."
case"testScreen.errors.notEnoughTerms":return y.k
case"resultsScreen.title":return"Provresultat"
case"resultsScreen.notSubmitted":return"Provet har inte l\xe4mnats in \xe4n."
case"resultsScreen.noQuestions":return"Det fanns inga fr\xe5gor i detta prov."
case"resultsScreen.yourScore":return"Ditt resultat"
case"resultsScreen.scoreFraction":return new A.aH2()
case"resultsScreen.reviewIncorrect":return"Granska felaktiga svar:"
case"resultsScreen.yourAnswerWas":return new A.aH3()
case"resultsScreen.noAnswer":return"(Inget svar)"
case"resultsScreen.congratulations":return"Grattis! Du hade alla r\xe4tt!"
case"resultsScreen.retryTest":return"F\xf6rs\xf6k igen"
case"resultsScreen.reviewFlashcards":return"Repetera med bildkort"
case"resultsScreen.backToWelcome":return p
case"settingsScreen.title":return v
case"settingsScreen.appearance":return"Utseende"
case"settingsScreen.language":return"Spr\xe5k"
case"settingsScreen.languageDialogTitle":return"V\xe4lj spr\xe5k"
case"settingsScreen.uiScaling":return"UI-skalning"
case"settingsScreen.uiScalingSubtitle":return y.H
case"settingsScreen.systemDefault":return"Systemstandard"
case"settingsScreen.light":return"Ljus"
case"settingsScreen.dark":return"M\xf6rk"
case"settingsScreen.english":return"Engelska"
case"settingsScreen.finnish":return"Finska"
case"settingsScreen.russian":return"Ryska"
case"settingsScreen.spanish":return"Spanska"
case"settingsScreen.swedish":return"Svenska"
case"settingsScreen.dataManagement":return"Datahantering"
case"settingsScreen.exportData":return o
case"settingsScreen.exportDataSubtitle":return"Spara alla listor till en fil"
case"settingsScreen.importData":return"Importera data"
case"settingsScreen.importDataSubtitle":return"Ladda listor fr\xe5n en fil"
case"settingsScreen.deleteAllData":return"Ta bort all data"
case"settingsScreen.exportDialog.title":return o
case"settingsScreen.exportDialog.content":return"Hur vill du exportera din data?"
case"settingsScreen.exportDialog.share":return"Dela fil"
case"settingsScreen.exportDialog.save":return"Spara p\xe5 enheten"
case"settingsScreen.importDialog.title":return"Bekr\xe4fta import"
case"settingsScreen.importDialog.content":return y.v
case"settingsScreen.importDialog.import":return"Importera"
case"settingsScreen.deleteDialog.title":return s
case"settingsScreen.deleteDialog.content":return y.w
case"settingsScreen.deleteDialog.deleteAll":return"Ta bort allt"
case"settingsScreen.snackbars.noDataToExport":return"Det finns ingen data att exportera."
case"settingsScreen.snackbars.exportSuccess":return"Data exporterades framg\xe5ngsrikt!"
case"settingsScreen.snackbars.exportError":return new A.aH4()
case"settingsScreen.snackbars.fileSaved":return"Filen har sparats!"
case"settingsScreen.snackbars.importSuccess":return new A.aH5()
case"settingsScreen.snackbars.importError":return new A.aH6()
case"settingsScreen.snackbars.allDeleted":return"Alla studielistor har tagits bort."
case"controlsScreen.title":return u
case"controlsScreen.gesturesTitle":return"Gester (Bildkort)"
case"controlsScreen.keyboardTitle":return"Tangentbord (Bildkort)"
case"controlsScreen.nextCard":return"N\xe4sta kort"
case"controlsScreen.previousCard":return"F\xf6reg\xe5ende kort"
case"controlsScreen.flipCard":return"V\xe4nd kort"
case"controlsScreen.swipeLeft":return"Svep v\xe4nster"
case"controlsScreen.swipeRight":return"Svep h\xf6ger"
case"controlsScreen.swipeVertical":return"Svep upp eller ner"
case"controlsScreen.arrowRight":return"H\xf6gerpiltangent"
case"controlsScreen.arrowLeft":return"V\xe4nsterpiltangent"
case"controlsScreen.arrowVerticalOrSpace":return"Upp/ner-piltangenter eller Mellanslag"
default:return null}},
b9U(d){return new A.aI6(d)},
Vj:function Vj(d,e){var _=this
_.ax=d
_.id=_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=_.ch=_.ay=$
_.a=e
_.at=_.as=_.Q=_.z=_.y=_.x=_.w=_.r=_.f=_.e=_.d=_.c=_.b=$},
aEQ:function aEQ(){},
aEI:function aEI(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aEw:function aEw(){},
aFN:function aFN(d,e){var _=this
_.d=d
_.f=_.e=$
_.a=e
_.c=_.b=$},
aEY:function aEY(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFh:function aFh(){},
aEM:function aEM(){},
aFd:function aFd(d,e){var _=this
_.e=d
_.w=_.r=_.f=$
_.a=e
_.d=_.c=_.b=$},
aFV:function aFV(d,e){var _=this
_.c=d
_.d=$
_.a=e
_.b=$},
aFl:function aFl(){},
aFB:function aFB(d,e){var _=this
_.f=d
_.y=_.x=_.w=$
_.a=e
_.e=_.d=_.c=$},
aEA:function aEA(){},
aEE:function aEE(){},
aFF:function aFF(){},
aFL:function aFL(){},
aEU:function aEU(){},
aF1:function aF1(){},
aF6:function aF6(){},
aFb:function aFb(d,e){this.b=d
this.a=e},
aFR:function aFR(){},
aFv:function aFv(){},
aFp:function aFp(){},
aFA:function aFA(){},
aI6:function aI6(d){this.a=d},
aGY:function aGY(){},
aGZ:function aGZ(){},
aH_:function aH_(d){this.a=d},
aHa:function aHa(){},
aHl:function aHl(){},
aHw:function aHw(){},
aHH:function aHH(){},
aHS:function aHS(){},
aI2:function aI2(){},
aI4:function aI4(){},
aI5:function aI5(){},
aH0:function aH0(d){this.a=d},
aH1:function aH1(){},
aH2:function aH2(){},
aH3:function aH3(){},
aH4:function aH4(){},
aH5:function aH5(){},
aH6:function aH6(){}}
B=c[0]
A=a.updateHolder(c[6],A)
A.Vj.prototype={
gi2(){var w=this.ay
if(w===$){w!==$&&B.v()
w=this.ay=this}return w},
gny(d){return"Quizlone"},
gdJ(){var w=this,v=w.ch
if(v===$){w.gi2()
w.ch!==$&&B.v()
v=w.ch=new A.aEQ()}return v},
glv(){var w,v=this,u=v.CW
if(u===$){w=v.gi2()
v.CW!==$&&B.v()
u=v.CW=new A.aEI(w,w)}return u},
grU(){var w=this,v=w.cx
if(v===$){w.gi2()
w.cx!==$&&B.v()
v=w.cx=new A.aEw()}return v},
gfj(){var w,v=this,u=v.cy
if(u===$){w=v.gi2()
v.cy!==$&&B.v()
u=v.cy=new A.aFN(w,w)}return u},
gfp(){var w,v=this,u=v.db
if(u===$){w=v.gi2()
v.db!==$&&B.v()
u=v.db=new A.aEY(w,w)}return u},
gdu(){var w=this,v=w.dx
if(v===$){w.gi2()
w.dx!==$&&B.v()
v=w.dx=new A.aFh()}return v},
gmu(){var w=this,v=w.dy
if(v===$){w.gi2()
w.dy!==$&&B.v()
v=w.dy=new A.aEM()}return v},
gep(){var w,v=this,u=v.fr
if(u===$){w=v.gi2()
v.fr!==$&&B.v()
u=v.fr=new A.aFd(w,w)}return u},
gl2(){var w,v=this,u=v.fx
if(u===$){w=v.gi2()
v.fx!==$&&B.v()
u=v.fx=new A.aFV(w,w)}return u},
ghw(){var w=this,v=w.fy
if(v===$){w.gi2()
w.fy!==$&&B.v()
v=w.fy=new A.aFl()}return v},
gcj(){var w,v=this,u=v.go
if(u===$){w=v.gi2()
v.go!==$&&B.v()
u=v.go=new A.aFB(w,w)}return u},
gf8(){var w=this,v=w.id
if(v===$){w.gi2()
w.id!==$&&B.v()
v=w.id=new A.aEA()}return v},
glS(){return this.ax}}
A.aEQ.prototype={
gx3(d){return"Tillbaka"},
gi7(d){return"Avbryt"},
gqx(d){return"Ta bort"},
gio(d){return"N\xe4sta"},
goe(){return"F\xf6reg\xe5ende"},
gvq(d){return"Skicka"},
gwQ(){return"Alla"},
gz3(){return"Laddar..."},
iw(d){return"Fel: "+d},
gzM(d){return"\xc5terst\xe4ll"}}
A.aEI.prototype={
gv8(){return"Inst\xe4llningar"},
gxk(d){return"Kontroller"},
grS(){return"Om"},
grT(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEE()}return w}}
A.aEw.prototype={
A9(d,e){return"Version "+e},
gAa(){return"Visa licenser"}}
A.aFN.prototype={
gaA(d){return"Quizlone"},
gAd(){return"V\xe4lkommen!"},
gxy(){return"Skapa ny lista"},
gz2(){return"Ladda sparad lista"},
gzk(){return"Inga listor sparade \xe4n."},
ux(d){var w=B.eW("sv")
return w.$3$one$other(d,"1 term",""+d+" termer")},
gte(){var w=this.e
if(w===$){w!==$&&B.v()
w=this.e=new A.aFF()}return w},
gmS(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aFL()}return w}}
A.aEY.prototype={
gaA(d){return"Skapa ny lista"},
gu3(){return"Listans namn"},
gyZ(){return"t.ex. Kapitel 1 Ordlista"},
gzx(){return"Klistra in dina termer nedan:"},
gzy(){return"(Term p\xe5 en rad, definition p\xe5 n\xe4sta)"},
gzX(){return y.a},
guY(){return"Spara lista"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aEU()}return w}}
A.aFh.prototype={
gaA(d){return"Alternativ & L\xe4ge"},
gl1(){return"\xc5terg\xe5 till v\xe4lkomstsk\xe4rmen"},
gyg(){return"Inst\xe4llningar f\xf6r bildkort"},
gvd(){return"Visa term f\xf6rst"},
gvb(){return"Visa definition f\xf6rst"},
gt5(){return"Visa definition, fr\xe5ga efter term"},
gt4(){return"Visa term, fr\xe5ga efter definition"},
gvp(){return"Studiel\xe4ngd:"},
gAi(){return"Skrivet svar"},
gzf(){return"Flerval"},
gyh(){return"Bildkort"},
gu0(){return"Inl\xe4rning"},
guy(){return"Prov"}}
A.aEM.prototype={
gaA(d){return"Bildkort"},
gzi(){return"Inga bildkort att visa."},
ger(){return"Inga termer tillg\xe4ngliga att studera."},
gvg(d){return"Blanda"},
gqi(){return"Starta om"}}
A.aFd.prototype={
gaA(d){return"Inl\xe4rning"},
gzQ(){return"Starta om inl\xe4rningssessionen"},
gx4(){return"Tillbaka till alternativ"},
gt_(){return"Skriv ditt svar h\xe4r..."},
gpQ(d){return"Ledtr\xe5d"},
gvh(d){return"Hoppa \xf6ver"},
ge4(){var w=this.f
if(w===$){w!==$&&B.v()
w=this.f=new A.aF1()}return w},
gnR(){var w=this.r
if(w===$){w!==$&&B.v()
w=this.r=new A.aF6()}return w},
glG(){var w,v=this.w
if(v===$){w=this.e
v!==$&&B.v()
v=this.w=new A.aFb(w,w)}return v}}
A.aFV.prototype={
gaA(d){return"Prov"},
gkU(){return"Inga fr\xe5gor f\xf6r detta prov."},
gAb(){return"Visa resultat"},
gvr(){return"L\xe4mna in provet"},
ge4(){var w=this.d
if(w===$){w!==$&&B.v()
w=this.d=new A.aFR()}return w}}
A.aFl.prototype={
gaA(d){return"Provresultat"},
gkU(){return"Det fanns inga fr\xe5gor i detta prov."},
gAk(){return"Ditt resultat"},
v0(d,e){return""+d+" / "+e+" r\xe4tt"},
gqk(){return"Granska felaktiga svar:"},
Aj(d){return"Ditt svar: "+d},
gzh(){return"(Inget svar)"},
gxi(){return"Grattis! Du hade alla r\xe4tt!"},
gzR(){return"F\xf6rs\xf6k igen"},
gzT(){return"Repetera med bildkort"}}
A.aFB.prototype={
gaA(d){return"Inst\xe4llningar"},
gwT(d){return"Utseende"},
gtZ(d){return"Spr\xe5k"},
gyR(){return"V\xe4lj spr\xe5k"},
guE(){return"UI-skalning"},
gA3(){return y.H},
gr7(){return"Systemstandard"},
gyX(){return"Ljus"},
gxE(){return"M\xf6rk"},
gxY(){return"Engelska"},
gyf(){return"Finska"},
gzW(){return"Ryska"},
gvk(){return"Spanska"},
gvx(){return"Svenska"},
gxF(){return"Datahantering"},
gy5(){return"Exportera data"},
gy6(){return"Spara alla listor till en fil"},
gyv(){return"Importera data"},
gyw(){return"Ladda listor fr\xe5n en fil"},
gxK(){return"Ta bort all data"},
gpR(){var w=this.w
if(w===$){w!==$&&B.v()
w=this.w=new A.aFv()}return w},
gpg(){var w=this.x
if(w===$){w!==$&&B.v()
w=this.x=new A.aFp()}return w},
gm1(){var w=this.y
if(w===$){w!==$&&B.v()
w=this.y=new A.aFA()}return w}}
A.aEA.prototype={
gaA(d){return"Kontroller"},
guJ(){return"Gester (Bildkort)"},
gyO(){return"Tangentbord (Bildkort)"},
go5(){return"N\xe4sta kort"},
gof(){return"F\xf6reg\xe5ende kort"},
gnY(){return"V\xe4nd kort"},
gvy(){return"Svep v\xe4nster"},
gvz(){return"Svep h\xf6ger"},
gvA(){return"Svep upp eller ner"},
gwX(){return"H\xf6gerpiltangent"},
gwW(){return"V\xe4nsterpiltangent"},
gwY(){return"Upp/ner-piltangenter eller Mellanslag"}}
A.aEE.prototype={
gyV(){return"\xa9 2025 Quizlone"},
gxM(d){return y.t}}
A.aFF.prototype={
gaA(d){return"Bekr\xe4fta borttagning"},
xj(d,e){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+e+"'?"}}
A.aFL.prototype={
gaA(d){return"Byt namn p\xe5 listan"},
gun(){return"Byt namn"},
gy_(){return"En lista med detta namn finns redan."},
gxZ(){return"Listnamnet kan inte vara tomt."}}
A.aEU.prototype={
gyY(){return"Listans namn kan inte vara tomt."},
ger(){return"Inga termer/definitioner inmatade."},
gyH(){return y.C},
xV(d){return"Formatfel n\xe4ra rad "+d+". Tom term eller definition hittades."},
gzl(){return y.M},
uX(d){return"Det gick inte att spara listan: "+d}}
A.aF1.prototype={
ger(){return y.g},
gkV(){return y.U}}
A.aF6.prototype={
gxt(){return"R\xe4tt!"},
yz(d){return"Fel. R\xe4tt svar: "+d},
yr(d,e){return'Ledtr\xe5d: B\xf6rjar med "'+e+'"'},
vi(d){return"\xd6verhoppad. Svaret var: "+d}}
A.aFb.prototype={
gwS(){return"Alla termer inl\xe4rda!"},
tj(d,e,f){return"Omg\xe5ng "+d+" | Fr\xe5ga "+e+" av "+f},
gv4(){return"Inl\xe4rningssessionen \xe4r klar! Bra jobbat!"},
z7(d){var w=B.eW("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+d+" fr\xe5gor kvar att repetera.")},
vm(d,e){return"Startar omg\xe5ng "+e+" med "+d+" fr\xe5ga(or)..."}}
A.aFR.prototype={
gz1(){return y.Q},
ger(){return"Inga termer tillg\xe4ngliga f\xf6r provet."},
gkV(){return y.k}}
A.aFv.prototype={
gaA(d){return"Bekr\xe4fta import"},
gky(d){return y.v},
guV(d){return"Importera"}}
A.aFp.prototype={
gaA(d){return"Bekr\xe4fta borttagning"},
gky(d){return y.w},
gxJ(){return"Ta bort allt"}}
A.aFA.prototype={
gzj(){return"Det finns ingen data att exportera."},
y7(d){return"Fel vid export av data: "+d},
yy(d){return""+d+" listor importerades framg\xe5ngsrikt!"},
yx(d){return"Fel vid import av data: "+d},
gwR(){return"Alla studielistor har tagits bort."}}
var z=a.updateTypes([])
A.aI6.prototype={
$1(d){return A.b9Q(this.a,d)},
$S:56}
A.aGY.prototype={
$1$error(d){return"Fel: "+B.j(d)},
$S:11}
A.aGZ.prototype={
$1$version(d){return"Version "+B.j(d)},
$S:82}
A.aH_.prototype={
$1$count(d){var w
this.a.gi2()
w=B.eW("sv")
return w.$3$one$other(d,"1 term",B.j(d)+" termer")},
$S:39}
A.aHa.prototype={
$1$listName(d){return"\xc4r du s\xe4ker p\xe5 att du vill ta bort '"+B.j(d)+"'?"},
$S:80}
A.aHl.prototype={
$1$line(d){return"Formatfel n\xe4ra rad "+B.j(d)+". Tom term eller definition hittades."},
$S:67}
A.aHw.prototype={
$1$error(d){return"Det gick inte att spara listan: "+B.j(d)},
$S:11}
A.aHH.prototype={
$1$id(d){return"Debug: Nuvarande aktivt ID \xe4r "+B.j(d)},
$S:74}
A.aHS.prototype={
$1$answer(d){return"Fel. R\xe4tt svar: "+B.j(d)},
$S:24}
A.aI2.prototype={
$1$char(d){return'Ledtr\xe5d: B\xf6rjar med "'+B.j(d)+'"'},
$S:69}
A.aI4.prototype={
$1$answer(d){return"\xd6verhoppad. Svaret var: "+B.j(d)},
$S:24}
A.aI5.prototype={
$3$cycleNum$itemNum$total(d,e,f){return"Omg\xe5ng "+B.j(d)+" | Fr\xe5ga "+B.j(e)+" av "+B.j(f)},
$S:68}
A.aH0.prototype={
$1$count(d){var w
this.a.gi2()
w=B.eW("sv")
return w.$3$one$other(d,y.R,"Max antal omg\xe5ngar n\xe5ddes. "+B.j(d)+" fr\xe5gor kvar att repetera.")},
$S:39}
A.aH1.prototype={
$2$count$cycleNum(d,e){return"Startar omg\xe5ng "+B.j(e)+" med "+B.j(d)+" fr\xe5ga(or)..."},
$S:88}
A.aH2.prototype={
$2$score$total(d,e){return B.j(d)+" / "+B.j(e)+" r\xe4tt"},
$S:87}
A.aH3.prototype={
$1$answer(d){return"Ditt svar: "+B.j(d)},
$S:24}
A.aH4.prototype={
$1$error(d){return"Fel vid export av data: "+B.j(d)},
$S:11}
A.aH5.prototype={
$1$count(d){return B.j(d)+" listor importerades framg\xe5ngsrikt!"},
$S:84}
A.aH6.prototype={
$1$error(d){return"Fel vid import av data: "+B.j(d)},
$S:11};(function inheritance(){var w=a.inherit,v=a.inheritMany
w(A.Vj,B.di)
w(A.aEQ,B.ub)
w(A.aEI,B.u9)
w(A.aEw,B.u6)
w(A.aFN,B.up)
w(A.aEY,B.uc)
w(A.aFh,B.ui)
w(A.aEM,B.ua)
w(A.aFd,B.ue)
w(A.aFV,B.ur)
w(A.aFl,B.uj)
w(A.aFB,B.ul)
w(A.aEA,B.u7)
w(A.aEE,B.u8)
w(A.aFF,B.uo)
w(A.aFL,B.uq)
w(A.aEU,B.ud)
w(A.aF1,B.uf)
w(A.aF6,B.ug)
w(A.aFb,B.uh)
w(A.aFR,B.us)
w(A.aFv,B.um)
w(A.aFp,B.uk)
w(A.aFA,B.un)
v(B.j9,[A.aI6,A.aGY,A.aGZ,A.aH_,A.aHa,A.aHl,A.aHw,A.aHH,A.aHS,A.aI2,A.aI4,A.aI5,A.aH0,A.aH1,A.aH2,A.aH3,A.aH4,A.aH5,A.aH6])})()
B.a3e(b.typeUniverse,JSON.parse('{"Vj":{"di":[],"hF":["dG","di"]}}'))
var y={v:"Detta kommer att importera studielistor fr\xe5n en fil. Befintliga listor med samma namn kommer att skrivas \xf6ver. Forts\xe4tta?",t:"En enkel, modern studieapplikation byggd med Flutter.",Q:"Fel vid laddning av studielista f\xf6r provet.",M:"Inga giltiga par av term/definition hittades.",g:"Inga termer tillg\xe4ngliga f\xf6r inl\xe4rningsl\xe4get.",U:"Inte tillr\xe4ckligt med termer f\xf6r den valda l\xe4ngden.",k:"Inte tillr\xe4ckligt med termer f\xf6r den valda studiel\xe4ngden.",H:"Justera storleken p\xe5 text och gr\xe4nssnittselement",R:"Max antal omg\xe5ngar n\xe5ddes. 1 fr\xe5ga kvar att repetera.",C:"Ogiltigt format. Varje term beh\xf6ver en definition p\xe5 n\xe4sta rad.",a:"R\xe4ttvisa\nPrincipen om moralisk riktighet\nSol\nEn stj\xe4rna som \xe4r centrum i ett planetsystem",w:"\xc4r du s\xe4ker p\xe5 att du vill ta bort ALLA studielistor? Denna \xe5tg\xe4rd kan inte \xe5ngras."}
var x={c:B.al("h0<dG,di>")}};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_4",e:"endPart",h:b})})($__dart_deferred_initializers__,"w7CSiKxLzol7juh4zIMLLohSFp8=");