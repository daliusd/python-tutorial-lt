.. _glossary:

***************
Terminų žodynas
***************

.. if you add new entries, keep the alphabetical sorting!

.. glossary::

   ``>>>``
      Numatytasis Python'o raginimas interaktyviajame apvalkale. Dažnai
      naudojamas pavyzdžiuose, kurie gali būti paleidžiami interpretatoriuje.

   ``...``
      Numatytasis Python'o raginimas interaktyviajame apvalkale kai įvedamas
      kodas pastumtam kodo blokui arba tarp poros sutampančių kairiojo
      ir dešiniojo skirtukų (skliaustų, laužtinių arba figūrinių skliaustų).

   2to3
      Įrankis, kuris bando konvertuoti Python'o 2.x kodą į Python'ą 3.x kodą.
      Konvertuojami tie kodo nesuderinamumai, kurie gali būti nustatyti
      analizuojant kodą ir pereinant analizės medį.

      2to3 įrankis yra standartinėje bibliotekoje kaip :mod:`lib2to3`; 
      Įrankis pateikiamas kaip :file:`Tools/scripts/2to3`. Žiūrėti
      :ref:`2to3-reference`.

   abstrakčioji bazinė klasė
      Abstrakčioji bazinė klasė (ABC, ang. abstract base class) papildo neišreikštinį
      tipizavimą suteikdama būdą apibrėžti klasės šabloninę sąsają kai kitų technikų
      (pvz.: :func:`hasattr`) naudojimas yra nepatogus. Python'e yra daug standartinių
      ABC duomenų struktūroms (:mod:`collections` modulyje), skaičiams (:mod:`numbers`
      modulyje), srautams (:mod:`io` modulyje). Galima kurti savo ABC
      naudojant :mod:`abc` modulį.

   argumentas
      Reikšmė perduota funkcijai arba metodui ir priskirta lokaliam
      kintamajam su vardu funkcijoje. Funkcija arba metodas gali
      turėti tiek pozicinius argumentas tiek vardinius argumentus
      apibrėžime. Poziciniai ir vardiniai argumentai gali turėti
      kintamą ilgį: ``*`` priima arba perduoda (jei funkcijos apibrėžime
      arba kvietime) kelis pozicinius argumentus sąrašu, kai tuo tarpu
      ``**`` atlieka tą patį su vardiniais argumentais žodyne.

      Betkoks reiškinys gali būti naudojamas argumentų sąraše ir apskaičiuota
      reikšmė yra perduodama lokaliam kintamajam.

   atkarpa
      (Ang. slice)

      Objektas, kuris paprastai turi dalį :term:`sekos <seka>`. Atkarpa paprastai
      sukuriama naudojant ``[]`` išraišką su dvitaškiais tarp skaičių, kai keli
      paduodami, pvz.: ``variable_name[1:3:5]``. Laužtiniai skliaustai
      naudoja klasės :class:`slice` objektus (arba senesnėse versijose
      :meth:`__getslice__` ir :meth:`__setslice__` metodus).

   atributas
      Reikšmė susieta su objektu, kuri yra pasiekiama pagal vardą naudojant
      taško išraišką. Pvz.: jei objektas *o* turi atributą *a* tai jis
      gali būti pasiektas kaip *o.a*.

   atvaizdis
      (Ang. mapping)

      Konteinerio objektas (pvz.: :class:`dict`) kuris palaiko reikšmių paiešką
      pagal raktus naudojant specialų metodą :meth:`__getitem__`.

   baitinis kodas
      Python'o kodas yra kompiliuojamas į baitinį kodą – vidinę Python'o programos
      reprezentaciją interpretatoriuje. Python'o baitinis kodas yra išsaugojamas
      ``.pyc`` ir ``.pyo`` failuose, kad to paties failo vykdymas būtų greitesnis
      vykdant antrą kartą (išvengiama perkompiliavimo iš kodo į baitinį kodą).
      Sakoma, kad "tarpinė kalba" yra vykdoma :term:`virtualiojoje mašinoje <virtualioji mašina>`
      kuri vykdo mašininį kodą kiekvienam baitiniam kodui.

   BFDL
      Dosnusis Diktatorius Visam Gyvenimui (angliško termino Benevolent
      Dictator For Life sutrumpinimas), taip pat žinomas kaip `Guido van Rossum
      <http://www.python.org/~guido/>`_, Python'o kūrėjas.

   CPython
      Pagrindinis Python'o programavimo kalbos įgyvendinimas. Terminas
      „CPython“ naudojamas, kai reikia atskirti šį įgyvendinimą nuo kitų, pvz.:
      Jython arba IronPython.

   dekoratorius
      Funkcija, kuri grąžina kitą funkciją, dažniausiai naudojant
      funkcijos transformacijos sintaksę ``@wrapper``. Dažnas
      pavyzdys dekoratoriams yra :func:`classmethod` ir :func:`staticmethod`.

      Dekoratoriaus sintaksė yra sukurta tik dėl patogumo. Pavyzdžiui
      šie du funkcijos apibrėžimai yra lygiaverčiai::

         def f(...):
             ...
         f = staticmethod(f)

         @staticmethod
         def f(...):
             ...

   deskriptorius
      Bet kuris *naujo stiliaus* objektas, kuris apibrėžia metodus :meth:`__get__`,
      :meth:`__set__` arba :meth:`__delete__`. Kai klasės atributas yra
      deskriptorius, jo specialūs metodai kviečiami tuo metu, kai bandoma
      pasiekti atributą. Paprastai norint gauti, nustatyti ar ištrinti *a.b*
      atributą yra ieškoma objekto *b* klasės *a* žodyne, bet jei *b* yra
      deskriptorius, iškviečiamas atitinkamas deskriptoriaus metodas.
      Deskriptorių supratimas yra reikalingas išsamiam Python'o supratimui, nes
      jie yra pagrindas daugeliui savybių: funkcijoms, metodams, savybėms,
      klasės metodams, statiniams metodams ir rodyklėms į super klases.

   dokumentavimo eilutė
      (Ang. docstring)

      Eilutės objektas, kuris yra pirmas reiškinys klasėje, funkcijoje ar
      modulyje. Nors šis objektas yra ignoruojamas, kai kodas yra
      vykdomas, kompiliatorius jį atpažįsta ir priskiria :attr:`__doc__`
      atributui. Kadangi jis yra pasiekiamas naudojant introspekciją, tai
      yra įprasta vieta objektų dokumentavimui.

   EAFP
      Lengviau paprašyti gailestingumo nei leidimo. Programuojant šiuo įprastu Python'o
      stiliumi daroma prielaida, kad raktai ar atributai egzistuoja ir gaudomos
      išimtys, jei prielaida yra neteisinga. Šis švarus ir greitas stilius
      yra charakterizuojamas raktinių žodžių :keyword:`try` ir :keyword:`except`
      egzistavimu. Ši technika kontrastuoja su :term:`LBYL` stiliaus
      programavimu dažnu daugelyje kitų programavimo kalbų (pvz.: C).

   eilutė su trigubomis kabutėmis
      (Ang. triple-quoted string)

      Eilutė, kuri yra apsupta trimis kabutėmis (") arba apostrofais (').
      Nors jose nėra jokio funkcionalumo, kurio negalima būtų padaryti
      su paprastomis eilutėmis, jos yra naudingos dėl kelių priežasčių.
      Jos leidžia naudoti viengubas arba dvigubas kabutes be kaitos (\\)
      ženklo ir leidžia sujungti kelias eilutes be pratęsimo simbolio.
      Dėl to jos labai naudingos dokumentavimo eilutėse.

   funkcija
      Sakinių grupė grąžinanti reikšmę. Funkcijai gali būti perduoti
      argumentai, kurie gali būti naudojami skaičiavimuose. Taip pat
      žiūrėti terminus :term:`argumentas` ir :term:`metodas`.

   __future__
      Pseudo-modulis, kurį programuotojai gali naudoti norėdami įjungti
      kalbos savybes, kurios nėra suderinamos su dabartine interpretatoriaus
      versija. Pavyzdžiui reiškinys ``11/4`` apskaičiuojamas kaip ``2``. Jei modulyje
      kuriame šis reiškinys yra vykdomas įjungiama *true division* įvykdant::

         from __future__ import division

      reiškinys ``11/4`` bus apskaičiuotas kaip ``2.75``.  Importavę
      :mod:`__future__` modulį ir įvertinę jo kintamuosius, jūs galite
      matyti kada naujos savybės buvo pridėtos į kalbą ir kada jos bus
      numatytosios::

         >>> import __future__
         >>> __future__.division
         _Feature((2, 2, 0, 'alpha', 2), (3, 0, 0, 'alpha', 0), 8192)

   generatorius
      Funkcija, kuri grąžina iteratorių. Ji panaši į normalią funkciją
      išskyrus tai, kad jos reikšmės yra grąžinamos naudojant
      :keyword:`yield` sakinį vietoje :keyword:`return` sakinio.  Generatoriaus
      funkcijos dažnai susideda iš vieno arba daugiau :keyword:`for` arba
      :keyword:`while` ciklų, kurie grąžina :keyword:`yield` elementus.
      Funkcijos vykdymas yra sustabdomas ties :keyword:`yield` raktiniu žodžiu
      (sugrąžinant rezultatą) ir pratęsiamas, kai pareikalaujama kito
      elemento iškviečiant iteratoriaus :meth:`next` metodą.

      .. index:: single: generator expression

   generatorinis reiškinys
      Reiškinys, kuris grąžina generatorių. Jis panašus į normalų reiškinį
      po kurio seka :keyword:`for` reiškinys apibrėžiantis ciklo
      kintamuosius, ribas ir papildomą :keyword:`if` reiškinį. Kombinuotas
      reiškinys sugeneruoja reikšmes reiškinį apimančiai funkcijai::

         >>> sum(i*i for i in range(10))         # sumuojame kvadratu pakeltus skaičius 0, 1, 4, ... 81
         285

   GIL
      Žiūrime :term:`globalus interpretatoriaus užrakinimas`.

   globalus interpretatoriaus užrakinimas
      (Ang. global interpreter lock)

      Python'o gijų naudojamas užrakinimas, kuris garantuoja, kad
      tik viena gija vykdo :term:`CPython` :term:`virtualiąją mašiną <virtualioji mašina>`
      vienu metu. Tai supaprastina CPython įgyvendinimą užtikrinant,
      kad du procesai negali pasiekti tos pačios atminties vienu metu.
      Viso interpretatoriaus užrakinimas leidžia interpretatoriui
      lengviau vykdyti kelias gijas vienu metu. Žinoma, dėl to Python'o
      interpretatorius pralošia daugiaprocesorinėse mašinose. Praeityje
      buvo ne vienas bandymas sukurti laisvų gijų interpretatorių (tokį,
      kuris užrakina bendrus duomenis žemesniame lygyje), bet nė vienas
      nebuvo sėkmingas, nes nukentėdavo greitis dažnai pasitaikančiose
      vieno-procesoriaus mašinose.

   IDLE
      Integruota Programavimo Aplinka Python'ui. IDLE yra paprastas redaktorius
      ir interpretuojama aplinka, kuri pateikiama su standartiniu Python'u.
      Tinkama pradedantiesiems, bet taip pat gali būti naudojama kaip
      pavyzdinis kodas tiems, kurie nori sukurti multi-platforminę GUI
      aplikaciją.

   interaktyvus
      Python'as turi interaktyvų interpretatorių, o tai reiškia, kad
      sakinius ir reiškinius galima įvesti interpretatoriaus
      raginime, iškart juos įvykdyti ir pamatyti rezultatą. Tiesiog
      paleiskite ``python`` be argumentų (tikriausiai galite jį
      rasti pagrindiniame kompiuterio meniu). Tai labai galingas
      įrankis išbandyti naujas idėjas arba analizuoti modulius
      (prisiminkite ``help(x)``).

   interpretuojamas
      Python'as yra interpretuojama kalba, o ne kompiliuojama, nors
      skirtumas gali būti ir nepastebimas dėl baitinio kodo
      kompiliatoriaus. Tai reiškia, kad kodo failai gali būti
      vykdomi tiesiogiai nekuriant vykdomųjų failų, kurie vėliau
      turi būti paleisti. Interpretuojamos kalbos dažniausiai
      padeda greičiau programuoti ir derinti, negu dirbant su
      kompiliuojančiomis kalbomis, tačiau įprastai jos yra
      lėtesnės. Žiūrime taip pat :term:`interaktyvus`.

   iteruojamas
      Objektas, kuris gali grąžinti savo narius po vieną.
      Iteruojamo objekto pavyzdys galėtų būti bet kuris sekos tipas
      (pvz.: :class:`list`, :class:`str`, ir :class:`tuple`) ir kai kurie
      ne sekos tipai (pvz.: :class:`dict` ir :class:`file`) ir bet kurios
      klasės objektai, kurie apibrėžia :meth:`__iter__` arba :meth:`__getitem__`
      metodus. Iteruojami objektai gali būti naudojami :keyword:`for` cikle ir
      daugelyje kitų vietų, kur reikalingos sekos (:func:`zip`, :func:`map`, ...).
      Kai iteruojamas objektas perduodamas funkcijai :func:`iter` kaip
      argumentas, ji grąžina objektui iteratorių. Šis iteratorius yra
      naudingas, kai reikia pereiti per aibės reikšmes. Kai naudojami
      iteruojami objektai nėra būtina kviesti :func:`iter` ar tvarkytis su
      iteratoriaus objektu pačiam. ``for`` sakinys tai atlieka automatiškai
      sukurdamas laikiną bevardį kintamąjį, kuriame laikomas iteratorius
      ciklui.  Taip pat žiūrėti: :term:`iteratorius`, :term:`seka`, ir
      :term:`generatorius`.

   iteratorius
      Objektas, kuris reprezentuoja duomenų srautą. Pakartotini iteratoriaus
      metodo :meth:`next` kvietimai grąžina sekantį narį sraute. Kai daugiau
      duomenų nebėra, sukeliama :exc:`StopIteration` išimtis. Nuo šios
      akimirkos iteratoriaus objektas yra išnaudotas ir bet kuris tolesnis
      :meth:`next` metodo kvietimas tiesiog išmes :exc:`StopIteration` vėl.
      Iteratoriai taip pat turi turėti :meth:`__iter__` metodą, kuris sugrąžina
      iteratoriaus objektą tam, kad pats iteratorius galėtų būti naudojamas
      kitoje vietoje, kur reikalingi iteruojami objektai. Viena pažymėtina
      išimtis yra kodas, kuris bando įvykdyti kelis iteracijos žingsnius.
      Konteinerio objektas (pvz.: :class:`list`) grąžina naują iteratorių
      kiekvieną kartą, kai jį perduodi :func:`iter` funkcijai arba naudoji
      :keyword:`for` cikle.  Bandymai atlikti tą patį su iteratoriumi
      tiesiog sugrąžins tą patį išnaudotą iteratoriaus objektą naudotą
      praeitame iteracijos vykdyme ir dėl to jis atrodys kaip tuščias
      konteineris.

      Daugiau informacijos galima rasti :ref:`typeiter`.

   išplėtimo modulis
      (Ang. extension module)

      Modulis parašytas C arba C++ naudojant Python'o C API skirtas bendradarbiavimui tarp
      Python'o branduolio ir vartotojo kodo.

   įdėtinė sritis
      (Ang. nested scope)

      Galimybė kreiptis į kintamuosius ribotame apibrėžime. Pavyzdžiui,
      funkcija apibrėžta kitos funkcijos viduje gali kreiptis
      į kintamąjį išorinėje funkcijoje. Atkreipkite dėmesį, kad įdėtinė
      sritis dirbs tik su nuorodomis, bet net priskyrimams, kurie yra visada
      rašomi artimiausioje srityje.

   klasė
        Šablonas, kuris naudojamas kurti vartotojo apibrėžtus objektus.
        Klasės apibrėžimas dažniausiai susideda iš metodų apibrėžimų,
        kurie operuoja su tos klasės objektais.

   klasikinė klasė
        Bet kuri klasė, kuri nėra paveldėta iš :class:`object`. Taip
        pat žiūrėti :term:`naujo stiliaus klasė`. Klasikinės klasės bus
        išimtos iš Python'o 3.0.

   keitimas
        (Ang. coercion)

        Neišreikštinis vieno tipo objekto konvertavimas į kitą tipą per operaciją,
        kurioje naudojami du to paties tipo argumentai. Pavyzdžiui
        ``int(3.15)`` konvertuoja slankiojo kablelio skaičių į sveiką skaičių ``3``, bet
        operacijoje ``3+4.5`` kiekvienas argumentas yra skirtingo tipo (vienas yra sveikas
        skaičius, kitas slankaus kablelio) ir abu turi būti sukonvertuojami į tą patį
        tipą prieš tai, kai jie yra sudedami arba kitaip bus išmetama ``TypeError`` klaida.
        Keitimas tarp dviejų objektų gali būti atliktas naudojantis ``coerce`` funkcija.
        Taigi ``3+4.5`` yra tolygu ``operator.add(*coerce(3, 4.5))`` kvietimui ir tokios
        operacijos rezultatas yra ``operator.add(3.0, 4.5)``. Be keitimo visi argumentai
        (net jei argumentų tipai yra suderinami) turėtų būti normalizuojami programuotojo,
        pvz.: ``float(3)+4.5`` užuot tiesiog rašius ``3+4.5``.

   kintamas
      (Ang. mutable)

      Kintamas objektas gali pakeisti savo reikšmę bet išlaikyti :func:`id`.
      Taip pat žiūrėti :term:`nekintamas`.

   kompleksinis skaičius
      Pažįstamos realiųjų skaičių sistemos plėtinys, kuriame visi skaičiai
      yra išreiškiami kaip realios ir menamosios dalių suma. Menamieji
      skaičiai yra realieji skaičiai padauginti iš menamojo vieneto (kvadratinė
      šaknis iš ``-1``), dažnai žymimo kaip ``i`` matematikoje arba ``j``
      inžinerijoje. Python'as palaiko kompleksinius skaičius, kurie naudoja
      pastarąjį žymėjimą – menamoji dalis yra rašoma naudojant ``j``, pvz.: 
      ``3+1j``.  Jei jums reikia :mod:`math` modulio ekvivalento kompleksiniams
      skaičiams naudokite :mod:`cmath`. Kompleksinių skaičių naudojimas
      yra pakankamai sudėtinga matematikos tema. Jei nesate tikras ar jums jų reikia,
      galite ramiai juos ignoruoti.

   konteksto valdiklis
      (Ang. context manager)

      Objektas, kuris valdo aplinką sakinyje su :keyword:`with` konstrukcija.
      Objekte reikia apibrėžti :meth:`__enter__` ir :meth:`__exit__` metodus.
      Daugiau informacijos :pep:`343`.

   lambda
      Anoniminė funkcija, susidedanti iš vieno reiškinio, kuris
      apskaičiuojamas, kai funkcija kviečiama. Lambda funkcijų sintaksė yra
      ``lambda [argumentai]: reiškinys``.

   LBYL
      Pažiūrėk prieš šokdamas. Programuojant šiuo stiliumi patikrinamos sąlygos
      prieš vykdant tolimesnius veiksmus. Šis stilius kontrastuoja
      :term:`EAFP` stiliui ir gali būti atpažintas pagal didelį
      :keyword:`if` sakinių kiekį.

   maišomas
      (Ang. hashable)

      Objektas yra *maišomas* jei jo maišos reikšmė niekada nepasikeičia
      per jo gyvavimo laiką (tam reikia :meth:`__hash__` metodo) ir jis
      gali būti palygintas su kitais objektais (tam reikia :meth:`__eq__`
      arba :meth:`__cmp__` metodų). Maišomi objektai, kurie turi lygias
      reikšmes lyginant, privalo turėti lygias maišos reikšmes.

      Maišomumas leidžia objektą naudoti žodynuose ir aibėse, nes šios
      duomenų struktūros naudoja maišos reikšmes.

      Visi nekintami Python'o objektai yra maišomi, tuo tarpu kintami
      objektai nėra (pvz.: konteineriai - sąrašai arba žodynai).
      Objektai, kurie yra sukuriami iš vartotojo apibrėžtų klasių yra
      maišomi visada, nes jie niekada nėra lygūs ir jų maišos reikšmė
      yra jų :func:`id`.

   metaklasė
      Klasės klasė. Klasės apibrėžimas sukuria klasės vardą, klasės žodyną
      ir bazinių klasių sąrašą. Metaklasė yra atsakinga už šių trijų
      argumentų paėmimą ir klasės sukūrimą. Dauguma objektiškai orientuotų
      programavimo kalbų pateikia standartinį įgyvendinimą. Python'as
      šiuo atveju yra išskirtinis, nes jame galima sukurti savo metaklases.
      Daugumai vartotojų niekada nereikia šios priemonės, bet kai
      atsiranda poreikis, metaklasės gali pasiūlyti galingus ir elegantiškus
      sprendimus. Jos yra naudojamos atributų pasiekimo žurnalų rašymui,
      gijų-saugumo įgyvendinime, objektų sukūrimo sekimui, singltonų
      įgyvendinime ir daugelyje kitų užduočių.

      Daugiau informacijos gali rasti :ref:`metaclasses`.

   metodas
      Funkcija, kuri apibrėžiama klasės viduje. Jei ji iškviečiama kaip
      klasės egzemplioriaus atributas, metodas gaus egzemplioriaus objektą
      kaip pirmąjį savo argumentą (žiūrime :term:`argumentas`). Dažniausiai
      jis vadinamas ``self``.
      Taip pat žiūrėti :term:`funkcija` and :term:`įdėtinė sritis`.

   naujo stiliaus klasė
      (Ang. new-style class)

      Bet kuri klasė, kuri paveldi iš :class:`object`. Į tai įeina visi
      standartiniai tipai kaip :class:`list` ar :class:`dict`.  Tik
      naujo stiliaus klasės gali naudoti naujas visapusiškas Python'o
      ypatybes kaip :attr:`__slots__`, deskriptorius, savybes
      ir :meth:`__getattribute__`.

   neišreikštinis tipizavimas
      (Ang. duck-typing)

      Python'iškas programavimo stilius, kuris nustato objekto tipą analizuojant
      jo metodus arba atributus užuot analizuojant objekto santykį su tam tikru
      tipu (jei versti tiesiogiai iš anglų kalbos, tai būtų anties tipizavimas
      „Jei tai atrodo kaip antis, kvaksi kaip antis, tai turi būti antis“).
      Naudojant sąsajas vietoje specifinių tipų gerai suprojektuotas kodas
      yra lankstesnis, nes leidžia naudoti polimorfinį pakeitimą. Naudojant
      neišreikštinį tipizavimą išvengiama tikrinimo naudojant :func:`type`arba
      :func:`isinstance` funkcijas (Pastaba: neišreikštinis tipizavimas gali
      būti papildytas naudojant abstrakčiąsias bazines klases). Vietoje to
      įprastai naudojama :func:`hasattr` funkcija arba :term:`EAFP` programavimas.

   nekintamas
      (Ang. immutable)

      Objektas su fiksuota reikšme. Nekintamais objektais gali būti skaičiai,
      eilutės ir kortežai. Tokie objektai negali būti keičiami. Turi būti
      sukurtas naujas objektas, jei norime sukurti kitokią reikšmę. Jie yra
      svarbūs situacijose, kur reikia konstantinės maišos reikšmės, pvz.: rakto
      žodynui.

   nuorodų skaičius
      (Ang. reference count)

      Nuorodų skaičius į objektą. Kai nuorodų skaičius nukrenta iki
      nulio, jo užimama atmintis yra atlaisvinama. Nuorodų skaičiavimas
      dažniausiai yra nematomas Python'o kode, bet tai yra svarbiausias
      elementas :term:`CPython` įgyvendinime.  :mod:`sys` modulis
      apibrėžia :func:`getrefcount` funkciją, kurią programuotojai gali
      iškviesti norėdami gauti nuorodų skaičių į tam tikrą objektą.

   reiškinys
      (Ang. expression)

      Sintaksės gabalas, kuris gali būti apskaičiuotas. Kitais žodžiais,
      reiškinys yra tokių elementų kaip vardai, atributų pasiekimai, operatorių
      arba funkcijų kvietimai, junginys, kurio visi nariai grąžina reikšmę.
      Kitaip, nei daugelyje kitų programavimo kalbų, ne visos Python'o
      konstrukcijos yra reiškiniai. Dar būna :term:`sakiniai <sakinys>`, kurie negali
      būti naudojami kaip reiškiniai. Pvz.: raktiniai žodžiai :keyword:`print`
      arba :keyword:`if`.  Priskyrimai taip pat yra sakiniai, o ne reiškiniai.

   objektas
      Bet kuris duomenų vienetas su būsena (atributų ar reikšmės)
      ir apibrėžtu elgesiu (metodais). Taip pat pirmine bazine
      klase, jei tai :term:`naujo stiliaus klasė`.

   pozicinis argumentas
      Argumentai priskirti lokaliems vardams funkcijoje ar metode
      nustatant jų eilę pagal tai kaip jie buvo kviečiami.
      ``*`` yra naudojamas kai reikia priimti kelis pozicinius
      argumentus (apibrėžime) arba kai reikia perduoti kelis argumentus
      kaip sąrašą funkcijai. Žiūrėti :term:`argumentas`.

   Python 3000
      Kodinis pavadinimas kitai svarbiai Python'o versijai, 3.0 (sugalvota
      seniai, kai 3 versija dar buvo tolimoje ateityje). Taip pat
      trumpinama „Py3k“.

   Python'iškas
      Idėja arba kodo gabalas, kuris atitinka daugumą Python'o kalbos idiomų
      užuot įgyvendina kodą naudojant kitų kalbų koncepcijas. Pavyzdžiui
      dažna Python'o idioma yra pereiti per visus iteruojamo objekto elementus
      naudojant :keyword:`for` sakinį. Dauguma kitų kalbų neturi tokio
      tipo konstrukcijos, taigi žmonės nesusipažinę su Python'u naudoja
      skaitliukus::

          for i in range(len(food)):
              print food[i]

      Kai tuo tarpu galima naudoti Python'išką metodą::

         for piece in food:
             print piece

   Python'o Zen
      Python'o dizaino principų ir filosofijų sąrašas kuris padeda suprasti
      ir naudoti kalbą. Sąrašą galima rasti surinkus "``import this``"
      interaktyviajame raginime.

   __slots__
      Apibrėžimas naujo stiliaus klasėje (žr. :term:`naujo stiliaus klasė`),
      kuris sutaupo atminties, rezervuodamas erdvę egzemplioriaus atributams
      ir išvengdamas egzemplioriaus žodyno. Nors technika yra populiari, kartais
      gali būti sudėtinga tai atlikti teisingai, todėl geriau tai palikti
      situacijoms, kai reikalingas didelis egzempliorių skaičius, o atmintį
      reikia išnaudoti efektyviai.

   sakinys
      (Ang. statement)

      Sakinys yra kodo bloko dalis. Sakinys yra arba :term:`reiškinys` arba
      viena iš kelių konstrukcijų su raktiniu žodžiu (pvz.: :keyword:`if`,
      :keyword:`while` arba :keyword:`print`).

   sąrašas
      (Ang. list)

      Standartinė Python'o :term:`seka`. Nepaisant pavadinimo jis artimesnis kitų
      programavimo kalbų masyvams, nei rodyklėmis susietais sąrašais, nes
      priėjimas prie elementų yra O(1).

   sąrašo užklausa / list comprehension
      Kompaktiškas būdas apdoroti visus ar dalį sekos elementų ir sugrąžinti
      sąrašą su rezultatais. ``result = ["0x%02x" % x for x in range(256) if x % 2 == 0]``
      sugeneruoja eilučių sąrašą susidedančių iš šešioliktainių skaičių (0x..) iš lyginių skaičių
      aibės nuo 0 iki 255. :keyword:`if` sakinys yra papildomas. Jei jis bus praleistas
      duotame pavyzdyje bus apdoroti visi elementai iš aibės nuo 0 iki 255.

   seka
      (Ang. sequence)

      :term:`iteruojamas` objektas, kuris palaiko efektyvų elementų pasiekimą
      per indeksus naudojant specialų :meth:`__getitem__` metodą ir apibrėžia
      :meth:`len` metodą, kuris sugrąžina sekos ilgį.
      Kai kurie standartiniai sekos tipai yra :class:`list`, :class:`str`,
      :class:`tuple` ir :class:`unicode`. Atkreipkite dėmesį į tai,
      kad :class:`dict` taip pat palaiko :meth:`__getitem__` ir :meth:`__len__`,
      bet yra atvaizdis, o ne seka, nes paieškai naudojami
      :term:`nekintami <nekintamas>` raktai, o ne sveikieji skaičiai.

   specialus metodas
      Metodas, kurį iškviečia Python'as, kad atliktų tam tikro tipo operaciją
      (pvz.: sudėtį). Tokie metodai turi vardus prasidedančius ir pasibaigiančius
      dvigubu pabraukimo brūkšniu.

   sveikųjų skaičių dalyba
      (Ang. integer division)

      Matematinė dalyba numetant liekaną. Pvz.: reiškinys ``11/4`` apskaičiuojamas
      kaip ``2``, kai tuo tarpu realiųjų skaičių dalyboje būtų grąžinta
      ``2.75``.  Taip pat dar vadinama *grindų dalyba*.
      Kai dalinami du sveikieji skaičiai rezultatas visada bus sveikas
      skaičius (kuriam bus pritaikyta *grindų* funkcija). Tačiau, jei
      vienas iš skaičių yra kitokio tipo (pvz.: :class:`float`), tai rezultatas
      bus keičiamas (žiūrime :term:`keitimas`) į bendrą tipą.  Pvz.: jei
      sveikas skaičius dalinamas iš realiojo skaičiaus rezultatas bus
      realusis skaičius, tikriausiai su dešimtaine liekana. Sveikųjų
      skaičių dalyba gali būti nurodoma priverstinai naudojant ``//`` operatorių
      vietoje ``/`` operatoriaus.  Taip pat žiūrėkite :term:`__future__`.

   šiukšlių surinkimas
      (Ang. garbage collection)

      Atminties atlaisvinimo procesas kai ji nebenaudojama. Python'as
      atlieka šiukšlių surinkimą naudodamas rodyklių skaičiavimą
      ir ciklišką šiukšlių surinkiklį, kuris sugeba aptikti ir
      nutraukti rodyklių ciklus.

   tipas
      Python'o objekto tipas nustato koks tai yra objektas. Kiekvienas objektas
      turi tipą. Objekto tipas pasiekiamas kaip :attr:`__class__` atributas
      arba gali būti nustatytas naudojant ``type(obj)``.

   vardinis argumentas
      (Ang. keyword argument)

      Argumentas prieš kurį parašoma  ``variable_name=`` kvietime.
      Kintamojo vardas nurodo lokalų kintamąjį funkcijoje, kuriai
      perduodama reikšmė. ``**`` naudojamas vardinių argumentų priėmimui
      arba perdavimui. Daugiau :term:`argumentas`.

   vardinis kortežas
      (Ang. named tuple)

      Bet kuri į kortežą panaši klasė, kurios indeksuojami elementai gali
      būti pasiekti naudojant vardinius atributus. Pvz.: :func:`time.localtime`
      sugrąžina į kortežą panašų objektą, kur *year* (metai) gali būti
      pasiekti arba naudojant indeksą ``t[0]`` arba vardinį atributą
      ``t.tm_year``).

      Vardinis kortežas gali būti standartinis tipas (pvz.: :class:`time.struct_time`)
      arba jis gali būti sukurtas naudojant įprastus klasės apibrėžimus.
      Visas savybes turintį vardinį kortežą galima sukurti naudojantis
      :func:`collections.namedtuple` funkcija.  Šis sprendimas automatiškai
      suteikia papildomas galimybes, pvz.: save-dokumentuojančią išraišką
      kaip ``Employee(name='Jonas', title='programuotojas')``.

   vardų erdvė
      (Ang. namespace)

      Vieta, kur laikomi kintamieji. Vardų erdvės yra įgyvendintos kaip
      žodynai. Egzistuoja lokali, globali ir įtaisytoji erdvės bei
      vidinė erdvė objektuose (arba metoduose). Vardų erdvės
      suteikia moduliškumą, kuris padeda išvengti vardų konflikto.
      Pavyzdžiui funkcijos :func:`__builtin__.open` ir :func:`os.open` gali
      būti atskirtos pagal vardų erdvę. Vardų erdvės taip pat padeda
      skaitomumui ir priežiūrai aiškiai parodydamos kuriam moduliui
      priklauso funkcija. Pavyzdžiui, užrašai :func:`random.seed` ir
      :func:`itertools.izip` aiškiai parodo, kad šios funkcijos
      yra įgyvendintos :mod:`random` ir :mod:`itertools` moduliuose
      atitinkamai.

   virtualioji mašina
      Kompiuteris apibrėžtas programine įranga. Python'o virtualioji
      mašina vykdo :term:`baitinį kodą <baitinis kodas>`, sugeneruotą
      baitinio kodo kompiliatoriaus.

   žodynas
      (Ang. dictionary)

      Asociatyvus masyvas, kur raktai yra atvaizduoti į reikšmes. Klasės
      :class:`dict` naudojimas labai panašus į klasės :class:`list` naudojimą,
      bet raktais gali būti bet kokie objektai turintys :meth:`__hash__` funkciją,
      ne tik sveiki skaičiai.

