.. _tut-classes:

******
Klasės
******

Python'o klasių mechanizmas prideda klases į kalbą naudodamas minimalų
kiekį naujos sintaksės ir semantikos. Naudojamas klasių mechanizmo
randamo C++ ir Modula-3 kalbose mišinys. Lygiai taip pat kaip ir
su moduliais, Python'o klasėse nėra absoliučios ribos tarp apibrėžimo
ir vartotojo - tiesiog tikimasi vartotojo suprantingumo "nesulaužant
apibrėžimo". Visgi svarbiausios klasių savybės yra pilnai išsaugotos:
paveldėjimo mechanizmas leidžia naudoti kelias bazines klases, paveldėta
klasė gali perrašyti bazinės klasės/bazinių klasių metodus ir metodai
gali iškviesti bazinės klasės metodus tuo pačiu vardu. Objektuose
galima laikyti reikiamą privačių duomenų kiekį.

Jei naudosime C++ terminologiją, visi klasės nariai (taip pat duomenys)
yra *vieši*, visos klasės funkcijos yra *virtualios*. Taip pat
neegzistuoja specialūs konstruktoriai ar destruktoriai. Lygiai taip
pat kaip Modula-3 neegzistuoja sutrumpinimo norint pasiekti objekto
narius iš jo metodo: metodinė funkcija yra apibrėžiama naudojant
pirmą argumentą, kuris nurodo objektą, ir šis argumentas visada
paduodamas kviečiant funkciją. Kaip Smalltalk pačios klasės yra
objektai, arba platesne žodžio prasme: Python'e visi duomenų tipai
yra objektai. Tai suteikia importavimo ir pervadinimo semantiką.
Skirtingai nuo C++ ir Modula-3, standartiniai tipai gali būti
naudojami kaip bazinės klasės kai vartotojui reikia juos
praplėsti. Taip pat kaip C++ bet ne kaip Modula-3, dauguma
standartinių operatorių naudojant specialią sintaksę (aritmetiniai
operatoriai ir t.t.) klasėse gali būti perrašyti.

.. _tut-terminology:

Žodis Apie Terminologiją
========================

Kadangi trūksta universalios terminologijos šnekant apie klases, aš
kartais naudosiu Smalltalk ir C++ terminus (aš naudočiau Modula-3
terminologiją, nes jos objektiškų-orientiškumo semantika
artimesnė Python'ui negu C++, bet aš nesitikiu, kad daug skaitytojų
yra apie ją girdėję).

Kiekvienas objektas yra individualus, yra keletas vardų (skirtingose vietose)
gali nurodyti į tą patį objektą. Kitose kalbose tai vadinama susitapatinimu.
Tai dažniausiai nėra įvertinama iš pirmo žvilgsnio ir netgi gali būti
saugiai ignoruojama, kai dirbama su paprastais nekintamais tipais (skaičiais,
eilutėmis ar kortežais). Tačiau susitapatinimas turi (planuotą!) efektą
semantikai Python'o kode kai dirbama su kintamais objektais kaip sąrašai,
žodynai ir dauguma tipų, kurie reprezentuoja objektus už programos ribų
(failus, langus ir t.t.). Tai dažniausiai naudojama programos naudai,
nes susitapatinimas elgiasi kaip rodyklė tam tikrais atžvilgiais.
Pavyzdžiui, perduoti objektą yra pigu, nes perduodama tik nuoroda. Ir
jeigu funkcija modifikuoja objektą, kuris buvo perduotas kaip
argumentas, kvietėjas taip pat matys tuos pakeitimus --- dėka to mums
nereikia dviejų skirtingų argumentų perdavimo mechanizmų kaip
Paskalyje.

.. _tut-scopes:

Python'o Sritys ir Vardų Erdvės
===============================

Prieš klasių pristatymą, aš pirmiausia turiu papasakoti apie Python'o
sričių taisykles. Klasių apibrėžtis naudoja kelis triukus su vardų
erdvėmis ir jūs turite žinoti kaip sritys ir vardų erdvės veikia,
kad visiškai suprastūmėte kas vyksta. Tuo pačiu šios žinios
naudingos bet kuriam patyrusiam Python'o programuotojui.

Pradėkime nuo kelių apibrėžimų.

*Vardų erdvė* yra vardų į objektus atvaizdis. Dauguma vardų erdvių
yra įgyvendintos naudojant Python'o žodynus, bet įprastai tai nėra
matoma (išskyrus greityje) ir ateityje tai gali pasikeisti. Vardų
erdvių pavyzdžiai: standartinių vardų aibė (funkcijos kaip :func:`abs`, ir
standartinių išimčių vardai); globalūs vardai modulyje, lokalūs vardai
funkcijoje. Tam tikra prasme objekto atributų aibė taip pat suformuoja
vardų erdvę. Svarbiasias dalykas, kurį reikia suprasti apie vardų
erdves, kad nėra visiškai jokio ryšio tarp vardų skirtingose vardų
erdvėse. Pvz.: du skirtingi moduliai gali apibrėžti tą pačią funkciją
"maksimizuoti"a --- tam kad vartotojai nesusimaišytų, modulio
vartotojai turėtų pridėti modulio vardą prieš funkciją.

