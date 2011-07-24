.. _tut-structures:

******************
Duomenų struktūros
******************

Šis skyrius pateiks daugiau informacijos apie duomenų struktūras, su kuriomis
buvo glaustai susipažinta ankstesniuose skyreliuose. Taip pat čia rasite
ir naujų dalykų.

.. _tut-morelists:

Daugiau apie sąrašus
====================

Sąrašo duomenų tipas pateikia naudingų metodų. Štai jie:

.. method:: list.append(x)
   :noindex:

   Prideda elementą ``x`` į sąrašo pabaigą. Tai ekvivalentu ``a[len(a):] = [x]``.


.. method:: list.extend(L)
   :noindex:

   Išplečia sąrašą kitu duotu sąrašu -- pridėdamas visus duoto sąrašo ``L``
   elementus į sąrašo pabaigą. Tai tas pats kaip ir ``a[len(a):] = L``.


.. method:: list.insert(i, x)
   :noindex:

   Įterpia elementą nurodytoje sąrašo pozicijoje. Pirmasis elementas -- indeksas
   elemento, prieš kurį norime įterpti, taigi ``a.insert(0, x)`` įterpia
   į sąrašo pradžią, o ``a.insert(len(a), x)`` tapatus ``a.append(x)``.


.. method:: list.remove(x)
   :noindex:

   Pašalina iš sąrašo pirmąjį elementą, kuris lygus *x*. Jeigu tokio elemento nėra,
   įvyksta klaida.


