// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#f2542d")

#show: template.with(
  title: "Financieel Management in de Publieke Sector",
  subtitle: "Samenvatting + aantekeningen",
  short-title: "Public Finance Samenvatting",
  venue: [ar#text(fill: red.darken(20%))[X]iv],
  // This is relative to the template file
  // When importing normally, you should be able to use it relative to this file.
  
  theme: defaultColor,
  authors: (
    (
      name: "Manuel Mol                                                                                                              . ",
    ),
  ),
  kind: "Samenvatting",
  abstract: (
    (title: "Samenvatting", content: lorem(100)),
  ),
  open-access: true,
  margin: (
    (
      title: "Key Points",
      content: [
        - #lorem(10)
        - #lorem(5)
        - #lorem(7)
      ],
    ),
  ),
  font-face: "Open Sans"
)
#set page(
  margin: (left: 2in, right: 0.8in), paper: "us-letter"
)
#let marginRatio = 0.8
#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}

#set-page-properties()
#show terms: it => [
  #margin-note(rect: default-rect, side: left, stroke: 0pt)[#text(defaultColor, weight: 600, size: 10pt)[#it.children.first().term:]\ #it.children.first().description] 
]

#set heading(numbering: none)

#show heading: set text(defaultColor, weight: "medium")

// = Samenvatting <samenvatting>
// Cijfer is 100% tentamen. Alles gaat via artikelen

// // You can put this after the content that fits on the first page to set the margins back to full-width
// = Tentamenvragen:
// - Principaal-agent theorie/probleem / Common pool-probleem
// - Tentamenvraag over verbetering: gebruik transparantie

= Introductie <introductie>

Het gaat vooral om bedrijfseconomische instrumenten in de context van de publieke sector. Algemene economie houdt een belangrijke rol. 
/ Financieel management: Planning en beheersing van financiële taken en transacties. Niet de *wat* en *waarom* maar de *hoe*

== Markfalen:
Markt faalt als de markt niet optimaal werkt. De overheid houdt dat in de gaten. Collective goederen zijn goederen die niet door de markt worden geleverd. Asymmetrische informatie is ook een reden voor marktfalen.

== Hoe wordt er ingegrepen?
Er zijn een paar manieren waarop er wordt ingegrepen:
- Regulering: De overheid kan regels opleggen.
- Belastingen: De overheid kan belastingen heffen.
- Subsidies: De overheid kan subsidies geven.
- Uitbesteed: De overheid kan dingen uitbesteden.
- Zelf produceren: De overheid kan zelf dingen produceren.
  
== Gaat het ingrijpen goed?
Nee, lang niet altijd. Dit worden *Budgetimperfecties* genoemd. 
/ Budgetimperfecties: Markt imperfecties maar dan in de publieke sector.

== Non-market failures:
Non-market failures zijn falen van de overheid. Dit kan komen door:
- Output slecht gedefinieerd en moeilijk te meten.
- Kwaliteit is moeilijk vast te stellen.
- Geen concurrentie.
- Geen criteria voor stopzetten beleid (vergeten dingen stop te zetten)
- Beloning voor formuleren van probleem en ontwerpen van oplossing. Er wordt niet terug gekeken.
- Politieke conjunctuur: 

== Principaal-agent theorie/probleem:
- Kiezer: Principaal
- Politicus: Agent
- Probleem: politici willen _rents_ (andere doelen dan de kiezer)
- Speelt ook in relatie politici $<->$ ambtenaren
Een oplossing zou een contract kunnen zijn. Dit is lastig, want het is onzeker en complex. Je kan niet alles vastleggen in contracten
/ Open einde regelingen: Begrotingsbesluit waardoor een financiële regeling geen budgettair plafond wordt toegekend

== Praktische voorbeelden:
- Geen verborgen uitgaven/fondsen
- Beperk *open einde regelingen*. 
- Beperk _contingent liabilities_ (a potential liability that may occur in the future)
- Begroot (raam) niet te optimistisch
- Onafhankelijke informatie 
Zie voor meer voorbeelden de slides van _Week 1_.

