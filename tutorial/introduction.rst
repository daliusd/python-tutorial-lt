.. _tut-informal:

*****************
Įvadas į Python'ą
*****************

Pavyzdžiuose, pateikiamuose toliau, įvedamas komandos bei jų išvestį galima
atskirti pagal tai, ar yra eilutė prasideda raginimu (``>>>`` ir ``...``).
Norėdami pakartoti pavyzdį savarankiškai, perrašykite viską, kas eina pavyzdyje
po raginimo. Eilutės, neprasidedančios raginimu, yra išvestis iš
interpretatoriaus. Turėkite omenyje, kad antrasis raginimo variantas (``...``) tuščiai
eilutei reiškia, jog jūs turėsite įvesti tuščią eilutę; taip užbaigiamos
komandos, kurios užima daugiau nei vieną eilutę.

Dauguma pavyzdžių, net ir tie, kurie prasideda raginimu, turi paaiškinamuosius
komentarus. Python'e komentarai pradedami simboliu ``#`` ir tęsiasi iki eilutės
pabaigos. Komentarai gali prasidėti eilutės pradžioje, taip pat po tarpų
arba po kodo, tačiau ne simbolių eilutės viduje. Simbolių eilutėje
tai tėra ``#`` simbolis, neatliekantis jokios papildomos funkcijos. Kadangi
komentarai paaiškina kodą, tačiau Python'as jų niekaip neinterpretuoja, atkartojant
pavyzdžius interaktyviame apvalkale, komentarus galima praleisti.

Pora pavyzdžių::

   # čia pirmasis komentaras
   SPAM = 1                 # o čia - antrasis komentaras
                            # ...ir trečiasis!
   STRING = "# Tai nėra komentaras."


.. _tut-calculator:

Python'as kaip skaičiuoklis
===========================

Pradėkime išbandydami porą paprastų Python'o komandų. Pasileiskite interpretatorių
ir luktelkite iki pasirodys raginimas ``>>>`` (neturėtų užtrukti).


.. _tut-numbers:

Skaičiai
--------

Interpretatorius veikia kaip paprastas skaičiuoklis -- jūs įvedate reiškinį,
o interpretatorius užrašo rezultatą. Reiškinių sintaksė paprasta: operatoriai
``+``, ``-``, ``*`` bei ``/`` veikia kaip ir daugumoje kitų kalbų
(tarkime, Paskalyje arba C). Grupavimui galima naudoti skliaustelius. Pavyzdžiui::

   >>> 2+2
   4
   >>> # Tai komentaras
   ... 2+2
   4
   >>> 2+2  # o čia - komentaras toje pačioje eilutėje, kaip ir kodas
   4
   >>> (50-5*6)/4
   5
   >>> # Sveikų skaičių dalyba apskaičiuoja sveiką dalį:
   ... 7/3
   2
   >>> 7/-3
   -3

Lygybės ženklas (``'='``) naudojamas priskirti reikšmę kintamajam. Atlikus
priskyrimą nėra parodomas joks rezultatas::

   >>> width = 20
   >>> height = 5*9
   >>> width * height
   900

Reikšmę galima priskirti iš karto keliems kintamiesiems::

   >>> x = y = z = 0  # Priskiriame nulį x, y ir z
   >>> x
   0
   >>> y
   0
   >>> z
   0

Kintamieji turi būti apibrėžti (jiems priskirta reikšmė) prieš naudojant.
Priešingu atveju įvyks klaida::

   >>> # pabandome gauti neapibrėžto kintamojo reikšmę
   ... n
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   NameError: name 'n' is not defined

Taip pat galima dirbti su slankaus kablelio skaičiais. Jeigu naudosime vieną
iš anksčiau aptartų operatorių su argumentais, kurių vienas -- sveikas skaičius,
o kitas -- slankaus kablelio skaičiais, tuomet rezultatas bus slankaus kablelio::

   >>> 3 * 3.75 / 1.5
   7.5
   >>> 7.0 / 2
   3.5

