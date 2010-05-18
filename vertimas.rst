.. _vertimas:

********
Vertimas
********

.. vertimas::

Tikslas
=======

Tikslas yra labai paprastas: išversti kažkiek informacijos apie Python'ą
į Lietuvių kalbą. Tikrai nesiekiama išversti visos Python'o dokumentacijos (bet
jei taip ir atsitiks, tarkim per 50 metų, nematau nieko tame blogo).

2009-03-01 – pradėtas versti Python'o vadovėlis (tutorial) ir terminų žodynėlis (glossary).

2010-02-10 – pakeista vertimo tvarka

Kaip prisidėti?
===============

Dokumentacija bus verčiama naudojantis bitbucket.org sistemoje
sukurta Mercurial repozitorija: http://bitbucket.org/Dalius/python-tutorial-lt/

Susikurkite paskyrą http://bitbucket.org arba prisijunkite ten naudodamiesi
OpenId (jūs žinoma rinksitės šį variantą!). Tada jums reikės šakutinti (kaip
teisingai verčiasi fork'inti?) python-tutorial-lt repozitoriją ir jeigu
norėsite, kad jūsų vertimas būtų įtrauktas į pagrindinę repozitoriją tiesiog
mane informuokite (galite tai padaryti paštu dalius@sandbox.lt).

Tiesa sakant, jūs neprivalote naudotis bitbucket.org, bet tai gali būti
greitesnis ir paprastesnis būdas.

Šiuo metu angliški failai imami iš pagrindinės Python'o repozitorijos
ir tiesiog verčiami: http://svn.python.org/projects/python/trunk/Doc/.
Jei jūs norite versti kažką kito negu tai, kas dabar yra repozitorijoje,
paanalizuokite Python'o dokumentaciją. Tiesa sakant, griežtų reikalavimų
nėra, kad reikia versti būtent iš Python'o dokumentacijos.

Jei neaišku kaip versti žodį pasitikrinkite viename iš šių šaltinių:
:ref:`glossary` arba http://www.likit.lt/en-lt/angl.html.

Kaip testuoti savo vertimą?
===========================

Aš naudoju tokį būdą::

    cd projects
    hg clone http://bitbucket.org/ianb/virtualenv/
    python virtualenv/virtualenv.py pytut
    cd pytut
    ./bin/sudo easy_install Sphinx
    hg clone http://bitbucket.org/Dalius/python-tutorial-lt/
    ./bin/sphinx-build -b html python-tutorial-lt/ pytut

Vertėjai
========

Jei ruošiatės versti kažkurį failą prieš tai darydami pridėkite
failo, kurį versite, vardą ir savo inicialus.

* glossary.rst – Dalius Dobravolskas
* tutorial\index.rst – Dalius Dobravolskas
* tutorial\appetite.rst – Maksim Norkin
* tutorial\classes.rst – Dalius Dobravolskas
* tutorial\controlflow.rst –
* tutorial\datastructures.rst –
* tutorial\errors.rst – Maksim Norkin
* tutorial\floatingpoint.rst –
* tutorial\inputoutput.rst –
* tutorial\interactive.rst – Armandas Jarušauskas
* tutorial\interpreter.rst –
* tutorial\introduction.rst – Adomas Paltanavičius
* tutorial\modules.rst – sirex
* tutorial\stdlib2.rst –
* tutorial\stdlib.rst –
* tutorial\whatnow.rst –
