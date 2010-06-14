.. _tut-morecontrol:

******************************
Daugiau Srauto Valdymo Įrankių
******************************

Apart tik ką pristatyto reiškinio :keyword:`while`, Python'as pažįsta
daugiau srauto valdymo įrankių žinomų iš kitų kalbų, tačiau
yra keletas smulkių skirtumų.


.. _tut-if:

:keyword:`if` Sakinys
=====================

Tikriausiai labiausiai žinomas sakinio tipas yra :keyword:`if` sakinys.
Pavyzdžiui::

   >>> x = int(raw_input("Please enter an integer: "))
   Please enter an integer: 42
   >>> if x < 0:
   ...      x = 0
   ...      print 'Negative changed to zero'
   ... elif x == 0:
   ...      print 'Zero'
   ... elif x == 1:
   ...      print 'Single'
   ... else:
   ...      print 'More'
   ...
   More

Gali būti nulis arba daugiau :keyword:`elif` dalių, ir :keyword:`else` dalis yra
neprivaloma. Raktažodis ':keyword:`elif`' yra 'else if' sutrumpinimas ir yra
naudingas norint išvengti perkrauto teksto stumdymo. Raktažodžių :keyword:`if` ...
:keyword:`elif` ... :keyword:`elif` ... seka yra ``switch`` arba
``case`` sakinių randamų kitose kalbose atitikmuo.


.. _tut-for:

:keyword:`for` Sakinys
======================

.. index::
   statement: for
   statement: for

:keyword:`for` sakinys Python'e šiek tiek skiriasi nuo to prie ko jūs
galbūt esate pripratę C arba Pascal. Užuot iteravus per aritmetinę
skaičių progresiją (kaip Paskalyje) arba leidžiant vartotojui apsibrėžti
vienu metu iteracijos žingsnį ir baigimo sąlygą (kaip C), Python'o :keyword:`for`
sakinys iteruoja per bet kokios sekos narius (sąrašą arba eilutę), tokia
tvarka kokia jie yra sekoje. Pavyzdžiui:

.. Vienas pasiūlymas buvo duoti realų C pavyzdį, bet tai gali tik
   sumaišyti C neprogramuojančius žmones.

::

   >>> # Measure some strings:
   ... a = ['cat', 'window', 'defenestrate']
   >>> for x in a:
   ...     print x, len(x)
   ...
   cat 3
   window 6
   defenestrate 12

Modifikuoti seką, kuri yra iteruojama, nėra saugu (tai gali įvykti tik
su kintamais sekų tipais, kaip kad sąrašai). Jeigu jums reikia
modifikuoti sąrašą per kurį jūs iteruojate (pavyzdžiui, norite
dvigubinti pasirinktus narius), jūs privalote iteruoti per kopiją.
Atkarpos naudojimas tam ypač patogus::

   >>> for x in a[:]: # padarome viso sąrašo kopiją naudodami atkarpos notaciją
   ...    if len(x) > 6: a.insert(0, x)
   ...
   >>> a
   ['defenestrate', 'cat', 'window', 'defenestrate']


.. _tut-range:

:func:`range` Funkcija
======================

Jeigu jums reikia iteruoti per skaičių seką, jums pravers įtaisytoji
funkcija :func:`range` .  Ji sugeneruoja sąrašą, kuriame laikoma aritmetinė
progresija::

   >>> range(10)
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

Duotasis galutinis taškas niekada nėra sąrašo dalis: ``range(10)`` sugeneruoja
10 reikšmių sąrašą - legalias indekso reikšmes dešimties narių sekai. Taip
pat galima nurodyti kitokią pirmąją reikšmę arba nurodyti
kitokį žingsnį (netgi neigiamą)::

   >>> range(5, 10)
   [5, 6, 7, 8, 9]
   >>> range(0, 10, 3)
   [0, 3, 6, 9]
   >>> range(-10, -100, -30)
   [-10, -40, -70]

Norėdami iteruoti per sekos indeksus, jūs galite sujungti :func:`range` ir 
:func:`len` šitaip::

   >>> a = ['Mary', 'had', 'a', 'little', 'lamb']
   >>> for i in range(len(a)):
   ...     print i, a[i]
   ...
   0 Mary
   1 had
   2 a
   3 little
   4 lamb