#pagebreak()

== Fasen:
Er zijn verschillende fasen
1. Planning (besluitvorming)
2. Beheersing (management) controle, uitvoering
3. Verslaggeving
4. Controle en verantwoording

/ Adagium: running a government like a business.
== New Public Management (NPM):
NPM zegt dat methoden en technieken uit de marktsector ook in de publieke sector kunnen worden toegepast. *Adagium*

== _Gevolgen van NPM_:
- Meer nadruk op efficiëntie
- Planning- en budgetteringstechnieken
- Sturen op prestaties
- Meer concurrentie
- Managementtechnieken
- Privatisering
- Terminologie is overgenomen

== _Kritiek op NPM_:
- Meer autonomie $->$ minder democratische controle
- Bureaucratisering
- Fragmentatie van beleid en uitvoering
- Steeds complexere informatie
- Managementcultus
Gevolgen hiervan zijn crisissen en schandalen, en soms wordt er ook minder doelmatig en "goed" gepresteerd.

#pagebreak()
= Hoe werkt het systeem nu? <systeem>
== BBP: Bruto Binnenlands Product
Is niet zo nuttig om over de tijd te vergelijken omdat een verandering kan komen door een verandering in prijs of in hoeveelheid. Daarom is het nuttiger om te kijken naar het _reële BBP_.

== Begrotingssaldo
Financieringssaldo: het tekort of het overschot op de begroting van het Rijk exclusief de aflossing op de staatsschuld, uitgedrukt in geld.
/ Tekortnorm: 3% van het BBP

== Primaire saldo:
Alle overheidsinkomsten min alle overheidsuitgaven exclusief rentebetalingen op de staatsschuld.

== Wanneer is de staats schuld stabiel?
Gelijk aan tekort $S$ delen door groei $G$ van het BBP. $ -S/G = d_0 $ 

== Schulddynamiek:
$ Delta b = (i-g)/(1+g)b_(t-1) - p s_t + d d a_t $

$g$ = groei

/ Annuïteit: jaarlijks gelijk blijvend bedrag om te betalen
== Annuïteit:

== Contante waarde:
Hoeveel moet ik nu op een spaarrekening zetten om over $x$ jaar een bepaald bedrag te hebben?

bvb:
$ 613,91 = 1000/(1+0.05)^10 $
613,91 inleggen om over 10 jaar 1000 te hebben

== Houdbaarheidssaldo:
De contante waarde van alle toekomstige overheidsoverschotten en -tekorten. Bij een houdbaarheidstekort moeten toekomstige generaties betalen voor de huidige generatie.

==  Vermogenssaldo:
Voor financiële gezondheid kijk je naar het vermogenssaldo. Dit is de som van de bezittingen en schulden van de overheid.

== trendmatig begrotingsbeleid:
Begrotingsbeleid dat is gericht op het stabiliseren van de economie op de lange termijn. Dit is een vorm van contracyclisch beleid.

== MTO (middellangetermijnraming):
Een raming van de overheidsfinanciën voor de komende jaren. Dit is een belangrijk instrument voor het begrotingsbeleid.
- Saldo waarbij de schuld stabiel blijft op 60% van het BBP

Is je schuld minder dan 60% van het BBP? Dan mag je een tekort hebben van 1% van het BBP. Is je schuld groter dan 60% van het BBP? Dan moet je een overschot hebben van 0,5% van het BBP.

MTO gehaald? Dan mogen de uitgaven niet sneller stijgen dan de economie groei.
Niet gehaald? Dan moet je *minder* uitgeven.

== Buitensporig tekort:
Buitensporig tekort:
- feitelijk tekort > 3% van het BBP
- begrotingstekort > 3% van het BBP

er is ook een Buitensporig tekort als je schuld > 60% van het BBP

de overschrijding moet met 1/20e per jaar worden verminderd