Tarp kitko, aš naudoju žodį *atributas* kiekvienam vardui po taško ---
pvz.: reiškinyje ``z.real``, ``real`` yra objekto ``z`` atributas.
Griežtai šnekant, nuorodos į vardus moduliuose yra atributų
nuorodos: reiškinyje ``modname.funcname``, ``modname`` yra modulio
objektas ir ``funcname`` yra jo atributas. Šiuo atveju įvyksta tiesioginis
atvaizdavimas tarp modulio atributo ir globalių vardų apibrėžtų
modulyje: jie naudojasi ta pačia vardų erdve! [#]_

Atributas gali būti tik-skaitomi arba rašomi. Pastaruoju atveju, priskyrimas
atributams yra galimas. Modulių atributai yra rašomi:  jūs galite parašyti
``modname.the_answer = 42``. Rašomi atributai gali būti ištrinti
naudojant raktažodžio :keyword:`del` sakinį.  Pvz.: ``del modname.the_answer``
pašalins atributą :attr:`the_answer` iš objekto pavadinto ``modname``.

Vardų erdvės yra sukuriamos skirtingais momentais ir gyvuoja skirtingą laiko
tarpą. Vardų erdvės, kuriose laikomi įtaisyti vardai, yra sukuriamos
kai Python'o interpretatorius startuoja, ir niekada nėra ištrinamos.
Globali vardų erdvė moduliui yra sukuriama kaip perskaitomas
modulio apibrėžimas. Paprastai, modulio vardų erdvė gyvuoja kol
interpretatorius baigia savo darbą. Sakiniai, kurie yra vykdomi
interpretoriuje aukščiausiame lygyje (tiek skaitant iš skripto failo
arba interaktyviai) yra laikomo modulio :mod:`__main__` dalimi, taigi
jie turi savo vardų erdvę. Įtaisyti vardai taip pat laikomi
modulyje pavadintame :mod:`__builtin__`.

Lokali vardų erdvė funkcijai yra sukuriama kai funkcija yra iškviečiama ir
yra ištrinama (tiesa sakant, "pamirštama" yra tinkamesnis žodis apibūdinti
tam kas iš tikro atsitinka) kai funkcija sugrįžta arba iškelia išimtį, kuri nėra
suvaldoma funkcijoje. Žinoma, kiekvienas rekursyvūs šaukimai turi
savo lokalią vardų erdvę.

*Sritis* yra tekstinis regionas Python'o programoje, kuri vardų erdvę
yra tiesiogiai pasiekiama. "Tiesiogiai pasiekiama" šiuo atveju reiškia,
kad neapribotas nuorodą į vardą bando surasti vardą vardų erdvėje.

Nors sritys yra apibrėžtos statiškai, jos naudojamos dinamiškai. Bet kuriuo
vykdymo momentu egzistuoja bent trys vidinės sritys, kurių vardų erdvė
yra tiesiogiai pasiekiama: vidinė sritis, kurioje ieškoma
pirmiausia, saugo lokalius vardus; vardų sritys bet kuriai funkcijai,
kurios yra ieškomos nuo artimiausios uždarančios srities; vėliau ieškoma
vidurinėje srityje, kurioje laikomi dabartinio modulio globalūs vardai.
Išorinė sritis ieškoma paskutinė ir joje laikomi įtaisyti vardai.

Jeigu vardas apie paskelbtas globaliai, tada visos nuorodos ir priskyrimai
vykdomi vidurinei sričiai, kurioje yra modulio globalūs vardai. Kitu
atveju, visi kintamieji esantis vidinėje srityje yra tik-skaitomi (bandymas
rašyti į tokį kintamąjį paprasčiausiai sukurs *naują* lokalų kintamąjį
vidinėje srityje ir nepalies taip pat pavadinto išorinio kintamojo).

Įprastai lokali sritis nurodo į lokalius vardus dabartinėje funkcijoje.
Už funkcijų ribų lokali sritis nurodo tą pačią vardų erdvę kaip
ir globali sritis: modulio vardų erdvę. Klasės apibrėžtis taip pat
sukuria dar vieną vardų erdvę lokalioje srityje.

Svarbu suprasti, kad sritys yra nustatomos pagal tekstą: globali
funkcijos sritis yra apibrėžta modulyje yra to modulio vardų erdvė,
nesvarbu iš kur ar kokiu vardu ta funkcija yra kviečiama. Iš kitus
pusės, vardų paieška yra atliekama dinamiškai vykdymo metu ---
tačiau kalbos apibrėžimas juda link statinio vardų nustatymo
"kompiliavimo metu", taigi nepasitikėkite dinamišku vardu nustatymu!
(Tiesa sakant, lokalūs kintamieji jau dabar nustatinėjami statiškai.)

Specialus Python'o veiksmas yra, kad jei sakinyje nenaudojamas :keyword:`global`,
tada priskyrimas vykdomas vidinėje srityje. Priskyrimai nekopijuoja
duomenų --- jei tik susieja vardą su objektu. Tas pats galioja
ir trynimui: sakinys ``del x`` pašalina ``x`` susiejimą lokalios sritied vardų erdvėje.
Tiesa sakant, visos operacijos kurios pristato naujus vardus naudoja lokalią sritį:
ypač, importavimo sakiniai ir funkcijų apibrėžtys susieja modulį ar funkcijos vardą
toje lokalioje srityje. (Raktažodis :keyword:`global` sakinyje gali būti naudojamas
norint nurodyti, kad tam tikras konkretus kintamasis turi būti ieškomas globalioje
srityje).


.. _tut-firstclasses:

Pirmas Žvilgsnis į Klases
=========================

Klasės prideda šiek tiek naujos sintaksės, tris naujus objektų tipus
ir šiek tiek naujos semantikos.

.. _tut-classdefinition:

Klasių Apibrėžties Sintaksė
---------------------------

Paprasčiausia klasės apibrėžtis atrodo taip:

   class ClassName:
       <statement-1>
       .
       .
       .
       <statement-N>

Klasių apibrėžties, kaip ir funkcijų apibrėžties (:keyword:`def` reiškinys)
turi būti įvykdyti, kad jie turėtų kokį nors efektą. (Jūs galite įdėti
klasės apibrėžtį į sąlyginio sakinio :keyword:`if` šaką, arba į funkciją.)

Praktikoje, reiškiniai klasės apibrėžtyje dažniausiai bus funkcijų
apibrėžtys, bet kitokie reiškiniai taip pat yra leidžiami, ir kartais
tai netgi naudinga --- mes dar prie to sugrįšime. Funkcijų apibrėžtys
klasėje klasėje dažniausiai turi savitą argumentų sąrašo formą,
kuri yra kilusi iš sutarto metodų kvietimo --- vėlgi, tai bus paaiškinta
vėliau.

Kai klasės apibrėžtis yra vykdoma yra sukuriama nauja vardų erdvė ir naudojama
kaip lokali sritis --- taigi visi priskyrimai lokaliems kintamiesiems
patenka į šią vardų erdvę. Ypatingai tai galioja funkcijų apibrėžtims, kurios
susieja naujų funkcijų vardus.

Kai klasės apibrėžtis įvykdoma (dažniausiai pabaigoje) yra sukuriamas
naujas *klasės objektas*. Tai iš esmės yra apgaubtis apie vardų erdvę, kuri
yra sukurta iš klasės apibrėžties  Mes išmoksime daugiau apie klasių objektus
kitame skyriuje. Originali lokali sritis (ta kuri buvo naudojama prieš
įžengiant į klasės apibrėžtį) yra atstatoma ir klasės objektas yra
susietas su klasės vardu duotu jai klasės apibrėžties antraštėje 
(pvz.: :class:`ClassName`).

.. _tut-classobjects:

Klasių Objektai
---------------

Klasių objektai palaiko dviejų rušių operacijas: atributų nuorodos ir
egzemplioriaus sukūrimą.

*Atributų nuorodos* naudoja standartinę sintaksę, kuri naudojame visoms atributų
nuorodoms Python'e: ``obj.name``. Validūs atributų vardai yra visi vardai, kurie
buvo klasės apibrėžtyje kai klasės objektas buvo sukurtas. Taigi, jei
klasės apibrėžtis atrodo taip::

   class MyClass:
       """A simple example class"""
       i = 12345
       def f(self):
           return 'hello world'

tada ``MyClass.i`` ir ``MyClass.f`` yra validžios atributų nuorodos,
kurios grąžina sveikąjį skaičių ir funkcijos objektą, atitinkamai.
Klasių atributai taip pat gali būti priskiriami, taigi ``MyClass.i`` reikšmė
gali būti pakeista priskyrimu. :attr:`__doc__` taip pat yra validus atributas, kuris
grąžina dokumentacijos eilutę, kuri priklauso klasei: ``"A simple example class"``.

Klasių *egzempliorių sukūrimas* naudoja funkcijų užrašą. Tiesiog apsimeskite,
kad klasės objektas yra funkcija be parametrų kuri grąžina nauja
klasės egzempliorių.
Pavyzdžiui (jei naudojame aukščiau apibrėžtą klasę)::

   x = MyClass()

sukurią naują klasės *egzempliorių* ir priskiria šį objektą lokaliam kintamajam ``x``.

Egzemplioriaus sukūrimo operacija ("kviečiant" klasės objektą) sukuria naują objektą.
Dauguma klasių sukuria objektus, kurių egzemplioriai yra pritaikomi
speficiniai pradinei pozicijai. Todėl klasė gali apibrėžti
specialų metodą pavadintą :meth:`__init__`, pvz.::

   def __init__(self):
       self.data = []

Kai klasė apibrėžia :meth:`__init__` metodą, klasės egzemplioriaus
sukūrimas automatiškai iškviečia meth:`__init__` naujai sukurtam klasės
egzemplioriui. Taigi šiame pavyzdyje naujas inicijuotas egzempliorius
gali būti gautas iškviečiant::

   x = MyClass()

Žinoma metodas :meth:`__init__` gali turėti ir argumentus didesniam lankstumui.
Tokiu atveju argumentai kurie paduodami klasės egzemplioriaus sukūrimo
operatoriui yra perduodami :meth:`__init__`.  Pavyzdžiui ::

   >>> class Complex:
   ...     def __init__(self, realpart, imagpart):
   ...         self.r = realpart
   ...         self.i = imagpart
   ...
   >>> x = Complex(3.0, -4.5)
   >>> x.r, x.i
   (3.0, -4.5)


.. _tut-instanceobjects:

Egzempliorių objektai
---------------------

Taigi ką mes galime daryti su egzempliorių objektais? Vienintelė operacija
kurią supranta egzempliorių objektai yra atributų nuorodos. Yra dviejų
rušių validūs atributų vardai: duomenų atribudai ir metodai.

*duomenų atributai* kurie atitinka Smalltalk „egzempliorių kintamuosius“ ir
„duomenų narius“ C++. Duomenų atributai turi būti aprašyti. Kaip ir
lokalųs kintamieji, jei pradeda egzistuoti kai jiems pirmą
kartą yra priskiriama reikšmė. Pavyzdžiui, jei ``x``
yra anksčiau sukurtos klases :class:`MyClass` egzempliorius,
tai žemiau esantis kodas išspausdins reikšmę ``16`` ir
nepaliks jokios žymės::

   x.counter = 1
   while x.counter < 10:
       x.counter = x.counter * 2
   print x.counter
   del x.counter

Kitas egzemplioriaus atributo nuorodos tipas yra *metodas*. Metodas
yra funkcija, kuri "priklauso" objektui. (Python'e, terminas metodas
nėra unikalus klasės egzemplioriams: kiti objektų tipai gali turėti
metodus taip pat. Pvz, sąrašo objektas turi metodus append, insert,
remove, sort ir t.t. Tačiau toliau sekančioje diskusijoje mes naudosime
terminą metodą išskirtinai klasių egzempliorių objektams, nebent
bus nurodyta kitaip).

.. index:: object: method

Validus metodų namai egzemplioriaus objektui priklauso nuo jo klasės.
Pagal apibrėžimą, visi klasės atributai, kurie yra funkcijų objektai,
apibrėžia atitinkamus egzemplioriaus metodus. Pavyzdžiui, ``x.f`` yra
validus metodas, nes ``MyClass.f`` yra funkcija, bet ``x.i`` nėra,
nes ``MyClass.i`` nėra. Bet ``x.f`` nėra tas pats kas ``MyClass.f`` --- tai
yra *metodo objektas*, ne funkcijos objektas.

.. _tut-methodobjects:

Metodų Objektai
---------------

Įprastai, metodai yra iškviečiamas iškart po to, kai jis susiejamas::

   x.f()


Klasės :class:`MyClass` pavyzdyje, tai sugrąžins eilutę ``'hello world'``.
Tačiau, nebūtina kviesti metodą iškart: ``x.f`` yra metodo objektas
ir gali būti laikomas vėliasniam laikui, Pvz.::

   xf = x.f
   while True:
       print xf()

Spausdins ``hello world`` begale kartų.

Kas konkrečiai atsitinka, kai metodas yra iškviečiamas? Jūs galėjote
pastebėti, kad ``x.f()`` (viršuje) buvo iškviestas be argumentų, nors
apibrėžtis  metodui :meth:`f` argumentą ir nurodė. Kas atsitiko argumentui?
Žinoma Pythonas išmeta išimtį kai funkcija, kuriai reikia argumentų yra
iškviečiama be jų --- netgi jei argumentas nėra naudojamas...

Tiesa sakant, atsakymą jūs galbūt jau nuspėjote: metodų ypatybė yra
ta, kad objektas yra perduodamas kaip pirmas argumentas funkcijai. Mūsų
pavyzdyje, kvietimas ``x.f()`` yra ekvivalentus ``MyClass.f(x)``.  Apibrendinus,
metodo su *n* argumentų sąrašu kvietimas yra ekvivalentiškas atitinkamos
funkcijos atitinkamos funkcijos kvietimui su argumentu sąrašu, kuris yra
sukuriamas pridedant metodo objektą prieš pirmą argumentą.

Jei jūs vis dar nesuprantate kaip metodas dirbas, žvilgsnis į įgyvendinimą gali
viską paaiškinti. Kai egzemplioriaus atributas, kuris nėra duomenų atributas,
yra nurodomas ieškoma jo klasėje. Jeigu vardas nurodo validų klasės atributą,
kuris yra funkcijos objektas, metodo objektas yra sukuriamas supakuojant kartu
egzemplioriaus objektą ir kątik surastos funkcijos objektą į abstraktų obektą ---
tai ir yra metodo objektas. Kai metodo objektas yra iškviečiamas su argumentų
sąrašu, jis išpakuojamas vėl, naujas argumentų sąrašas yra sukonstruojamas
iš egzemplioriaus objekto ir originalaus argumentų sąrašo ir tada funkcijos
objektas yra iškviečiamas naudojant šį naują argumentų sąrašą.

.. _tut-remarks:

Atsitiktinės pastabos
=====================

.. Šios tikriausiai turėtų būti išdėstytos atsargiau...

Duomenų atributai yra svarbesni už metodų atributus tokiu pačiu vardu.
Tam kad išvengtumėte vardų konflikto, dėl ko gali kilti sunkiai
randamos klaidos didelėse programose, patartina naudoti tam
tikrus susitarimus, kad konfliktų tikimybė būtų minimizuota. Galimi
susitartimai gali būti metodų vardų rašymas iš didžiųjų raidžių,
pridedant tam tikra unikalią eilutę prie duomenų atributų pradžioje
(pvz.: pabraukimą) arba metodų vardams naudoti veiksmažodžius,
o daiktavardžius naudoti duomenų atributams.

Duomenų atribudai gali būti pasiekiami tiek metodų tiek paprastų
objekto vartotojų ("klientų"). Kitaip sakant, klasės nėra tinkamos
įgyvendinti abstrakčius duomenų tipus. Tiesa sakant, Python'e nėra
nieko kas leistų paslėpti duomenis --- viskas yra paremta susitarimu.
(Iš kitos pusės, Python'o implementacija parašyta C gali visiškai
paslėpti įgyvendinimo detales ir kontroliuoti priėjimą prie
objekto, jei tik to reikia. Tai gali būti naudojame naudojant
Python'o išplėtimus parašytus C.)

Klientai turi naudoti duomenų atributus atsargiai --- klientai gali
sujaukti metodų prižiūrimus invariantus jei bus pakeisti jų
duomenų atributai. Pastebėsime, kad klientai gali pridėti savo
duomenų atributus į egzemplioriaus objektą nepaveikiant metodų
validumo, tol kol išvengiama vardų konflikto --- vėlgi vardų
kūrimo susitarimai gali padėti išvengti daug galvos skausmo.

Python'e nėra sutrumpinimo norint pasiekti duomenų atributus (ar kitus metodus!)
iš metodo. Aš asmeniškai manau, kad tai padidina metodų skaitomumą:
nėra galimybės sumaišyti lokalių ir egzemplioriaus kintamųjų besižvalgant
metode.

Dažniausiai, pirmas metodo argumentas yra vadinamas ``self``. Tai tėra
nieko daugiau tik susitarimas: vardas ``self`` neturi jokios specialios
reikšmės Python'e. (Tačiau pastebėkite, kad jums nesilaikant šio
susitarimo jūsų kodas gali būti mažiau skaitomas kitiems Python'o
progamuotojams, ir labai tikėtina, kad *klasių naršyklės* programa
gali būti parašyta laikantis šio susitarimo).

Kiekvienas funkcijos objektas, kuris yra klasės atributas, apibrėžia metodą
šios klasės egzemplioriams. Nėra būtina, kad funkcijos apibrėžtis būtų
apgaubta klasės apibrėžties tekste: funkcijos priskyrimas lokaliam
klasės kintamajam taip pat yra galimas. Pvz.::

   # Funkcija apibrėžta už klasės ribų
   def f1(self, x, y):
       return min(x, x+y)

   class C:
       f = f1
       def g(self):
           return 'hello world'
       h = g

Dabar ``f``, ``g`` and ``h`` yra klasės :class:`C` atributai, kurie
nurodo į funkcijų objektus yra to pasekoje jie visi yra klasės
:class:`C` egzemplioriaus metodai --- ``h`` yra ekvivalentus ``g``.
Pastebėsime, kad tokia praktika dažniausiai naudojama norint tik
sumaišyti programos skaitytoją.

Metodai gali kviesti kitus metodus naudodami argumento ``self`` metodo
atributus::

   class Bag:
       def __init__(self):
           self.data = []
       def add(self, x):
           self.data.append(x)
       def addtwice(self, x):
           self.add(x)
           self.add(x)

Metodai gali kreiptis į globalius vardus tokiu pačiu būdų kaip paprastos
funkcijos. Globali sritis susieta su metodu yra modulis kuriame yra
klasės apibrėžtis (klasė pati savaime niekada nėra naudojama globalioje
srityje!). Nors surasti gerą priežastį naudoti globalius duomenis metode
yra labai sunku, yra daug teisėtų būdų naudoti globalią sritį: metodai
gali naudoti funkcijas ar modulius importuotus į globalią sritį, taip
pat metodai gali naudoti funkcijas ar klases apibrėžtas globalioje
srityje. Dažniausiai, klasė kurioje yra metodai yra taip pat
apibrėžta globalioje srityje, ir kitoje dalyje mes surasime
keletą gerų priežasčių kodėl metode gali prireikti nurodyti
savo paties klasę!

Kiekviena reikšmė yra objektas, ir to pasekoje turi *klasę* (taip pat
vadinama *tipu*). Ji laikoma ``object.__class__``.

.. _tut-inheritance:

Paveldėjimas
============

Žinoma, kalbos savybė nebūtų verta "klasės" vardo jeigu nepalaikytų
paveldėjimo. Paveldėtos klasės apibrėžties sintaksė atrodo
taip::

   class DerivedClassName(BaseClassName):
       <statement-1>
       .
       .
       .
       <statement-N>

Vardas :class:`BaseClassName` turi būti apibrėžtas srityje, kur yra
laikoma paveldėtos klasės apibrėžtis. Viršklasio vardo vietoje, kitos
norimos išraiškos taip pat yra leidžiamos. Tai tarkim gali būti naudinga
kai viršklasis yra apibrėžtas kitame modulyje::

   class DerivedClassName(modname.BaseClassName):

Paveldėtos klasės apibrėžties vykdymas vyksta taip pat kaip ir
viršklasiui. Kai klasės objektas yra konstruojamas, taip pat
yra prisimenamas ir viršklasis. Tai naudojama nustatant atributų
nuorodas: jeigu norimas atributas nėra randamas klasėje, tada
jo paieška vykdoma jos viršklasyje. Ši taisyklė yra taikoma
rekursiškai jeigu pats viršklasis yra paveldėtas iš kokios
nors kitos klasės.

Taip pat nėra nieko ypatingo kuriant paveldėtos klasės egzempliorių:
``DerivedClassName()`` sukuria naują klasės egzempliorių. Metodų
nuorodos surandamos taip: pirmiausia ieškoma atitinkamos klasės
atributo ir jeigu reikia tada ieškoma grandine žemyn per viršklasius,
ir metodo nuoroda yra validi jei ji gražina funkcijos objektą.

Paveldėtos klasės gali perrašyti viršklasio metodus. Kadangi
metodai neturi specialių teisių kviečiant kitus to pačio
objekto metodus, viršklasio metodas, kuris kviečia kitą metodą apibrėžta
tame pačiame viršklasyje, galiausiai gali iškviesti paveldėtos klasės
metodą (kuris perrašė norimą iškviesti metodą). (C++ programuotojams: visi
metodai Python'e yra ``virtualūs``.)

Metodo perrašymas paveldėtoje klasėje gali praplėsti (užuot tiesiog
pakeitus) viršklasio metodą tuo pačiu vardu. Yra labai paprastas
būdas iškviesti bazinės klasės metodą tiesiogiai: tiesiog
iškvieskite ``BaseClassName.methodname(self, arguments)``.  Tai
kartais naudingą ir vartotojams. (Pastebėkite, kad tai dirba
tik tada, kai bazinė klasė yra apibrėžta arba importuota tiesiogiai
į globalią sritį).

Python'as turi dvi įtaisytas funkcijas, kurios dirba su paveldėjimu:

* Naudokite funkciją :func:`isinstance` norėdami patikrinti objekto tipą: ``isinstance(obj, int)``
  bus ``True`` tik tada kai ``obj.__class__`` yra :class:`int` arba kokia
  nors klasė paveldėta iš :class:`int`.

* Naudokite funkciją :func:`issubclass` norėdami patikrinti paveldėjimą: ``issubclass(bool, int)``
  yra ``True`` kadangi :class:`bool` yra klasės :class:`int` poklasis.  Tačiau,
  ``issubclass(unicode, str)`` grąžins ``False`` kadangi :class:`unicode` nėra
  :class:`str` poklasis (jie tik turi bendrą protėvį :class:`basestring`).


.. _tut-multiple:

Sudėtinis paveldėjimas
----------------------

Python'as palaiko apribotą sudėtinio paveldėjimo formą. Klasės
apibrėžtis su keliais viršklasiais atrodo taip::

   class DerivedClassName(Base1, Base2, Base3):
       <statement-1>
       .
       .
       .
       <statement-N>

Seno stiliaus klasėms, vienintelė taisyklė yra pirmiausia-gilyn, iš kairės į dešinę.
Taigi jei atributas nėra randamas klasėje :class:`DerivedClassName`, tada jo
ieškoma klasėje :class:`Base1`, tada (rekursyviai) klasės :class:`Base1` viršklasyje ir
tik tada, jei jo neranda ten, ieškoma klasėje :class:`Base2` ir t.t.

(Kai kuriems žmonėms ieškojimas klasėse :class:`Base2` ir :class:`Base3`
prieš ieškant klasės :class:`Base1` viršklasiuose atrodo natūralus. Tačiau
tai reikalautų žinoti ar tam tikras :class:`Base1` atributas yra iš ties
apibrėžtas klasėje :class:`Base1` arba viename iš jos viršklasių prieš
galėdamas numatyti vardų konflikto pasekmes su klasės :class:`Base2`
atributu. Pirmiausia-gilyn taisyklė nedaro skirtumo tarp tiesioginių
ir paveldėtų klasės :class:`Base1` atributų.

:term:`naujo stiliaus klasė`\se metodų nustatymo tvarka keičiasi dinamiškai,
kad galėtų palaikyti bendradarbiaujančius funkcijos :func:`super` kvietimus.
Šis sprendimas keliose kitose sudėtinį paveldėjimą palaikančiose kalbose
yra žinomas kaip kviesk-kitą-metodą ir yra galingesnis negu super kvietimas
randamas paveldėjimo iš vieno viršklasio kalbose.

Naujo stiliaus klasėms dinamiškas paveldėjimas yra reikalingas nes visi
sudėtinio paveldėjimo atvejai naudoja vieną ar daugiau deimantinių
sąsajų (kai bent viena iš tėvinių klasių gali būti pasiektos keletu kelių
iš tos pačios viršutinės klasės). Pvz.: visos naujo stiliaus klasės yra
paveldėtos iš :class:`object`, taigi bet kuris sudėtinio paveldėjimo
atvejis leidžia daugiau negu vieną būdą pasiekti :class:`object`.  Norint
viršklasius apsaugoti nuo panaudojimo kelis kartus, dinaminis algoritmas
liniarizuoja paieškos tvarką taip, kad būtų išlaikyta iš kairės į dešinę
tvarka nurodyta kiekvienoje klasėje, kuri kviečią tevą tik kartą, ir būtų
monotonišką (monotoniška reiškia, kad klasė gali būti poklasiu
nepaveikdama jos tėvų pirmenybės tvarkos). Visą tai paimant kartu,
šios savybės leidžia kurti patikimas ir išplečiamas klases naudojant
sudėtinį paveldėjimą. Daugiau informacijos čia:
http://www.python.org/download/releases/2.3/mro/.


.. _tut-private:

Privatūs kintamieji
===================

Privatūs klasės identifikatoriai egzistuoja, bet su tam tikrais apribojamais.
Jei identifikatorius turi formą ``__spam`` (bent du pabraukimo brūkšniai
priekyje ir daugiausiai vienas pabaigoje) jis yra pakeičiamas į
``_classname__spam``, kur ``classname`` yra klasės vardas be pabraukimo brūkšnių,
jei jie buvo klasės vardo gale. Šis pakeitimas atliekamas nepaisant
sintaksinės identifikatoriaus pozicijos, todėl tai gali būti
naudojama apibrėžti klasės kintamuosius, metodus, kintamuosius laikomus
tarp globalių kintamųjų ir netgi kintamuosius laikomus egzemplioriuose,
kurie yra privatūs šiai klasės *kitos* klasės egzemplioriuje. Gali
įvykti sutrumpinimas, jei pakeistas vardas yra ilgesnis negu 255
simboliai. Jei identifikatorius nėra klasėje arba kai klasės vardas
sudarytas tik iš pabraukimo brūkšnių pakeitimas neįvyksta.

Vardų pakeitimo tikslas yra leisti paprastai apibrėžti "privačius"
egzemplioriaus kintamuosius ir metodus nesujaudinant apie
egzemplioriaus kintamuosius apibrėžtus paveldėtoje klasėje arba
egzemplioriaus kintamųjų keitimus už klasės ribų. Pastebėsime,
kad pakeitimo taisyklės yra sukurtos taip, kad būtų išvengta
sutapimų. Tačiau visgi įmanoma pasišventusiai sielai pasiekti ir
modifikuoti kintamuosius, kurie laikomi privačiais. Tai netgi
gali būti naudinga tam tikrose situacijose, kaip kad derintuvėje
ir tai vienintelė priežastis kodėl ši skylė yra palikta. Paveldėjimas
naudojant tokį patį klasės vardą kaip viršklasio leidžia
naudoti viršklasio privačius kintamuosius.

.. _tut-odds:

Odds and Ends
=============

Sometimes it is useful to have a data type similar to the Pascal "record" or C
"struct", bundling together a few named data items.  An empty class definition
will do nicely::

   class Employee:
       pass

   john = Employee() # Create an empty employee record

   # Fill the fields of the record
   john.name = 'John Doe'
   john.dept = 'computer lab'
   john.salary = 1000

A piece of Python code that expects a particular abstract data type can often be
passed a class that emulates the methods of that data type instead.  For
instance, if you have a function that formats some data from a file object, you
can define a class with methods :meth:`read` and :meth:`readline` that get the
data from a string buffer instead, and pass it as an argument.

.. (Unfortunately, this technique has its limitations: a class can't define
   operations that are accessed by special syntax such as sequence subscripting
   or arithmetic operators, and assigning such a "pseudo-file" to sys.stdin will
   not cause the interpreter to read further input from it.)

Instance method objects have attributes, too: ``m.im_self`` is the instance
object with the method :meth:`m`, and ``m.im_func`` is the function object
corresponding to the method.


.. _tut-exceptionclasses:

Exceptions Are Classes Too
==========================

User-defined exceptions are identified by classes as well.  Using this mechanism
it is possible to create extensible hierarchies of exceptions.

There are two new valid (semantic) forms for the raise statement::

   raise Class, instance

   raise instance

In the first form, ``instance`` must be an instance of :class:`Class` or of a
class derived from it.  The second form is a shorthand for::

   raise instance.__class__, instance

A class in an except clause is compatible with an exception if it is the same
class or a base class thereof (but not the other way around --- an except clause
listing a derived class is not compatible with a base class).  For example, the
following code will print B, C, D in that order::

   class B:
       pass
   class C(B):
       pass
   class D(C):
       pass

   for c in [B, C, D]:
       try:
           raise c()
       except D:
           print "D"
       except C:
           print "C"
       except B:
           print "B"

Note that if the except clauses were reversed (with ``except B`` first), it
would have printed B, B, B --- the first matching except clause is triggered.

When an error message is printed for an unhandled exception, the exception's
class name is printed, then a colon and a space, and finally the instance
converted to a string using the built-in function :func:`str`.


.. _tut-iterators:

Iterators
=========

By now you have probably noticed that most container objects can be looped over
using a :keyword:`for` statement::

   for element in [1, 2, 3]:
       print element
   for element in (1, 2, 3):
       print element
   for key in {'one':1, 'two':2}:
       print key
   for char in "123":
       print char
   for line in open("myfile.txt"):
       print line

This style of access is clear, concise, and convenient.  The use of iterators
pervades and unifies Python.  Behind the scenes, the :keyword:`for` statement
calls :func:`iter` on the container object.  The function returns an iterator
object that defines the method :meth:`next` which accesses elements in the
container one at a time.  When there are no more elements, :meth:`next` raises a
:exc:`StopIteration` exception which tells the :keyword:`for` loop to terminate.
This example shows how it all works::

   >>> s = 'abc'
   >>> it = iter(s)
   >>> it
   <iterator object at 0x00A1DB50>
   >>> it.next()
   'a'
   >>> it.next()
   'b'
   >>> it.next()
   'c'
   >>> it.next()

   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
       it.next()
   StopIteration

Having seen the mechanics behind the iterator protocol, it is easy to add
iterator behavior to your classes.  Define a :meth:`__iter__` method which
returns an object with a :meth:`next` method.  If the class defines
:meth:`next`, then :meth:`__iter__` can just return ``self``::

   class Reverse:
       "Iterator for looping over a sequence backwards"
       def __init__(self, data):
           self.data = data
           self.index = len(data)
       def __iter__(self):
           return self
       def next(self):
           if self.index == 0:
               raise StopIteration
           self.index = self.index - 1
           return self.data[self.index]

   >>> for char in Reverse('spam'):
   ...     print char
   ...
   m
   a
   p
   s


.. _tut-generators:

Generators
==========

:term:`Generator`\s are a simple and powerful tool for creating iterators.  They
are written like regular functions but use the :keyword:`yield` statement
whenever they want to return data.  Each time :meth:`next` is called, the
generator resumes where it left-off (it remembers all the data values and which
statement was last executed).  An example shows that generators can be trivially
easy to create::

   def reverse(data):
       for index in range(len(data)-1, -1, -1):
           yield data[index]

   >>> for char in reverse('golf'):
   ...     print char
   ...
   f
   l
   o
   g

Anything that can be done with generators can also be done with class based
iterators as described in the previous section.  What makes generators so
compact is that the :meth:`__iter__` and :meth:`next` methods are created
automatically.

Another key feature is that the local variables and execution state are
automatically saved between calls.  This made the function easier to write and
much more clear than an approach using instance variables like ``self.index``
and ``self.data``.

In addition to automatic method creation and saving program state, when
generators terminate, they automatically raise :exc:`StopIteration`. In
combination, these features make it easy to create iterators with no more effort
than writing a regular function.


.. _tut-genexps:

Generator Expressions
=====================

Some simple generators can be coded succinctly as expressions using a syntax
similar to list comprehensions but with parentheses instead of brackets.  These
expressions are designed for situations where the generator is used right away
by an enclosing function.  Generator expressions are more compact but less
versatile than full generator definitions and tend to be more memory friendly
than equivalent list comprehensions.

Examples::

   >>> sum(i*i for i in range(10))                 # sum of squares
   285

   >>> xvec = [10, 20, 30]
   >>> yvec = [7, 5, 3]
   >>> sum(x*y for x,y in zip(xvec, yvec))         # dot product
   260

   >>> from math import pi, sin
   >>> sine_table = dict((x, sin(x*pi/180)) for x in range(0, 91))

   >>> unique_words = set(word  for line in page  for word in line.split())

   >>> valedictorian = max((student.gpa, student.name) for student in graduates)

   >>> data = 'golf'
   >>> list(data[i] for i in range(len(data)-1,-1,-1))
   ['f', 'l', 'o', 'g']



.. rubric:: Footnotes

.. [#] Except for one thing.  Module objects have a secret read-only attribute called
   :attr:`__dict__` which returns the dictionary used to implement the module's
   namespace; the name :attr:`__dict__` is an attribute but not a global name.
   Obviously, using this violates the abstraction of namespace implementation, and
   should be restricted to things like post-mortem debuggers.

