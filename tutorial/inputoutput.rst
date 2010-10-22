.. _tut-io:

*********************
Įvedimas ir išvedimas
*********************

Egzistuoja keli būdai išvesti programos rezultatus. Duomenys gali būti
išspausdinti žmogui skaitoma forma arba įrašyti į failą ateities naudojimui.
Ši dalis apžvelgs kelias galimybes.

.. _tut-formatting:

Gražesnis išvedimo formatavimas
===============================

Kol kas mes sutikome du reikšmių rašymo būdus: *išraiškos sakinius* ir
:keyword:`print` sakinį.  (trečias būdas :meth:`write` metodo naudojimas
su failo objektais. Standartinis išvedimo failas gali būti pasiektas
per ``sys.stdout``.)

.. index:: module: string

Dažnai jums reikės daugiau kontrolės formatuojant išvedamus duomenis negu tiesiog
spausdinti tarpu atskirtas reikšmes. Egzistuoja du būdai suformatuoti
jūsų išvedimo duomenis. Pirmas būdas yra visą formatavimą atlikti patiems:
naudodami eilučių karpymo ir sujungimo operacijas jūs galite sukurti
tokį išdėstymą kokį tik įsivaizduojate. Standartiniame modulyje :mod:`string`
galima rasti kelias naudingas operacijas eilučių užpildymui iki reikiamo
stulpelio pločio (jas peržvelgsime netrukus). Antras būdas yra
naudoti metodą :meth:`str.format`.

Žinoma, išlieka vienas klausimas: kaip konvertuoti reikšmes į eilutes?
Laimei Python'as turi būdą reikšmes paversti eilutėmis: perduokite
reikšmę funkcijoms: :func:`repr` arba :func:`str`.

Funkcijos :func:`str` paskirtis yra sugražinti reikšmę, kurią galėtų perskaityti
žmogus, tuo tarpu :func:`repr` paskirtis yra sugeneruoti reprezentaciją,
kurią galėtų perskaityti interpretatorius (arba jei tokias formos
nėra grąžintų :exc:`SyntaxError` klaidą). Objektams, kurie neturi žmogui
skaitomos formos, :func:`str` sugrąžins tokią pačią reikšmę kaip :func:`repr`.
Dauguma reikšmių, kaip kad skaičiai, struktūros, sąrašai ar žodynai,
turi tą pačia reprezentaciją abiems funkcijoms. Eilutės ir slankaus kablelio
skaičiai --- turi dvi skirtingas reprezentacijas.

Keletas pavyzdžių::

   >>> s = 'Hello, world.'
   >>> str(s)
   'Hello, world.'
   >>> repr(s)
   "'Hello, world.'"
   >>> str(0.1)
   '0.1'
   >>> repr(0.1)
   '0.10000000000000001'
   >>> x = 10 * 3.25
   >>> y = 200 * 200
   >>> s = 'The value of x is ' + repr(x) + ', and y is ' + repr(y) + '...'
   >>> print s
   The value of x is 32.5, and y is 40000...
   >>> # eilutės repr() prideda kabutes ir kairinį brūkšnį:
   ... hello = 'hello, world\n'
   >>> hellos = repr(hello)
   >>> print hellos
   'hello, world\n'
   >>> # repr() argumentu gali būti bet koks Python'o objektas:
   ... repr((x, y, ('spam', 'eggs')))
   "(32.5, 40000, ('spam', 'eggs'))"

Čia yra du būdai parašyti kvadratų ir kubų lentelę::

   >>> for x in range(1, 11):
   ...     print repr(x).rjust(2), repr(x*x).rjust(3),
   ...     # Atkreipkite dėmesį į kablelį eilutės gale
   ...     print repr(x*x*x).rjust(4)
   ...
    1   1    1
    2   4    8
    3   9   27
    4  16   64
    5  25  125
    6  36  216
    7  49  343
    8  64  512
    9  81  729
   10 100 1000

   >>> for x in range(1,11):
   ...     print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)
   ...
    1   1    1
    2   4    8
    3   9   27
    4  16   64
    5  25  125
    6  36  216
    7  49  343
    8  64  512
    9  81  729
   10 100 1000

