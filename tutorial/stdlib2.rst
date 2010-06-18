.. _tut-brieftourtwo:

*******************************************************
Trumpa standartinės bibliotekos apžvalga -- antra dalis
*******************************************************

Ši dalis apžvelgia sudėtingesnius modulius, kurie reikalingi
profesionaliam programavimui. Šie moduliai retai naudojami
mažuose skriptuose.

.. _tut-output-formatting:

Išvesties formatavimas
======================

:mod:`repr` modulyje rasite :func:`repr` funkcijos
versiją skirtą dideliems arba giliai įdėtiems konteinerių
objektams::

   >>> import repr
   >>> repr.repr(set('supercalifragilisticexpialidocious'))
   "set(['a', 'c', 'd', 'e', 'f', 'g', ...])"

:mod:`pprint` modulis leidžia rafinuočiau atspausdinti
tiek įtaisytus tiek vartojo apibrėžtus objektus interpretatoriui
skaitomu būdu. Jeigu rezultatas yra ilgesnis negu viena eilutė,
"pretty printer" prideda eilučių pabaigos simbolius ir
pastumia tekstą, kad duomenų struktūra būtų suprantamesnė::

   >>> import pprint
   >>> t = [[[['black', 'cyan'], 'white', ['green', 'red']], [['magenta',
   ...     'yellow'], 'blue']]]
   ...
   >>> pprint.pprint(t, width=30)
   [[[['black', 'cyan'],
      'white',
      ['green', 'red']],
     [['magenta', 'yellow'],
      'blue']]]

:mod:`textwrap` modulis suformatuoja teksto paragrafą, kad jis tilptų
į nurodytą ekrano plotį::

   >>> import textwrap
   >>> doc = """The wrap() method is just like fill() except that it returns
   ... a list of strings instead of one big string with newlines to separate
   ... the wrapped lines."""
   ...
   >>> print textwrap.fill(doc, width=40)
   The wrap() method is just like fill()
   except that it returns a list of strings
   instead of one big string with newlines
   to separate the wrapped lines.

:mod:`locale` modulis prieina prie nuo kultūros priklausančių datos
formatų duombazės. Lokalės formatavimo funkcijos grupavimo
atributas leidžia tiesiogiai formatuoti skaičius naudojant grupių
atskyrimą::

   >>> import locale
   >>> locale.setlocale(locale.LC_ALL, 'English_United States.1252')
   'English_United States.1252'
   >>> conv = locale.localeconv()          # get a mapping of conventions
   >>> x = 1234567.8
   >>> locale.format("%d", x, grouping=True)
   '1,234,567'
   >>> locale.format("%s%.*f", (conv['currency_symbol'],
   ...               conv['frac_digits'], x), grouping=True)
   '$1,234,567.80'


.. _tut-templating:

Šablonai
========

:mod:`string` modulyje rasite visapusišką :class:`Template` klasę, kuri
leis naudoti supaprastintą sintaksę, kurią gali suprasti ir
paprastas vartotojas. Tai leidžia vartotojui modifikuoti programos
elgesį nekeičiant pačios programos.

Rezervuotų vietų vardai formuojami su ``$`` with ir teisingu
Python'o identifikatoriumi (t.y. žodis, kurį gali sudaryti skaičiai, raidės
ir pabraukimo brūkšniai). Jeigu rezervuotą vietą apskliaudus figūriniais
skliausteliais, tai po to gali sekti kiti simboliai be tarpų. 
Parašius ``$$`` jis paverčiamas vienu ``$``::

   >>> from string import Template
   >>> t = Template('${village}folk send $$10 to $cause.')
   >>> t.substitute(village='Nottingham', cause='the ditch fund')
   'Nottinghamfolk send $10 to the ditch fund.'

:meth:`substitute` metodas pakelia :exc:`KeyError`, jeigu rezervuotai
vietai nepateikiamas argumentas. Jeigu mums reikia, kad funkcija
veiktų net tuo atveju, kai vartotojas pateikia ne visą informaciją,
galima naudoti :meth:`safe_substitute` metodą, jeigu ji tinkama.
Naudojant šia funkciją rezervuota vieta bus nepakeista, jei
duomenų truks::

   >>> t = Template('Return the $item to $owner.')
   >>> d = dict(item='unladen swallow')
   >>> t.substitute(d)
   Traceback (most recent call last):
     . . .
   KeyError: 'owner'
   >>> t.safe_substitute(d)
   'Return the unladen swallow to $owner.'

