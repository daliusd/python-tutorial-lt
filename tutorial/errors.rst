.. _tut-errors:

******************
Klaidos ir išimtys
******************

Iki šiol klaidų pranešimai buvo tik minimi, bet jeigu jūs bandėte
vykdyti pavyzdžius jūs tikriausiai kelias matėte. Egzistuoja
mažiausiai dvi skirtingos klaidų rūšys: *sintaksės klaidos* ir *išimtys*.

.. _tut-syntaxerrors:

Sintaksės klaidos
=================

Sintaksės klaidos taip pat žinomos kaip teksto analizės
klaidos, yra turbūt dažniausiai pasitaikanti klaidų rūšis, kol
jūs dar mokotės Python'o::


   >>> while True print 'Sveikas pasauli'
     File "<stdin>", line 1, in ?
       while True print 'Sveikas pasauli'
                      ^
   SyntaxError: invalid syntax

Teksto analizatorius pakartoja eilutę su klaida ir parodo mažą 'rodyklę',
kur pirmiausiai buvo surasta klaida. Klaida yra sukelta ar bent jau
nustatyta ties komanda, kuri yra aprašyta prieš rodyklę. Pavyzdyje
klaida rasta bazinio žodžio :keyword:`print` naudojime, nes prieš jį
trūksta dvitaškio (``':'``). Failo vardas ir eilutės numeris
yra atspausdinami, kad jūs žinotumėte, kur žiūrėti, jei klaida
įvyko vykdant skriptą.

.. _tut-exceptions:

Išimtys
=======

Net jei sakinys ar reiškinys yra sintaksiškai teisingi, tai gali sukelti
klaidą, kai juos bandoma įvykdyti. Klaidos, kurios nustatomos vykdymo
metu yra vadinamos *išimtimis* ir yra besąlygiškai neišvengiamos: jūs
netrukus išmoksite kaip jas suvaldyti Python'o programose. Tačiau dauguma
išimčių nėra suvaldomos programoje ir baigiasi klaidos pranešimu
kaip parodyta čia::

   >>> 10 * (1/0)
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   ZeroDivisionError: integer division or modulo by zero
   >>> 4 + spam*3
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   NameError: name 'spam' is not defined
   >>> '2' + 2
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: cannot concatenate 'str' and 'int' objects

Paskutinė klaidos pranešimo eilutė nurodo, kas įvyko. Išimtys būna
skirtingų tipų ir tipas parašomas kaip dalis pranešimo. Pavyzdyje
tipai yra :exc:`ZeroDivisionError`, :exc:`NameError` ir :exc:`TypeError`.
Eilutė, kuri parašyta kaip išimties tipas, yra įtaisytos išimties,
kuri įvyko, vardas. Tai galioja visoms įtaisytoms išimtims, bet
nebūtinai tiesa vartotojo apibrėžtoms išimtims (nors tai ir yra
naudingas susitarimas). Standartinių išimčių vardai yra
įtaisyti identifikatoriai (ne rezervuoti baziniai žodžiai).

Likusi eilutės dalis pateikia detalią informaciją priklausomai nuo
išimties tipo ir kas sukėlė išimtį.

Priešais einanti klaidos pranešimo dalis parodo kontekstą, kuriame įvyko
išimtis dėklo pėdsakų (ang. traceback) forma. Bendrai jame yra dėklo
pėdsakai nurodantys kodo eilutes, tačiau eilutės perskaitytos iš
standartinės įvesties.

.. _tut-handling:

Išimčių Valdymas
================

Programą galima parašyti taip, kad ji suvaldytų pasirinktas išimtis. Pažiūrėkime
į žemiau esantį pavyzdį, kuris prašo vartotoją įvesti teisingą skaičių tol kol
jis yra įvedamas, bet taip pat leidžia vartotojui nutraukti programą
(naudojant :kbd:`Control-C` ar bet kokį kitą būdą, kurį palaiko operacinė sistema).
Pastebėsime, kad vartotojo sugeneruotas nutraukimas yra signalizuojamas sukeliant
:exc:`KeyboardInterrupt` išimtį::

   >>> while True:
   ...     try:
   ...         x = int(raw_input("Please enter a number: "))
   ...         break
   ...     except ValueError:
   ...         print "Oops!  That was no valid number.  Try again..."
   ...