(Atkreipkite dėmesį į tai, kad pirmame pavyzdyje vienas tarpas tarp stulpelių
buvo pridėtas dėl to kaip :keyword:`print` dirba: ši komanda visada prideda tarpus tarp argumentų.)

Šis pavyzdys demonstruoja eilučių objektų metodą :meth:`rjust`, kuris
sulygina eilutes pagal dešinę pusę jas užpildydamas tarpais kairėje.
Egzistuoja panašūs metodai :meth:`ljust` ir :meth:`center`. Šie metodai
nieko nerašo --- jie tiesiog sugrąžina eilutę. Jei paduota eilutė
yra per ilga, ji nėra sutrumpinama, bet grąžinama nepakeista. Tai žinoma
sugadins jūsų išdėstymą, bet tai geriau negu sutrumpinta eilutė (dėl ko
būtų rodoma neteisinga reikšmė). Jeigu jus tenkina, kad eilute bus sutrumpinta
tai galite atlikti kirpdami, pvz.: ``x.ljust(n)[:n]``.

Yra kitas metodas :meth:`zfill`, kuris užpildo skaitines reikšmes nuliais
iš kairės pusės. Šis metodas taip pat supranta plius ir minus ženklus::

   >>> '12'.zfill(5)
   '00012'
   >>> '-3.14'.zfill(7)
   '-003.14'
   >>> '3.14159265359'.zfill(5)
   '3.14159265359'

Paprastas :meth:`str.format` metodo naudojimas atrodo taip::

   >>> print 'We are the {0} who say "{1}!"'.format('knights', 'Ni')
   We are the knights who say "Ni!"

Figūriniai skliausteliai ir simboliai tarp jų (vadinami formatavimo laukais)
yra pakeičiami objektais perduotais formatavimo metodui. Skaičius tarp
figūrinių skliaustelių nurodo formatavimo metodui perduoto objekto
poziciją::

   >>> print '{0} and {1}'.format('spam', 'eggs')
   spam and eggs
   >>> print '{1} and {0}'.format('spam', 'eggs')
   eggs and spam

Jei vardiniai argumentai yra naudojami formatavimo metode, jų reikšmės
yra nurodomos naudojant argumento vardą. ::

   >>> print 'This {food} is {adjective}.'.format(
   ...       food='spam', adjective='absolutely horrible')
   This spam is absolutely horrible.

Poziciniai ir vardiniai argumentai gali būti naudojami vienu metu::

   >>> print 'The story of {0}, {1}, and {other}.'.format('Bill', 'Manfred',
   ...                                                    other='Georg')
   The story of Bill, Manfred, and Georg.

Papildomai po lauko vardo gali eiti ``':'`` ir formatavimo nurodymas. Tai
taip pat leidžia labiau kontroliuoti kaip reikšmė yra
formatuojama. Sekantis pavyzdys sutrumpina Pi reikšmę iki trijų
ženklų po kablelio::

   >>> import math
   >>> print 'The value of PI is approximately {0:.3f}.'.format(math.pi)
   The value of PI is approximately 3.142.

Jeigu po ``':'`` bus perduotas skaičius, tai reikš, kad laukas
užims mažiausiai tiek simbolių. Tai patogu norint parodyti
lenteles gražiai::

   >>> table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 7678}
   >>> for name, phone in table.items():
   ...     print '{0:10} ==> {1:10d}'.format(name, phone)
   ...
   Jack       ==>       4098
   Dcab       ==>       7678
   Sjoerd     ==>       4127

