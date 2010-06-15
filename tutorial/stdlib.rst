.. _tut-brieftour:

****************************************
Trumpa Standartinės Bibliotekos Apžvalga
****************************************


.. _tut-os-interface:

Operacinės Sistemos Sąsaja
==========================

:mod:`os` modulis suteikia galimybę bendrauti su operacine sistema::

   >>> import os
   >>> os.system('time 0:02')
   0
   >>> os.getcwd()      # grąžina dabartinę darbinę direktoriją
   'C:\\Python26'
   >>> os.chdir('/server/accesslogs')

Būtinai naudokite ``import os`` stilių vietoje ``from os import *``.  Tai
neleis funkcijai :func:`os.open` paslėpti įtaisytos funkcijos :func:`open`,
kuri dirba visai kitaip.

.. index:: builtin: help

Įtaisytos funkcijos :func:`dir` ir :func:`help` yra naudingos
interaktyviai dirbant su dideliais moduliais kaip :mod:`os`::

   >>> import os
   >>> dir(os)
   <returns a list of all module functions>
   >>> help(os)
   <returns an extensive manual page created from the module's docstrings>

Kasdienam darbui su failais ir direktorijomis modulis :mod:`shutil`
suteikia aukštesnio lygio sąsają, kurią lengviau naudoti::

   >>> import shutil
   >>> shutil.copyfile('data.db', 'archive.db')
   >>> shutil.move('/build/executables', 'installdir')


.. _tut-file-wildcards:

Failų Paieška
=============

:mod:`glob` modulyje galima rasti funkciją, kuri leidžią į sąrašą
iš direktorijos surinkti norimus failus nurodant tų failų
vardo požymius::

   >>> import glob
   >>> glob.glob('*.py')
   ['primes.py', 'random.py', 'quote.py']


.. _tut-command-line-arguments:

Komandinės Eilutės Argumentai
=============================

Pagalbinei skriptai dažnai turi dirbti su komandinės eilutės argumentais.
Šiek argumentai laikomi modulio :mod:`sys` atributų sąraše *argv*.
Pavyzdžiui jei įvykdysite komandą ``python demo.py one two three``
komandinėje eilutėje gausite::

   >>> import sys
   >>> print sys.argv
   ['demo.py', 'one', 'two', 'three']

:mod:`getopt` modulis sutvarko *sys.argv* naudodamas Unix'ės :func:`getopt`
funkcijos susitarimą.  Daugiau galimybių ir lankstumo dirbant
su komandine eilute gali suteikti :mod:`optparse` modulis.


.. _tut-stderr:

Klaidų Išvesties Nukreipimas ir Programos Pabaigimas
====================================================

:mod:`sys` modulyje taip pat galima rasti atributus *stdin*, *stdout*, and *stderr*.
Pastarasis yra naudingas norint parodyti klaidų pranešimus netgi tada
kai *stdout* (standartinė išvestis) yra nukreipta (t.y. nematoma vartotojui)::

   >>> sys.stderr.write('Warning, log file not found starting a new one\n')
   Warning, log file not found starting a new one

Pats tiesiausias būdas pabaigti skripto veikimą yra naudoti ``sys.exit()``.


.. _tut-string-pattern-matching:

Eilučių Rašto Atpažinimas
=========================

:mod:`re` modulis suteikia galimybę naudotis reguliariais reiškiniais
(ang. regular expression) sudėtingesniam eilučių tvarkymui.
Sudėtingam rašto atpažinimui ir manipuliacijoms, reguliarūs
reiškiniai siūlo trumpą ir optimizuotą sprendimą::

   >>> import re
   >>> re.findall(r'\bf[a-z]*', 'which foot or hand fell fastest')
   ['foot', 'fell', 'fastest']
   >>> re.sub(r'(\b[a-z]+) \1', r'\1', 'cat in the the hat')
   'cat in the hat'

Jeigu reikia paprasto sprendimo, rekomenduojama naudoti eilučių metodus,
kuriuos paprasčiau skaityti ir derinti::

   >>> 'tea for too'.replace('too', 'two')
   'tea for two'

