.. _tut-intro:

******************
Apetitui sužadinti
******************

Jeigu dirbate kompiuteriu anksčiau ar vėliau pastebėsite, kad yra užduočių,
kurias norėtumėte automatizuoti. Pavyzdžiui, jums gali prireikti atlikti teksto
pakeitimo operaciją dideliam tekstinių failų kiekiui arba pervadinti ir
surikiuoti didelį nuotraukų kiekį ypatinga tvarka. Galbūt jūs norėtumėte
parašyti mažą duombazę, specializuotą grafinę programą arba paprastą žaidimą.

Jei esate profesionalus programuotojas, tikriausiai jums reikia dirbti su
keliomis C/C++/Java bibliotekomis, bet įprastas darbo ciklas
rašai/kompiliuoji/testuoti/perkompiliuoji jums yra per lėtas. Galbūt jūs rašote
testavimo įrankį tokiai bibliotekai ir testinio kodo rašymas yra varginanti
užduotis. Galbūt jūs parašėte programą, kuri galėtų naudoti praplėtimo kalbą ir
jūs nenorite sukurti visos naujos kalbos jūsų aplikacijai.

Python'as yra kalba kaip tik jums.

Žinoma, galite rašyti Unix'o arba Windows'ų skriptus realizuoti kai kurioms iš
šių užduočių, nes skriptai tinka failų operacijoms ir tekstinių duomenų
keitimui, bet nėra tinkami grafinėms aplikacijoms ar žaidimams. Jūs galite
rašyti C/C++/Java programą, bet jums reikės tikrai daug laiko norint parašyti
pačią pirmą programos versiją. Naudoti Python'ą yra paprasčiau, jis veikia
Windows, Max OS X ir Unix-tipo operacinėse sistemose ir su juo darbą atliksite
daug greičiau.

Python'ą paprasta naudoti, bet tuo pačiu tai yra pilnavertė programavimo kalba,
kur kas geriau struktūrizuota ir lengviau palaikoma rašant didelės apimties
programas, nei skriptai. Iš kitos pusės, Python'as gali pasiūlyti daugiau
klaidų tikrinimo negu C ir būdama *labai-aukšto-lygio kalba* Python'as turi
standartinių aukšto lygio duomenų tipų kaip kad lanksčių masyvų ir žodynų. Dėl
bendresnių duomenų tipų Python'as gali būti pritaikytas platesniam problemų
spektrui nei Awk ar netgi Perl ir vėlgi dauguma dalykų padaromi taip pat
lengvai Python'u kaip ir paminėtomis kalbomis.

Python'as leidžia jūsų programas išskaidyti į modulius, kurie gali būti panaudoti
kitose Python'o programose. Python'e yra daug standartinių modulių, kuriuos jūs
galite naudoti kaip pagrindą savo programoms arba kaip pavyzdį pradedant mokytis
programuoti Python'u. Kai kurie iš šių modulių leidžia atlikti failų operacijas,
sisteminius kvietimus, lizdų (angl. socket) operacijas arba netgi grafines naudotojo aplinkas naudojant
bibliotekas kaip Tk.

Python'as yra interpretuojama kalba, o tai reiškia kad jūs galite sutaupyti daug laiko,
nes programos kūrimo metu nereikia kompiliuoti ir saistyti. Interpretatorius gali
būti naudojamas interaktyviai, todėl jūs galite lengvai eksperimentuoti su įvairiomis
kalbos galimybėmis, rašyti programas pasibandymui arba testuoti funkcijas programuodami
iš apačios viršun. Tai taip pat tiesiog patogus skaičiuotuvas.

Python'as leidžia rašyti programas kompaktiškai ir skaitomai. Programos parašytos
Python'u dažniausiasi yra trumpesnės negu ekvivalenčios programos parašytos
C, C++ arba Java dėl kelių priežasčių:

* aukšto lygio duomenų tipai leidžia išreikšti sudėtingas operacijas paprastais
  sakiniais;

* sakinių grupavimas atliekamas stumdant tekstą užuot naudojus pradžios ir pabaigos
  skliaustelius;

* kintamųjų ar argumentų nereikia deklaruoti.

Python'as yra *išplečiamas*: jeigu jūs mokate programuoti C tada labai paprasta
pridėti naujas funkcijas ar modulius į interpretatorių. Tai gali praversti
norint atlikti operacijas maksimaliu greičiu arba susaistyti Python'o programas
su bibliotekomis, kurias turime tik sukompiliuotame formate (pvz.: tiekėjui
specifines grafines bibioletekas). Jeigu jums reikia, jūs galite susieti Python'o
interpretatorių su programa parašyta C ir naudoti jį kaip praplėtimų arba komandinę
kalbą tai programai.

Tarp kitko, programa yra pavadinta pagal BBC laidą „Monty Python's Flying
Circus“ ir neturi nieko bendro su reptilijomis. Nuorodos į Monty Python ištraukas
dokumentacijoje yra ne tik leidžiamos, bet ir skatinamos!

Dabar, kai jūs jau esate susižavėjęs Python'u, jūs norite jį panagrinėti detaliau. Kadangi
geriausias būdas išmokti kalbą yra ją naudoti, vadovėlis kviečia jus žaisti su
Python'o interpretatoriumi beskaitant.

Kitoje dalyje paaiškinta, kaip naudotis interpretatoriumi. Tai nėra labai įdomi informacija,
bet būtina norint išbandyti vėliau pateiktus pavyzdžius.

Likęs vadovėlis supažindina su įvairiomis Python kalbos savybėmis ir sistema per pavyzdžius.
Pradedama nuo paprastų reiškinių, sakinių ir duomenų struktūrų, vėliau paaiškinamos funkcijos
ir moduliai, ir galiausia paliečiami pažangesnės koncepsijos kaip kad išimtys ir naudotojo
apibrėžtos klasės.