Jeigu jūs turite labai ilgą formatavimo eilutę, kurios jūs nenorite
skaidyti, būtų labai patogu, jei galėtumėte pasiekti kintamuosius
pagal vardą, o ne pagal poziciją. Tai galima padaryti
tiesiog perduodant žodyną ir naudojant laužtinius skliaustelius
``[]``, kai reikia pasiekti raktus ::

   >>> table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 8637678}
   >>> print ('Jack: {0[Jack]:d}; Sjoerd: {0[Sjoerd]:d}; '
   ...        'Dcab: {0[Dcab]:d}'.format(table))
   Jack: 4098; Sjoerd: 4127; Dcab: 8637678

Tą patį galima atlikti perduodant lentelę kaip vardinius argumentus
naudojant '**' užrašą::

   >>> table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 8637678}
   >>> print 'Jack: {Jack:d}; Sjoerd: {Sjoerd:d}; Dcab: {Dcab:d}'.format(**table)
   Jack: 4098; Sjoerd: 4127; Dcab: 8637678

Tai ypač patogu naudoti kartu su įtaisyta funkcija :func:`vars`, kuri
sugrąžina žodyną, kuriame laikomi visi lokalūs kintamieji.

Senas eilučių formatavimas
--------------------------

Operatorius ``%`` taip pat gali būti naudojamas eilučių formatavimui.
Jis interpretuoja argumentą panašiai kaip C funkcija `sprintf`.
Pavyzdžiui::

   >>> import math
   >>> print 'The value of PI is approximately %5.3f.' % math.pi
   The value of PI is approximately 3.142.

Kadangi :meth:`str.format` yra pakankamai naujas, dauguma Python'o kodo vis
dar naudoja ``%`` operatorių. Tačiau, kadangi šis seno stiliau formatavimas
ilgainiui iš kalbos bus pašalintas rekomenduojama naudoti
:meth:`str.format`.

.. _tut-files:

Failų skaitymas ir rašymas
==========================

.. index::
   builtin: open
   object: file

:func:`open` grąžina failo objektą, ir yra dažnai naudojama su
dviem argumentais: ``open(failovardas, rėžimas)``.

::

   >>> f = open('/tmp/workfile', 'w')
   >>> print f
   <open file '/tmp/workfile', mode 'w' at 80a0960>

Pirmas argumentas yra eilutė nurodanti failo vardą. Antras argumentas yra
kita eilutė, kurioje yra keli simboliai nurodantys kaip failas bus
naudojamas. *rėžimas* gali turėti reikšmes ``'r'`` kai failas bus
tik skaitomas, ``'w'`` kai tik rašomas (egzistuojantis failas tokiu
pat vardu bus ištrintas), ir ``'a'`` atidaro failą papildymui. Bet kokie
duomenys rašomi į failą pridedami į jo galą. ``'r+'`` atidaro failą ir
skaitymui ir rašymui. *rėžimo* argumentas yra nebūtinas: jeigu jis bus
praleistas, tai bus daroma prielaida, kad rėžimas yra ``'r'``.

Windows sistemoje, ``'b'`` pridėjimas prie rėžimo atidaro failą dvejetainiame
rėžime. Taigi rėžimai gali atrodyti taip: ``'rb'``, ``'wb'``, ir ``'r+b'``.
Windows sistemoje yra skirtumas tarp tekstinių ir dvejetainių failų: eilutės
pabaigos simbolis tekstiniuose failuose yra modifikuojamas, kai duomenys
yra skaitomi arba rašomi. Ši modifikacija nepakenkia ASCII failams,
bet dvejetainius failus (kaip kad :file:`JPEG` arba :file:`EXE`) ji sugadina.
Būkite labai atsargūs ir nepamirškite naudoti dvejetainio rėžimo,
kai skaitote ar rašote failus. Unix sistemose ``'b'`` simbolio pridėjimas į
rėžimo eilutę žalos nedaro, taigi pridėkite jį, kad jūsų kodas būtų
nepriklausomas nuo platformos.

.. _tut-filemethods:

Failų objektų metodai
---------------------