Tačiau dažniausiai patogiau naudoti :func:`enumerate` funkciją, žiūrime :ref:`tut-loopidioms`.


.. _tut-break:

:keyword:`break` ir :keyword:`continue` Sakiniai, bei :keyword:`else` Reiškinys Cikluose 
========================================================================================

:keyword:`break` sakinys, kaip ir C, išeina iš mažiausio uždarančio
:keyword:`for` arba :keyword:`while` ciklo.

:keyword:`continue` sakinys, taip pat pasiskolintas iš C, pereina prie kitos
ciklo iteracijos.

Ciklai taip pat gali turi  ``else`` dalį --- ji yra įvykdoma kai
ciklas pereina visus sąrašo elementus (naudojant :keyword:`for`) arba
kai sąlyga nebetenkinama (naudojant :keyword:`while`), bet ne tada
kai sąrašas baigiamas naudojant :keyword:`break`.  Tai pademonstruota
toliau sekančiu ciklu, kuris ieško pirminių skaičių::

   >>> for n in range(2, 10):
   ...     for x in range(2, n):
   ...         if n % x == 0:
   ...             print n, 'equals', x, '*', n/x
   ...             break
   ...     else:
   ...         # ciklas baigėsi neradęs daliklių
   ...         print n, 'is a prime number'
   ...
   2 is a prime number
   3 is a prime number
   4 equals 2 * 2
   5 is a prime number
   6 equals 2 * 3
   7 is a prime number
   8 equals 2 * 4
   9 equals 3 * 3


.. _tut-pass:

:keyword:`pass` Sakiniai
========================

:keyword:`pass` sakinys nedaro nieko. Jis gali būti naudojamas, kai
sakinio reikalauja sintaksė, bet iš programos nereikia jokio veiksmo.
Pavyzdžiui::

   >>> while True:
   ...     pass  # Laukiame kol vartotojas nutrauks programą naudodamasis klaviatūra (Ctrl+C)
   ...

Tai dažniausiai naudojama norint sukurti minimalią klasę::

   >>> class MyEmptyClass:
   ...     pass
   ...

Kita vieta, kur :keyword:`pass` gali būti panaudotas, tai funkcijos
arba sąlyginio kodo bloko vieta, kai jūs dirbate prie naujo kodo, kas
leidžia mąstyti abstraktesniame lygyje. :keyword:`pass` yra tyliai
ignoruojamas::

   >>> def initlog(*args):
   ...     pass   # Nepamiršk parašyti funkcijos!
   ...

.. _tut-functions:

Funkcijų Apibrėžimas
====================

Mes galime sukurti funkciją, kuri surašo Fibonači skaičių seką iki
tam tikros ribos::

   >>> def fib(n):    # write Fibonacci series up to n
   ...     """Print a Fibonacci series up to n."""
   ...     a, b = 0, 1
   ...     while b < n:
   ...         print b,
   ...         a, b = b, a+b
   ...
   >>> # Now call the function we just defined:
   ... fib(2000)
   1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597

.. index::
   single: documentation strings
   single: docstrings
   single: strings, documentation

:keyword:`def` pradeda funkcijos *apibrėžtį*.  Po jo turi
sekti funkcijos vardas ir apskliaustas formalių parametrų sąrašas.
Sakiniai, kurie sudaro funkcijos kūną, prasideda kitoje eilutėje,
ir privalo būti pastumti.

Pirmasis funkcijos sakinys gali būti eilutė --- ši eilutė yra
funkcijos dokumentacijos eilutė arba :dfn:`docstring`.
(daugiau apie dokumentacijos eilutes galima rasti :ref:`tut-docstrings` skyriuje.)
Egzistuoja priemonės, kurios naudodamos dokumentacijos eilutes, gali
automatiškai sukurti dokumentaciją arba leidžia vartotojui interaktyviai
naršyti po kodą. Dokumentacijos eilučių rašymas yra gera praktika,
todėl įpraskite jas rašyti.

Funkcijos *vykdymas* prideda naują simbolių lentelę, kuri naudojama
funkcijos lokaliems kintamiesiems. Arba tiksliau, visi kintamųjų
priskyrimai funkcijoje prideda reikšmes į lokalią simbolių lentelę.
Taigi kintamųjų paieška pirmiausia atliekama lokalioje simbolių 
lentelėje, tada uždarančios funkcijos lokalioje simbolių lentelėje,
po to globalioje simbolių lentelėje ir galiausiai įtaisytoje vardų
lentelėje. Taigi globaliems kintamiesiems negalima tiesiogiai
priskirti reikšmės funkcijoje (nebent jie būtų paminėti :keyword:`global`
sakinyje), nors juos galima skaityti.

