.. _tut-fp-issues:

******************************************************
Slankaus Kablelio Aritmetika: Problemos ir Apribojimai
******************************************************

.. sectionauthor:: Tim Peters <tim_one@users.sourceforge.net>


Slankaus kablelio skaičiai kompiuterio atmintyje yra reprezentuojami
kaip dvejetainės dalys. Pavyzdžiui, dešimtainis skaičius::

   0.125

yra dešimtainių dalių suma 1/10 + 2/100 + 5/1000. Tuo tarpu skaičius
užrašytas dvejetainėje formoje::

   0.001

yra lygus 0/2 + 0/4 + 1/8. Šie du skaičiai yra lygis. Vienintelis
skirtumas tarp jų yra toks, kad pirmasis yra parašytas dešimtainėje
sistemoje, o antrasis dvejetainėje.

Nelaimei, dauguma realių dešimtainių skaičių negali būti tiksliai
pavaizduoti dvejetainėje formoje. To pasekmė yra tokia, kad
dauguma dešimtainių skaičių yra tik apytiksliai išreiškiami
dvejetaine forma laikoma kompiuteryje.

Problemą iš pradžių lengviau suprasti dešimtainėje sistemoje. Tarkime turime
1/3. Apytiksliai dešimtainėje sistemoje tai galima užrašyti kaip::

   0.3

arba, geriau, ::

   0.33

arba, dar geriau, ::

   0.333

ir t.t. Nesvarbu kiek skaičių jūs užrašysite, rezultatas niekada nebus tiksliai
lygus 1/3, bet tik bus tikslesnė 1/3 aproksimacija.

Tuo pačiu būdu, nesvarbu kiek dvejetainio skaičius skaitmenų naudosite, dešimtainė
reikšmė 0.1 negali būti tiksliai pavaizduota dvejetainėje sistemoje.
Dvejetainėje sistemoje 1/10 yra amžinai pasikartojanti seka::

   0.0001100110011001100110011001100110011001100110011...

Sustojate ties tam tikru skaitmeniu ir jūs turite apytikslę reikšmę. Štai
todėl jūs matote tokius dalykus::

   >>> 0.1
   0.10000000000000001

Tai yra būtent tai, ką jūs matysite jei įvesite 0.1 reikšmę Python'e.
Aišku, galbūt jūs matysite kitokį vaizdą, nes skirtingi kompiuteriai
gali naudoti skirtingą bitų skaičių laikyti slankaus kablelio skaičius.
Python'as atspausdina dvejetainės aproksimacijos dešimtainėje formoje.
Jeigu Python'as turėtų atspausdinti tikrą dešimtainę 0.1 reikšmę,
jis turėtų parodyti::

   >>> 0.1
   0.1000000000000000055511151231257827021181583404541015625

Python'as naudoja įtaisytą funkciją :func:`repr`, kad parodytų objekto eilutės
versiją. Slankaus kablelio skaičiams ``repr(float)`` suapvalina
tikrą dešimtainę reikšmę iki 17 ženklo::

   0.10000000000000001

``repr(float)`` parodo 17 ženklų po kablelio kadangi to pakanka daugeliui
kompiuterių, todėl ``eval(repr(x)) == x`` yra teisinga visiems
slankaus kablelio *x*, bet jeigu skaičius bus suapvalintas iki 16 skaičiaus
po kablelio tai nebebus tiesa.

Pastebėsime, kad taip tiesiog veikia dvejetainiai slankaus kablelio skaičiai ---
tai nėra Python ar klaida jūsų kode. Jūs galite pamatyti tokį patį
veikimą ir kitose kalbose, kurios palaiko aparatinę slankaus kablelio
aritmetiką. Nors kai kurios kalbos gali ir neparodyti *skirtumo*
įprastai.

Python'o įtaisytoji funkcija :func:`str` panaudoja tik 12 skaičių po kablelio ir
jūs dažniausiai ją ir norėtsite naudoti. ``eval(str(x))`` tikriausiai
neatgamins *x* reikšmės, bet rezultatas gali būti mielesnis akiai::

   >>> print str(0.1)
   0.1

Labai svarbu suprasti, kad tai yra iliuzija: reikšmė mašinoje nėra tiksliai
1/10 --- jūs tiesiog apvalinate tikrąją kompiuterio reikšmę.

Iš čia seka kita siurprizai. Pavyzdžiui, pamatę::

   >>> 0.1
   0.10000000000000001

jūs galite užsimanyti panaudot :func:`round` (apvalinimo) funkciją, taip tikėdamiesi
gauti reikšmę su vienu skaičiumi po kablelio. Tačiau tai nieko nepakeis::

   >>> round(0.1, 1)
   0.10000000000000001

Problema yra ta, kad slankaus kablelio formoje išsaugota "0.1" reikšmė
jau yra geriausia įmanoma dvejetainė 1/10 aproksimacija, taigi bandymas
ją apvalinti nieko nepakeis --- ji jau buvo tokia gera kokia tik gali
būti.

Kita problema yra, tokia, kad 0.1 nėra tiksliai 1/10, taigi
susumavus 0.1 dešimt kartų negausime tiksliai 1.0::

   >>> sum = 0.0
   >>> for i in range(10):
   ...     sum += 0.1
   ...
   >>> sum
   0.99999999999999989