.. method:: list.pop([i])
   :noindex:

   Pašalina elementą iš sąrašo pagal poziciją ir sugrąžina toje pozicijoje buvusią reikšmę.
   Jei indeksas nėra nurodytas, ``a.pop()`` pašalina ir sugrąžina paskutinį sąrašo elementą.
   (Laužtiniai skliausteliai aplink *i* metodo aprašyme nurodo, kad parametras
   yra nebūtinas, o ne kad jūs turite naudoti laužtinius skliaustelius
   toje vietoje. Jūs sutiksite šį būdą dažnai naudojamą Python'o dokumentacijoje.)


.. method:: list.index(x)
   :noindex:

   Sugrąžina pirmą sąrašo elemento poziciją, kur reikšmė yra x.
   Jeigu elemento, nėra įvyksta klaida.


.. method:: list.count(x)
   :noindex:

   Sugrąžina, kiek kartų reikšmė *x* sutinkama sąraše.


.. method:: list.sort()
   :noindex:

   Surikiuoja sąrašo elementus.


.. method:: list.reverse()
   :noindex:

   Sąrašo elementų tvarka pakeičiama atbulai.

Pavyzdys, kuriame panaudojam dauguma sąrašo metodų::

   >>> a = [66.25, 333, 333, 1, 1234.5]
   >>> print a.count(333), a.count(66.25), a.count('x')
   2 1 0
   >>> a.insert(2, -1)
   >>> a.append(333)
   >>> a
   [66.25, 333, -1, 333, 1, 1234.5, 333]
   >>> a.index(333)
   1
   >>> a.remove(333)
   >>> a
   [66.25, -1, 333, 1, 1234.5, 333]
   >>> a.reverse()
   >>> a
   [333, 1234.5, 1, 333, -1, 66.25]
   >>> a.sort()
   >>> a
   [-1, 1, 66.25, 333, 333, 1234.5]


.. _tut-lists-as-stacks:

Sąrašo naudojimas dėklams
-------------------------

.. sectionauthor:: Ka-Ping Yee <ping@lfw.org>


Sąrašo metodai leidžia sąrašą naudoti kaip dėklą (ang. stack), kur
paskutinis pridėtas elementas yra pirmiausia išimamas („paskutinis įdetas, pirmas išimtas“).
Norėdami pridėti elementą į deklą, naudokite :meth:`append`. Norėdami išimti
elementą iš dėklo viršaus, naudokite :meth:`pop` nenurodydami indekso. Pavyzdžiui::

   >>> stack = [3, 4, 5]
   >>> stack.append(6)
   >>> stack.append(7)
   >>> stack
   [3, 4, 5, 6, 7]
   >>> stack.pop()
   7
   >>> stack
   [3, 4, 5, 6]
   >>> stack.pop()
   6
   >>> stack.pop()
   5
   >>> stack
   [3, 4]


.. _tut-lists-as-queues:

Sąrašo naudojimas eilėms
------------------------

.. sectionauthor:: Ka-Ping Yee <ping@lfw.org>


Jūs taip pat patogiai galite panaudoti sąrašą kaip eilę, kur pirmas pridėtas
elementas yra pirmas išimamas („pirmas-į, pirmas-iš“). Elemento pridėjimui
naudokite :meth:`append`, o elemento išėmimui iš eilės priekio
naudokite :meth:`pop` su indeksu ``0``.  Pavyzdžiui::

   >>> queue = ["Eric", "John", "Michael"]
   >>> queue.append("Terry")           # Terry atvyksta
   >>> queue.append("Graham")          # Graham'as atvyksta
   >>> queue.pop(0)
   'Eric'
   >>> queue.pop(0)
   'John'
   >>> queue
   ['Michael', 'Terry', 'Graham']


.. _tut-functional:

Funkcinio programavimo įrankiai
-------------------------------

Egzistuoja trys įtaisytosios funkcijos, kurios yra labai naudingos su sąrašais:
:func:`filter`, :func:`map`, ir :func:`reduce`.

``filter(function, sequence)`` sugrąžina seką sudarytą iš elementų,
kuriems tenkina funkcijos ``function(item)`` sąlygą. Jei *sequence* yra
:class:`string` arba :class:`tuple` tipo, rezultatas bus to paties tipo,
bet kokiu kitu atveju rezultatas visada yra :class:`list`. Pavyzdžiui, kelis
pirminius skaičius galime suskaičiuoti taip::

   >>> def f(x): return x % 2 != 0 and x % 3 != 0
   ...
   >>> filter(f, range(2, 25))
   [5, 7, 11, 13, 17, 19, 23]

``map(function, sequence)`` iškviečia ``function(item)`` kiekvienam
sekos elementui ir sugrąžina sugrąžintų reikšmių sąrašą. Pavyzdžiui,
jei norime suskaičiuoti kelis kubus::

   >>> def cube(x): return x*x*x
   ...
   >>> map(cube, range(1, 11))
   [1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]

Galima perduoti daugiau negu vieną seką --- funkcija tada privalo
turėti tiek argumentų kiek yra perduodama sekų. Tada funkcijai perduodami
argumentai iš kiekvienos sekos, arba ``None``, jei kuri nors seka trumpesnė.
Pavyzdžiui::

   >>> seq = range(8)
   >>> def add(x, y): return x+y
   ...
   >>> map(add, seq, seq)
   [0, 2, 4, 6, 8, 10, 12, 14]

``reduce(function, sequence)`` sugrąžina vieną reikšmę, kuri sukonstruojama
naudojant dvejetainę funkciją *function* pirmiems dviems elementams,
tada rezultatui ir sekančiam elementui ir t.t. Pavyzdžiui, jei norime
suskaičiuoti sumą nuo 1 iki 10::

   >>> def add(x,y): return x+y
   ...
   >>> reduce(add, range(1, 11))
   55

Jei sąraše yra tik vienas elementas, jo reikšmė yra sugrąžinama. Jei seka
tuščia sukeliama išimtis.

Galima perduoti trečia arugmentą nurodantį pradinę reikšmę. Tokiu atveju
pradinė reikšmė sugrąžinama tuščiai sekai, o funkcija iš pradžių
pritaikoma pradinei reikšmei ir pirmas sekos elementui, tada rezultatai
ir kitam elementui ir t.t. Pavyzdžiui::

   >>> def sum(seq):
   ...     def add(x,y): return x+y
   ...     return reduce(add, seq, 0)
   ...
   >>> sum(range(1, 11))
   55
   >>> sum([])
   0

Nenaudokite šio pavyzdžio apibrėžties :func:`sum`: kadangi skaičių sumavimas
yra tokia dažna užduotis, kad įtaisytoji funkcija ``sum(sequence)`` jau
egzistuoja ir ji būtent taip ir dirba.

.. versionadded:: 2.3


Sąrašo užklausos
----------------

Sąrašo užklausos leidžia paprastai sukurti sąrašus nenaudojant
funkcijų :func:`map`, :func:`filter` ir/ar :keyword:`lambda` funkcijų.
Gauta sąrašo apibrėžtis dažniausiai linkusi būti aiškesnė negu naudojant
paminėtas konstrukcijas. Kiekviena sąrašo užklausa sudaroma iš
reiškinio po kurio seka :keyword:`for` sakinys, tada gali sekti nulis
arba daugiau :keyword:`for` arba :keyword:`if` sakinių. Taip
gausime sąrašą, kuris sudaromas įvertinant reiškinį
:keyword:`for` ir :keyword:`if` sakinių kontekste, kurie seka po reiškinio.
Jeigu reiškinio rezultatas yra kortežas, tai rezultatas privalo būti
apskliaustas::

   >>> freshfruit = ['  banana', '  loganberry ', 'passion fruit  ']
   >>> [weapon.strip() for weapon in freshfruit]
   ['banana', 'loganberry', 'passion fruit']
   >>> vec = [2, 4, 6]
   >>> [3*x for x in vec]
   [6, 12, 18]
   >>> [3*x for x in vec if x > 3]
   [12, 18]
   >>> [3*x for x in vec if x < 2]
   []
   >>> [[x,x**2] for x in vec]
   [[2, 4], [4, 16], [6, 36]]
   >>> [x, x**2 for x in vec]  # klaida -- kortežui reikalingi skliausteliai
     File "<stdin>", line 1, in ?
       [x, x**2 for x in vec]
                  ^
   SyntaxError: invalid syntax
   >>> [(x, x**2) for x in vec]
   [(2, 4), (4, 16), (6, 36)]
   >>> vec1 = [2, 4, 6]
   >>> vec2 = [4, 3, -9]
   >>> [x*y for x in vec1 for y in vec2]
   [8, 6, -18, 16, 12, -36, 24, 18, -54]
   >>> [x+y for x in vec1 for y in vec2]
   [6, 5, -7, 8, 7, -5, 10, 9, -3]
   >>> [vec1[i]*vec2[i] for i in range(len(vec1))]
   [8, 12, -54]

Sąrašo užklausos yra daug lankstesnės negu :func:`map` ir gali būti
pritaikytos sudėtingies reiškiniams ir vidinėms funkcijoms::

   >>> [str(round(355/113.0, i)) for i in range(1,6)]
   ['3.1', '3.14', '3.142', '3.1416', '3.14159']


Įdėtinės sąrašo užklausos
-------------------------

Jeigu jūs mėgstate sudėtingus dalykus, sąrašo užklausos gali būti įdėtinės.
Tai yra galingas įrankis, bet kaip visi galingi įrankiai, jos turi būti
naudojamos atsargiai (arba išvis nenaudojamos).

Tarkime turime 3x3 matricą, kuri yra sudaryta iš sąrašo, kuriame laikomi
trys sąrašai::

    >>> mat = [
    ...        [1, 2, 3],
    ...        [4, 5, 6],
    ...        [7, 8, 9],
    ...       ]

Taigi, jeigu norėtumėte sukeisti eilutes ir stulpelius, jūs galite
panaudoti sąrašo užklausas::

    >>> print [[row[i] for row in mat] for i in [0, 1, 2]]
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

*Įdėtinės* sąrašo užklausos turi būti įvertintos ypatingai:

    Kad išvengtumėte abejonių, kai sąrašo užklausos yra įdedamos viena į kitą,
    skaitykite iš dešinės į kairę.

Skaitomesnė šio kodo versija parodo veikimą aiškiau::

    for i in [0, 1, 2]:
        for row in mat:
            print row[i],
        print

Realiame pasaulyje, jūs turėtumėte naudoti įtaisytąsias funkcijas vietoj
sudėtingų sakinių. Funkciją :func:`zip` šiuo atveju atliks būtent tai,
ko jums reikia::

    >>> zip(*mat)
    [(1, 4, 7), (2, 5, 8), (3, 6, 9)]

Žr. :ref:`tut-unpacking-arguments`, ką reiškia žvaigždutė šioje eilutėje.

.. _tut-del:

:keyword:`del` sakinys
======================

Norėdami išimti iš sąrašo elementą pagal indeksą, o ne pagal reikšmę,
naudokite :keyword:`del` sakinį. Jis skiriasi nuo :meth:`pop` metodo,
kuris grąžina reikšmę. :keyword:`del` sakinys gali būti
naudojamas išimti iš sąrašo atkarpas arba norint išvalyti visą sąrašą
(seniau mes tai atlikome priskirdami tuščią sąrašą atkarpai).
Pavyzdžiui::

   >>> a = [-1, 1, 66.25, 333, 333, 1234.5]
   >>> del a[0]
   >>> a
   [1, 66.25, 333, 333, 1234.5]
   >>> del a[2:4]
   >>> a
   [1, 66.25, 1234.5]
   >>> del a[:]
   >>> a
   []

:keyword:`del` gali būti naudojamas kintamųjų pašalinimui::

   >>> del a

Po šios operacijos bandymas pasiekti ``a`` yra klaida (nebent kita reikšmė
yra priskiriama šiam kintamajam). Daugiau :keyword:`del` panaudojimo
būdų sutiksime vėliau.


.. _tut-tuples:

Kortežai ir sekos
=================

Mes pastebėjome, kad sąrašai ir eilutės turi daug bendrų savybių,
kaip kad indeksavimas ir kirpimo operacijos. Jie yra *sekos* duomenų
tipų pavyzdžiai. Kadangi Python'as yra besivystanti kalba, kiti sekos tipai gali
būti pridėti ateityje. Python'e yra ir kitas standartinis sekos tipas: *kortežas* (ang. tuple).

Kortežas yra kelių reikšmių seka atskirta kableliais. Pavyzdžiui::

   >>> t = 12345, 54321, 'labas!'
   >>> t[0]
   12345
   >>> t
   (12345, 54321, 'labas!')
   >>> # Kortežai gali būti įdėti vienas į kitą:
   ... u = t, (1, 2, 3, 4, 5)
   >>> u
   ((12345, 54321, 'labas!'), (1, 2, 3, 4, 5))

Kaip jūs matote, kortežų rezultatas visada yra apskliaustas, tam kad
idėtieji kortežai būtų interpretuojami teisingai. Jų įvedimas galimas
tiek be tiek su skliausteliais, nors dažniausiai skliausteliai yra
reikalingi (ypač jei kortežas yra didesnio reiškinio dalis).

Kortežai turi daug panaudojimo būdų. Pavyzdžiui: (x, y) koordinačių pora,
darbuotojo įrašas duombazėje ir t.t. Kortežai, kaip eilutės, yra nekintami,
t.y. neįmanoma priskirti reikšmės kuriam nors kortežo nariui (tačiau
tai galite padaryti naudodami kirpimus ir sujungimus). Taip pat galima
sukurti kortežą, kurio nariai yra kintami objektai (kaip kad sąrašai).

Išskirtinė problema iškyla norint sukurti kortežus, kurie sudaryti iš 0
ar 1 nario. Norint tai padaryti reikia žinoti tam tikrus sintaksės
niuansus. Tuščias kortežas sukonstruojamas naudojant tuščius skliaustelius.
Kortežas sudarytas iš vieno nario yra sukonstruojamas padedant kablelį
po reikšmės (apskliausti vieną reikšmę neužteks). Negražu, bet
efektyvu. Pavyzdžiui::

   >>> empty = ()
   >>> singleton = 'hello',    # <-- atkreipkite dėmesį į kablelį
   >>> len(empty)
   0
   >>> len(singleton)
   1
   >>> singleton
   ('hello',)

Sakinys ``t = 12345, 54321, 'hello!'`` demonstruoja *kortežo pakavimą*:
``12345``, ``54321`` ir ``'hello!'`` yra kartu supakuojamas į kortežą.
Atvirkštinė operacija taip pat yra galima:

   >>> x, y, z = t

Tai vadinama *sekos išpakavimu*. Sekos išpakavimas reikalauja tiek kintamųjų
kiek reikšmių yra sekoje. Atkreipsime dėmesį, kad priskyrimas keliams kintamiesiems
yra tik kortežo pakavimo ir sekos išpakavimo kombinacija!

Čia tėra tik šiek tiek asimetrijos: kelių reikšmių pakavimas visada sukuria
kortežą, o išpakavimas veikia su bet kokia seka.

.. XXX Pridėti šiek tiek informacijos tarp sąrašų ir kortežų.


.. _tut-sets:

Aibės
=====

Python'e taip yra duomenų tipas *aibėms*. Aibė yra nesurikiuotų
elementų rinkinys, kuriame nėra pasikartojančių elementų. Įprastai
aibės naudojamos buvimo aibėje tikrinimui ir dvigubų
narių pašalinimui. Aibės objektai taip pat palaiko
matematines operacijas kaip sąjunga, sankirta,
skirtumas ar simetriškas skirtumas.

Čia demonstruojamos aibių galimybės::

   >>> basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
   >>> fruit = set(basket)               # sukuriame aibę be dublikatų
   >>> fruit
   set(['orange', 'pear', 'apple', 'banana'])
   >>> 'orange' in fruit                 # greitas priklausymo aibei tikrinimas
   True
   >>> 'crabgrass' in fruit
   False

   >>> # Demonstruojame aibių operacijas unikalioms raidėms iš dviejų žodžių
   ...
   >>> a = set('abracadabra')
   >>> b = set('alacazam')
   >>> a                                  # unikalios raidės žodyje a
   set(['a', 'r', 'b', 'c', 'd'])
   >>> a - b                              # raidės, kurios yra a, bet ne b
   set(['r', 'd', 'b'])
   >>> a | b                              # raidės, kurios yra arba a arba b
   set(['a', 'c', 'r', 'd', 'b', 'm', 'z', 'l'])
   >>> a & b                              # raidės, kurios yra ir a ir b
   set(['a', 'c'])
   >>> a ^ b                              # raidės, kurios yra a arba b, bet ne abiejuose
   set(['r', 'd', 'b', 'm', 'z', 'l'])


.. _tut-dictionaries:

Žodynai
=======

Kitas naudingas duomenų tipas Python'e yra *žodynas*. Kitose
kalbose žodynai vadinami
„asociatyviąją atmintimi“ arba „asociatyviaisiais masyvais“.
Skirtingai nuo sekų, kurios yra indeksuojamos skaičiais,
žodynai indeksuojami naudojant *raktus*, kuriais gali būti
bet kuris nekintamas tipas. Eilutės arba skaičiai visada
gali būti naudojami kaip raktai. Kortežai gali būti
naudojami kaip raktai, jeigu jie sudaryti tik iš eilučių,
skaičių ar kortežų. Jeigu kortežas yra sudarytas iš kintamų
objektų (tiesiogiai ar netiesiogiai), jo negalima naudoti raktui.
Jūs negalite naudoti sąrašų raktams, kadangi sąrašai gali būti
modifikuojami vietoje naudojant indekso priskyrimą, atkarpų
priskyrimus arba metodus kaip :meth:`append` ir :meth:`extend`.

Žodynus geriausia įsivaizduoti kaip nesutvarkytą *raktas:reikšmė* porų aibę,
kur reikalaujama, kad raktas būtų žodyne unikalus. Tuščia figūrinių skliaustelių
pora ``{}`` sukuria tuščia žodyną. Norėdami sukurti žodyną
su pradinėmis reikšmėmis tarp figūrinių skliaustelių surašysite raktas:reikšmė poras
atskirtas kableliais. Tokiu pat būdu žodynai yra išvedami.

Pagrindinė žodynų operacija yra reikšmių įdėjimas pagal raktą
ir tos reikšmės ištraukimas pagal raktą. Taip pat galima
iš žodyno pašalinti raktas:reikšmė porą naudojant ``del``.
Jeigu jūs į žodyną rašote reikšmę naudodami raktą, kuris jau
žodyne panaudotas, senoji reikšmė yra pamirštama.
Jeigu bandysite ištraukti reikšmę iš žodyno naudodami neesantį
raktą gausite klaidą.

Metodas :meth:`keys` sugrąžina žodyne naudojamų raktų sąrašą.
Sąrašo tvarka nėra apibrėžta, todėl, jei norite surikiuoto sąrašo,
tiesiog panaudokite metodą :meth:`sort` raktų sąrašui. Jeigu norite
patikrinti, ar raktas yra žodyne, naudokite bazinį žodį :keyword:`in`.

Mažas pavyzdys kaip naudoti žodyną::

   >>> tel = {'jack': 4098, 'sape': 4139}
   >>> tel['guido'] = 4127
   >>> tel
   {'sape': 4139, 'guido': 4127, 'jack': 4098}
   >>> tel['jack']
   4098
   >>> del tel['sape']
   >>> tel['irv'] = 4127
   >>> tel
   {'guido': 4127, 'irv': 4127, 'jack': 4098}
   >>> tel.keys()
   ['guido', 'irv', 'jack']
   >>> 'guido' in tel
   True

Funkcija :func:`dict` sukonstruoja žodyną tiesiogiai
iš kortežų sąrašo, kur korteže laikomos rakto ir reikšmės poros.
Jeigu poros gali būti sudarytos algoritmiškai, žodyno
sudarymui galite panaudoti sąrašo užklausą::

   >>> dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
   {'sape': 4139, 'jack': 4098, 'guido': 4127}
   >>> dict([(x, x**2) for x in (2, 4, 6)])     # sąrašo užklausos panaudojimas
   {2: 4, 4: 16, 6: 36}

Vėliau šiame vadovėlyje išmoksime apie Generatoriaus Reiškinius, kurie
dar labiau tinka raktas-reikšmė porų sudarymui :func:`dict` funkcijai.

Kai raktai yra paprastos eilutės, tada kartais paprasčiau nurodyti
poras naudojant vardinius argumentus::

   >>> dict(sape=4139, guido=4127, jack=4098)
   {'sape': 4139, 'jack': 4098, 'guido': 4127}


.. _tut-loopidioms:

Iteravimo technikos
===================

Norint pereiti per žodyną, raktas ir jį atitinkantį reikšmė
gali būti gauta vienu metu naudojant :meth:`iteritems` metodą. ::

   >>> knights = {'gallahad': 'the pure', 'robin': 'the brave'}
   >>> for k, v in knights.iteritems():
   ...     print k, v
   ...
   gallahad the pure
   robin the brave

Kai einama per seką, pozicijos indeksas ir atitinkanti reikšmė
gali būti gauta vienu metu naudojant :func:`enumerate` funkciją. ::

   >>> for i, v in enumerate(['tic', 'tac', 'toe']):
   ...     print i, v
   ...
   0 tic
   1 tac
   2 toe

Norėdami pereiti per dvi ar daugiau sekų vienu metu, galite
sujungti įrašus naudodami :func:`zip` funkciją. ::

   >>> questions = ['name', 'quest', 'favorite color']
   >>> answers = ['lancelot', 'the holy grail', 'blue']
   >>> for q, a in zip(questions, answers):
   ...     print 'What is your {0}?  It is {1}.'.format(q, a)
   ...
   What is your name?  It is lancelot.
   What is your quest?  It is the holy grail.
   What is your favorite color?  It is blue.

Norėdami pereiti seką iš kito galo, pirma nurodykite seką
normalia tvarka ir tada iškvieskite :func:`reversed` funkciją. ::

   >>> for i in reversed(xrange(1,10,2)):
   ...     print i
   ...
   9
   7
   5
   3
   1

Jei norite pereiti per surikiuotą seką, naudokite :func:`sorted` funkciją,
kuri sugrąžina naują surikiuotą sąrašą (bet originalų sąrašą palieka nepakeistą). ::

   >>> basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
   >>> for f in sorted(set(basket)):
   ...     print f
   ...
   apple
   banana
   orange
   pear


.. _tut-conditions:

Daugiau apie sąlygas
====================

Sąlygose naudojamose ``while`` ir ``if`` sakiniuose gali būti
naudojami operatoriai (ne tik palyginimai).

Palyginimo operatoriai ``in`` ir ``not in`` tikrina, ar reikšmė
yra sekoje. Operatoriai ``is`` ir ``is not`` palygina ar
du objektai yra vienas ir tas pats objektas: tai svarbu tik kintamiems
tipams kaip kad sąrašai. Visi palyginimo operatoriai yra to paties
prioriteto, bet mažesnio prioriteto negu skaičių operatoriai.

Palyginimai gali būti sujungiami. Pavyzdžiui, ``a < b == c`` patikrina ar ``a`` yra
mažiau negu ``b`` ir dar ar ``b`` lygu ``c``.

Palyginimai gali būti sujungti naudojant loginius operatorius ``and`` ir ``or``, ir
bet kurio palyginimo (ar bet kokio loginio reiškinio) rezultatas gali būti paneigtas
naudojant ``not``. Šie operatoriai turi mažesnį prioritetą negu palyginimo
operatoriai --- iš jų ``not`` turi aukščiausia prioritetą ir ``or`` mažiausią,
taigi ``A and not B or C`` yra tas pats kas ``(A and (not B)) or C``. Kaip visada,
skliausteliai gali padėti išreikšti norimą kompoziciją.

Loginiai operatoriai ``and`` ir ``or`` yra taip pavadinami *trumpos grandinės*
operatoriais: jų argumentai yra įvertinami iš kairės į dešinę, ir įvertinimas
sustabdomas kai tik rezultatas yra nustatomas. Pavyzdžiui, jei ``A`` ir ``C`` yra
tiesa, bet ``B`` yra netiesa, tai ``A and B and C`` nevertina ``C`` reikšmės.
Kai naudojamos bendros, o ne loginės, reikšmės, trumpos-grandinės operatorių
rezultatas yra paskutinis įvertintas argumentas.

Palyginimo (ar kitos loginio reiškinio) rezultatą galima priskirti kintamajam.
Pavyzdžiui::

   >>> string1, string2, string3 = '', 'Trondheim', 'Hammer Dance'
   >>> non_null = string1 or string2 or string3
   >>> non_null
   'Trondheim'

Pastebėkite, kad Python'e (skirtingai nuo C), priskyrimas negali įvykti
reiškinyje. C programuotojai gali būti tuo nepatenkinti, bet tai padeda
išvengti dažnos C problemos, kai panaudojamas ``=`` reiškinyje, kur norėta
parašyti ``==``.


.. _tut-comparing:

Sekų ir kitų tipų palyginimas
=============================

Sekų objektai gali būti palyginami su kitais objektais, kurie turi
tą patį sekos tipą. Palyginimas naudoja *leksikografinę* tvarką:
pirmiausia palyginami pirmi du nariai, ir jeigu jie skiriasi pagal
tai nustatomas rezultatas. Jei jie lygūs, tada lyginami kitu du nariai,
ir taip toliau, kol kur nors seka baigiasi. Jeigu patys nariai yra
sekos, tada rekursiškai leksikografine tvarka lyginami jie patys.
Jei visi sekos nariai vienodi, tada sekos laikomos lygiomis.
Jeigu viena seka yra kitos sekos pradžia, tai trumpesnioji
seka yra mažesnė. Leksikografinė tvarka eilutėms naudoja ASCII
koduotę atskiroms raidėms. Keletas palyginimo pavyzdžių
tarp to paties tipo sekų::

   (1, 2, 3)              < (1, 2, 4)
   [1, 2, 3]              < [1, 2, 4]
   'ABC' < 'C' < 'Pascal' < 'Python'
   (1, 2, 3, 4)           < (1, 2, 4)
   (1, 2)                 < (1, 2, -1)
   (1, 2, 3)             == (1.0, 2.0, 3.0)
   (1, 2, ('aa', 'ab'))   < (1, 2, ('abc', 'a'), 4)

Atkreipkite dėmesį į tai, kad skirtingų tipų palyginimas yra legalus.
Rezultatas gali būti nustatytas tiksliai (bet viskas gali būti painu):
tipai yra rikiuojami pagal vardus. Taigi sąrašas (**l**\ist) yra visada trumpesnis
už eilutė (**s**\tring), eilutė visada trumpesnė už kortežą (**t**\uple) ir t.t.
[#]_ Skirtingo tipo skaičiai lyginami pagal jų reikšmę, taigi 0 lygu 0.0 ir t.t.


.. rubric:: Pastabos

.. [#] Taisyklės pagal kurias lyginami skirtingi tipai nėra galutinės ir gali
   pasikeisti ateityje.