Šablonų poklasiai gali apibrėžti kitokį rezervuotos vietos atpažinimo
ženklą. Pavyzdžiui nuotraukų pervadinimo programėlė gali naudoti
procento ženklą rezervuotai vietai atpažinti (pvz. datai, paveikslėlio
numeris ar failo formatas)::

   >>> import time, os.path
   >>> photofiles = ['img_1074.jpg', 'img_1076.jpg', 'img_1077.jpg']
   >>> class BatchRename(Template):
   ...     delimiter = '%'
   >>> fmt = raw_input('Enter rename style (%d-date %n-seqnum %f-format):  ')
   Enter rename style (%d-date %n-seqnum %f-format):  Ashley_%n%f

   >>> t = BatchRename(fmt)
   >>> date = time.strftime('%d%b%y')
   >>> for i, filename in enumerate(photofiles):
   ...     base, ext = os.path.splitext(filename)
   ...     newname = t.substitute(d=date, n=i, f=ext)
   ...     print '{0} --> {1}'.format(filename, newname)

   img_1074.jpg --> Ashley_0.jpg
   img_1076.jpg --> Ashley_1.jpg
   img_1077.jpg --> Ashley_2.jpg

Kitas šablonų naudojimo tikslas yra programos logikos ir skirtingų formatų
išvedimo atskyrimas. Tai leidžia rezultatus išvesti kaip XML failą,
paprastą tekstinę ar HTML ataskaitą.

.. _tut-binary-formats:

Darbas su dvejetainiais duomenų įrašais
=======================================

:mod:`struct` modulio funkcijos :func:`pack` ir :func:`unpack` leidžia
dirbti su kintamo ilgio dvejetainiais įrašų formatais. Sekantis pavyzdys
parodo kaip perskaityti ZIP failo antraštę nenaudojant :mod:`zipfile` modulio.
Pakavimo kodai ``"H"`` ir ``"I"`` reprezentuoja dviejų ir keturių baitų
skaitinę reikšmę be ženklo atitinkamai. ``"<"`` reiškia, kad jie
yra įprasto dydžio ir išsidėstę didėjančių baitų tvarka::

   import struct

   data = open('myfile.zip', 'rb').read()
   start = 0
   for i in range(3):                      # show the first 3 file headers
       start += 14
       fields = struct.unpack('<IIIHH', data[start:start+16])
       crc32, comp_size, uncomp_size, filenamesize, extra_size = fields

       start += 16
       filename = data[start:start+filenamesize]
       start += filenamesize
       extra = data[start:start+extra_size]
       print filename, hex(crc32), comp_size, uncomp_size

       start += extra_size + comp_size     # skip to the next header


.. _tut-multi-threading:

Daugiagijiškumas
================

Gijos naudojamos norint atskirti užduotis, kurios nėra viena nuo kitos
priklausomos. Gijos gali būti naudojamos norint pagerinti programos
reagavimo laiką, kuri gauna vartotojo įvedamus duomenis ir tuo tarpu
vykdo kitas užduotis fone. Susijęs panaudojimo variantas yra
duomenų skaitymas ir rašymas vykdant skaičiavimus kitoje gijoje.

Žemiau esantis kodas rodo kaip aukšto lygio modulis :mod:`threading` gali
vykdyti užduotis fone kol pagrindinė programa yra vykdoma::

   import threading, zipfile

   class AsyncZip(threading.Thread):
       def __init__(self, infile, outfile):
           threading.Thread.__init__(self)
           self.infile = infile
           self.outfile = outfile
       def run(self):
           f = zipfile.ZipFile(self.outfile, 'w', zipfile.ZIP_DEFLATED)
           f.write(self.infile)
           f.close()
           print 'Finished background zip of: ', self.infile

   background = AsyncZip('mydata.txt', 'myarchive.zip')
   background.start()
   print 'The main program continues to run in foreground.'

   background.join()    # Wait for the background task to finish
   print 'Main program waited until background was done.'

Pagrindinė problema daugiagijiškoje programoje yra gijų,
kurios dalinasi duomenimis ir kitais resursais, koordinavimas.
Gijų modulis leidžia naudoti sinchronizavimo primityvus kaip
spynas (ang. lock), įvykius (ang. event), sąlygų kintamuosius
(ang. condition variable) ar semaforus.

