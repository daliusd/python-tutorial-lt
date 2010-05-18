.. _tut-using:

***************************************
Naudojimasis Python'o interpretatoriumi
***************************************


.. _tut-invoking:

Interpretatoriaus paleidimas
============================

Python'o interpretatorius dažniausiai instaliuojamas į :file:`/usr/local/bin/python`;
pridėję :file:`/usr/local/bin` į savo Unix apvalkalo (angl. *shell*) paieškos kelią,
galėsite Python'ą paleisti įrašę komandą::

   python

Kadangi direktorija, kurioje „gyvena“ interpretatorius, yra pasirenkama
diegimo metu, aukščiau minėtas kelias nebūtinai yra teisingas;
pasitikslinkite detales su savo administratoriumi (pvz.:
:file:`/usr/local/python` yra populiari alternatyva).

Windows sistemose, Python'as įdiegiamas kataloge :file:`C:\\Python26`, tačiau
šis nustatymas gali būti pakeistas instaliacijos metu. Norėdami pridėti
šią direktoriją į paieškos kelią, galite įrašyti tokią komandą į DOS
terminalą::

   set path=%path%;C:\python26

Įrašę bylos pabaigos simbolį (:kbd:`Control-D` Unix sistemose, :kbd:`Control-Z`
Windows) Python'o komandinėje eilutėje išjungsite interpretatorių. Jei tai
nesuveikia, galite išjungti interpretatorių surinkę : ``import sys; sys.exit()``.

Teksto rinkimas interpretatoriuje nėra labai rafinuotas. Unix sistemose, Python'ą
įdiegęs žmogus galėjo pridėti GNU readline bibliotekos palaikymą, taip
įgalindamas vartotojus naudoti interaktyvų redagavimą, bei komandų istoriją.
Turbūt greičiausias būdas patikrinti ar komandinės eilutės redagavimas yra
palaikomas - surinkti Control-P interpretatoriuje. Jei išgirdote pyptelėjimą -
redagavimas įjungtas; įvadą į klavišus rasite priede: :ref:`tut-interacting`.
Jei pyptelėjimo nesigirdi arba išvedama ``^P``, redagavimo palaikymas
neįjungtas; galėsite tik trinti simbolius, toje pačioje eilutėje, naudodami
Backspace klavišą.

Interpretatoriaus darbas šiek tiek primena Unix apvalkalą: kai interpretatorius
iškviečiamas prijungus standartinę įvestį prie TTY įrenginio, jis nuskaito ir
vykdo komandas interaktyviai; kai iškviečiamas su bylos pavadinimo parametru
arba byla pateikiama per standartinę įvestį, interpretatorius nuskaito ir įvykdo
*scenarijų* esantį byloje.

Antras būdas paleisti interpretatorių yra ``python -c komanda [argumentai] ...``.
Šiuo būdu paleistas interpretatorius įvykdys sakinius pateiktus *komanda*
parametre, analogiškai apvalkalo :option:`-c` parinkčiai. Kadangi Python'o
sakiniuose dažnai būna tarpų ar kitų simbolių, kuriuos apvalkalas laiko
specialiais, patartina visą *komandos* turinį apgaubti apostrofais.

Kai kurie Python'o moduliai yra naudingi kaip scenarijai. Jie gali būti iškviesti
su ``python -m modulis [argumentai] ...``. Ši eilutė įvykdys bylos *modulis*
turinį taip, lyg būtumėte parašę tos bylos pilną vardą komandinėje eilutėje.

Atkreipkite dėmesį, kad ``python byla`` ir ``python <byla`` skiriasi. Pastaruoju
atveju, įvesties reikalavimas, pavyzdžiui kviečiant input() ar raw_input(), yra
užpildomas iš *bylos*. Kadangi byla yra nuskaitoma dar prieš pradedant vykdyti
scenarijų, bylos pabaiga bus rasta iškart. Pirmu atveju (kurio jūs dažniausiai
ir norite), duomenys bus imami iš įrenginio, kuris yra sujungtas su standartine
interpretatoriaus įvestimi.

Kartais, kai vykdomas scenarijus, gali būti naudinga persijungti į interaktyvų
režimą scenarijaus vykdymo pabaigoje. Tai galima padaryti su :option:`-i`
parinktimi prieš scenarijų. (Šis būdas neveikia, jei scenarijus yra nuskaitomas
iš standartinės įvesties dėl tos pačios priežasties, kuri aprašyta praėjusioje
pastraipoje.)

.. _tut-argpassing:

Argumentų perdavimas
--------------------