Be to, galima naudoti ir kompleksinius skaičius. Menamoji dalis aprašoma
naudojant galūnę ``j``` arba ``J``. Kompleksiniai skaičiai su nenuline realiąja
dalimi užrašomi kaip ``(realioji+menamojiJ)``, arba pasinaudojama
``complex(realioji, menamoji)`` funkcija.
::

   >>> 1j * 1J
   (-1+0j)
   >>> 1j * complex(0,1)
   (-1+0j)
   >>> 3+1j*3
   (3+3j)
   >>> (3+1j)*3
   (9+3j)
   >>> (1+2j)/(1+1j)
   (1.5+0.5j)

Kompleksiniai skaičiai visuomet aprašomi dviem slankaus kablelio skaičiais,
realiąja ir menamąja dalimi. Norėdami išskirti šias dalis iš kompleksinio
skaičiaus *z*, naudokite ``z.real`` (realiąjai daliai) ir ``z.imag``
(menamąjai daliai).  ::

   >>> a=1.5+0.5j
   >>> a.real
   1.5
   >>> a.imag
   0.5

Sveikų ir slankaus kablelio skaičių konvertavimo funkcijos (``float``,
``int`` ir ``long``) neveikia kompleksiniams skaičiams -- nes nėra vienaprasmio
būdo to atlikti. Naudodami ``abs(z)`` gausite kompleksinio skaičiaus modulį
(slankaus kablelio skaičiaus pavidalu). Jau minėtas ``z.real`` leis gauti
realiąją kompleksinio skaičiaus dalį. ::

   >>> a=3.0+4.0j
   >>> float(a)
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: can't convert complex to float; use abs(z)
   >>> a.real
   3.0
   >>> a.imag
   4.0
   >>> abs(a)  # sqrt(a.real**2 + a.imag**2)
   5.0
   >>>

Interaktyvioje veiksenoje, paskutinė atspausdinta reikšmė yra priskiriama
kintamajam ``_``. Tai reiškia, kad jums naudojant Python'ą kaip skaičiuoklį,
kai kuriuos skaičiavimus galima atlikti daug paprasčiau. ::

   >>> mokestis = 12.5 / 100
   >>> kaina = 100.50
   >>> kaina * mokestis
   12.5625
   >>> kaina + _
   113.0625
   >>> round(_, 2)
   113.06
   >>>

Su šiuo kintamuoju turėtų būti elgiamasi lyg jis būtų skirtas tik skaitymui.
Nepriskyrinėkite jam reikšmės --- taip sukurtumėte nesusijusį kintamąjį,
kurio vardas neleistų prieiti prie tikrojo magiško Python'o kintamojo.

.. _tut-strings:

Eilutės
-------

Python'as dirba ne tik su skaičiais, bet ir su simbolių eilutėmis, kurias
galima užrašyto pora būdų. Galima apsupti viengubomis arba dvigubomis
kabutėmis::

   >>> 'spam eggs'
   'spam eggs'
   >>> 'doesn\'t'
   "doesn't"
   >>> "doesn't"
   "doesn't"
   >>> '"Yes," he said.'
   '"Yes," he said.'
   >>> "\"Yes,\" he said."
   '"Yes," he said.'
   >>> '"Isn\'t," she said.'
   '"Isn\'t," she said.'

Simbolių eilutės gali aprėpti porą eilučių. Naudojant pasvirąjį brūkšnelį
eilutės gale galima nurodyti, kad toliau einanti eilutė yra šios tęsinys::

   >>> hello = "This is a rather long string containing\n\
   ... several lines of text just as you would do in C.\n\
   ...     Note that whitespace at the beginning of the line is\
   ... significant."
   >>> print hello

Turėkite omenyje, kad pasvirasis brūkšnelis sujungia gretimas eilutes
į vieną, todėl naujas eilutes reikia sudaryti naudojant ``\n``.
Ankstesnis pavyzdys ekrane atspausdintų::

   This is a rather long string containing
   several lines of text just as you would do in C.
       Note that whitespace at the beginning of the line is significant.

Kita vertus, jeigu eilutę pažymime kaip „neapdorojamą“ (angl. *raw*), tuomet ``\n``
nepradeda naujos eilutės. Neapdorojamose eilutėse pasvirieji brūkšneliai
taip pat praranda savo reikšmę (t.y. lieka pasviraisiais brūkšneliais),
tačiau skirstymas į eilutes nėra prarandamas -- lieka taip, kaip užrašyta:

   hello = r"This is a rather long string containing\n\
   several lines of text much as you would do in C."

   print hello

atspausdintų::

   This is a rather long string containing\n\
   several lines of text much as you would do in C.

Dar galima eilutes apgaubti poromis trigubų kabučių: ``"""``` arba ``'''``.
Eilučių pabaigų nereikia užrašyti specialiai, bus paliekamas toks skaidymas
į eilutes, kaip užrašyme. ::

   print """
   Usage: thingy [OPTIONS]
        -h                        Display this usage message
        -H hostname               Hostname to connect to
   """

ekrane išvestų::

   Usage: thingy [OPTIONS]
        -h                        Display this usage message
        -H hostname               Hostname to connect to

Interpretatorius atspausdina operacijų su eilutėmis rezultatus visiškai taip
pat, kaip eilutės ir įvedamos: apgaubia kabutėmis iš šonų, o viduje eilutės
esančios kabutės užrašomos pridedant pasvirąjį brūkšnelį. Jeigu eilutės
viduje yra vienguba kabutė, eilutė spausdinama apgaubta dvigubomis kabutėmis.
Kitais atvejais apgaubiama dvigubomis kabutėmis. (Komanda :keyword:`print`,
kurią aptarsime kiek vėliau, gali būti naudojama atspausdini eilutes be
apgaubiančių kabučių.)

Eilutės gali būti sujungtos (pridėtos viena prie kitos) naudojant ``+``
operatorių bei pakartotos keletą kartų su ``*`` operatoriumi::

   >>> word = 'Pagalb' + 'a'
   >>> word
   'Pagalba'
   >>> '<' + word*5 + '>'
   '<PagalbaPagalbaPagalbaPagalbaPagalba>'

Dvi eilutės, užrašytos viena po kitos, yra automatiškai sujungiamos. Taigi pirmąją
eilutę pavyzdyje galėjome užrašyti tiesiog kaip ``word = 'Pagalb' 'a'``; turėkite
omenyje, kad šitaip galima daryti tik su rankomis užrašytomis eilutėmis, o ne
su operacijų rezultatais::

   >>> 'str' 'ing'             #  <-  Taisyklinga
   'string'
   >>> 'str'.strip() + 'ing'   #  <-  Taisyklinga
   'string'
   >>> 'str'.strip() 'ing'     #  <-  Netaisyklinga
     File "<stdin>", line 1, in ?
       'str'.strip() 'ing'
                         ^
   SyntaxError: invalid syntax

Eilutės gali būti indeksuojamos; kaip ir C kalboje, pirmasis eilutės simbolis
atitinka indeksą 0. Python'o kalboje nėra atskiro tipo simboliams aprašyti; simbolis --
tai eilutė, kurios dydis -- vienas simbolis. Eilučių dalys gali būti nurodomos
su *išpjovos notacija* (angl. *slice notation*): du indeksai atskirti dvitaškiu. ::

   >>> word
   'Pagalba'
   >>> word[4]
   'l'
   >>> word[0:2]
   'Pa'
   >>> word[2:4]
   'ga'

Išpjovos indeksai gali būti nenurodyti; jeigu praleistas pirmasis indeksas, vietoje
jo naudojamas nulis, o praleistas antrasis indeksas tapatus eilutės ilgio nurodymui. ::

   >>> word[:2]    # Du pirmi simboliai
   'Pa'
   >>> word[2:]    # Viskas, kas eina po dviejų pirmų simbolių
   'galba'

Priešingai negu C kalboje, Python'o eilutės negali būti keičiamos. Bandant pakeisti
eilutės simbolį nurodant indeksą įvyksta klaida::

   >>> word[0] = 'x'
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: object doesn't support item assignment
   >>> word[:1] = 'Splat'
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   TypeError: object doesn't support slice assignment

Tačiau naujų eilučių sukūrimas sudedant turimas yra paprastas ir efektyvus::

   >>> 't' + word[1:]
   'tagalba'
   >>> 'Kav' + word[1]
   'Kava'

Naudinga išpjovų operacijų savybė: ``s[:i] + s[i:]`` visuomet lygu ``s``.
::

   >>> word[:2] + word[2:]
   'Pagalba'
   >>> word[:3] + word[3:]
   'Pagalba'

Išeinantys iš ribų indeksai yra tvarkingai apdorojami. Per didelis indeksas 
pakeičiamas eilutės ilgiu. Jeigu išpjovos pradžios indeksas didesnis už
pabaigos indeksą, gausime tuščią eilutę. ::

   >>> word[1:100]
   'Pagalba'
   >>> word[10:]
   ''
   >>> word[2:1]
   ''

Kaip indeksus galima naudoti ir neigiamus skaičius, tokiu atveju skaičiuojama
nuo dešinės. Pavyzdžiui,::

   >>> word[-1]     # Paskutinis simbolis
   'a'
   >>> word[-2]     # Priešpaskutinis simbolis
   'b'
   >>> word[-2:]    # Du paskutiniai simboliai
   'ba'
   >>> word[:-2]    # Viskas iki dviejų paskutinių simbolių
   'Pagal'

Pastebėkite, kad -0 iš tiesų yra tas pats kaip ir 0, todėl šiuo atveju nuo
dešinės nėra skaičiuojama. ::

   >>> word[-0]     # (nes -0 lygu 0)
   'P'

Išeinantys iš ribų neigiami indeksai yra apkarpomi, tačiau tai galioja
tik išpjovoms::

   >>> word[-100:]
   'Pagalba'
   >>> word[-10]    # klaida
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   IndexError: string index out of range

Bus lengviau atsiminti, kaip veikia išpjovos, jeigu galvosite apie indeksus
kaip apie rodykles *tarp* simbolių, o eilutės kraštą prieš pirmą simbolį kaip
turintį nulinį indeksą. Tuomet eilutės, sudarytos iš *n* simbolių, dešinys
kraštas turės indeksą *n*. ::

    +---+---+---+---+---+---+---+
    | P | a | g | a | l | b | a |
    +---+---+---+---+---+---+---+
    0   1   2   3   4   5   6   7
   -7  -6  -5  -4  -3  -2  -1

Pirma skaičių eilutė parodo indeksų 0..7 vietas simbolių eilutėje. Antroji
eilutė -- atitinkamai atvaizduoja neigiamus indeksus. Tada išpjova nuo *i*
iki *j* susideda iš visų simbolių, esančių tarp *i* ir *j*.

Neneigiamiems indeksams, išpjovos ilgis yra indeksų skirtumas (jeigu abu
indeksai yra eilutės ribose). Tarkime, išpjovos ``word[1:3]`` ilgis yra
2.

Standartinė funkcija :func:`len` grąžina eilutės ilgį.

   >>> s = 'supercalifragilisticexpialidocious'
   >>> len(s)
   34


.. seealso::

   :ref:`typesseq`
      Simbolių eilutės, o taip pat ir Unikodo eilutės, aprašomos tolesniame
      skyrelyje, yra *sekų tipai*, todėl leidžia naudoti visiems sekų tipams
      apibrėžtas operacijas.

   :ref:`string-methods`
      Ir paprastos eilutės, ir Unikodo eilutės pateikia daug metodų nesudėtingoms
      teksto transformacijoms bei teksto paieškai.

   :ref:`new-string-formatting`
      Čia aprašoma, kaip suformuoti eilutes su :meth:`str.format` metodu.

   :ref:`string-formatting`
      Čia detaliau aprašoma, kaip suformuoti eilutes naudojant senesnį metodą --
      paprastoms arba Unikodo eilutėms kviečiamą ``%`` operatorių.


.. _tut-unicodestrings:

Unikodo eilutės
---------------

.. sectionauthor:: Marc-Andre Lemburg <mal@lemburg.com>

Pradedant Python'o versija 2.0 programuotojams pateikiamas naujas duomenų tipas,
skirtas tekstinių duomenų saugojimui: Unikodo objektai. Jis gali būti naudojamas
saugoti bei operuoti Unikodu paremtais duomenimis (daugiau informacijos
rasite http://lt.wikipedia.org/wiki/Unikodas bei http://www.unicode.org).
Šis duomenų tipas taip pat gerai integruojasi su paprastomis simbolių
eilutėmis; esant poreikiui tipų pakeitimas atliekamas automatiškai.

Didelis Unikodo pranašumas yra tai, kad šis standartas aprašo visus ženklus,
naudojamus bet kuriame dabarties bei senovės tekste. Prieš Unikodą
būdavo apsiribojama 256-ių rašto ženklų lentelėmis. Tekstai būdavo
susiejami su šiomis lentelėmis, kurios aprašydavo skaičių ir rašto ženklų
sąryšį. Tai sukurdavo labai daug maišaties, ypač ten, kur tai susiję
su programinės įrangos daugiakalbyste. Unikodas šias problemas išsprendžia
pristatydamas vientisą kodų lentelę, kurią galima naudoti visoms rašto
sistemoms.

Unikodo eilučių sukūrimas Python'e yra ne ką sudėtingesnis negu paprastų
eilučių::

   >>> u'Labas, pasauli!'
   u'Labas, pasauli!'

Mažoji ``'u'`` prieš kabutę nurodo, kad aprašome Unikodo eilutę. Jeigu
norite eilutėje naudoti specialius simbolius, galite tai padaryti naudodami
specialią Python'o sintaksę. ::

   >>> u'Sveikas,\u0020pasauli!'
   u'Sveikas, pasauli!'

Čia užrašyta seka ``\u0020`` reiškia Unikodo simbolio, kurio kodas 0x0020
(o tai yra tarpo simbolis), įterpimą eilutėje.

Visi kiti simboliai interpretuojami pagal tai, kokį Unikodo kodą jie
atitinka. Jeigu jūs užrašote eilutes naudodami Latin-1 koduotę (turinčią
daugumai vakarų Europos kalbų skirtų simbolių), tikrai įvertinsite tai,
kad pirmi 256 Unikodo rašmenys sutampa su Latin-1 kodų lentele.

Ypatingiems poreikiams galima naudoti neapdorojamas (angl. *raw*) eilutes --
visai taip pat, kaip ir paprastų eilučių atveju. Norėdami tokias 
eilutes įvesti, prieš atidarančią kabutę parašykite 'ur'. Tuomet ``\uXXXX``
užrašymas bus apdorojamas tik tuomet, kai pasvirųjų brūkšnelių skaičius
prieš 'u' yra nelyginis. ::

   >>> ur'Sveikas,\u0020pasauli!'
   u'Sveikas, pasauli!'
   >>> ur'Sveikas,\\u0020pasauli!'
   u'Sveikas,\\\\u0020pasauli!'

Šis režimas naudingas tada, kai reikia įvesti daug pasvirųjų brūkšnelių,
pavyzdžiui reguliariuosius reiškinius (angl. *regular expression*).

Be šių užrašymo būdų, Python'as pateikia ir daugiau būdų Unikodo eilutėms sukurti
tuomet, kai žinoma teksto koduotė.

.. index:: builtin: unicode

Standartinė funkcija :func:`unicode` moka iškoduoti ir užkoduoti daug tekstų
koduočių. Keletas žinomesnių yra *Latin-1*, *ASCII*, *UTF-8*, ir *UTF-16*.
Dvi paskutinės koduotės yra vadinamos *kintamo ilgio koduotėmis*, kadangi
naudojant šias koduotes vienas Unikodo simbolis gali būti paverčiamas vienu
arba daugiau baitų. Pagal nutylėjimą dažniausiai naudojama ASCII koduotė,
kuri turi 127 simbolius, atitinkančius pirmus 127 Unikodo simbolius. Ši
koduotė atmes visus kitus simbolius, pranešdama apie klaidą. Spausdinant
Unikodo eilutę ekrane arba faile, naudojama funkcija :func:`str`, kuri
konvertuoja eilutę naudodama numatytąją teksto koduotę. ::

   >>> u"abc"
   u'abc'
   >>> str(u"abc")
   'abc'
   >>> u"äöü"
   u'\xe4\xf6\xfc'
   >>> str(u"äöü")
   Traceback (most recent call last):
     File "<stdin>", line 1, in ?
   UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-2: ordinal not in range(128)

Galite paversti Unikodo eilutę į 8 bitų simbolių eilutę nurodydami norimą
teksto koduotę su :func:`encode` metodu, kuriam būtinas vienas parametras --
koduotės pavadinimas. Teksto koduočių vardus rekomenduojama užrašyti
mažosiomis raidėmis. ::

   >>> u"äöü".encode('utf-8')
   '\xc3\xa4\xc3\xb6\xc3\xbc'

Jeigu jūs turite duomenis žinomoje teksto koduotėje ir norite iš jų gauti
Unikodo eilutę, galite naudoti :func:`unicode` funkciją, kartu nurodydami
koduotės pavadinimą. ::

   >>> unicode('\xc3\xa4\xc3\xb6\xc3\xbc', 'utf-8')
   u'\xe4\xf6\xfc'


.. _tut-lists:

Sąrašai
-------

Python'as pateikia daug *sudėtinių* duomenų tipų, naudojamų apjungti kitas reikšmes.
Lanksčiausias iš tokių tipų yra *sąrašas*, kuris aprašomas kaip laužtiniais
skliaustais apgaubtas sąrašas kableliais atskirtų elementų. Sąrašo elementai
neprivalo visi būti to paties tipo. ::

   >>> a = ['spam', 'eggs', 100, 1234]
   >>> a
   ['spam', 'eggs', 100, 1234]

Kaip ir simbolių eilučių indeksai, sąrašų indeksai prasideda nuo 0, sąrašai gali
būti išpjauti, sujungti ir taip toliau::

   >>> a[0]
   'spam'
   >>> a[3]
   1234
   >>> a[-2]
   100
   >>> a[1:-1]
   ['eggs', 100]
   >>> a[:2] + ['bacon', 2*2]
   ['spam', 'eggs', 'bacon', 4]
   >>> 3*a[:3] + ['Boo!']
   ['spam', 'eggs', 100, 'spam', 'eggs', 100, 'spam', 'eggs', 100, 'Boo!']

Priešingai negu simbolių eilutės, kurios yra nekintamos, sąrašo elementus galima
pakeisti::

   >>> a
   ['spam', 'eggs', 100, 1234]
   >>> a[2] = a[2] + 23
   >>> a
   ['spam', 'eggs', 123, 1234]

Išpjovoms (angl. *slice*) taip pat galima priskirti reikšmes, net jeigu tai pakeičia
sąrašo dydį arba jį ištuština::

   >>> # Pakeiskime porą elementų:
   ... a[0:2] = [1, 12]
   >>> a
   [1, 12, 123, 1234]
   >>> # Panaikinkime keletą:
   ... a[0:2] = []
   >>> a
   [123, 1234]
   >>> # Įterpkime:
   ... a[1:1] = ['bletch', 'xyzzy']
   >>> a
   [123, 'bletch', 'xyzzy', 1234]
   >>> # Įterpkime sąrašo kopiją į paties pradžią
   >>> a[:0] = a
   >>> a
   [123, 'bletch', 'xyzzy', 1234, 123, 'bletch', 'xyzzy', 1234]
   >>> # Ištuštinkime sąrašą: pakeiskime visus elementus tuščiu sąrašu
   >>> a[:] = []
   >>> a
   []

Standartinė funkcija :func:`len` tinka ir sąrašams::

   >>> a = ['a', 'b', 'c', 'd']
   >>> len(a)
   4

Galima sąrašus sudėti į sąrašus (sukurti sąrašus, kurių elementai yra
kiti sąrašai), pavyzdžiui::

   >>> q = [2, 3]
   >>> p = [1, q, 4]
   >>> len(p)
   3
   >>> p[1]
   [2, 3]
   >>> p[1][0]
   2
   >>> p[1].append('xtra')     # Žiūrėkite skyrių 5.1
   >>> p
   [1, [2, 3, 'xtra'], 4]
   >>> q
   [2, 3, 'xtra']

Turėkite omenyje, kad paskutiniame pavyzdyje ``p[1]`` ir ``q`` iš tiesų
nurodo tą patį objektą! *Objektų semantiką* aptarsime vėliau.


.. _tut-firststeps:

Pirmieji žingsniai link programavimo
====================================

Be abejonės, Python'as gali būti naudojamas daug sudėtingesniems darbams negu
apskaičiuoti du plius du. Pavyzdžiui, galime apskaičiuoti pradinius *Fibonačio*
sekos narius::

   >>> # Fibonačio seka:
   ... # dviejų narių suma apibrėžia tolesnį narį
   ... a, b = 0, 1
   >>> while b < 10:
   ...     print b
   ...     a, b = b, a+b
   ...
   1
   1
   2
   3
   5
   8

Šis pavyzdys pristatė porą naujų dalykų.

* Pirmoje eilutėje naudojamas *priskyrimas keliems kintamiesiems*: kintamieji
  ``a`` ir ``b`` tuo pat metu įgauna reikšmes; atitinkamai 0 ir 1. Panašus
  priskyrimas naudojamas ir paskutinėje eilutėje, kas parodo, kad visos dešinės
  priskyrimo pusės išraiškos apskaičiuojamos anksčiau nei atliekamas bet koks
  priskyrimas.  Dešinės pusės apskaičiavimas atliekamas iš kairės į dešinę.

* Ciklo konstrukcija :keyword:`while` vykdoma tol, kol sąlyga yra teisinga
  (šiuo atveju: ``b < 10``). Python'e, panašiai kaip ir C, bet kuris nelygus
  nuliui skaičius laikomas *teisingu*; nulis yra *klaidingas*. Sąlyga taip
  taip pat gali būti eilutės arba sąrašo reikšmė, arba apibendrinant: bet
  kokia seka. Tuščia seka yra *klaidinga*; netuščia (turinti bent vieną
  elementą) yra *teisinga*. Pavyzdyje naudojama sąlyga yra paprastas palyginimas.
  Standartiniai palyginimo operatoriai užrašomi kaip ir C kalboje: ``<``
  (mažiau negu), ``>`` (daugiau negu), ``==`` (lygu), ``<=`` (mažiau arba lygu),
  ``>=`` (daugiau arba lygu) bei ``!=`` (nelygu).

* Vidinis ciklo kodas yra *įtrauktas* -- tai Python'o būdas sugrupuoti kodo sakinius.
  Python'as nesuteikia (kol kas) gudraus eilutės redagavimo galimybės, taigi tarpus
  arba tabuliacijos ženklus reikia eilutės pradžioje įterpti rankomis. Praktikoje,
  visgi, dauguma tekstų redaktorių, naudojamų rašyti Python'o kodą, pateikia
  galimybę automatiškai lygiuoti kodą. Kai sudėtinis kodo sakinys įvedamas
  interaktyvioje veiksenoje, po jo turi sekti tuščia eilutė tam, kad Python'as
  suprastų, jog jūs užrašėte paskutinę eilutę. Taip pat turėkite omenyje, kad
  visos to paties kodo bloko eilutės privalo būti įtrauktos vienodu skaičiumi
  tarpo ženklų.

* :keyword:`print` komanda atspausdina duotos išraiškos reikšmę. Tai skiriasi nuo
  paprasčiausio išraiškos užrašymo prie Python'o raginimo tuo, kad :keyword:`print`
  gali atspausdinti daugiau negu vieną reikšmę. Taip pat ji spausdina eilutes
  be kabučių ženklų, o pateikus daugiau negu vieną išraišką, spausdinant tarp
  jų įterpiami tarpo simboliai::

     >>> i = 256*256
     >>> print 'The value of i is', i
     The value of i is 65536

  Gale parašytas kablelis nurodo atspausdinus reikšmes nepradėti naujos eilutės::

     >>> a, b = 0, 1
     >>> while b < 1000:
     ...     print b,
     ...     a, b = b, a+b
     ...
     1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987

  Tačiau interpretatorius įterps naują eilutę prieš pateikdamas raginimą, jei
  ankstesnė eilutė nebuvo užbaigta.