= Hoe wordt dit systeem? <systeem_later>
Waarom wordt het veranderd? Omdat het te ingewikkeld is. We willen ook zeker weten dat schulden dalen. Bepaalde dingen willen we ook stimuleren. Bijdragen aan anticyclische beleid.

In het nieuwe raamwerk wordt er alleen gestuurd op een uitgavenpad. Er wordt niet meer gestuurd op een tekort. Er wordt ook niet meer gestuurd op een schuld. Er wordt alleen gestuurd op een uitgavenpad.

MTO komt te vervallen. evenals de eis van afname van 1/20e per jaar.

== Uitgavenpad:
/ Netto Primaire uitgaven: Alle ontvangsten min alle uitgaven exclusief rentebetalingen op de staatsschuld.

Alle lidstaten moeten een uitgavenpad opstellen en alle lidstaten moeten een begrotingsinspanning doen. 

== Schuldwaarborg:
schuldratio > 60%:
- tussen 60% en 90%: 0.5% per jaar
- > 90%: 1% per jaar

== Back loading clausule:
Ieder jaar dezelfde inspanning doen. 

== Waarborg:
Als je tekort groter is dan 3% van het BBP, dan moet je een begrotingsinspanning doen van 0.5% van het BBP.

= Budget & Begroting
_A budget is the financial mirror of society’s economic and social choices._ de
financiële gevolgen van genomen beslissingen. 

Functie van de begroting:
- *Afweging (allocatie, keuze)*: laat de overheid toe om prioriteiten te stellen en middelen toe te wijzen aan verschillende beleidsdomeinen
- *Staatsrechtelijk:* de begroting is een wettelijk document dat de toestemming van het parlement vereist
- *Democratisch:* de begroting is een instrument voor de controle van de uitvoerende macht door het parlement
- *Macro-economisch:* de begroting heeft een impact op de economie
- *Beheer:* de begroting is een instrument voor het beheer van de overheidsfinanciën
- *Verantwoording:* de begroting is een instrument voor de verantwoording van de overheid aan de burgers
- *Controle:* de begroting is een instrument voor de controle van de overheid door de burgers

== Waar heeft de begroting betrekking op?
- *Input:* Uitgaven en ontvangsten, kosten en baten 
- *Prestatie/output/programma:* Verantwoord Begroten
- *Outcome/effect:* Zero based budgeting: elk jaar beginnen met een leeg budget

== Wettelijke basis:
- *Grondwet:* de begroting is een wettelijk document
- *Begrotingswet zelf*

== Principaal en agent:
- Agent (kabinet, B&W, GSetc.) stelt begroting op
- Principaal (parlement, gemeenteraad) keurt begroting goed

*EU:*
- Commissie stelt begroting op
- EP keurt goed (meerderheid)
- Raad: unanimiteit

== Regels:
- Volledigheid
- Vergelijkbare maatstaf
- Bruto ramen
- Openbaarheid
- Prealabiliteit
- Periodiciteit
- Onderworpen aan controle

#pagebreak()
== Periodiciteit:
- Meestal: één jaar, kalender jaar
- Rijksbegroting: 4 jaar, 
- EU: 7 jaar, meerjarenbegroting, 

== Begrotingsproces:
De rijksbegroting bestaat uit hoofdstukken. Elk hoofdstuk heeft een eigen minister. 

=== Hoofdstukken:
- De Koning, Staten Generaal, Hoge Colleges van Staat.
- Departementen zoals buitenlandse zaken, defensie, etc.
- Begrotingsfondsen zoals gemeentefonds

=== Miljoenennota: 
toelichting op de rijksbegroting

Derde dinsdag van september: aanbieding begroting(en) aan
Tweede Kamer. Daarna behandeling in de Tweede Kamer. Dan evenetuele wijzigingen en behandeling in de Eerste Kamer.

=== Uitvoering
- *Voorlopige rekening*: verantwoording over het afgelopen jaar (t-1)
- *Voorjaarsnota*: bijstelling van de begroting (t)
- *Begroting*: begroting voor het volgende jaar (t+1)
- *Najaarsnota*: bijstelling van de begroting (t)

