.. _tut-intro:

**********************
Galandinam apetitą
**********************

Jeigu Jūs daug dirbate kompiuteriais, galų gale Jūs pamatysite, kad egzistuoja 
kažkokios užduotis, kurias galite automatizuoti. Pavyzdžiui, galima atlikti
paiešką ir pakeisti daug tekstinių failų, ar pervadinti ir pertvarkyti sauja
nuotraukų sudėtingu būdu. Galbūt norite parašyti mažas nestandartines
duomenų bazes ar specializuota GUI aplikaciją, ar paprastą žaidimą.

Jeigu esate profesionalus programuotojas, Jums gali tekti dirbti su keliomis 
C/C++/Java biliotekomis, bet įprastas rašymo / kompiliavimo / testavimo / pakartotinio 
kompiliavimo ciklas yra pernelyg lėtas. Galbūt Jūs rašote testavimo komplektą 
tokiai biliotekai, bet greitai atrandat, kad testavimo komplekto rašymas 
yra per didelė užduotis. O gal Jūs parašėte programa, kuri gali naudoti 
pratęsimo kalbą ir Jūs nenorite kurti ir įgyvendinti visiškai naują kalbą
Jūsų programai.

Python yra kalba kaip tik Jums.

Jūs galite naudoti Unix kiauto (shell) skriptą arba Windows batch failą tam tikroms 
užduotis, bet skiauto scriptai yra puikūs keisti failus ir teksto duomenis, bet  
netinka GUI programomis ir žaidimams. Jūs galite rašyti C/C++/Java programas, 
bet tai užtruks daug laiko iki pirmos programos. Python yra paprastesnis naudojimui 
Windows, Mac OS X ir UNIX operacinėse sistemose ir padės darbą padaryti kuo greičiau.

Python yra lengvas naudoti, bet tai yra reali programavimo kalba, siųlanti daug 
daugiau struktūros ir palaikymą didelėms programomis, atvirkščiai nei kiauto scriptai 
ar batch failai gali pasiųlyti. Kita vertus, Python taip pat siųlo daug daugiau 
klaidų tikrinimo negu C, ir būdama aukšto lygio programavimo kalba, ji turi 
aukšto lygio duomenu tipus, lankščius masyvūs ir žodynus. Kadangi yra daug pagrindinių 
kintamųjų tipų, Python yra tiknamas daugybei problemų sprendimui, atvirkščiai nei 
Awk ar net Perl, tuo pat metu tai taip lengva Python'e, kaip ir tose kalbose.

Python leidžia suskirstyti programą į modulius, kurie gali būti naudojami kitose 
Python programose. Jis ateina su didesniu standartiniu moduliu paketu, kurį  
galite naudoti savo programose -- arba kaip pavyzdžius mokindamiesi Python. 
Kaikurie moduliai suteikia galimybę skaityti/rašyti failus, inicijuoti sisteminius kvietimus, 
socket'us arba net sąsajas su GUI įrankiais, kaip Tk.

Python yra interpretuojama kalba, kuri gali išsaugoti Jums didelius laiko kaštus 
rašant programą, kadangi nebereikia kompiliavimo ir linkinimo. Interpretatorius 
gali būti naudojamas interaktyviai, kas leidžia lengvai eksperementuoti su 
kalbos ypatumais, testinėmis programomis, ar tiesiog testuojant tam tikras 
funkcijas, per atvirkščią programos kūrimą. Jis taip pat yra galingas stalo 
škaičiuotuvas.


Python leidžia programoms būti parašytoms kompaktiškai ir įskaitomai. Programos 
rašymas Python'e tipiškai yra daug trumpesnis, negu ekvivalenčioms C, C++ ar Java 
programos, kadangi:

* aukšto lygio duomenų tipai leidžia išreikšti kompleksinius sveiksmus vienu 
  teiginiu;

* teiginio grupavimas yra vykdomas atskirimu, o ne laužtiniais skliaustais;

* nereikia deklaruoti kintamūjų ar argumentų;

Python yra *išplečimas*: jeigu žinote programą, parašyta C kalba, labai lengva įdėti 
naują įskiepytą funkciją ar modulį į interpretatoriu, taip pat atlikti 
kritines operacijas didžiausiu greičiu, ar sujungti Python programas su bibliotekomis, 
kurios egzistuoja tik binarinėje formoje ( kaip atgalinė grafinė biblioteka). 
Kaip tik esate pasiruotęs, jūs galite sujungti Python interpretatorių su programa, 
parašyta C kalba ir naudoti ją kaip papildymą ar komandinę kalbą programai.

Tiesa, kalba yra pavadinta dėl BBC laidos "Monty Python's Flying Circus" ir neturi 
nieko bendro su reptilijomis. Darydami nurodymus į Monty Python parodiją 
dokumentacijoje nėra tik leidžiamas, bet ir propaguojamas!

Kadangi dabar esate sujaudinti dėl Python, galima išegzaminuoti jį daug detalesniu 
pavidalu. O geriausias būdas išmokti programavimo kalbą yra ją naudoti, todėl vadovas 
kviečia pažaisti su Python interpretatoriumi, skaitymo metu.

Sekančiam skyriuje, paaiškinsime interpretatoriaus naudojimo mechanika. Tai yra 
gan neįdomi informacija, bet būtina bendydami mūsų pavyzdžius vėliau.

Likęs vadovas pristato įvairius Python kalbos įpatumus ir pereina per pavyzdžius, 
pradedant paprastais išsireiškimais, deklaravimais ir duomenų tipais, iki funkcijų, 
modulių ir galiausiai paliesime aukščiausius konceptus, kaip išskirtinumus ir 
vartotojo aprašytas klases.