Vertėjo pastaba: iš savo patirties galiu pasakyti, kad reguliarių
reiškinių reikia vengti. Yra toks posakis: žmogus turėjo problemą,
pagalvojo, kad reguliarūs reiškiniai padės ją išspręsti --- dabar
jis turi dvi problemas. Yra priemonių, kurios teksto analizei
tinka daug labiau (pvz.: pyparsing). Vėlgi universalaus atsakymo,
ką geriausiai naudoti nėra, nes jeigu jums reikia kažko veikiančio
tikrai greitai reguliarūs reiškiniai gali būti ir geriausias
pasirinkimas.


.. _tut-mathematics:

Matematika
==========

:mod:`math` modulis leidžia prieiti prie C bibliotekos slankaus
kablelio funkcijų::

   >>> import math
   >>> math.cos(math.pi / 4.0)
   0.70710678118654757
   >>> math.log(1024, 2)
   10.0

:mod:`random` modulis leidžia dirbti su atsitiktiniu pasirinkimu::

   >>> import random
   >>> random.choice(['apple', 'pear', 'banana'])
   'apple'
   >>> random.sample(xrange(100), 10)   # atsitiktinis parinkimas
   [30, 83, 16, 4, 8, 81, 41, 50, 18, 33]
   >>> random.random()    # atsitiktinis realusis skaičius
   0.17970987693706186
   >>> random.randrange(6)    # atsitiktinis sveikas skaičius iš pasirinktos atkarpos
   4


.. _tut-internet-access:

Interneto Prieiga
=================

Egzistuoja ne vienas modulis priėjimui prie interneto ir interneto protokolų
valdymui. Du paprasčiausi yra :mod:`urllib2` duomenų parsisiuntimui pagal
nurodytą URL ir :mod:`smtplib` laiškų siuntimui::

   >>> import urllib2
   >>> for line in urllib2.urlopen('http://tycho.usno.navy.mil/cgi-bin/timer.pl'):
   ...     if 'EST' in line or 'EDT' in line:  # look for Eastern Time
   ...         print line

   <BR>Nov. 25, 09:43:32 PM EST

   >>> import smtplib
   >>> server = smtplib.SMTP('localhost')
   >>> server.sendmail('soothsayer@example.org', 'jcaesar@example.org',
   ... """To: jcaesar@example.org
   ... From: soothsayer@example.org
   ...
   ... Beware the Ides of March.
   ... """)
   >>> server.quit()

(Pastaba: antrasis pavyzdys reikalauja lokalaus pašto serverio veikiančio lokaliai)


.. _tut-dates-and-times:

Datos ir Laikai
===============

:mod:`datetime` modulyje rasite klasių datos ir laiko manipuliavimui.
Nors datos ir laiko aritmetines operacijos yra palaikomos,
pagrindinis tikslas yra efektyvus informacijos ištraukimas duomenų
formatavimui ir išvedimui. Modulis taip pat palaiko objektus, kurie
supranta laiko zonas ::

   # dates are easily constructed and formatted
   >>> from datetime import date
   >>> now = date.today()
   >>> now
   datetime.date(2003, 12, 2)
   >>> now.strftime("%m-%d-%y. %d %b %Y is a %A on the %d day of %B.")
   '12-02-03. 02 Dec 2003 is a Tuesday on the 02 day of December.'

   # dates support calendar arithmetic
   >>> birthday = date(1964, 7, 31)
   >>> age = now - birthday
   >>> age.days
   14368


.. _tut-data-compression:

Duomenų Suspaudimas
===================

Dažni duomenų archyvavimo ir suspaudimo formatai yra tiesiog palaikomi
modulių, pvz.: :mod:`zlib`, :mod:`gzip`, :mod:`bz2`, :mod:`zipfile` ir
:mod:`tarfile`. ::

   >>> import zlib
   >>> s = 'witch which has which witches wrist watch'
   >>> len(s)
   41
   >>> t = zlib.compress(s)
   >>> len(t)
   37
   >>> zlib.decompress(t)
   'witch which has which witches wrist watch'
   >>> zlib.crc32(s)
   226805979


.. _tut-performance-measurement:

Našumo Matavimas
================

Kai kurie Python vartotojai nori žinoti kaip skirtingi tos pačios problemos
sprendimai paveikia našumą. Python'e yra priemonių matavimui, kurios
šiuos klausimus atsako iškart.