Nors šios priemonės yra galingos, mažiausia klaida gali baigtis klaida,
kurią sunku atgaminti. Rekomenduojamas būdas užduočių koordinavimui
yra sukoncentruoti priėjimą prie visų resursų vienoje gijoje ir tada
naudoti :mod:`Queue` modulį, tam kad tai gijai perduoti užsakymus
iš kitų gijų. Programos, kurios naudoja :class:`Queue.Queue` objektus
bendravimui tarp gijų yra lengviau sukuriamos, skaitomesnės ir
patikimesnės.

.. _tut-logging:

Žurnalas
========

:mod:`logging` modulis leidžia naudoti pilną ir lanksčią žurnalo sistemą.
Paprasčiausias variantas yra visus žurnalo pranešimus siųsti į failą arba
``sys.stderr``::

   import logging
   logging.debug('Debugging information')
   logging.info('Informational message')
   logging.warning('Warning:config file %s not found', 'server.conf')
   logging.error('Error occurred')
   logging.critical('Critical error -- shutting down')

To rezultatas yra toks::

   WARNING:root:Warning:config file server.conf not found
   ERROR:root:Error occurred
   CRITICAL:root:Critical error -- shutting down

Įprastai, informaciniai ir derinimo pranešimai yra sulaikomi ir
rezultatas siunčiamas į standartinių klaidų rašymo vietą. Kiti
išvedimo rezultatai yra pranešimų siuntimas paštu, į serverį ir
t.t. Nauji filtrai gali pasirinkti skirtingus pranešimo
rašymo/siuntimo būdus priklausomai nuo pranešimo prioriteto:
:const:`DEBUG`, :const:`INFO`, :const:`WARNING`, :const:`ERROR`, and :const:`CRITICAL`.

Žurnalo sistema gali būti konfigūruojama tiesiogiai iš Python'o arba gali
būti užkrauta iš vartotojo konfigūruojamo failo.

.. _tut-weak-references:

Silpnos nuorodos
================

Python'as atmintį valdo automatiškai (daugumai objektų skaičiuojamos
nuorodos ir naudojamas :term:`šiukšlių surinkimas` ciklų eliminavimui).
Atmintis atlaisvinama ne už ilgo po to, kai paskutinė nuorodą į ją
yra panaikinama.

Šis būdas tinka daugumai programų bet kartais reikia sekti objektus tik
tiek kiek jie yra naudojami kažkur kitur. Nelaimei vien tam, kad
juos sekti, yra sukuriama nuorodą, kuri padaro juos amžinus.
:mod:`weakref` modulis leidžia sekti objektus nesukūrus jiems nuorodų.
Kai objektas tampa nebereikalingu jis automatiškai išimamas
iš *weakref* lentelės.  Tipiškai programos saugo objektus, kuriuos
yra brangu sukurti::

   >>> import weakref, gc
   >>> class A:
   ...     def __init__(self, value):
   ...             self.value = value
   ...     def __repr__(self):
   ...             return str(self.value)
   ...
   >>> a = A(10)                   # sukuriame nuorodą
   >>> d = weakref.WeakValueDictionary()
   >>> d['primary'] = a            # nuoroda nesukuriama
   >>> d['primary']                # gauname objektą, jei jis dar gyvas
   10
   >>> del a                       # pašaliname nuorodą
   >>> gc.collect()                # paleidžiame šiukšlių surinkimą
   0
   >>> d['primary']                # įrašas buvo automatiškai pašalintas
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
       d['primary']                # įrašas buvo automatiškai pašalintas
     File "C:/python26/lib/weakref.py", line 46, in __getitem__
       o = self.data[key]()
   KeyError: 'primary'


.. _tut-list-tools:

Priemonės darbui su sąrašais
============================

Dauguma duomenų struktūrų poreikių gali būti pasiekti naudojant
įtaisytus tipus. Tačiau kartais reikia alternatyvaus įgyvendinimo
su skirtingais našumo reikalavimais.

:mod:`array` modulyje rasite :class:`array()` objektą, kuris yra panašus
į sąrašą, kuris laiko vienodus objektus ir laiko juos kompaktiškiau.
Sekantis pavyzdys parodo skaičių masyvą, laikomą kaip dviejų baitų
dvejetainius skaičius be ženklo (tipo kodas ``"H"``) vietoje 16 baitų
kiekvienam nariui kaip tai daroma paprastame Python'o sąraše::

   >>> from array import array
   >>> a = array('H', [4000, 10, 700, 22222])
   >>> sum(a)
   26932
   >>> a[1:3]
   array('H', [10, 700])

