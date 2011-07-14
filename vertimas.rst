.. _vertimas:

********
Vertimas
********

Tikslas
=======

Tikslas yra labai paprastas: išversti kažkiek informacijos apie Python'ą
į lietuvių kalbą. Tikrai nesiekiama išversti visos Python'o dokumentacijos (bet
jei taip ir atsitiks, tarkim per 50 metų, nematau nieko tame blogo).

Tikslinė auditorija
-------------------

Kai buvau mažas ir kvailas geros literatūros apie programavimą lietuvių kalba
rasti buvo labai sunku. Nei anglų nei rusų kalbos nemokėjau tiek, kad galėčiau
skaityti ir tuo labiau suprasti. Man išties pasisekė, kad tuo metu jau
egzistavo `Jaunųjų Programuotojų Mokykla <http://aldona.mii.lt/pms/jpm/>`__,
taigi jie man davė pirmą taip reikalingą spyrį, kad pradėčiau gaudytis kas kur
kaip ir su kuo valgoma. Vėliau susidarė draugų ratas ir atsirado literatūros
tiek anglų tiek rusų kalba (rusiškos deja taip ir nesupratau iš esmės).

Taigi pirmiausiai šis vertimas skirtas žmonėms, kurie dar nemoka anglų kalbos
(galbūt tik pradeda mokytis) ir jau tikrai nebemoka rusiškai (tokia tad ta
Nepriklausomybės karta). Nebijokite, jei visko nesuprasite iš pradžių (šis
vadovėlis išties yra labai techniškas). Jei kas neaišku visada galite
paklausti žinančių žmonių. Jų galite rasti
`Python el. konferencijoje <http://www.konferencijos.lt/mailman/listinfo/python>`__.

O vėliau jums tikriausiai vistiek teks išmokti anglų kalbą --- iš kitos pusės,
tai nebus taip jau ir sudėtinga, kai būsite pagauti azarto ir reikės išsiaiškinti
kaip reikia padaryti vieną ar kitą dalyką.

Beje, jei nepatenkate į aukščiau aprašytą tikslinę auditoriją, tai dar
nereiškia, kad šis vadovėlis jums netinka.

Padėkos žodis
-------------

Dėkoju prie vertimo vienaip ar kitaip prisidėjusiems žmonėms: Adomui Paltanavičiui,
Armandui Jarušauskui, Mantui Zimnickui, Maksim Norkin, Vytautui Šalteniui,
Martynui Jociui, Martynui Sklizmantui, Albertui Agėjavui, Mariui Gedminui,
Jurgiui Pralgauskiui, Agniui Vasiliauskui, Audriui Kažukauskui, Bogdan M. Maryniuk,
Vakarui Liutinkevičiui ir kitiems asmenims, kurie vienaip ar kitaip prisidėjo
prie vertimo.

Jeigu norite prisidėti prie vertimo visada tai galite padaryti. Kaip? Perskaitykite
kitame skyriuje.

Kaip prisidėti?
===============

Prisidėti galima įvairiais būdais: naujais vertimais, pataisymais ir t.t.
Pataisymus galite tiesiog atsiųsti man, bet jei norite tai galite daryti
ir kaip tikri programuotojai.

Dokumentacija yra verčiama naudojantis bitbucket.org sistemoje
sukurta Mercurial repozitorija: http://bitbucket.org/Dalius/python-tutorial-lt/

Susikurkite paskyrą http://bitbucket.org arba prisijunkite ten naudodamiesi
OpenId (jūs žinoma rinksitės šį variantą!). Tada jums reikės šakoti (kaip
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

Aš naudoju tokį būdą (Ubuntu Linux sistemoje)::

    cd projects
    hg clone http://bitbucket.org/ianb/virtualenv/
    python virtualenv/virtualenv.py pytut
    cd pytut
    ./bin/easy_install Sphinx
    hg clone http://bitbucket.org/Dalius/python-tutorial-lt/
    ./bin/sphinx-build -b html python-tutorial-lt/ pytut

Jei norite sugeneruoti pdf'ą taip pat reikės įdiegti rst2pdf biblioteką::

    ./bin/easy_install rst2pdf

Prieš tai jums gali tekti įsirašyti kelis papildomus paketus::

    sudo aptitude install build-essential
    sudo aptitude install python-dev

Kitas variantas – naudoti buildout (Ubuntu Linux sistemoje)::

    cd projects
    hg clone http://bitbucket.org/vakaras/python-tutorial-lt
    make bootstrap
    make buildout

Kai darbo aplinka paruošta, galima susigeneruoti HTML (PDF) ir iš karto jį
atverti::
    
    make show-html                      # Sugeneruoja HTML ir atveria 
                                        # naršyklėje.
    make show-pdf                       # Sugeneruoja PDF ir jį parodo.

    make html                           # Tiesiog sugeneruoja HTML.
    make pdf                            # Tiesiog sugeneruoja PDF.

Taip pat galima dirbti ir be virtualenv ar buildout aplinkos. Įdiekite 
reikalingas bibliotekas tiesiai į sistemą::

    sudo apt-get install python-sphinx rst2pdf

Naudokitės paruoštu make failu::

    make && firefox ./html/index.html

Šio būdo trūkumas yra toks, kad python-sphinx biblioteka yra
pakankamai sena (be lietuviškų vertimų).

Vertėjai
========

Čia surašyti asmenys, kurie prisidėjo prie kiekvieno skyriaus vertimo:

* glossary.rst – Dalius Dobravolskas
* tutorial\\index.rst – Dalius Dobravolskas
* tutorial\\appetite.rst – Dalius Dobravolskas
* tutorial\\interpreter.rst – Armandas Jarušauskas
* tutorial\\introduction.rst – Adomas Paltanavičius
* tutorial\\controlflow.rst – Dalius Dobravolskas
* tutorial\\datastructures.rst – Adomas Paltanavičius, Dalius Dobravolskas
* tutorial\\modules.rst – sirex, Dalius Dobravolskas
* tutorial\\inputoutput.rst – Dalius Dobravolskas
* tutorial\\errors.rst – Dalius Dobravolskas
* tutorial\\classes.rst – Dalius Dobravolskas
* tutorial\\stdlib.rst – Dalius Dobravolskas
* tutorial\\stdlib2.rst – Dalius Dobravolskas
* tutorial\\whatnow.rst – Dalius Dobravolskas
* tutorial\\floatingpoint.rst – Dalius Dobravolskas
