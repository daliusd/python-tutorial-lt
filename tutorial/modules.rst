.. _tut-modules:

********
Moduliai
********

Jei išjungsite Python interpretatorių ir vėliau vėl jį įjungsite, visi jūsų
aprašai (funkcijos ir kintamieji), aprašyti interpretatoriuje, dings. Todėl,
jei ketinate rašyti sudėtingesnę programą, geriau naudotis teksto redaktoriumi
kintamųjų ir funkcijų aprašymui, kuriuos vėliau galėsite panaudoti
interpretatoriuje. Failas, kuriame saugomas jūsų paruoštas kodas, vadinamas
*skriptu*. Programai didėjant, tikriausiai kils poreikis išskaidyti ją keliuose
failuose, kad būtų lengviau surasti, kas kur aprašyta. Tikriausiai norėsite
aprašytą funkciją panaudoti keliose kitose programose nekopijuojant viso
funkcijos aprašo į kiekvieną iš tų programų.

Python'as gali nuskaityti jūsų kodo aprašus iš failo ir suteikia galimybę
panaudoti kiekvieną aprašytą struktūrą panaudoti kitame skripte ar
interpretatoriuje. Toks failas vadinamas *moduliu*: apibrėžtos struktūros iš
vieno modulio, gali būti *importuotos* į kitus modulius arba į jūsų pagrindinį
modulį (vykdomąjį skriptą arba interaktyvaus interpretatoriaus režimą, kur
galite operuoti kintamaisiais).

Modulis yra paprastas failas, kuriame saugomas Python'o kodas. Failo vardas
sudaromas iš modulio pavadinimo ir galūnės: :file:`.py`. Modulyje, pačio
modulio vardas (kaip simbolių eilutė) saugomas globaliame kintamajame
``__name__``. Praktiniam išbandymui, atverkite savo mėgiamą teksto redaktorių
ir einamajame kataloge sukurkite naują failą pavadinimu :file:`fibo.py`. Failo
turinys turėtu būti toks::

   # Fibonačio skaičių modulis

   def fib(n):    # išvedama Fibonačio seka iki n
       a, b = 0, 1
       while b < n:
           print b,
           a, b = b, a+b

   def fib2(n): # grąžinama Fibonačio seka iki n
       result = []
       a, b = 0, 1
       while b < n:
           result.append(b)
           a, b = b, a+b
       return result

Dabar paleiskite Python'o interpretatorių ir importuokite šį moduli
naudodami tokią komandą::

   >>> import fibo