:mod:`collections` modulyje rasite :class:`deque()` objektą, panašų į sąrašą
su greitesniais sąrašo papildymais ir išėmimais iš kairės, bet lėtesne
peržiūra iš vidurio. Šie objektai labai tinka eilių ir kai kurių
paieškos medžių įgyvendinimui::

   >>> from collections import deque
   >>> d = deque(["task1", "task2", "task3"])
   >>> d.append("task4")
   >>> print "Handling", d.popleft()
   Handling task1

   unsearched = deque([starting_node])
   def breadth_first_search(unsearched):
       node = unsearched.popleft()
       for m in gen_moves(node):
           if is_goal(m):
               return m
           unsearched.append(m)

Papildomai alternatyviems sąrašų įgyvendinimams, biblioteka taip pat
siūlo priemones kaip :mod:`bisect` modulis su funkcijomis skirtoms
surūšiuotų manipuliavimui::

   >>> import bisect
   >>> scores = [(100, 'perl'), (200, 'tcl'), (400, 'lua'), (500, 'python')]
   >>> bisect.insort(scores, (300, 'ruby'))
   >>> scores
   [(100, 'perl'), (200, 'tcl'), (300, 'ruby'), (400, 'lua'), (500, 'python')]

:mod:`heapq` modulyje rasite funkcijas reikalingas krūvų (ang. heap) paremtų
sąrašais įgyvendinimui. Mažiausia reikšmė visada laikoma nulinėje
pozicijoje. Tai praverčia programose, kurioms dažnai reikia pasiekti
mažiausią elementą nerūšiuojant sąrašo pilnai::

   >>> from heapq import heapify, heappop, heappush
   >>> data = [1, 3, 5, 7, 9, 2, 4, 6, 8, 0]
   >>> heapify(data)                      # surūšiuojame sąrašą krūvos tvarka
   >>> heappush(data, -5)                 # pridedame naują narį
   >>> [heappop(data) for i in range(3)]  # gauname tris mažiausius narius
   [-5, 0, 1]


.. _tut-decimal-fp:

Dešimtainė slankaus kablelio aritmetika
=======================================

:mod:`decimal` modulis leidžia naudoti :class:`Decimal` duomenų tipą skirta
dešimtainei slankaus kablelio aritmetikai. Jeigu palyginsime šį modulį
su įtaisyta :class:`float` klase skirta dvejetainėms slankaus kablelio
operacijoms, tai ši nauja klasė labai praverčia finansinėms programoms
ir kitiems atvejams, kurie reikalauja tikslios dešimtainės išraiškos,
tikslumo kontrolės, tikslumo apvalinant norint atitikti legalumo
ar reguliavimo reikalavimus, sekimo iki pasirinktos svarbios
dešimtainės vietos, arba programoms, kur vartotojas tikisi, kad
rezultatas sutaps su ranka atliktais skaičiavimais.

Pavyzdžiui, 5% mokesčio skaičiavimas 70 centų telefono sąskaitai duos
skirtingus rezultatus naudojant dešimtainį ir dvejetainį slankų
kablelį. Skirtumas pasidaro akivaizdus, jeigu rezultatas yra
suapvalinamas iki artimiausio cento::

   >>> from decimal import *
   >>> Decimal('0.70') * Decimal('1.05')
   Decimal("0.7350")
   >>> .70 * 1.05
   0.73499999999999999

:class:`Decimal` rezultatas palieka paskutinį nulį, automatiškai
nurodantį keturių vietų po kablelio svarbą iš dviejų daugiklių su dviem
svarbiomis vietomis po kablelio. Dešimtainis skaičiavimas atspindį
matematiką atliekamą ranka ir padeda išvengti problemų, kurios kyla
kai dvejetainis slankus kablelis negali tiksliai atspindėti
dešimtainių kiekių.

Tiksli reprezentacija leidžia :class:`Decimal` klasei atlikti modulio
skaičiavimus ir lygybės testus, kurie nėra įmanomi naudojant dvejetainį
slankų kablelį::

   >>> Decimal('1.00') % Decimal('.10')
   Decimal("0.00")
   >>> 1.00 % 0.10
   0.09999999999999995

   >>> sum([Decimal('0.1')]*10) == Decimal('1.0')
   True
   >>> sum([0.1]*10) == 1.0
   False

:mod:`decimal` modulis leidžia atlikti aritmetines operacijas su tokiu tikslumu
kokio reikia::

   >>> getcontext().prec = 36
   >>> Decimal(1) / Decimal(7)
   Decimal("0.142857142857142857142857142857142857")