Funkcijos apibrėžtis sukuria naują funkcijos vardą dabartinėje
simbolių lentelėje. Funkcijos vardo reikšmė turi tipą, kurį
atpažįsta interpretatorius. Ši reikšmė gali būti priskirta kitam
vardui, kuris vėliau taip pat gali būti naudojamas kaip funkcija.
Tai naudojama kaip pervadinimo mechanizmas::

   >>> fib
   <function fib at 10042ed0>
   >>> f = fib
   >>> f(100)
   1 1 2 3 5 8 13 21 34 55 89

Jeigu jūs atėjote iš kitų kalbų, jūs galite papriekaištauti, kad ``fib`` yra
ne funkcija, o procedūra, nes ji negrąžina reikšmių. Tiesa sakant,
netgi funkcijos, kurios nenaudoja :keyword:`return` sakinio grąžina reikšmę,
tačiau pakankamai nuobodžią. Ši reikšmė yra ``None`` (tai yra įtaisytasis vardas).
``None`` reikšmė paprastai nespausdinama interpretatoriaus, jei tai yra
vienintelė reikšmė, kurią reikia atspausdinti. Bet jeigu tikrai norite ją
pamatyti, tai galite padaryti naudodami :keyword:`print`::

   >>> fib(0)
   >>> print fib(0)
   None