:keyword:`try` sakinys dirba taip:

* Pirmiausia, vykdomas *try paragrafas* (tarp :keyword:`try` ir :keyword:`except` bazinių žodžių)

* Jei išimtis neįvyksta, *except paragrafas* yra praleidžiamas ir
  :keyword:`try` sakinys yra baigiamas.

* Jei išimtis įvyksta *try* vykdymo metu, likusi paragrafo dalis yra praleidžiama.
  Jeigu išimties tipas sutampa su vardu po
  :keyword:`except` bazinio žodžio, tada except paragrafas yra įvykdomas ir
  tada vykdymas tęsiamas po :keyword:`try` sakinio.

* Jei įvyksta išimtis, kuri nesutampa su išimtimi paminėtoje except
  paragrafe, ji perduodama išoriniam :keyword:`try` sakiniui. Jeigu
  nesurandama, kas suvaldytų išimtį, ji tampa *nesuvaldyta išimtimi*,
  vykdymas yra sustabdomas ir parodomas klaidos pranešimas kaip parodyta
  aukščiau.

:keyword:`try` sakinys gali turėti daugiau negu vieną except paragrafą, jei
norima suvaldyti skirtingas išimtis. Daugiausiai bus įvykdytas vienas
paragrafas. *except* dalyje suvaldomos tik išimtys, kurios ateina iš
try paragrafo, bet ne iš kitų to paties :keyword:`try` sakinio except dalių.
Except paragrafe galima išvardinti kelias išimtis kortežo formoje,
pavyzdžiui::

   ... except (RuntimeError, TypeError, NameError):
   ...     pass

Paskutiniame except paragrafe galima praleisti išimties vardą ir tai
bus interpretuojama kaip bet kokia išimtis. Naudokite šią galimybę
ypač atsargiai, nes taip galima paslėpti tikras programavimo
klaidas! Tai taip pat galima naudoti klaidos pranešimo
atspausdinimui ir tada vėl sukelti išimtį (taip leidžiant
kvietėjui suvaldyti išimtį taip pat)::

   import sys

   try:
       f = open('myfile.txt')
       s = f.readline()
       i = int(s.strip())
   except IOError as (errno, strerror):
       print "I/O error({0}): {1}".format(errno, strerror)
   except ValueError:
       print "Could not convert data to an integer."
   except:
       print "Unexpected error:", sys.exc_info()[0]
       raise

:keyword:`try` ... :keyword:`except` sakinys turi papildomą *else
paragrafą*, kuris, jam esant, turi sekti po visų except paragrafų.
Jis naudingas tuo atveju, jei try paragrafas nesukelia išimties.
Pavyzdžiui::

   for arg in sys.argv[1:]:
       try:
           f = open(arg, 'r')
       except IOError:
           print 'cannot open', arg
       else:
           print arg, 'has', len(f.readlines()), 'lines'
           f.close()

:keyword:`else` naudojimas yra geresnis variantas negu papildomo kodo
rašymas the :keyword:`try` paragrafe, kadangi tai padeda išvengti
atsitiktinio išimties pagavimo, kuri nebuvo sukelta kodo, kuris
yra apsaugotas :keyword:`try` ... :keyword:`except` sakiniu.

Kai įvyksta išimtis, ji gali turėti susietą reikšmę, taip pat žinomą kaip
išimties *argumentas*. Argumento egzistavimas ir tipas priklauso nuo
išimties tipo.

Išimties sakinys gali nurodyti kintamąjį po išimties vardo (arba kortežo).
Kintamasis yra susietas su išimties egzemplioriumi per kintamąjį
padėtą į ``instance.args``.  Patogumo dėlei, išimties egzempliorius
apibrėžia :meth:`__getitem__` ir :meth:`__str__` tam, kad argumentus
būtų galima pasiekti arba atspausdinti tiesiogiai nesikreipiant į
``.args``.

