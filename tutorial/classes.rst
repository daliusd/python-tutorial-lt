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

Method Objects
--------------

Usually, a method is called right after it is bound::

   x.f()

In the :class:`MyClass` example, this will return the string ``'hello world'``.
However, it is not necessary to call a method right away: ``x.f`` is a method
object, and can be stored away and called at a later time.  For example::

   xf = x.f
   while True:
       print xf()

will continue to print ``hello world`` until the end of time.

What exactly happens when a method is called?  You may have noticed that
``x.f()`` was called without an argument above, even though the function
definition for :meth:`f` specified an argument.  What happened to the argument?
Surely Python raises an exception when a function that requires an argument is
called without any --- even if the argument isn't actually used...

Actually, you may have guessed the answer: the special thing about methods is
that the object is passed as the first argument of the function.  In our
example, the call ``x.f()`` is exactly equivalent to ``MyClass.f(x)``.  In
general, calling a method with a list of *n* arguments is equivalent to calling
the corresponding function with an argument list that is created by inserting
the method's object before the first argument.

If you still don't understand how methods work, a look at the implementation can
perhaps clarify matters.  When an instance attribute is referenced that isn't a
data attribute, its class is searched.  If the name denotes a valid class
attribute that is a function object, a method object is created by packing
(pointers to) the instance object and the function object just found together in
an abstract object: this is the method object.  When the method object is called
with an argument list, it is unpacked again, a new argument list is constructed
from the instance object and the original argument list, and the function object
is called with this new argument list.


.. _tut-remarks:

Random Remarks
==============

.. These should perhaps be placed more carefully...

Data attributes override method attributes with the same name; to avoid
accidental name conflicts, which may cause hard-to-find bugs in large programs,
it is wise to use some kind of convention that minimizes the chance of
conflicts.  Possible conventions include capitalizing method names, prefixing
data attribute names with a small unique string (perhaps just an underscore), or
using verbs for methods and nouns for data attributes.

Data attributes may be referenced by methods as well as by ordinary users
("clients") of an object.  In other words, classes are not usable to implement
pure abstract data types.  In fact, nothing in Python makes it possible to
enforce data hiding --- it is all based upon convention.  (On the other hand,
the Python implementation, written in C, can completely hide implementation
details and control access to an object if necessary; this can be used by
extensions to Python written in C.)

Clients should use data attributes with care --- clients may mess up invariants
maintained by the methods by stamping on their data attributes.  Note that
clients may add data attributes of their own to an instance object without
affecting the validity of the methods, as long as name conflicts are avoided ---
again, a naming convention can save a lot of headaches here.

There is no shorthand for referencing data attributes (or other methods!) from
within methods.  I find that this actually increases the readability of methods:
there is no chance of confusing local variables and instance variables when
glancing through a method.

Often, the first argument of a method is called ``self``.  This is nothing more
than a convention: the name ``self`` has absolutely no special meaning to
Python.  (Note, however, that by not following the convention your code may be
less readable to other Python programmers, and it is also conceivable that a
*class browser* program might be written that relies upon such a convention.)

Any function object that is a class attribute defines a method for instances of
that class.  It is not necessary that the function definition is textually
enclosed in the class definition: assigning a function object to a local
variable in the class is also ok.  For example::

   # Function defined outside the class
   def f1(self, x, y):
       return min(x, x+y)

   class C:
       f = f1
       def g(self):
           return 'hello world'
       h = g

Now ``f``, ``g`` and ``h`` are all attributes of class :class:`C` that refer to
function objects, and consequently they are all methods of instances of
:class:`C` --- ``h`` being exactly equivalent to ``g``.  Note that this practice
usually only serves to confuse the reader of a program.

Methods may call other methods by using method attributes of the ``self``
argument::

   class Bag:
       def __init__(self):
           self.data = []
       def add(self, x):
           self.data.append(x)
       def addtwice(self, x):
           self.add(x)
           self.add(x)

Methods may reference global names in the same way as ordinary functions.  The
global scope associated with a method is the module containing the class
definition.  (The class itself is never used as a global scope!)  While one
rarely encounters a good reason for using global data in a method, there are
many legitimate uses of the global scope: for one thing, functions and modules
imported into the global scope can be used by methods, as well as functions and
classes defined in it.  Usually, the class containing the method is itself
defined in this global scope, and in the next section we'll find some good
reasons why a method would want to reference its own class!

Each value is an object, and therefore has a *class* (also called its *type*).
It is stored as ``object.__class__``.


.. _tut-inheritance:

Inheritance
===========

Of course, a language feature would not be worthy of the name "class" without
supporting inheritance.  The syntax for a derived class definition looks like
this::

   class DerivedClassName(BaseClassName):
       <statement-1>
       .
       .
       .
       <statement-N>

The name :class:`BaseClassName` must be defined in a scope containing the
derived class definition.  In place of a base class name, other arbitrary
expressions are also allowed.  This can be useful, for example, when the base
class is defined in another module::

   class DerivedClassName(modname.BaseClassName):