Pavyzdžiui, argumentų sukeitimui galime norėti naudoti kortežų išpakavimo
ir supakavimo savybes vietoje tradicinio būdo sukeisti argumentus
vietomis. :mod:`timeit` modulis greitai parodytis maža našumo
privalumą::

   >>> from timeit import Timer
   >>> Timer('t=a; a=b; b=t', 'a=1; b=2').timeit()
   0.57535828626024577
   >>> Timer('a,b = b,a', 'a=1; b=2').timeit()
   0.54962537085770791

Jeigu :mod:`timeit` modulis yra labai tikslus matuojant mažas operacijas, :mod:`profile`
ir :mod:`pstats` moduliai gali būti naudojami dideliuose kodo blokuose norint
identifikuoti kritines sekcijas.


.. _tut-quality-control:

Kokybės Kontrolė
================

Vienas būdas rašyti aukštos kokybės programinę įrangą yra testų
rašymas kiekvienas funkcijai, kai ji yra kuriama, ir jų dažnas
vykdymas kūrimo procese.

:mod:`doctest` modulis suteikia priemones modulių peržiūrai ir testų,
kurie surašyti į dokumentacijos eilutes, tikrinimui. Testavimo
konstrukcija yra paprasta: tereikia tipinį kvietimą ir jo
rezultatus iš python interpretatoriaus perkelti į dokumentacijos
eilutę. Taip dokumentacijoje vartotojui pateikia pavyzdžiai ir
jei leidžia doctest moduliui užtikrinti, kad kodas sutampa su
dokumentacija::

   def average(values):
       """Computes the arithmetic mean of a list of numbers.

       >>> print average([20, 30, 70])
       40.0
       """
       return sum(values, 0.0) / len(values)

   import doctest
   doctest.testmod()   # automatically validate the embedded tests

:mod:`unittest` modulio naudojimas nėra toks paprastas kaip :mod:`doctest` modulio,
bet jis leidžia rašyti detalesnius testus, kuriuos galima laikyti atskirame
faile::

   import unittest

   class TestStatisticalFunctions(unittest.TestCase):

       def test_average(self):
           self.assertEqual(average([20, 30, 70]), 40.0)
           self.assertEqual(round(average([1, 5, 7]), 1), 4.3)
           self.assertRaises(ZeroDivisionError, average, [])
           self.assertRaises(TypeError, average, 20, 30, 70)

   unittest.main() # Calling from the command line invokes all tests


.. _tut-batteries-included:

Baterijos Pridedamos
====================

Python'as laikosi "baterijos pridedamos" filosofijos. Tai geriausiai matoma
žiūrint į rafinuotas ir užtikrintas didesnių pakuočių galimybes. Pavyzdžiui:

* :mod:`xmlrpclib` ir :mod:`SimpleXMLRPCServer` moduliai nuotolinį
  procedūrų kvietimą padaro trivialia užduotimi. Nepaisant modulių
  vardų, jums nereikia nieko žinoti apie XML ar su juo dirbti
  tiesiogiai.

* :mod:`email` pakuotė yra biblioteka darbui su el. laiškų pranešimais,
  įskaitant ir MIME ir kitus RFC 2822-paremtus žinučių dokumentus. Skirtingai
  nuo :mod:`smtplib` ir :mod:`poplib`, kurie iš tikro gauna ir siunčia
  pranešimus, ši pakuotė turi pilną įrankinę sudėtingų pranešimų struktūrų (taip pat
  priedų) kūrimui ir iškodavimui, taip pat internetiniam kodavimui
  ir antraščių protokolų valdymui.

* :mod:`xml.dom` ir :mod:`xml.sax` pakuotės pilnai palaiko šį populiarų
  duomenų pasikeitimo formatą. :mod:`csv` modulis palaiko dažno
  duombazių formato skaitymą ir rašymą. Kartų, šie moduliai ir
  pakuotės labai supaprastina duomenų pasikeitimą tarp python'o
  programų ir kitų priemonių.

* Internacionalizacija yra palaikoma naudojant ne vieną modulį
  tarp kurių yra  :mod:`gettext`, :mod:`locale` ir the :mod:`codecs`
  pakuotė.
