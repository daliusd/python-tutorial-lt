.. _vertimas:

********
Vertimas
********

.. vertimas::

Tikslas
=======

Tikslas yra labai paprastas: išversti kažkiek informacijos apie Pitoną
į Lietuvių kalbą. Tikrai nesiekiama išversti visos Pitono dokumentacijos (bet
jei taip ir atsitiks, tarkim per 50 metų, nematau nieko tame blogo).

2009-03-01 – pradėtas versti Pitono vadovėlis (tutorial) ir terminų žodynėlis (glossary).

Kaip prisidėti?
===============

Dokumentacija bus verčiama naudojantis bitbucket.org sistemoje
sukurta Mercurial repozitorija: http://bitbucket.org/Dalius/python-tutorial-lt/

Susikurkite paskyrą http://bitbucket.org arba prisijunkite ten naudodamiesi
OpenId (jūs žinoma rinksitės šį variantą!). Praneškite man savo vartotojo
vardą paštu (dalius@sandbox.lt). Per kažkiek laiko jus pridėsiu prie
python-tutorial-lt repozitorijos vartotojų. Tada susikurkite SSH raktą ir
klonuokite repozitoriją::

    hg clone ssh://hg@bitbucket.org/[vartotojo-vardas]/python-tutorial-lt/

Šiuo metu angliški failai imami iš pagrindinės Pitono repozitorijos
ir tiesiog verčiami: http://svn.python.org/projects/python/trunk/Doc/.
Jei jūs norite versti kažką kito negu tai, kas dabar yra repozitorijoje,
paanalizuokite Pitono dokumentaciją. Tiesa sakant, griežtų reikalavimų
nėra, kad reikia versti būtent iš Pitono dokumentacijos.

Dar vienas prašymas: būtų šaunu, kad pavyzdžius skaitytojams
duotumėte išbandyti http://py.sandbox.lt (žinoma, kur yra prasmės).

Kaip naudotis sphinx'u?
=======================

Tiesa sakant, dar nežinau, bet man suveikė toks variantas::

    sudo easy_install Sphinx
    sphinx-build -b html python-tutorial-lt/ pytut

Vertėjai
========

Jei ruošiatės versti kažkurį failą prieš tai darydami pridėkite
failo, kurį versite, vardą ir savo inicialus.

* glossary.rst – Dalius Dobravolskas
* tutorial\index.rst – Dalius Dobravolskas
* tutorial\appetite.rst – Maksim Norkin
* tutorial\classes.rst –
* tutorial\controlflow.rst –
* tutorial\datastructures.rst –
* tutorial\errors.rst –
* tutorial\floatingpoint.rst –
* tutorial\inputoutput.rst –
* tutorial\interactive.rst –
* tutorial\interpreter.rst –
* tutorial\introduction.rst –
* tutorial\modules.rst –
* tutorial\stdlib2.rst –
* tutorial\stdlib.rst –
* tutorial\whatnow.rst –