Likę pavyzdžiai šioje dalyje tikėsis, kad failo objektas ``f`` yra jau sukurtas.

Tam, kad perskaitytumėte failo turinį, iškvieskite ``f.read(size)``. Tai
perskaitys dalį duomenų ir grąžins juos kaip eilutę. *size* yra nebūtinas skaitinis
argumentas. Jeigu *size* yra praleidžiamas arba neigiamas, tada perskaitomas
visas failo turinys ir sugrąžinamas. Tačiau, jei failas yra dukart didesnis negu
yra atminties jūsų mašinoje, tai jau jūsų problema. Kitu atveju daugiausiai
*size* baitų yra perskaitoma ir sugrąžinama. Jeigu pasiekiamas failo galas
``f.read()`` sugrąžina tuščią eilutę (``""``). ::

   >>> f.read()
   'This is the entire file.\n'
   >>> f.read()
   ''

``f.readline()`` perskaito vieną eilutę iš failo: naujos eilutės simbolis (``\n``)
yra paliekamas eilutės gale ir jo ten nebus tik tuo atveju, jei paskutinė
eilutė neturi eilutės pabaigos simbolio. Dėl to sugrąžinta reikšmė tampa
aiški, jei ``f.readline()`` sugrąžina tuščią eilutę, reiškia failo pabaiga yra
pasiekta. Tuo tarpu tuščią eilutę nurodo ``'\n'`` --- eilutė, kurioje yra
tik naujos eilutės simbolis. ::

   >>> f.readline()
   'This is the first line of the file.\n'
   >>> f.readline()
   'Second line of the file\n'
   >>> f.readline()
   ''

``f.readlines()`` sugrąžina visas eilutes iš failo.
Jeigu paduodamas nebūtinas parametras *sizehint*, ši funkcija perskaito
tiek baitų iš failo ir dar šiek tiek, kad pabaigtų eilutę ir tada sugrąžina eilutę.
Tai dažnai naudojama norint efektyviai skaityti didelius failus eilutėmis ir tuo
pačiu neužkrauti viso failo į atmintį. Tik pilnos eilutės bus sugrąžintos::

   >>> f.readlines()
   ['This is the first line of the file.\n', 'Second line of the file\n']

Alternatyvus būdas skaityti eilutes iš failo yra pereiti per failą.
Tai daug efektyviau atminties atžvilgiu, greičiau veikia ir kodas
daug paprastesnis::

   >>> for line in f:
           print line,

   This is the first line of the file.
   Second line of the file

Alternatyvus būdas yra paprastesnis, bet nesuteikia tiek kontrolės.
Kadangi du būdai valdo eilučių buferį skirtingai, jei neturėtų
būti maišomi.

``f.write(string)`` įrašo *eilutės* turinį į failą ir grąžina ``None``.::

   >>> f.write('This is a test\n')

Jeigu norite irašyti, ką nors kitą negu eilutė, pirmiausia turite
tai konvertuoti į eilutę::

   >>> value = ('the answer', 42)
   >>> s = str(value)
   >>> f.write(s)

``f.tell()`` sugrąžina skaitinę reikšmę nurodančią dabartinę failo objekto
poziciją faile, kuri matuojama baitas nuo failo pradžios. Jei norite
pakeisti failo objekto poziciją, naudokite ``f.seek(poslinkis, nuo_ko)``.
Pozicija yra apskaičiuojama pridedant *poslinkio* reikšmę nuo atskaitos
taško. Atskaitos tašką apsprendžia *nuo_ko* argumentas. *nuo_ko* gali
turėti tokias reikšmes: 0 --- poslinkis nuo failo pradžios, 1 --- dabartinė
pozicija, 2 --- nuo failo pabaigos. Jeigu *nuo_ko* yra praleidžiamas,
tai naudojama reikšmė 0, t.y. nuo failo pradžios::

   >>> f = open('/tmp/workfile', 'r+')
   >>> f.write('0123456789abcdef')
   >>> f.seek(5)     # Eik prie 6-to failo baito
   >>> f.read(1)
   '5'
   >>> f.seek(-3, 2) # Eik prie 3-io baito nuo galo
   >>> f.read(1)
   'd'