#pagebreak()
= Baten, lasten en belastingfaciliteiten:
Het wordt bijna overal gebruikt, behalve bij het Rijk en de EU. Bij hun is het kas en verplichtingen. 

Alles gaat om vermogen. Het gaat om je netto vermogen. Er zijn twee belangrijke begrippen:
- *Exploitatie begroting:* inkomsten en uitgaven, = baten en lasten / resultatenrekening
- *Balans:* bezittingen en schulden

Je begint het jaar met ja *balans*. Vervolgens gebeuren er allemaal dingen. Aan het einde van het jaar heb je een nieuwe *balans*. De stromen die er tussen zitten zijn de *baten* en *lasten*.

== Waarom dit stelsel?
- Het maakt zuivere afweging mogelijk
- Investeringen worden niet zoveel benadeeld, omdat afschrijven
- Verkoop van bezit is geen ontsnapping als je in de problemen zit. 
- Het maakt de werkelijke kosten zichtbaar. 
- Beter inzicht in toekomstige lasten en risico's
- Inzicht in bezittingen en schulden
- Praktisch is het handig dat iedereen hetzelfde systeem gebruikt. In de praktijk is dat helaas niet zo.
- Je bouwt reserves op. Dat kan niet bij begrotingen
- Schuiven voor het idee dat het er beter uit ziet heeft geen zin
- Waardemutaties/afschrijvingen worden inzichtelijk

== Zuivere afweging:
Uitgaven staan niet in de exploitatie rekening maar op het kasstroom overzicht.

=== Jaarlijkse lasten:
- Afschrijvingen
- Kapitaallasten (rente)
- Eventuele herwaarderingen ($+"/"-$)

== Verkoop van bezit:
Netto vermogen blijft gelijk.
/ Toekomstige lasten: AOW, zorg, milieu, stijging waterpeil, etc.

== Resultaat:
Je toekomstige lasten worden vroeg zichtbaar. Je kan dan ook beter anticiperen. Lasten worden naar voren gehaald. 

#pagebreak()

= Functies van de overheid:
- *Allocatiefunctie:* de overheid kan de markt corrigeren (_bijvoorbeeld subsidies voor zonnepanelen_)
- *Stabilisatiefunctie:* de overheid kan de economie stabiliseren
- *Herverdelingsfunctie:* de overheid kan de inkomensverdeling corrigeren (lorenzcurve)

== Belastinguitgaven:
/ Voorbeelden: Hypotheekrente aftrek, toeslagen
Belastinguitgaven zijn eigenlijk kortingen op belastingen die de overheid geeft aan burgers en bedrijven. Dit wordt gedaan om mensen en bedrijven aan te moedigen zich op een bepaalde manier te gedragen.

== Fiscale regelingen:
Uitzonderingen in het belastingstelsel (zoals heffingskorting).

=== Gevolgen
- Hogere belastingtarieven
- Meer complexiteit

De fiscale regelingen leiden niet tot meer uitgaven, je krijgt als overheid gewoon minder geld binnen. Je kan het algemeen belastingtarief gewoon verlagen door Hypotheekrente aftrek af te schaffen. Door de Hypotheekrente moet de belasting compenseren op andere plekken.

== heffingskorting:
Een korting op de belasting die je moet betalen. 

=== Kortingen:
- _Algemene heffingskorting_: iedereen krijgt dit
- _Arbeidskorting_: als je werkt
- _Inkomensafhankelijke combinatiekorting_: als je werkt en kinderen hebt
- _Jonggehandicaptenkorting_: als je jonggehandicapte bent
- _Ouderenkorting_: als je oud bent
- _heffingskorting voor groene beleggingen_: als je groen belegt


= Week 5B: Kosten baten analyse (KBA):
KBA is een methode om de maatschappelijke kosten en baten van een project in kaart te brengen.