Kai pateikti, scenarijaus pavadinimas ir kiti argumentai yra perduodami
scenarijui, naudojant ``sys.argv`` kintamąjį, eilučių sąrašo (angl.
*list of strings*) pavidalu. Sąrašo ilgis ne mažesnis už vienetą; kai
scenarijus ir argumentai neperduodami, ``sys.argv[0]`` bus tuščia eilutė. Kai
scenarijaus vardas yra pateiktas kaip ``-`` (kas reiškia standartinę įvestį),
``sys.argv[0]`` įgauna ``'-'`` reikšmę. Kai naudojama :option:`-c` *komanda*,
``sys.argv[0]`` reikšmė bus ``'-c'``. Jei naudojamas :option:`-m` *modulis*,
``sys.argv[0]`` reikšmė bus pilnas modulio vardas. Parinktys rastos po
:option:`-c` *komanda* ar :option:`-m` *modulis* nėra apdorojamos
interpretatoriaus, jos paliekamos ``sys.argv`` sąraše iš kur, reikalui esant,
jas gali pasiekti komanda ar modulis.

.. _tut-interactive:

Interaktyvus režimas
--------------------

Kai komandos yra nuskaitomos iš TTY įrenginio, sakome, kad interpretatorius yra
interaktyviajame režime. Šiame režime *pirminis raginimas* (dažniausiai trys
daugiau-už ženklai ```>>>```) reiškia, kad interpretatorius yra pasiruošęs
nuskaityti sekančią komandą; antrinis raginimas (trys taškai ``...``) reiškia,
kad laukiamas prieš tai įvestos komandos pratęsimas. Prieš atspausdindamas
pirmąjį raginimą, interpretatorius parodo pasisveikinimo žinutę, kurioje
nurodoma interpretatoriaus versija bei autorinių teisių pranešimas::

   python
   Python 2.6 (#1, Feb 28 2007, 00:02:06)
   Type "help", "copyright", "credits" or "license" for more information.
   >>>

Tęsiamosios eilutės yra naudojamos įvedinėjant komandas užimančias daugiau nei
vieną eilutę. Kaip pavyzdį galime naudoti šį :keyword:`if` sąlygos teiginį::

   >>> pasaulis_yra_plokscias = 1
   >>> if pasaulis_yra_plokscias:
   ...     print "Atsargiai, nenukriskite!"
   ...
   Atsargiai, nenukriskite!


.. _tut-interp:

Interpretatorius ir jo aplinka
==============================

.. _tut-error:

Klaidų valdymas
---------------

Kai įvyksta klaida, interpretatorius atspausdina klaidos pranešimą ir dėklo
pėdsaką (angl. *stack trace*). Jei klaida įvyksta interaktyviajame režime,
interpretatorius tiesiog grįžta į pirminį raginimą; jei įvestis buvo nuskaityta
iš bylos, interpretatorius atspausdins dėklo pėdsaką ir baigs darbą grąžindamas
atitinkamą (nelygų nuliui) būsenos kodą. Išimtys suvaldytos naudojant
:keyword:`except` sakinį :keyword:`try` teiginyje, šiame kontekste nėra laikomos
klaidomis. Kai kurios klaidos yra besąlygiškai lemtingos ir priverčia
interpretatorių baigti darbą su klaidos būsena nelygia nuliui; prie tokių klaidų
priskiriami vidiniai neatitikimai bei kai kurie atminties trūkumo atvejai. Visi
klaidų pranešimai yra surašomi į standartinį klaidų srautą; įprastas tekstas,
grąžinamas vykdomų komandų, yra rašomas į standartinę išvestį.

Įrašę pertraukties simbolį (paprastai Control-C arba DEL) į pirminį arba antrinį
raginimą, nutrauksite įvestį ir interpretatorius grįš į pirminį raginimą.
[#]_ Jei pertraukties simbolis įrašomas kol vykdoma komanda, interpretatorius
sukelia išimtį, kuri gali būti suvaldyta :keyword:`try` teiginiu.

.. _tut-scripts:

Python'o vykdomieji scenarijai
------------------------------

BSD tipo Unix sistemose, Python'o scenarijai gali būti padaryti vykdomaisiais,
taip pat, kaip apvalkalo scenarijai. Tam bylos pradžioje reikia pridėti tokią
eilutę::

   #! /usr/bin/env python

Kad ši eilutė veiktų, interpretatorius turi būti vartotojo kelyje
(:envvar:`PATH`), o bylai turi būti suteikta vykdymo būsena. Pirmi du simboliai
byloje privalo būti ``#!``. Kai kuriose platformose pirmoji eilutė turi baigtis
Unix tipo eilutės pabaigos simboliu (``'\n'``), o ne Windows (``'\r\n'``).
Atkreipkite dėmesį, kad grotelės ``#`` Python'e yra naudojamos kaip komentaro
pradžios simbolis.

Scenarijui vykdymo būseną galite suteikti pasinaudoję :program:`chmod` komanda::

   $ chmod +x scenarijus.py

Windows sistemose nėra „vykdomosios būsenos“ žymėjimo. Python'o diegimo programa
automatiškai susieja ``.py`` rinkmenas su ``python.exe``, todėl spragtelėjus
du kartus ant Python'o bylos, ji bus įvykdyta kaip scenarijus. Byla taip pat
gali baigtis ``.pyw`` plėtiniu. Tokiu atveju terminalo langas nebus rodomas,
kaip įprasta.

Išeities teksto koduotė
-----------------------

ASCII nėra vienintelis kodavimas, kuris gali būti naudojamas Python'o išeities
tekstuose. Geriausias būdas nurodyti savo koduotę yra įdėti dar vieną specialų
komentarą iš karto po ``#!`` eilute:

   # -*- coding: <koduotė> -*-

Su šia deklaracija, visi simboliai byloje bus traktuojami, kaip turintys
*koduotė* kodavimą, be to galėsite rašyti Unikodo simbolius tiesiogiai
pasirinktoje koduotėje. Galimų koduočių sąrašą galite rasti Python'o bibliotekų
rodyklėje, :mod:`codecs` skiltyje.

Pavyzdys: norėdami rašyti Unikodo simbolius įskaitant ir Euro valiutos simbolį,
galite naudoti ISO-8859-15 kodavimą, kur Euro simbolio eilės numeris yra 164.
Šis scenarijus atspausdins reikšmę 8364 (Kodas atitinkantis Euro simbolį Unikode)
ir baigs darbą::

   # -*- coding: iso-8859-15 -*-

   valiuta = u"€"
   print ord(valiuta)

Jei jūsų teksto redaktorius turi galimybę išsaugoti bylas kaip ``UTF-8`` su
UTF-8 *baitų eiliškumo žyme* (angl. *byte order mark, BOM*), tuomet galite
naudoti šį būdą vietoj koduotės deklaracijos. IDLE redaktorius turi tokią
galimybę, jei pasirinktas ``Options/General/Default Source Encoding/UTF-8``
nustatymas. Atkreipkite dėmesį, kad senesnės Python'o laidos (2.2 ir ankstesnės)
neatpažįsta šio parašo. Taip pat operacinės sistemos neatpažįsta BOM
scenarijuose, kurie prasideda eilute su ``#!`` (naudojama tik Unix sistemose).

Naudojant UTF-8 (su koduotės deklaracija ar BOM parašu), daugumos pasaulio kalbų
simboliai gali būti naudojami, komentaruose ir simbolių eilutėse, vienu metu. Ne
ASCII simboliai negali būti naudojami kintamųjų, funkcijų, klasių ir t.t.
*varduose.* Ši galimybė yra palaikoma nuo Python'o 3 versijos. Kad visi simboliai
būtų atvaizduoti tvarkingai, jūsų redaktorius turi atpažinti UTF-8 rinkmenas ir
naudoti šriftą, palaikantį visus simbolius esančius byloje.

.. _tut-startup:

Interaktyvaus režimo paleidimo byla
-----------------------------------

Naudojant Python'ą interaktyviai, gali būti naudinga įvykdyti kokias nors komandas
kaskart paleidžiant interpretatorių. Tai atlikti galite pakeitę aplinkos
kintamojo :envvar:`PYTHONSTARTUP` reikšmę į bylos, su jūsų paleidimo komandomis,
vardą. Šis būdas yra panašus į Unix apvalkalo :file:`.profile` galimybę.

.. XXX This should probably be dumped in an appendix, since most people
   don't use Python interactively in non-trivial ways.

Ši rinkmena yra nuskaitoma tik interaktyvių sesijų metu, bet ne tada, kai Python'as
nuskaito komandas iš scenarijaus ar kai :file:`/dev/tty` yra pateiktas kaip
konkretus įvesties šaltinis (nors šiuo atveju interpretatorius elgsis taip pat
kaip ir interaktyviajame režime). Paleidimo bylos komandos yra vykdomos toje
pačioje vardų srityje, kurioje vykdomos interaktyvios komandos, todėl bylos
sukurti ar importuoti objektai gali būti naudojami iškart interaktyviojoje
sesijoje. Šioje byloje taip pat galite keisti ir raginimus ``sys.ps1`` bei
``sys.ps2``.

Jei norite nuskaityti papildomas paleidimo bylas, galite tai padaryti
globalioje paleidimo byloje. Pavyzdžiui: ``if os.path.isfile('.pythonrc.py'):
execfile('.pythonrc.py')``. Jei norite naudoti paleidimo bylą scenarijuje,
turite tai aprašyti::

   import os
   rinkmena = os.environ.get('PYTHONSTARTUP')
   if rinkmena and os.path.isfile(rinkmena):
       execfile(rinkmena)


.. rubric:: Išnašos

.. [#] Bėdos su GNU Readline paketu gali tam sutrukdyti.