Jeigu baigėte darbą su failų, iškvieskite ``f.close()`` tam, kad
uždarytumėte jį ir atlaisvintumėte sisteminius resursus, kuriuos
šio failas atidarymas yra paėmęs. Po ``f.close()`` iškvietimo bet
kokie bandymai naudoti failo objektą automatiškai nepavyks. ::

   >>> f.close()
   >>> f.read()
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   ValueError: I/O operation on closed file

Gera praktika yra naudoti :keyword:`with` bazinę žodį dirbant su failų
objektais. Šio bazinio žodžio privalumas yra tas, kad failas yra
tinkamai uždaromas, kai jo naudojimas yra baigiamas, net jei pakeliui
yra sukeliama išimtis. Be to tai daug trumpiau negu rašyti
:keyword:`try`\ -\ :keyword:`finally` blokus::

    >>> with open('/tmp/workfile', 'r') as f:
    ...     read_data = f.read()
    >>> f.closed
    True

Failų objektai turi kelis papildomus metodus, kaip kad :meth:`isatty` ir
:meth:`truncate`, kurie yra daug rečiau naudojami.


.. _tut-pickle:

:mod:`pickle` modulis
---------------------

.. index:: module: pickle

Eilutes yra paprasta rašyti ir skaityti iš failo. Skaitines reikšmes
reikalauja šiek tiek daugiau pastangų, kadangi :meth:`read` metodas grąžina
tik eilutes, kurias po to reikia perduoti funkcijoms kaip kad :func:`int`,
kurios gavusios eilutę ``'123'`` grąžina skaitinę reikmę 123. Tačiau,
jeigu jums reikia saugoti sudėtingesnius duomenų tipus kaip sąrašus,
žodynus ar klasių egzempliorius, viskas pasidaro daug sudėtingiau.

Tam, kad vartotojui nereiktų nuolat vargti rašant ir derinant
kodą norint išsaugoti sudėtingus duomenų tipus, Python'as turi
standartinį modulį :mod:`pickle`. Tai yra nerealus modulis, kuris
gali paimti beveik bet kurį Python'o objektą (netgi tam tikras Python'o
kodo formas!) ir sukonvertuoti jį į eilutę. Šis
procesas vadinamas marinavimu (ang. :dfn:`pickling`). Objekto rekonstravimas
iš eilutės yra vadinamas išmarinavimu (ang. :dfn:`unpickling`).
Tarp marinavimo ir išmarinavimo, objektas eilutėje gali
būti padėtas į failą arba persiųstas per tinklą į kitą mašiną.

Jeigu jūs turite objektą ``x`` ir failo objektą ``f`` atidarytą rašymui,
paprasčiausias būdas marinuoti objektą užima tik vieną eilutę::

   pickle.dump(x, f)

Jei norite išmarinuoti objektą ir turite failo objektą ``f``, kuris atidarytas
skaitymui naudokite::

   x = pickle.load(f)

(Yra ir daugiau variantų kaip tai padaryti, kurie naudojami marinuojant
daug objektų arba kai jūs nenorite rašyti marinuotų duomenų į failą)

:mod:`pickle` yra standartinis būdas Python'e duomenų saugojimui
ir naudojimui kitose programose (arba toje pačioje programoje, kai ji
bus iškviesta ateityje). Techninis terminas tam yra ilgalaikis
(ang. :dfn:`persistent`) objektas.  Kadangi :mod:`pickle` yra
dažnai naudojamas, daugelis autorių rašančių Python'o plėtinius
pasirūpina, kad naujus duomenų tipus (pvz.: matricas) būtų galima
tinkamai marinuoti ir išmarinuoti.