Be to ``.args`` naudojimas yra nerekomenduotinas. Vietoje to, rekomenduojama
perduoti vieną argumentą išimčiai (kas gali būti kortežas, jeigu reikia
perduoti kelis argumentus) ir susieti jį su ``message`` atributu.
Taip pat galima inicializuoti išimtį prieš ją sukeliant ir pridėti bet kokius
norimus atributus::

   >>> try:
   ...    raise Exception('spam', 'eggs')
   ... except Exception as inst:
   ...    print type(inst)     # the exception instance
   ...    print inst.args      # arguments stored in .args
   ...    print inst           # __str__ allows args to printed directly
   ...    x, y = inst          # __getitem__ allows args to be unpacked directly
   ...    print 'x =', x
   ...    print 'y =', y
   ...
   <type 'exceptions.Exception'>
   ('spam', 'eggs')
   ('spam', 'eggs')
   x = spam
   y = eggs

Jei išimtis turi argumentą, jis yra atspausdinamas kaip paskutinė
pranešimo dalis nesuvaldytai išimčiai.

Išimtys yra suvaldomos ne tik tada, kai jos iškart seka try paragrafe, bet taip
pat jeigu jos įvyksta funkcijos viduje, kuri yra iškviesta try paragrafe.
Pavyzdžiui::

   >>> def this_fails():
   ...     x = 1/0
   ...
   >>> try:
   ...     this_fails()
   ... except ZeroDivisionError as detail:
   ...     print 'Handling run-time error:', detail
   ...
   Handling run-time error: integer division or modulo by zero


.. _tut-raising:

Išimčių Sukėlimas
=================

:keyword:`raise` sakinys leidžia programuotojui sukelti norimą išimtį.
Pavyzdžiui::

   >>> raise NameError, 'HiThere'
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   NameError: HiThere

Pirmas :keyword:`raise` argumentas yra išimties, kurią norima sukelti, vardas.
Papildomas antrasis argumentas nurodo išimties argumentą. Alternatyviai
tą patį galima parašyti kaip ``raise NameError('HiThere')``.  Abi
formos dirba gerai, bet atrodo, kad žmonėms pastaroji forma patinka labiau.

Jeigu jums tik reikia sužinoti ar išimtis buvo sukelta bet jūs nenorite
jos suvaldyti, paprastesne :keyword:`raise` sakinio forma leidžia
vėl sukelti išimtį::

   >>> try:
   ...     raise NameError, 'HiThere'
   ... except NameError:
   ...     print 'An exception flew by!'
   ...     raise
   ...
   An exception flew by!
   Traceback (most recent call last):
     File "<stdin>", line 2, in ?
   NameError: HiThere


.. _tut-userexceptions:

Vartotojų apibrėžtos Išimtys
============================

Programos gali sukurti savo išimtis sukurdamos naujas išimčių klases.
Išimtys įprastai turėtų būti paveldėtos iš :exc:`Exception` klasės (tiesiogiai
ar netiesiogiai). Pavyzdžiui::

   >>> class MyError(Exception):
   ...     def __init__(self, value):
   ...         self.value = value
   ...     def __str__(self):
   ...         return repr(self.value)
   ...
   >>> try:
   ...     raise MyError(2*2)
   ... except MyError as e:
   ...     print 'My exception occurred, value:', e.value
   ...
   My exception occurred, value: 4
   >>> raise MyError, 'oops!'
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   __main__.MyError: 'oops!'

Šiame pavyzdyje numatytasis :class:`Exception` klasės metodas :meth:`__init__`
buvo perrašytas. Naujas elgesys paprasčiausiai sukuria *value* atributą.
Tai pakeičia įprasta *args* atributo sukūrimą.

Išimčių klasės gali apibrėžti bet ką, ką daro kitos klasės, bet dažniausiai
būną paprastos, dažniausiai leidžiančios tik daugiau atributų saugoti
informacijai apie klaidą. Kai kuriamas modulis, kuris gali sukelti kelias
skirtingas išimtis, dažna praktika yra sukurti bazinę klasę išimtims
apibrėžtoms tame modulyje ir tada kitas išimčių klases paveldėti
iš tos klasės::

   class Error(Exception):
       """Base class for exceptions in this module."""
       pass

   class InputError(Error):
       """Exception raised for errors in the input.

       Attributes:
           expression -- input expression in which the error occurred
           message -- explanation of the error
       """

       def __init__(self, expression, message):
           self.expression = expression
           self.message = message

   class TransitionError(Error):
       """Raised when an operation attempts a state transition that's not
       allowed.

       Attributes:
           previous -- state at beginning of transition
           next -- attempted new state
           message -- explanation of why the specific transition is not allowed
       """

       def __init__(self, previous, next, message):
           self.previous = previous
           self.next = next
           self.message = message