Ši komanda funkcijų vardų, kurie yra apibrėžti ``fibo`` modulyje, neprideda
į dabartinę simbolių lentelę --- į lentelę pridedamas tik modulio vardas
``fibo``. Naudodami modulio vardą jūs galite pasiekti funkcijas::

   >>> fibo.fib(1000)
   1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987
   >>> fibo.fib2(100)
   [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
   >>> fibo.__name__
   'fibo'

Jeigu jūs planuojate naudoti funkciją dažnai jūs galite ją priskirti
lokaliam vardui::

   >>> fib = fibo.fib
   >>> fib(500)
   1 1 2 3 5 8 13 21 34 55 89 144 233 377


.. _tut-moremodules:

Daugiau apie Modulius
=====================

Modulyje gali būti sudėti tiek vykdomi sakiniai tiek funkcijų apibrėžtys.
Šių sakinių tikslas yra modulio inicializavimas. Jie vykdomi tik
*pirmą* kartą, kai modulis yra importuojamas. [#]_

Kiekvienas modulis turi savo privačią simbolių lentelę, kuri naudojama
kaip globali simbolių lentelę visoms funkcijoms modulyje. Taigi
modulio autorius gali naudoti globalius kintamuosius nesirūpindamas
apie atsitiktinius vardų sutapimus su vartotojo globaliais kintamaisiais.
Iš kitos pusės, jeigu jūs žinote, ką jus darote, jūs galite pasiekti
modulio globalius kintamuosius naudodamiesi ta pačia sintakse, kurią
naudojote funkcijoms --- ``modname.itemname``.

Moduliai gali importuoti modulius. Yra įprasta (nors nebūtina) visus
:keyword:`import` sakinius surašyti modulio (ar skripto) pradžioje.
Visi importuotų modulių vardai yra įkeliami į importuojančio modulio
globalią simbolių lentelę.

:keyword:`import` sakinys turi formą leidžiančią importuoti
pasirinktus vardus iš modulio tiesiai į importuojančio modulio
simbolių lentelę. Pavyzdžiui::

   >>> from fibo import fib, fib2
   >>> fib(500)
   1 1 2 3 5 8 13 21 34 55 89 144 233 377

Ši forma neįtraukia modulio (iš kurio importuojama) vardo į lokalia
simbolių lentelę (taigi šiame pavyzdyje ``fibo`` yra neapibrėžtas).

Egzistuojate netgi forma leidžianti importuoti visus vardus, kuriuos
apibrėžia modulis::

   >>> from fibo import *
   >>> fib(500)
   1 1 2 3 5 8 13 21 34 55 89 144 233 377

Ši forma importuoja visus vardus išskyrus tuos kurie prasideda pabraukimu (``_``).

.. note::

   Dėl efektyvumo kiekvienas modulis importuojamas tik vieną kartą
   interpretatoriaus sesijai. Taigi, jeigu jūs keičiate savo modulius,
   jūs privalote perkrauti interpretatorių. Jeigu dirbate
   tik su vienu moduliu, kurį jūs norite testuoti interaktyviai,
   galite naudoti :func:`reload`, pvz. ``reload(modulename)``.


.. _tut-modulesasscripts:

Moduliai kaip skriptai
----------------------

Kai jūs vykdote Python'o modulį šitaip:

   python fibo.py <arguments>

kodas modulyje bus įvykdytas, lyg jis būtų importuotas, bet ``__name__``
kintamasis bus nustatytas į ``"__main__"``.  Taigi jeigu
jūs pridėsite tokį kodą į modulio pabaigą::

   if __name__ == "__main__":
       import sys
       fib(int(sys.argv[1]))

jūs galite failą naudoti ir kaip importuojamą modulį ir kaip skriptą
nes kodas, kuris tikrina komandinę eilutę vykdomas tik tada
kaip modulis vykdomas kaip "pagrindinis" ("main") failas::

   $ python fibo.py 50
   1 1 2 3 5 8 13 21 34

Jeigu modulis bus importuotas, kodas nebus vykdomas::

   >>> import fibo
   >>>

Tai dažniausiai naudojama norint suteikti patogią vartotojo sąsają moduliui
arba testavimo tikslais (pvz.: modulį paleidžiant kaip skriptą įvykdomi
testai).


.. _tut-searchpath:

Modulio Paieškos Kelias
-----------------------

.. index:: triple: module; search; path

Kai modulis pavadintas :mod:`spam` yra importuojamas, interpretatorius
ieško failo vardu :file:`spam.py` dabartinėje direktorijoje, o po to
direktorijų sąraše, kurias nurodo aplinkos kintamasis :envvar:`PYTHONPATH`.
Šis kintamasis naudoja tokią pačią sintaksę kaip ir apvalkalo kintamasis
:envvar:`PATH`, t.y. aplankų vardų sąrašas. Jeigu :envvar:`PYTHONPATH` nėra
nustatytas, arba kai modulis čia nerandamas, paieška tęsiama aplanke, kuris priklauso
nuo įdiegimo. Unix-tipo sistemoje tai dažniausiai
yra :file:`.:/usr/local/lib/python`.

Faktiškai, moduliai yra ieškomi aplankų sąraše, kuris laikomas kintamajame
``sys.path``. Šis kintamasis yra inicializuojamas dabartiniu aplanku (t.y.
tuo kur paleidžiamas skriptas), :envvar:`PYTHONPATH` ir aplanku, kuris
priklauso nuo įdiegimo. Tai leidžia Python'o programoms, kurios
supranta, kas yra daroma, modifikuoti arba pakeisti modulių paieškos kelius.
Kadangi skripto aplankas yra įdedamas į paieškos kelią nevadinkite savo
skripto vardu sutampančiu su kokiu nors standartiniu Python'o moduliu,
nes kitaip Python'as importuojant kokį nors modulį importuos jūsų skriptą,
o tai dažniausiai yra klaida. Daugiau informacijos apie tai
skyriuje :ref:`tut-standardmodules`.


"Kompiliuoti" Python'o failai
-----------------------------

"Kompiliuoti" Python'o failai yra svarbus pagreitinimas mažoms programoms,
kurios naudoja daug modulių. Jeigu :file:`spam.pyc` egzistuoja tame
pačiame aplanke kaip :file:`spam.py`, daroma prielaida, kad
modulis :mod:`spam` jau turi "baitinę-kompiliuotą" versiją. Į :file:`spam.pyc`
įrašomas failo :file:`spam.py` pakeitimo laikas, todėl kai
laikas esantis :file:`.pyc` nesutampa jis yra ignoruojamas.

Įprastai, jums nieko nereikia daryti, kad failas :file:`spam.pyc` būtų sukurtas.
Kaskart, kai :file:`spam.py` yra sėkmingai sukompiliuojamas, jo kompiliuotą
versiją bandoma rašyti į  :file:`spam.pyc`. Jeigu tai nepavyksta, tai nėra
klaida. Jei tarkime dėl kokių nors priežasčių įrašomas ne visas failas,
tai vėliau jis bus atpažįstamas kaip neteisingas ir bus ignoruojamas.
:file:`spam.pyc` turinys yra nepriklausomas nuo platformos, todėl Python'o
modulių aplankas gali būti naudojamas vienu metu skirtingų architektūrų
mašinų.

Keletas patarimų ekspertams:

* Kai Python'o interpretatorius yra iškviečiamas su :option:`-O`, sugeneruojamas
  optimizuotas kodas ir padedamas į failą :file:`.pyo`. Optimizatorius
  šiuo metu daug nepadeda: jis tik pašalina :keyword:`assert` sakinius. Kai
  :option:`-O` yra naudojamas, *visas* :term:`baitinis kodas` yra optimizuotas, ``.pyc``
  failai yra ignoruojami ir ``.py`` failai kompiliuojami į optimizuotą
  baitinį kodą.

* Jeigu perduosite du :option:`-O` Python'o interpretatoriui (:option:`-OO`), tada
  baitinio kodo kompiliatorius atliks optimizacijas, kurios kai kuriais retais
  atvejais gali pagaminti neteisingai veikiančias programas. Šiuo metu tik
  ``__doc__`` eilutės yra pašalinamos iš baitinio kodo, dėl ko
  :file:`.pyo` failai yra mažesni.  Kadangi, kai kurios programos gali
  remtis šių eilučių buvimo, jūs turite naudoti šią galimybę tik tada,
  kai tikrai žinote, ką darote.

* Programa paleista iš :file:`.pyc` arba :file:`.pyo` neveikia greičiau
  negu tada, kai ji vykdoma iš :file:`.py` failo --- vienintelis
  dalykas, kuo :file:`.pyc` arba :file:`.pyo` failai yra greitesni,
  tai greitis, kuriuo jie yra užkraunami.

* Kai skriptas vykdomas nurodant jo vardą komandinėje eilutėje,
  baitinis kodas niekada nėra rašomas į :file:`.pyc` ar :file:`.pyo` failą.  Taigi,
  skripto paleidimo laikas gali būti sumažintas jo kodo dalis perkeliant
  į modulį ir naudojant mažą skriptą, kuris tą modulį importuoja.

* Galima turėti failą :file:`spam.pyc` (arba :file:`spam.pyo`
  kai naudojama :option:`-O`) be :file:`spam.py` failo tam pačiam
  moduliui. Tai gali būti panaudojama Python bibliotekų platinimui,
  nes tokią formą yra pakankamai sunku vėl atgal paversti skaitomu
  kodu.

  .. index:: module: compileall

* Modulis :mod:`compileall` gali sukurti :file:`.pyc` failus (arba :file:`.pyo`
  failus kai naudojama :option:`-O`) visiems moduliams aplanke.


.. _tut-standardmodules:

Standartiniai Moduliai
======================

.. index:: module: sys

Įprastas Python'o įdiegimas turi standartinių modulių biblioteką.
Kai kurie moduliai yra interpretatoriaus dalis --- jie leidžia atlikti
operacijas, kurios nėra kalbos branduolio dalis, bet jie yra įtaisyti
arba dėl efektyvumo arba, kad būtų galima atlikti operacinės sistemos
primityvus (kaip kad sisteminius kvietimus). Tokių modulių aibė
priklauso nuo platformos. Pavyzdžiui, modulis :mod:`winreg` yra
aktualus tik Windows sistemai. Vienas konkretus modulis
nusipelno šiek tiek dėmesio: :mod:`sys`, kuris yra kiekvieno Python'o
interpretatoriaus dalis. Kintamieji ``sys.ps1`` ir ``sys.ps2`` apibrėžia
eilutes, kurios naudojamos kaip pirminis ir antrinis raginimas::

   >>> import sys
   >>> sys.ps1
   '>>> '
   >>> sys.ps2
   '... '
   >>> sys.ps1 = 'C> '
   C> print 'Yuck!'
   Yuck!
   C>


Šiek du kintamieji yra apibrėžti tik jei interpretatorius yra interaktyviame
rėžime

Kintamasis ``sys.path`` yra eilučių sąrašas, kuris nustato interpretatoriaus
modulių paieškos kelią. Jis inicializuojamas keliu paimtu
iš aplinkos kintamojo :envvar:`PYTHONPATH` arba standartiniu keliu, jei
:envvar:`PYTHONPATH` nėra nustatytas.  Jūs galite jį modifikuoti naudodami
standartines sąrašo operacijas::

   >>> import sys
   >>> sys.path.append('/ufs/guido/lib/python')


.. _tut-dir:

:func:`dir` Funkcija
====================

Įtaisytoji funkcija :func:`dir` yra naudojama, kai norime sužinoti kokius
vardus apibrėžia modulis. Ši funkcija sugrąžina surūšiuotą eilučių sąrašą::

   >>> import fibo, sys
   >>> dir(fibo)
   ['__name__', 'fib', 'fib2']
   >>> dir(sys)
   ['__displayhook__', '__doc__', '__excepthook__', '__name__', '__stderr__',
    '__stdin__', '__stdout__', '_getframe', 'api_version', 'argv',
    'builtin_module_names', 'byteorder', 'callstats', 'copyright',
    'displayhook', 'exc_clear', 'exc_info', 'exc_type', 'excepthook',
    'exec_prefix', 'executable', 'exit', 'getdefaultencoding', 'getdlopenflags',
    'getrecursionlimit', 'getrefcount', 'hexversion', 'maxint', 'maxunicode',
    'meta_path', 'modules', 'path', 'path_hooks', 'path_importer_cache',
    'platform', 'prefix', 'ps1', 'ps2', 'setcheckinterval', 'setdlopenflags',
    'setprofile', 'setrecursionlimit', 'settrace', 'stderr', 'stdin', 'stdout',
    'version', 'version_info', 'warnoptions']

Jei funkcija :func:`dir` vykdoma be argumentų, tai surašomi vardai, kurie
yra apibrėžti dabar::

   >>> a = [1, 2, 3, 4, 5]
   >>> import fibo
   >>> fib = fibo.fib
   >>> dir()
   ['__builtins__', '__doc__', '__file__', '__name__', 'a', 'fib', 'fibo', 'sys']

Pastebėsime, kad surąšomi visų tipų vardai: kintamieji, moduliai, funkcijos ir t.t.

.. index:: module: __builtin__

Funkcija :func:`dir` neišrašo įtaisytų funkcijų ir kintamųjų. Jeigu
jūs norite gauti jų sąrašą, jie yra apibrėžti standartiniame modulyje
:mod:`__builtin__`::

   >>> import __builtin__
   >>> dir(__builtin__)
   ['ArithmeticError', 'AssertionError', 'AttributeError', 'DeprecationWarning',
    'EOFError', 'Ellipsis', 'EnvironmentError', 'Exception', 'False',
    'FloatingPointError', 'FutureWarning', 'IOError', 'ImportError',
    'IndentationError', 'IndexError', 'KeyError', 'KeyboardInterrupt',
    'LookupError', 'MemoryError', 'NameError', 'None', 'NotImplemented',
    'NotImplementedError', 'OSError', 'OverflowError',
    'PendingDeprecationWarning', 'ReferenceError', 'RuntimeError',
    'RuntimeWarning', 'StandardError', 'StopIteration', 'SyntaxError',
    'SyntaxWarning', 'SystemError', 'SystemExit', 'TabError', 'True',
    'TypeError', 'UnboundLocalError', 'UnicodeDecodeError',
    'UnicodeEncodeError', 'UnicodeError', 'UnicodeTranslateError',
    'UserWarning', 'ValueError', 'Warning', 'WindowsError',
    'ZeroDivisionError', '_', '__debug__', '__doc__', '__import__',
    '__name__', 'abs', 'apply', 'basestring', 'bool', 'buffer',
    'callable', 'chr', 'classmethod', 'cmp', 'coerce', 'compile',
    'complex', 'copyright', 'credits', 'delattr', 'dict', 'dir', 'divmod',
    'enumerate', 'eval', 'execfile', 'exit', 'file', 'filter', 'float',
    'frozenset', 'getattr', 'globals', 'hasattr', 'hash', 'help', 'hex',
    'id', 'input', 'int', 'intern', 'isinstance', 'issubclass', 'iter',
    'len', 'license', 'list', 'locals', 'long', 'map', 'max', 'min',
    'object', 'oct', 'open', 'ord', 'pow', 'property', 'quit', 'range',
    'raw_input', 'reduce', 'reload', 'repr', 'reversed', 'round', 'set',
    'setattr', 'slice', 'sorted', 'staticmethod', 'str', 'sum', 'super',
    'tuple', 'type', 'unichr', 'unicode', 'vars', 'xrange', 'zip']


.. _tut-packages:

Pakuotės
========

Pakuotės yra būdas struktūrizuoti Python'o modulių vardų edrvę
naudojant "taškais atskirtus modulių vardus". Pavyzdžiui, modulis :mod:`A.B`
nurodo submodulį ``B`` pakuotėje ``A``. Lygiai taip kaip moduliai
apsaugo skirtingų modulių autorius nuo rūpesčio dėl vienodų
globalių kintamųjų vardų, taip taškais atskirti modulių vardai apsaugo
multi-modulinių pakuočių (tokių kaip NumPy ar Python Imaging Library)
autorius nuo rūpesčio dėl vienodų modulių vardų.

Tarkime jūs norite sukurti modulių kolekciją ("pakuotę")
universalią garso failų ir duomenų tvarkymui. Kadangi egzistuoja
įvairūs failų formatai (dažniausiai atpažįstami pagal plėtinį,
pvz.: :file:`.wav`, :file:`.aiff`, :file:`.au`), todėl
jums reikės sukurti ir palaikyti augančią modulių
kolekciją įvairiems failų formatams. Taip pat egzistuoja daug skirtingų
operacijų, kurias jus norite atlikti su garso duomenimis (miksavimas,
aido pridėjimas, ekvalaizerio pritaikymas, dirbtinio stereo efekto
sukūrimas), taigi jūs taip pat tūrėsite rašyti daug modulių, kurie
atliks šias operacijas. Tai galėtų būti jūsų pakuotės struktūra
(pavaizduota kaip hierarchinė failų sistema)::

   sound/                          Aukščiausio lygio pakuotė
         __init__.py               Garso pakuotės inicializacija
         formats/                  Subpakuotė failų formatų konvertavimui
                 __init__.py
                 wavread.py
                 wavwrite.py
                 aiffread.py
                 aiffwrite.py
                 auread.py
                 auwrite.py
                 ...
         effects/                  Subpakuotė garso efektams
                 __init__.py
                 echo.py
                 surround.py
                 reverse.py
                 ...
         filters/                  Subpakuotė filtrams
                 __init__.py
                 equalizer.py
                 vocoder.py
                 karaoke.py
                 ...

Kai importuojame pakuotė, Python'as ieško pakuotės aplanko aplankuose
nurodytose ``sys.path``.

:file:`__init__.py` failas yra reikalingas tam, kad Python'as aplanką
atpažintų kaip pakuotę. Taip daroma todėl, kad dažni vardai (tarkim
``string``), netyčia nepaslėptų galiojančių modulių, kurie randami
vėliau modulių paieškos kelyje. Paprasčiausiu atveju :file:`__init__.py`
gali būti tiesiog tuščias failas, bet jei reikia jis gali įvykdyti
inicializacijos kodą pakuotei arba nustatyti kintamąjį
``__all__`` (aprašytas vėliau).

Pakuotės vartotojai gali importuoti individualius modulius iš pakuotės.
Pavyzdžiui::

   import sound.effects.echo

Ši komanda paleidžia submodulį :mod:`sound.effects.echo`. Norint jį naudoti
reikia nurodyti pilną vardą::

   sound.effects.echo.echofilter(input, output, delay=0.7, atten=4)

Alternatyvus būdas importuotį submodulį yra::

   from sound.effects import echo

Ši komanda taip pat paleidžia submodulį :mod:`echo` ir leidžia jį naudoti
nenurodant pakuotės. Todėl jį galima naudoti taip::

   echo.echofilter(input, output, delay=0.7, atten=4)

Kitas variantas yra importuoti norimą funkciją ar kintamąjį tiesiogiai::

   from sound.effects.echo import echofilter

Vėlgi, tai užkrauną submodulį :mod:`echo`, bet jo funkcija
:func:`echofilter` dabar pasiekiama tiesiogiai::

   echofilter(input, output, delay=0.7, atten=4)

Atkreipkime dėmesį, kad naudojant ``from pakuotė import narys``, *narys* gali
būti pakuotės submodulis (ar subpakuotė), koks nors vardas,
arba koks nors vardas apibrėžtas pakuotėje (funkcija, klasė ar kintamasis).
``import`` sakinys pirmiausia testuoja ar narys yra apibrėžtas pakuotėje
ir jeigu ne tada daro prielaidą, kad narys yra modulis ir bando jį pakrauti.
Jeigu ir tada jo neranda, tada sukelia išimtis :exc:`ImportError`.

Priešingai, kai naudojama sintaksė ``import item.subitem.subsubitem``, kiekvienas
narys išskyrus paskutinį privalo būti pakuotė. Paskutinis narys gali
būti modulis, pakuotė, bet negali būti klasė, funkcija, kintamasis (kaip
tai buvo galima daryti prieš tai).


.. _tut-pkg-import-star:

\* Importavimas Iš Pakuotės
---------------------------

.. index:: single: __all__

Kas atsitiks, jeigu vartotojas parašys ``from sound.effects import *``? Idealiu
atveju vartotojas tikėsis, kad ši komanda kažkaip nueis į failų sistemą,
ras kurie submoduliai priklauso pakuotei ir juos visus importuos. Nelaimei
ši operacija nedirba gerai Windows platformoje, kur failų sistema ne
visada turi informaciją apie failo vardo raidžių lygį! Šioje platformoje,
nėra garantuoto būdo žinoti ar :file:`ECHO.PY` turi būti importuotas kaip
:mod:`echo`, :mod:`Echo` ar :mod:`ECHO`. (Pavyzdžiui, Windows 95 turi
erzinantį įprotį rodyti visus failų vardus naudojant pirmą didžiąją raidę).
DOS 8+3 failų vardų apribojimai prideda kitą įdomią problemą ilgiems modulių
vardams.

Vienintelis sprendimas yra pakuotės autoriui išskirtinai išvardinti
pakuotės turinį. *import* sakinys naudoja tokį susitarimą: jei
pakuotės :file:`__init__.py` faile apibrėžiamas sąrašas ``__all__`` kintamajame,
jis turi būti naudojamas, kai modulių vardai importuojami naudojant
``from package import *``. Pakuotės autorius yra atsakingas, kad šis sąrašas
būtų atnaujinamas su kiekviena nauja pakuotės versija. Pakuotės autorius
gali taip pat nuspręsti jo nepalaikyti, jeigu jis nemato prasmės naudoti
\* importavimą su jo pakuote. Pavyzdžiui :file:`sounds/effects/__init__.py`
failo turinys gali būti toks::

   __all__ = ["echo", "surround", "reverse"]

Tai reiškia, kad ``from sound.effects import *`` importuos tris
išvardinus submodulius iš :mod:`sound` pakuotės.

Jeigu ``__all__`` nėra apibrėžtas, sakinys ``from sound.effects import *``
*neimportuoja* visų submodulių iš pakuotės :mod:`sound.effects` į
dabartinę vardų erdvę --- tai tik užtikrins, kad pakuotė
:mod:`sound.effects` bus importuota, įvykdys inicializacijos
kodą :file:`__init__.py` faile ir tada importuos visus vardus apibrėžtus
pakuotėje. Į tai įeina visi vardai apibrėžti (ir submoduliai išskirtinai
paleisti) faile :file:`__init__.py`. Į tai taip pat įeina
bet kokie pakuotės submoduliai, kurie buvo išskirtinai paleisti
senesnių importavimo sakinių. Pažiūrėkite į šį kodą::

   import sound.effects.echo
   import sound.effects.surround
   from sound.effects import *

Šiame pavyzdyje, echo ir surround moduliai yra importuojami į dabartinę
vardų erdvę, kadangi jie yra apibrėžti :mod:`sound.effects` pakuotėje, kai
``from...import`` sakinys yra įvykdomas. (Tai dirba taip pat, kai
``__all__`` yra apibrėžtas)

Pastebėsime, kad geriau nenaudoti ``*`` improtavimo iš modulių
ar pakuočių, nes dažniausiai dėl to kodas tampa prastai skaitomas.
Tačiau, nieko blogo tai daryti interaktyvioje sesijoje norint sutaupyti
klaviatūros spausdinimo laiko, o taip pat kai kurie moduliai yra sukurti
taip, kad būtų išeksportuojami tik tam tikri vardai.

Prisiminkite, kad nėra nieko blogo naudoti ``from Pakuotė import
specifinis_submodulis``!  Tiesa sakant, tai rekomenduojamas būdas nebent
submodulis iš kitos pakuotės naudoja tokį patį vardą.


Nuorodos tarp Pakuočių
----------------------

Submoduliai dažnai rodo vienas į kitą. Tarkime, modulis :mod:`surround` gali
naudoti modulį :mod:`echo`.  Tiesa sakant, tokios nuorodos yra tokios
dažnos, kad :keyword:`import` sakinys pirmiausiai tikrina jau turimas pakuotes
prieš ieškodamas modulių paieškos kelyje. Taigi,
modulis :mod:`surround` gali tiesiog naudoti ``import echo`` arba ``from echo import
echofilter``.  Jeigu importuojamas modulis nerandamas dabartinėje
pakuotėje (t.y. pakuotėje, kurioje šis modulis yra submodulis),
tada :keyword:`import` sakinys ieško aukščiausio lygio modulio duotu
vardu.

Kai pakuotė yra struktūrizuota į subpakuotes (pavyzdžiui kaip tai padaryta
:mod:`sound` pakuotėje), jūs galite naudoti absoliučius importavimus norėdami
nurodyti į gretimų pakuočių submodulius. Pavyzdžiui, jei modulis
:mod:`sound.filters.vocoder` turi naudoti :mod:`echo` modulį iš :mod:`sound.effects` pakuotės,
tai tada galima naudoti ``from sound.effects import echo``.

Pradedant Python 2.5 versija, prie netiesiogiai nurodytų reliatyvių
importavimų aprašytų viršuje, jūs galite naudoti griežtai nurodytus
reliatyvius importavimus naudodami ``from module import name`` formą.
Šie griežtai nurodyti reliatyvūs importavimai naudoją tašką, kuris nurodo
dabartinę arba tėvinę pakuotę. Pavyzdžiui, iš :mod:`surround` modulio jūs
galite naudoti::

   from . import echo
   from .. import formats
   from ..filters import equalizer

Atkreipsime dėmesį, kad tiek netiesiogiai tiek griežtai nurodyti
importavimai paremti dabartinio modulio vardu. Kadangi pagrindinio modulio
vardas visada yra ``"__main__"`` moduliai, kurie bus naudojami kaip
pagrindiniai Python'o programos moduliai turi naudoti absoliučius
importavimus.

Pakuotės Keliose Direktorijose
------------------------------

Pakuotės palaiko dar vieną specialų atributą --- :attr:`__path__`.  Šis
atributas inicializuojamas kaip sąrašas, kuriame yra aplankas, kuriame
yra pakuotės :file:`__init__.py` failas (prieš tai, kai kodas yra įvykdomas
tame faile). Šis kintamasis gali būti modifikuojamas ir tai paveiks
kaip atliekama modulių ir subpakuočių paieška pakuotėje.

Nors ši savybė nėra dažnai naudojama, ji gali būti panaudota norint
išplėsti modulių randamų pakuotėje aibę.

.. rubric:: Pastabos

.. [#] Funkcijų apibrėžtys irgi yra 'sakiniai', kurie yra 'vykdomi'; Vykdymas
   prideda funkcijos vardą į modulio globalią simbolių lentelę.