Parašyti funkciją, kuri sugrąžina Fibonačių sekos skaičių sąrašą (užuot
jį spausdinus) yra labai paprasta::

   >>> def fib2(n): # return Fibonacci series up to n
   ...     """Return a list containing the Fibonacci series up to n."""
   ...     result = []
   ...     a, b = 0, 1
   ...     while b < n:
   ...         result.append(b)    # see below
   ...         a, b = b, a+b
   ...     return result
   ...
   >>> f100 = fib2(100)    # call it
   >>> f100                # write the result
   [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

Šis pavyzdys kaip įprasta taip pat demonstruoja kelias naujas Python'o savybes:

* :keyword:`return` sakinys iš funkcijos grįžta su reikšme.
  :keyword:`return` be argumentų reiškinio sugrąžina ``None``. Jeigu
  jis nėra parašytas funkcijos gale funkcija taip pat grąžina ``None``.

* Sakinys ``result.append(b)`` iškviečia sąrašo objekto ``result`` *metodą*.
  Metodas yra funkcija, kuri „priklauso“ objektui ir vadinasi
  ``obj.methodname``, kur ``obj`` yra koks nors objektas (tai gali būti ir reiškinys),
  ir ``methodname`` yra metodo, kurį apibrėžia objekto tipas, vardas.
  Skirtingi tipai apibrėžia skirtingus metodus. Skirtingų tipų metodai
  gali vadintis taip pat nesukeldami problemų. Norint apibrėžti
  savo objektų tipus ir metodus reikia naudoti *klases*, kurios aprašytos
  vėliau šitame vadovėlyje. Metodas :meth:`append` (naudojamas pavyzdyje) yra
  apibrėžtas sąrašo objektams --- jis prideda naują elementą į sąrašo pabaigą.
  Tai yra tolygu ``result = result + [b]`` bet veikia daug efektyviau.


.. _tut-defining:

Daugiau apie Funkcijų Apibrėžimą
================================

Taip pat galima apibrėžti funkcijas su kintamu argumentų skaičiumi.
Galimos trys formos, kurios gali būti kombinuojamos.


.. _tut-defaultargs:

Numatytos Argumentų Reikšmės
----------------------------

Naudingiausia forma yra numatytų reikšmių naudojimas vienam ar daugiau
argumentų. Taip sukuriama funkcija, kuri gali būti iškviesta nurodant
mažiau argumentų negu ji priima. Pavyzdžiui::

   def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
       while True:
           ok = raw_input(prompt)
           if ok in ('y', 'ye', 'yes'): return True
           if ok in ('n', 'no', 'nop', 'nope'): return False
           retries = retries - 1
           if retries < 0: raise IOError, 'refusenik user'
           print complaint

Šią funkciją galima iškviesti taip: ``ask_ok('Do you really want to
quit?')`` arba štai šitaip: ``ask_ok('OK to overwrite the file?', 2)``.

Šis pavyzdys taip pat demonstruoja :keyword:`in` raktažodį. Šis raktažodis
tikrina ar reikšmė yra sekoje.

Numatytosios reikšmės yra įvertinamos funkcijos apibrėžimo momentu
*apibrėžties* srityje, taigi::

   i = 5

   def f(arg=i):
       print arg

   i = 6
   f()

atspausdins ``5``.

**Svarbus įspėjimas:**  numatytoji reikšmė įvertinama tik vieną kartą. Tai
yra svarbu kai naudojamas kintamas objektas kaip sąrašas, žodynas
ar daugumos klasių egzemplioriai. Pavyzdžiui, žemiau
esanti funkcija surenka argumentus, kurie perduodami
jai kiekvienu kvietimu::

   def f(a, L=[]):
       L.append(a)
       return L

   print f(1)
   print f(2)
   print f(3)

Šis kodas atspausdins ::

   [1]
   [1, 2]
   [1, 2, 3]

Jeigu jūs nenorite, kad numatytoji reikšmė būtų naudojant kiekvienam
kvietimui, jūs galite perrašyti funkciją taip::

   def f(a, L=None):
       if L is None:
           L = []
       L.append(a)
       return L


.. _tut-keywordargs:

Vardiniai Argumentai
--------------------

Funckijos taip pat gali būti kviečiamos naudojant vardinius argumentus naudojant
tokią formą ``vardas = reikšmė``.  Pavyzdžiui, ši funkcija::

   def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
       print "-- This parrot wouldn't", action,
       print "if you put", voltage, "volts through it."
       print "-- Lovely plumage, the", type
       print "-- It's", state, "!"

gali būti iškviesta tokiai būdais::

   parrot(1000)
   parrot(action = 'VOOOOOM', voltage = 1000000)
   parrot('a thousand', state = 'pushing up the daisies')
   parrot('a million', 'bereft of life', 'jump')

bet sekantys kvietimas yra nevalidus::

   parrot()                     # trūksta privalomo argumento
   parrot(voltage=5.0, 'dead')  # nevardinis argumentas seka vardinį argumentą
   parrot(110, voltage=220)     # sudvigubintas argumentas
   parrot(actor='John Cleese')  # nežinomas vardinis argumentas

Bendrai argumentų sąrašas turi naudoti tik pozicinius argumentus po kurių
seka bet kokie vardiniai argumentai, kur vardiniai argumentai turi būti parinkti
iš formalių parametrų vardų. Yra visiškai nesvarbu ar formalūs parametrai
turi numatytąją reikšmę ar ne. Nė vienas argumentas negali gauti reikšmę
daugiau negu vieną kartą --- formalūs parametrų vardai atitinkantys pozicinius
argumentus negali būti naudojami kaip vardiniai argumentai tame pačiame
kvietime. Čia yra pavyzdys, kuris neveikia dėl šių apribojimų::

   >>> def function(a):
   ...     pass
   ...
   >>> function(0, a=0)
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: function() got multiple values for keyword argument 'a'

Kai paskutinis parametras turi formą ``**name``, jis gauna
:term:`žodyną <žodynas>`, kuriame yra visi vardiniai argumentai išskyrus
tuos, kurie yra aprašyti kaip formalūs parametrai. Ši forma gali būti
naudojama su ``*name`` parametrų forma (aprašyta kitam poskyryje) kuri
gauna kortežą, kuriame sudėti poziciniai argumentai neapibrėžti
formaliame parametrų sąraše. ``*name`` turi būti apibrėžtas prieš ``**name``.
Pavyzdžiui, jei mes apibrėšime funkciją taip::

   def cheeseshop(kind, *arguments, **keywords):
       print "-- Do you have any", kind, "?"
       print "-- I'm sorry, we're all out of", kind
       for arg in arguments: print arg
       print "-" * 40
       keys = keywords.keys()
       keys.sort()
       for kw in keys: print kw, ":", keywords[kw]

Ji gali būti iškviečiama taip::

   cheeseshop("Limburger", "It's very runny, sir.",
              "It's really very, VERY runny, sir.",
              shopkeeper='Michael Palin',
              client="John Cleese",
              sketch="Cheese Shop Sketch")

ir žinoma ji atspausdins::

   -- Do you have any Limburger ?
   -- I'm sorry, we're all out of Limburger
   It's very runny, sir.
   It's really very, VERY runny, sir.
   ----------------------------------------
   client : John Cleese
   shopkeeper : Michael Palin
   sketch : Cheese Shop Sketch

Pastebėsime, kad argumentų vardų sąrašo metodas :meth:`sort` yra iškviečiamas
prieš spausdinant žodyno ``keywords`` reikšmes. Jei to nepadarytūmėm,
tai tvarka, kuria būti atspausdinami argumentai, būtų neapibrėžta.

.. _tut-arbitraryargs:

Laisvas Argumentų Sąrašas
-------------------------

.. index::
  statement: *

Galiausiai, rečiausiai naudojama galimybė yra nurodyti, kad funkcija
gali būti iškviesta su bet kokiu argumentų skaičiumi. Šie argumentai
bus sudėti į kortežą (žr. :ref:`tut-tuples`). Prieš kintamą argumentų
skaičių, galima nurodyti nulį ar daugiau normalių argumentų::

   def write_multiple_items(file, separator, *args):
       file.write(separator.join(args))


.. _tut-unpacking-arguments:

Argumentų Sąrašo Išpakavimas
----------------------------

Atvirkštinė situacija įvyksta, kai argumentai jau yra sąraše arba korteže,
bet turi būti išpakuoti funkcijos kvietimui, kuri reikalauja poziciniu
argumentų. Pavyzdžiui įtaisytoji funkcija :func:`range` tikisi
atskirų *pradžios* ir *pabaigos* argumentų. Jeigu jų neturime atskirai,
funkcijos kvietime panaudokite ``*``\-operatorių tam, kad argumentai
būtų išpakuoti iš argumentų sąrašo::

   >>> range(3, 6)             # normalus kvietimas su atskirais argumentais
   [3, 4, 5]
   >>> args = [3, 6]
   >>> range(*args)            # kvietimas su argumentais išpakuotais iš sąrašo
   [3, 4, 5]

.. index::
  statement: **

Tokiu pat būdu, žodynai gali ištraukti vardinius argumentus naudodami  ``**``\-operatorių::

   >>> def parrot(voltage, state='a stiff', action='voom'):
   ...     print "-- This parrot wouldn't", action,
   ...     print "if you put", voltage, "volts through it.",
   ...     print "E's", state, "!"
   ...
   >>> d = {"voltage": "four million", "state": "bleedin' demised", "action": "VOOM"}
   >>> parrot(**d)
   -- This parrot wouldn't VOOM if you put four million volts through it. E's bleedin' demised !


.. _tut-lambda:

Lambda Formos
-------------

Pagal populiarų prašymą naują savybė randama kitose funkcinėse programavimo kalbose
kaip kad Lisp buvo pridėta ir į Python'ą. Naudojant :keyword:`lambda` raktažodį,
galima kurti mažas anonimines funkcijas. Čia yra funkcija, kuri sugrąžina dviejų
argumentų sumą: ``lambda a, b: a+b``.  Lambda formos gali būti naudojamas
kiekvieną kartą kai reikia funkcijos objekto. Jos sintaksiškai yra apribotos
iki vieno reiškinio. Semantiškai, jos tėra sintaksinis cukrus normalių
funkcijų apibrėžtims. Kaip yra įdėtinės funkcijos, lambda formos gali
pasiekti kintamuosius iš išorinės srities::

   >>> def make_incrementor(n):
   ...     return lambda x: x + n
   ...
   >>> f = make_incrementor(42)
   >>> f(0)
   42
   >>> f(1)
   43

*Vertėjo pastaba*: nuo Python 3.0 versijos lambda funkcijos yra išimtos todėl venkite jas naudoti.

.. _tut-docstrings:

Dokumentacijos Eilutės
----------------------

.. index::
   single: docstrings
   single: documentation strings
   single: strings, documentation


Egzistuoja susitarimai dokumentacijos eilučių turiniui ir formatavimui.

Pirmoji eilutė visada turi būti trumpas, aiškus objekto paskirties
apibendrinimas. Dėl trumpumo objekto vardas ar tipas neturi būti minimas,
nes jis ir taip yra matomas (išskyrus, jei vardas yra veiksmažodis
apibūdinantis funkcijos operaciją). Ši eilutė turi prasidėti
iš didžiosios raidės ir pasibaigti tašku.

Jeigu dokumentacijos eilutėje yra daugiau eilučių, antroji eilutė turi
būti tuščia, atskirianti apibendrinimą nuo aprašymo. Sekančios eilutės
turi būti vienas ar daugiau paragrafų aprašančių objekto kvietimo
būdus, šalutinius efektus ir t.t.

Python'o interpetatorius nepašalina pastūmimų iš daugiaeilutės eilutės,
taigi priemonės, kurios tvarko dokumentaciją turi padaryti tai
pačios, jei to nori. Tai atliekama pagal tokį susitarimą. Pirma netuščia
eilutė po pirmos eilutės nustato per kiek yra pastumtas tekstas visai
dokumentacijai. Mes negalime naudoti pirmosios eilutės, nes ji
paprastai būną toje pačioje eilutėje kaip atidarančios kabutės, todėl
jos lygiavimas nėra akivaizdus. Tada šis tarpų "ekvivalentas" nukerpamas
nuo visų eilučių starto. Tekste neturėtų būti eilučių, kurios pastumtos
mažiau, bet jei taip atsitinka visi tarpai turi būti nukerpami.

Čia yra daugiaeilutės dokumentacijos eilutės pavyzdys::

   >>> def my_function():
   ...     """Do nothing, but document it.
   ...
   ...     No, really, it doesn't do anything.
   ...     """
   ...     pass
   ...
   >>> print my_function.__doc__
   Do nothing, but document it.

       No, really, it doesn't do anything.


.. _tut-codingstyle:

Intermezzo: Programavimo Stilius
================================

.. sectionauthor:: Georg Brandl <georg@python.org>
.. index:: pair: coding; style

Dabar kai jūs esate pasiruošę rašyti ilgesnes ir sudėtingesnes Python'o
programas, tai yra puikus metas pakalbėti apie *programavimo stilių*.
Dauguma kalbų gali būti rašomas (arba tiksliau sakant *formatuojamas*)
skirtingais stiliais --- kai kurios yra skaitomesnės negu kitos.
Rašyti kitiems skaitomą kodą yra gera idėja, todėl gražaus programavimo
stiliaus naudojimas labai padeda.

Python'e dauguma projektų naudoja stilių apibrėžtą :pep:`8` dokumente --- kas
skatina labai skaitomą ir akiai malonų programavimo stilių. Kiekvienas
Python'o programuotojas privalo jį kada nors perskaityti. Štai
čia aprašomi patys svarbiausi punktai:

* Naudokite 4-tarpų pastūmimą, ir nenaudokite tabuliacijos.

  4 tarpai yra kompromisas tarp mažo pastūmimo (leidžia naudoti gilesnį
  įdėjimo gylį) ir didelio pastūmimo (paprasčiau skaityti). Tabuliacija
  naudoti teisingai yra sudėtinga ir todėl jos nenaudoti iš viso.

* Nerašykite eilučių, kurios yra ilgesnės negu 79 simboliai.

  Tai padeda vartotojams, kurie naudoja mažus ekranus ir leidžia
  stebėti du kodo puslapius turint didelį ekraną.

* Naudokite tuščias eilutes atskirdami funkcijas ir klases, bei didesnius kodo
  blokus funkcijos viduje.

* Kai įmanoma komentarus rašykite atskiroje eilutėje.

* Naudokite dokumentacijos eilutes.

* Naudokite tarpus aplink operatorius ir po kablelių, bet ne skliaustelių
  konstrukcijose: ``a = f(1, 2) + g(3, 4)``.

* Vardus klasėms ir funkcijoms duokite nuosekliai. Oficialiai susitarta, kad
  klasėms vardai turi būti duodami naudojant ``KupranugarioLygius``, o funkcijoms
  ir metodams ``mažosios_raidės_su_pabraukimais``. Visada naudokite
  ``self`` vardą pirmam metodo argumentui (žr. :ref:`tut-firstclasses` apie
  klases ir metodus).

* Nenaudokite keistų koduočių savo kode, jeigu jūsų kodas yra skirtas tarptautinei
  aplinkai. Paprasta ASCII koduose yra geriausia dauguma atvejų.