Dvejetainė slankaus kablelio aritmetika slepia ne vieną tokį siurpriza.
Problema su "0.1" detaliau paaiškinta žemiau skyriuje "Atvaizdavimo
Klaida". `The Perils of Floating Point <http://www.lahey.com/float.htm>`_
rasite daugiau dažnų siurprizų pavyzdžių.

Kaip galiausiai sakoma "lengvų atsakymų nėra". Visgi nebūkite per daug
atsargūs dirbdami su slankiu kableliu. Klaidos Python'e kylančios
su slankiu kableliu yra paveldėtos iš aparatinės įrangos ir
daugumoje mašinų klaidos galimybė yra ne didesnė negu
1 iš 2\*\*53.  Tai daugiau negu adekvatu daugumai užduočių, bet jūs turite
prisiminti, kad tai ne dešimtainė aritmetika ir kad kiekviena
slankaus kablelio operacija prideda apvalinimo klaidą.

Nors egzistuoja patologiniai atvejai, dauguma atvejų jūs matysite
tą rezultatą, kurio ir tikėjotės, jei galiausiai rezultatą
suapvalinsite iki norimo skaičiaus po kablelio.
Dažniausiai pakanka :func:`str` funkcijos, o jei reikia daugiau
galimybių naudokite :meth:`str.format` metodą.

.. _tut-fp-error:

Atvaizdavimo Klaida
===================

Šis skyrius paaiškina "0.1" pavyzdį detaliau ir paaiškina, kaip jūs galite
atlikti tokių atvejų analizę patys. Darome prielaidą, kad su slankaus
kablelio dvejetainiais skaičiais skaitytojas yra susipažinęs.

:dfn:`Atvaizdavimo klaida` reiškia, kad kai kurie (tiesa sakant, dauguma)
dešimtainių trupmenų negali būti išreikštos kaip dvejetainės trupmenos.
Tai yra pagrindinė priežastis kodėl Python'as (Perl, C, C++, Java, Fortran ir
daug kitų kalbų) dažnai tiksliai neatvaizduos dešimtainio skaičiaus
kaip jūs tikitės::

   >>> 0.1
   0.10000000000000001

Kodėl tai atsitinka?  1/10 nėra tiksliai reprezentuojama kaip dvejetainė trupmena.
Beveik visos mašinos šiandien (2000 Lapkritis) naudoja IEEE-754 slankaus kablelio
aritmetiką ir beveik visos platformos slankaus kablelio skaičius Python'e
naudoja kaip "dvigubu tikslumo" IEEE-754.  754 naudoja 53 tikslumo bitus,
taigi 0.1 sukonvertuojamas į artimiausią trupmeną *J*/2**\ *N* formoje,
kur *J* yra sveikasis skaičius sudarytas iš 53 bitų. Perrašius::

   1 / 10 ~= J / (2**N)

kaip ::

   J ~= 2**N / 10

ir paėmus, kad *J* turi lygiai 53 bitus (yra ``>= 2**52`` bet ``< 2**53``),
tinkamiausia reikšmė *N* yra 56::

   >>> 2**52
   4503599627370496L
   >>> 2**53
   9007199254740992L
   >>> 2**56/10
   7205759403792793L

Taip jau yra, kad 56 yra vienintelė *N* reikšmė, kurią naudojant *J* turi tiksliai 53 bits.
Tinkamiausia *J* reikšmė tada yra suapvalintas dalmuo::

   >>> q, r = divmod(2**56, 10)
   >>> r
   6L

Kadangi liekana yra didesnė negu 10 pusė, geriausia aproksimacija
gaunama apvalinant viršun::

   >>> q+1
   7205759403792794L

Taigi geriausia 1/10 aproksimacija 754 formoje yra 2\*\*56, arba ::

   7205759403792794 / 72057594037927936

Pastebėkite, kad dėl to jog mes ją suapvalinome aukštyn, tai yra šiek tiek
daugiau negu 1/10. Jei mes nebūtumėm apvalinę dalmuo būtų buvęs truputi
mažesnis negu 1/10. Bet jokiu būtų jis negali būti *tiksliai* lygus
1/10.

Taigi kompiuteris niekada "nemato" 1/10. Tai ką jis mato yra tiksli trupmena
duota aukščiau. Geriausia 254 dviguba aproksimacija, kurią jis gali gauti yra::

   >>> .1 * 2**56
   7205759403792794.0

Jei mes padaugintumėme tą trupmeną iš 10\*\*30 mes galėtumėme pamatyti (nukirptą)
reikšmę iki 30 ženklų po kablelio::

   >>> 7205759403792794 * 10**30 / 2**56
   100000000000000005551115123125L

kas reiškia, jog tiksli reikšmė laikoma kompiuteryje apytiksliai yra lygi
0.100000000000000005551115123125.  Suapvalinus ją iki 17 ženklų po kablelio
gauname 0.10000000000000001, kurią ir rodo Python'as.
(tiksliau, taip bus rodoma ant bet kurios 754-formą palaikančios platformos,
kurioje C biblioteka padaro geriausią įmanomą įvesties ir išvesties
konvertavimą --- jūsų sistemą gali būti kitokia!).