Dauguma išimčių pavadinimas baigiasi "Error", taip kaip ir standartinės
išimtys.

Dauguma standartinių modulių apibrėžia savo išimtis klaidų, kurios
gali įvykti modulyje apibrėžtose funkcijose, pranešimui. Daugiau
informacijos apie klases galima rasti skyriuje :ref:`tut-classes`.

.. _tut-cleanup:

Išvalymo Apibrėžimas
====================

:keyword:`try` sakinys turi dar vieną papildomą paragrafą,
kuris yra skirtas išvalymui ir yra įvykdomas bet kokiomis
sąlygomis. Pavyzdžiui::

   >>> try:
   ...     raise KeyboardInterrupt
   ... finally:
   ...     print 'Goodbye, world!'
   ...
   Goodbye, world!
   Traceback (most recent call last):
     File "<stdin>", line 2, in ?
   KeyboardInterrupt

*finally paragrafas* yra vykdomas visada prieš paliekant :keyword:`try`
sakinį, nepaisant to ar išimtys įvyko ar ne. Jeigu išimtis
įvyko :keyword:`try` paragrafe ir nebuvo suvaldyta nei :keyword:`except`
paragrafe (arba jei ji įvyko :keyword:`except` arba :keyword:`else` paragrafuose),
ji yra vėl sukeliama po :keyword:`finally` paragrafo įvykdymo.
:keyword:`finally` paragrafas yra vykdomas ir tuo atveju, jei kitas
:keyword:`try` sakinio paragrafas yra paliekamas įvykdžius :keyword:`break`,
:keyword:`continue` ar :keyword:`return` sakinį.  Šiek tiek
sudėtingesnis pavyzdys (:keyword:`except` ir :keyword:`finally` paragrafai
tame pačiame :keyword:`try` sakinyje dirba nuo Python 2.5 versijos)::

   >>> def divide(x, y):
   ...     try:
   ...         result = x / y
   ...     except ZeroDivisionError:
   ...         print "division by zero!"
   ...     else:
   ...         print "result is", result
   ...     finally:
   ...         print "executing finally clause"
   ...
   >>> divide(2, 1)
   result is 2
   executing finally clause
   >>> divide(2, 0)
   division by zero!
   executing finally clause
   >>> divide("2", "1")
   executing finally clause
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
     File "<stdin>", line 3, in divide
   TypeError: unsupported operand type(s) for /: 'str' and 'str'

Kaip matote :keyword:`finally` paragrafas yra įvykdomas bet kokiu atveju.
:exc:`TypeError` sukelta dalinant dvi eilutes nėra suvaldoma :keyword:`except`
paragrafe todėl vėl sukeliama po to kai :keyword:`finally` paragrafas
baigia savo darbą.

Realiame pasaulyje, :keyword:`finally` paragrafas praverčia atlaisvinant
išorinius resursus (failai ar tinklo jungtys), nepaisant to ar
resursų panaudojimas buvo sėkmingas ar ne.


.. _tut-cleanup-with:

Numatytas Išvalymas
===================

Kai kurie objektai apibrėžia standartinius išvalymo veiksmus tam atvejui
kai paimtas objektas yra nebereikalingas --- nesvarbu ar operacija,
kuri naudoja tą objektą pavyko ar baigėsi nesėkme. Pažiūrėkime į
sekantį pavyzdį, kuriame bandoma atidaryti failą ir atspausdinti jo
turinį į ekraną::

   for line in open("myfile.txt"):
       print line

Šio kodo problema yra ta, kad failas yra paliekamas atidarytas neapibrėžtam
laiko tarpui po to, kai kodas baigia vykdymą. Tai nėra problema paprastame
skripte, bet gali būti problema didelėje programoje. :keyword:`with` sakinys
leidžia objektus naudoti taip, kad jie visada teisingai ir laiku būtų
išvalyti::

   with open("myfile.txt") as f:
       for line in f:
           print line

Po sakinio vykdymo, failas *f* yra visada uždaromas, netgi jei kilo kažkokių
problemų skaitant eilutes. Jei objektai turi numatytą išvalymą, tai būna
paminėta dokumentacijoje.