Execution of a derived class definition proceeds the same as for a base class.
When the class object is constructed, the base class is remembered.  This is
used for resolving attribute references: if a requested attribute is not found
in the class, the search proceeds to look in the base class.  This rule is
applied recursively if the base class itself is derived from some other class.

There's nothing special about instantiation of derived classes:
``DerivedClassName()`` creates a new instance of the class.  Method references
are resolved as follows: the corresponding class attribute is searched,
descending down the chain of base classes if necessary, and the method reference
is valid if this yields a function object.

Derived classes may override methods of their base classes.  Because methods
have no special privileges when calling other methods of the same object, a
method of a base class that calls another method defined in the same base class
may end up calling a method of a derived class that overrides it.  (For C++
programmers: all methods in Python are effectively ``virtual``.)

An overriding method in a derived class may in fact want to extend rather than
simply replace the base class method of the same name. There is a simple way to
call the base class method directly: just call ``BaseClassName.methodname(self,
arguments)``.  This is occasionally useful to clients as well.  (Note that this
only works if the base class is defined or imported directly in the global
scope.)

Python has two built-in functions that work with inheritance:

* Use :func:`isinstance` to check an object's type: ``isinstance(obj, int)``
  will be ``True`` only if ``obj.__class__`` is :class:`int` or some class
  derived from :class:`int`.

* Use :func:`issubclass` to check class inheritance: ``issubclass(bool, int)``
  is ``True`` since :class:`bool` is a subclass of :class:`int`.  However,
  ``issubclass(unicode, str)`` is ``False`` since :class:`unicode` is not a
  subclass of :class:`str` (they only share a common ancestor,
  :class:`basestring`).



.. _tut-multiple:

Multiple Inheritance
--------------------

Python supports a limited form of multiple inheritance as well.  A class
definition with multiple base classes looks like this::

   class DerivedClassName(Base1, Base2, Base3):
       <statement-1>
       .
       .
       .
       <statement-N>

For old-style classes, the only rule is depth-first, left-to-right.  Thus, if an
attribute is not found in :class:`DerivedClassName`, it is searched in
:class:`Base1`, then (recursively) in the base classes of :class:`Base1`, and
only if it is not found there, it is searched in :class:`Base2`, and so on.

(To some people breadth first --- searching :class:`Base2` and :class:`Base3`
before the base classes of :class:`Base1` --- looks more natural.  However, this
would require you to know whether a particular attribute of :class:`Base1` is
actually defined in :class:`Base1` or in one of its base classes before you can
figure out the consequences of a name conflict with an attribute of
:class:`Base2`.  The depth-first rule makes no differences between direct and
inherited attributes of :class:`Base1`.)

For :term:`new-style class`\es, the method resolution order changes dynamically
to support cooperative calls to :func:`super`.  This approach is known in some
other multiple-inheritance languages as call-next-method and is more powerful
than the super call found in single-inheritance languages.

With new-style classes, dynamic ordering is necessary because all  cases of
multiple inheritance exhibit one or more diamond relationships (where one at
least one of the parent classes can be accessed through multiple paths from the
bottommost class).  For example, all new-style classes inherit from
:class:`object`, so any case of multiple inheritance provides more than one path
to reach :class:`object`.  To keep the base classes from being accessed more
than once, the dynamic algorithm linearizes the search order in a way that
preserves the left-to-right ordering specified in each class, that calls each
parent only once, and that is monotonic (meaning that a class can be subclassed
without affecting the precedence order of its parents).  Taken together, these
properties make it possible to design reliable and extensible classes with
multiple inheritance.  For more detail, see
http://www.python.org/download/releases/2.3/mro/.


.. _tut-private:

Private Variables
=================

There is limited support for class-private identifiers.  Any identifier of the
form ``__spam`` (at least two leading underscores, at most one trailing
underscore) is textually replaced with ``_classname__spam``, where ``classname``
is the current class name with leading underscore(s) stripped.  This mangling is
done without regard to the syntactic position of the identifier, so it can be
used to define class-private instance and class variables, methods, variables
stored in globals, and even variables stored in instances. private to this class
on instances of *other* classes.  Truncation may occur when the mangled name
would be longer than 255 characters. Outside classes, or when the class name
consists of only underscores, no mangling occurs.

Name mangling is intended to give classes an easy way to define "private"
instance variables and methods, without having to worry about instance variables
defined by derived classes, or mucking with instance variables by code outside
the class.  Note that the mangling rules are designed mostly to avoid accidents;
it still is possible for a determined soul to access or modify a variable that
is considered private.  This can even be useful in special circumstances, such
as in the debugger, and that's one reason why this loophole is not closed.
(Buglet: derivation of a class with the same name as the base class makes use of
private variables of the base class possible.)

Notice that code passed to ``exec``, ``eval()`` or ``execfile()`` does not
consider the classname of the invoking  class to be the current class; this is
similar to the effect of the  ``global`` statement, the effect of which is
likewise restricted to  code that is byte-compiled together.  The same
restriction applies to ``getattr()``, ``setattr()`` and ``delattr()``, as well
as when referencing ``__dict__`` directly.


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