== Waardering: wat een mensen leven waard is
Veel kosten en baten hebben geen (markt)prijs, daarom moet er worden gewaardeerd. Veel dingen hebben ook te maken met schade aan natuur, ziekte, dood, etc.

=== Lost earnings:
Als iemand overlijdt, dan is er een verlies aan inkomen. Dit kan je berekenen door te kijken naar wat iemand verdient zou hebben.

=== Willingness to pay:
Hoeveel mensen bereid zijn te betalen voor een bepaalde dienst. Dit kan je bijvoorbeeld berekenen door te kijken naar hoeveel mensen bereid zijn te betalen voor een bepaalde dienst.

=== Contingent valuation:
Mensen vragen hoeveel ze bereid zijn te betalen voor een bepaalde dienst. Hoeveel heeft men over voor behoud van plant/dier/mensen

=== Klopt niet:
- Monetariseren van mensenlevens is onjuist, veel zaken zijn niet in geld uit te drukken
- Disconteren (waarderen) is onjuist, toekomst is belangrijk

== 4 soorten problemen:
=== Waardering is onnauwkeurig en ongeloofwaardig
- Niet alles is in geld uit te drukken, mensenleven is van onschatbare waarde.
- Er zit een verschil tussen de waardering van het risico vs de waardering van het leven zelf.
- Het maakt ook best wel een verschil of de risico's dicht bij jezelf zijn of niet.

=== Discontering bagatelliseert toekomstige schade en onomkeerbaarheid problemen
- Bedragen in de toekomst zijn minder waard dan bedragen nu.
- KBA maakt toekomst minder belangrijk

=== Geen rekening gehouden met rechtvaardigheid/ethiek
\ KBA negeert verdelingseffecten. Het is niet eerlijk dat de ene groep meer betaalt dan de andere groep. Goed criterium is *Pareto-verbetering*. In de praktijk is dit niet altijd mogelijk. Daarom (Hicks-Kaldor) _potentiële_ Pareto-verbetering. Kan als er kan gecompenseerd worden met geld. Werkt niet bij mensenlevens, daar valt niets te compenseren. 

Dit kan opgelost worden op een aantal manieren:
- Sommige dingen niet doen, ook al hebben ze uiteindelijk een goed saldo.
- Extra maatregelen toevoegen.

=== Niet objectief, niet transparant
\ KBA werkt met veel benaderingen en schattingen. Dit maakt het niet objectief. We weten veel niet dus we kunnen niet alles objectief beoordelen.

Een paar opties:
- Beslissen zonder info
- Beslissen met een beetje info

#pagebreak()

== Alternatieven KBA:
- _Technology based approach:_ pas de beste / meest **doelmatige** technologie toe
  - _Verhandelbare emissierechten:_ doelmatig en doeltreffend
- _Informational regulation:_ informeer de consument
- _Muitcriteria-analyse:_ 
  - Drie soorten criteria: economisch, sociaal (niet meetbaar), ecologisch (meetbaar)
  - Meet kosten en baten in eigen dimensie
  - Geef al die verschillende dingen een gewicht
  - Weeg af met het risico
  - Tel de scores op en vergelijk
  - Inhoudelijk geen verschil omdat de gewichten nog steeds vast gesteld moeten worden.
- _Risk assessment:_ Alleen mogelijke uitkomsten en hun waarschijnlijkheid, zonder waardering en zonder onderscheid van tijd.
- _Cost effectiveness analysis:_ alle varianten om risico te verminderen op een rij. Per onderdeel de kosten vermeld
  - Gezochten naar de laagste kosten per eenheid minder betalen
-  _Risk benefit analysis:_ Baten van therapie afwegen tegen de risico's
- _Wel KBA maar niet disconteren (terugrekenen)_
- _Breng kosten en baten in eigen dimensie in beeld._ Druk kosten en baten uit in geld als dat kan, bereken daar contante waarde. Netto contante waarde + niet in geld uitgedrukte kosten en baten is de uitkomst. 




