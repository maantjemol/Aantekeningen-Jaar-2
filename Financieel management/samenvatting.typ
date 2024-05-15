// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#f2542d")

#show: template.with(
  title: "Financieel Management in de Publieke Sector",
  subtitle: "Samenvatting",
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

= Inleiding
Financieel management is de planning en beheersing van financiële zaken. Het gaat niet om beleid (wat en waarom) maar om de *hoe vraag*. 

Er wordt veel gebruik gemaakt van bedrijfseconomische instrumenten, maar in de context van de publieke sector. De algemene economie houdt een belangrijke rol. Denk hierbij bijvoorbeeld aan *kosten baten analyse.*

Voorbeelden financieel management:
- Wat kost een paspoort?
- Corona en de kosten van de maatregelen

De rode draad is dat het diverse thema's behandelt, maar altijd gaat om het hoe en niet om het wat en waarom. 

== Publieke sector een non profit?
De publieke sector is gericht op een doel, en niet op winst. Waar is de publieke sector dan wel op gericht?
- Diverse producten
Het is divers georganiseerd en er zijn veel verschillende producten. Denk hierbij aan onderwijs, zorg, veiligheid, etc. De bekostiging is vaak via belastingen, en dus ook niet markt georiënteerd. De publieke sector is een aanzienlijk deel van de economie, ongeveer de helft.

Onderdelen van een non-profit:
- Publiek georiënteerde organisaties: overheid
- cliëntgerichte organisaties (*middenveld*), zoals onderwijs, zorg, corporaties, openbaar vervoer;
- Private organisaties, vakbonden, kerken, goede doelen.

De publieke sector bestaat uit *publiek georiënteerde organisaties*, zoals de overheid en de *middenveld organisaties*.

Wij gaan dus niet kijken naar ledenorganisaties, zoals vakbonden, kerken en goede doelen.

Wie horen bij de overheid?
- Rijk, provincies, gemeenten, waterschappen
- ZBO's (zelfstandige bestuursorganen)
- Agentschap (KNMI, DUO)

== Marktwerking
Er is geen marktwerking in de publieke sector, dus besluiten worden op andere manieren gemaakt. Denk hierbij ook aan marktfalen. De economie is in principe efficient, maar er moet ook rekening worden gehouden met:
- Macro-economie
- Verdeling/rechtvaardigheid
- Paternalisme
#pagebreak()
Voorbeelden van marktfalen:
- Externe effecten
- Asymmetrische informatie
- Collectieve goederen
- Marktmacht

Dit wordt opgelost door overheidsingrijpen. De overheid kan dit doen door:
- regelgeving
- belastingen
- zelf producten leveren
- overdrachten

Dit gaat lang niet altijd goed. Als dit niet goed gaat, dan is er sprake van *budget imperfecties*, ofwel *non-market failure*

Redenen voor non-market failure:
- Output slecht gedefinieerd of niet meetbaar
- Kwaliteit is moeilijk te meten
- Geen concurrentie
- Geen criteria voor het stopzetten van activiteiten
- Beloning voor het formuleren van een probleem en het bedenken van een oplossing, _maar niet voor het oplossen van het probleem_
- Politieke conjunctuur, waardoor er geen lange termijn visie is
- Common pool problemen (bijv. milieu)
- Principaal-agent problemen (bijv. zorg)

== Principaal-agent problemen:
- Principaal: degene die de opdracht geeft (kiezer)
- Agent: degene die de opdracht uitvoert (politici)

Politici hebben vaak hun eigen doelen en belangen, zoals herverkiezing, macht, of persoonlijke voordelen (rents), die niet altijd in lijn zijn met de belangen van de kiezers. Dit kan leiden tot besluiten die de kiezers niet ten goede komen.

Oplossingen hiervoor zijn:
- Contracten (werken niet goed en zijn incompleet)
- Begrotingsinstituties

== Begrotingsinstituties
Begrotingsinstituties zijn regels die ervoor zorgen dat de politici zich aan de begroting houden. Dit kan bijvoorbeeld door een *tekortnorm* in te stellen, of door een *onafhankelijke toezichthouder* in te stellen.

== Common pool problemen
Common pool problemen zijn problemen waarbij de kosten en baten niet bij dezelfde partij liggen. Dit kan leiden tot overexploitatie van een goed. Denk hierbij aan het milieu, waarbij de kosten van vervuiling niet bij de vervuiler liggen, maar bij de maatschappij.

Ook geld komt bij de overheid uit een algemene pot. Dit wordt besteed aan afzonderlijke groepen. De netto baten voor de groepen zijn groot, en de kosten zijn klein. Dit kan leiden tot overconsumptie.

*Oplossing:* een centraal begrotingsproces. Dit zorgt ervoor dat de kosten en baten bij dezelfde partij liggen.

== Praktisch:
- De overheid heeft een begroting, waarin de inkomsten en uitgaven staan.
- Er zijn geen verborgen uitgaven
- Beperk open eindjes
- Beperk regelgeving die tot uitgaven leid.
- Beperk contingent liabilities zoals garanties (expliciet én impliciet)
- Zorg dat alles in vergelijkbare maatstaf te meten is
- Niet te optimistisch ramen
- Geen creatief boekhouden maar transparantie
- Uitgaven gebruiken voor het doel waarvoor ze bedoeld zijn
- Begrotingsnormen, eisen waar de begroting aan moet voldoen
- Onafhankelijke informatie voorzieningen
- Een centraal begrotingsproces
- Een één partijregering, benoem een financieel zwaargewicht
- Zorg voor een contract (regeerakkoord) met duidelijke afspraken.
- Een hogere overheid zoals de EU, IMF (internationaal monetaire fonds) of de ECB (Europese centrale bank) kan ook helpen.

== Fasen:
- Planning en besluitvorming
- Beheersing (controle en uitvoering)
- Verslaggeving
- Controle en verantwoording

== New public management:
New Public Management (NPM) is een manier om overheidsdiensten te beheren die ideeën uit de private sector leent om de overheid efficiënter te laten werken. *running government like a business*

Gevolgen van NPM:
- Focus op efficiency
- Planning- en budgetteringstechnieken
- Sturen op prestaties
- Meer concurrentie
- Managementstijlen uit de private sector
- Contracten
- Privatisering
- Terminologie

#pagebreak()

== Fondsvorming:
Fondsvorming is het reserveren van geld voor een specifiek doel. Dit kan bijvoorbeeld zijn voor de AOW, of voor de zorg. Dit zorgt ervoor dat er geld is voor de toekomstige uitgaven.

Voordelen van een fonds:
- Toewijzing van middelen voor een specifiek doel
- Geld gaat naar waar het het meest nodig is.
- Geld wordt niet gebruikt voor andere algemene doeleinden.
- Er is op lange termijn geld beschikbaar voor een specifieke activiteit
- Ook bedrijven kunnen bijdragen aan het fonds
- Middelen stromen van de centrale naar de lokale overheden

Nadelen van een fonds:
- Niet alle middelen kunnen goed tegen elkaar worden afgewogen
- Verlies van overzicht
- Minder flexibiliteit
- Neiging tot meer uitgaven

Een aantal fondsen zijn:
- AOW-spaarfonds
- Fonds Economische Versterking: Garanderen van een deel van het aardgasvermogen d.m.v. investeringen die de economische structuur versterken;
- Waddenfonds
- BTW-compensatiefonds

/ Privaatrechtelijke fondsen: Stichtingen die van het Rijk een financiële bijdrage ontvangen en die vervolgens subsidie verlenen( bijv. cultuurfondsen).

*Depositogarantie:* fond van de banken om spaargeld te garanderen.

*Begrotingsreserve:* een reserve dat wordt apart gezet door het ministerie van financiën voor onvoorziene uitgaven.

*Structuurfondsen:* fondsen van de EU om de economische structuur van de lidstaten te versterken. Het verschil tussen de rijke en arme landen moet kleiner worden. *Europees Sociaal Fonds*

== Open-einde-regelingen:
Open-einde-regelingen zijn regelingen waarbij de kosten niet van tevoren vaststaan. Dit kan leiden tot hoge kosten. Denk hierbij aan de zorg, waarbij de kosten niet van tevoren vaststaan.

*Voordelen:*
- Mensen die recht hebben op deze regeling weten zeker dat ze het geld krijgen. Er zijn geen limieten of wachtlijsten
- De regeling helpt de economie automatisch te stabiliseren door in slechte tijden meer geld uit te keren en in goede tijden minder.

*Nadelen:*
- De kosten zijn moeilijk te voorspellen en kunnen hoog oplopen
- Het is slecht beheersbaar
#pagebreak()
/ Cederen: Het overdragen van een vordering van de ene naar de andere partij
== Exportkredietverzekeringen:
Een exportkredietverzekering is een soort verzekering die bedrijven helpt bij het exporteren van hun producten of diensten naar andere landen. Het beschermt bedrijven tegen het risico dat hun klanten in het buitenland niet kunnen betalen voor wat ze hebben gekocht. Als de klant niet kan betalen, compenseert de exportkredietverzekering het bedrijf voor het verlies. Dit moedigt bedrijven aan om internationaal zaken te doen door het risico te verminderen.

Wordt geregeld door Minister van Financiën. 

Hoe werkt het *Gefinancierde transactie (vanuit lening)*?
+ Bedrijf A uit Nederland exporteert product X naar Bedrijf Y in land Z.
+ Bedrijf A regelt een exportkrediet bij een Nederlandse bank (Bank B).
+ Bank B verzekert dit krediet bij Atradius Dutch State Business.
+ Atradius vraagt goedkeuring aan het Ministerie van Financiën (MinFin) en voert een risicoanalyse uit.
+ Bij goedkeuring van MinFin stelt Atradius in overleg met Bank B een polis op.
+ Atradius bepaalt de hoogte van de polis en ontvangt daarvoor een vergoeding van de Staat.
+ Bank B sluit de polis af bij Atradius DSB.
+ De Staat betaalt Atradius DSB een vergoeding voor de verleende diensten.

*Contante transactie*
+ Bedrijf A uit NL exporteert goed X aan bedrijf Y uit land Z;
+ Bedrijf A levert, bedrijf Y betaalt niet. Bedrijf A staakt de levering;
+ Atradius DSB neemt de vordering over.

EKV is aanvullend en exporteurs kunnen pas aanspraak maken als ze niet commercieel verzekert kunnen worden. 

De EKV is bedoeld voor bedrijven die exporteren naar landen waar de politieke en economische situatie onzeker is. De EKV is bedoeld om de risico's van exporteren naar deze landen te verkleinen.

Als de schade is uitgekeerd wordt er geprobeerd te *recupereren*. Dit gebeurt onder meer via de Club van Parijs.

De link tussen de EKV en het ministerie van Buitenlandse Zaken wordt gelegd via het concept van Official Development Assistance. Dit is een vorm van ontwikkelingshulp waarbij de overheid van een land geld geeft aan een ander land om de economie te stimuleren.
Voorbeeld:
- Kwijtschelding van schulden aan ontwikkelingslanden
- *De HGIS (Homogene Groep Internationale Samenwerking)* is een overzicht van alle uitgaven van Nederland in het kader van internationale samenwerking, inclusief de ODA-uitgaven
- HGIS-nota geeft een totaaloverzicht van deze uitgaven, niet apart maar een overzicht

Om kwijtschelding toe te rekenen aan de HGIS nota moet het desbetreffende land op de lijst van OESO-DAC voorkomen.

*Minister van BHOS (Buitenlandse Handel en Ontwikkelingssamenwerking):*
- Geen eigen begroting
- Het bedrag dat aan ODA moet worden uitgegeven wordt bij elk Regeerakkoord opnieuw vastgelegd;

Een schuldenkwijtschelding die als ODA wordt aangemerkt verlaagd de "echte" uitgaven naar ontwikkelingswerk. De totale omvang van de jaarlijkse schuldenkwijtschelding (aangemerkt als ODA) is niet terug te vinden in de HGIS-nota. Er is weinig controle op de besteding van de ODA-gelden.

In principe heeft het parlement dus niets in te brengen over het belang
van de schuldenkwijtschelding, terwijl de regering daar juridisch toe
verplicht is.

De toerekening van kwijtscheldingen aan de HGIS-nota wordt dus niet
officieel goedgekeurd

= Budget en begroting

== BBP:
Maatstaf voor de omvang van een economie; de totale waarde van alle goederen en diensten die in een land worden geproduceerd in een bepaalde periode. Het BBP wordt vaak gebruikt om de economische groei van een land te meten.

Nominaal BBP versus reëel BBP:
- Nominaal BBP: de waarde van alle goederen en diensten die in een land worden geproduceerd in een bepaalde periode, gemeten in huidige prijzen.
- Reëel BBP: de waarde van alle goederen en diensten die in een land worden geproduceerd in een bepaalde periode, gecorrigeerd voor inflatie.

$
Y=C+I+O+E-M
$

Ons schuldratio mag max 60% zijn van het BBP.

$ "Financieringssaldo" = "begrotingssaldo - aflossing schuld" $

- We mogen een maximaal tekort per jaar hebben van 3% van het BBP.
- Inflatie niet hoger dan 1,5%-punt boven het gemiddelde van de drie EMU-landen met de laagste inflatie;
- Geen wisselkoersdevaluaties t.o.v. de euro in de laatste twee jaar;
- Kapitaalmarktrente niet meer dan 2%-punt boven de gemiddelde kapitaalmarktrente van de drie EMU-landen met de laagste inflatie.

De schuldnorm (60%) en tekortnorm (3%) zijn arbitrair gekozen; er is geen economische reden voor. 

#pagebreak()

== Schuldquote
Hoe kan de schuldquote (schuld als percentage van BBP) veranderen?
- Economische groei (BBP stijgt)
- Reële rente (rente - inflatie)
- Primair surplus PS = belastingen - uitgaven (zonder rente)
- Boekhoudkundige mutaties

$ "Primair saldo" = "overheidsinkomsten" - "(overheidsuitgaven - rente)" $


$ Delta b_t = (i_t - g_t) / (1+g_t) b_(t-1) - "ps"_t + "dda"_t $

$Delta b_t$: verandering in de schuldquote\
$i_t$: rente\
$g_t$: groei\
$b_(t-1)$: schuldquote vorig jaar\
$"ps"_t$: primair saldo\
$"dda"_t$: boekhoudkundige mutaties en andere zaken\

Als $i>g$ is de interest betaling hoger dan de groei. Hierdoor is er dus meer geld nodig (primair saldo) om de schuldquote te verlagen. 

Als $i<g$ is de interest betaling lager dan de groei. Hierdoor is er minder geld nodig (primair saldo) om de schuldquote te verlagen.

== Contante waarde:
Annuïteit: een vast bedrag dat periodiek wordt betaald. Dit kan bijvoorbeeld een lening zijn.

Hoeveel moet ik vandaag op een bankrekening storten om over 7 jaren over €40.000 te beschikken als de rente 5% is?

$ (€40.000)/1.05^7 = €28.427,25 $

*Houdbaarheidssaldo*: De contante waarde van alle toekomstige overheidsoverschotten en -tekorten. Bij een *houdbaarheidstekort* kunnen toekomstige generaties *niet van dezelfde overheidsvoorzieningen profiteren* als de huidige generaties zonder de belastingen te verhogen.

*Netto vermogenspositie van de overheid:* Verschil tussen alle bezittingen van de overheid (financiële activa, gasvoorraad, kapitaalgoederenvoorraad) en de bruto schulden van de overheid

*Conjectuur:* In tijden van hoogconjunctuur verbetert het overheidssaldo door hogere belastinginkomsten en lagere werkloosheidsuitgaven en vice versa in tijden van laagconjunctuur.

*Verschillende soorten beleid:*
1. *anticyclisch:* in tijd van welvaart besparen, in tijd van crisis uitgeven
2. *trendmatig:* in tijd van welvaart besparen, in tijd van crisis ook besparen
#pagebreak()

Hoe maak je automatische conjectuur stabilisatoren?
- *Progressief belastingstelsel:* inkomstenbelasting. Meer verdienen = meer belasting betalen
- *Stelsel van sociale zekerheid:* Naarmate het (nationaal) inkomen daalt neemt de werkloosheid toe; de uitgaven voor werkloosheidsuitkeringen stijgen en de belastinginkomsten dalen. Dit zorgt voor een stabiliserend effect op de conjunctuur.

*Structurele saldo:* het saldo gecorrigeerd voor de conjunctuur. Dit is het saldo dat je zou hebben als de economie op volle capaciteit draait.

*Preventieve arm:* een set van regels die de begrotingen van landen in de eurozone moeten bewaken.

== MTO:
Het *middellangetermijnbegrotingsdoel* (MTO) is een begrotingsdoelstelling die de overheid zichzelf oplegt om de schuldquote te verlagen. Het MTO is een schuldquote van 60% van het BBP, met aanpassingen voor verwachte vergrijzingslasten

Als de schuldratio $< 60%$ mag er een tekort zijn van 1% van het BBP. Als de schuldratio $> 60%$ mag er een tekort zijn van 0,5% van het BBP.

Wanneer niet voldaan aan MTO:
- Wanneer schuld $<60%$: verbetering structureel saldo met gemiddeld $0,5%$- punt per jaar;
- Wanneer schuld $>60%$: verbetering structureel saldo met gemiddeld meer dan $0,5%$-punt per jaar.

MTO gehaald?
- Uitgaven mogen niet sneller stijgen dan de potentiële middellange termijn economische groei.
MTO niet gehaald?
- Uitgaven moeten minder snel stijgen dan de potentiële middellange termijn economische groei

De uitgaveregel zorgt ervoor dat landen conjuncturele inkomstenmeevallers niet kunnen inzetten voor structurele uitgavenverhoging.

== Correctieve arm:
Deze vereist dat landen binnen een bepaalde termijn een buitensporig tekort herstellen.

Dit moet gebeuren als er een tekort is van meer dan 3% van het BBP, of een begroot tekort van meer dan 3% van het BBP. Ook als de schuld $> 60%$ en die niet voldoende afneemt. voldoende afneemt betekent dat de schuldquote met 1/20 van de schuld per jaar afneemt.
#pagebreak()

Afwijkingen mogen als:
- Ze tijdelijk zijn
- Er sprake is van bijzondere omstandigheden
- Het saldo een waarde bereikt die de referentiewaarde nadert; (er is een duidelijke neerwaartse trend)

*Straffen:*
- Een boete van 0,2% van het BBP
- Een niet-rentedragende deposito van 0,2% van het BBP
- Niet in EU: opschorting betalingen uit Europese Cohesiefondsen.
- Eventueel meer sancties

== Herziening Europees begrotingsraamwerk:
*Belangrijkste verschil:* Er wordt alleen gestuurd op jaarlijkse uitgavenplafonds. MTO en de significante afwijkingsprocedure komen dan te vervallen, evenals de eis van afname van 1/20e per jaar.

- Schuldratio >60%?
  - $S R>90%$: SR jaarlijks minimaal verminderen met 1% BBP;
  - $60%<S R<90%$: SR jaarlijks minimaal verminderen met 0,5% BBP.

*Backloading* gaat ook worden voorkomen door te zeggen dat lidstaten die een technisch uitgavenpad krijgen moeten ieder jaar een gelijk deel van de benodigde aanpassing realiseren. Je mag dus niet beloven het tekort in de toekomst te verlagen.

== Begroting:
A budget is the financial mirror of society’s economic and social choices. Het zijn de financiële gevolgen van genomen beslissingen.

De functies van een begroting:
- Allocatiefunctie: hoe worden de middelen verdeeld?
- Staatsrechtelijke functie: hoe wordt de macht verdeeld?
- Democratiefunctie: hoe wordt de macht gecontroleerd?
- Macro-economische functie: hoe wordt de economie gestuurd?
- Beheer: Managen van de middelen
- Verantwoording: Hoe worden de middelen gebruikt
- Controle: er kan onafhankelijk gecontroleerd worden

De begroting heeft betrekking op:
- Uitgaven en ontvangsten: Het gaat om de bedragen die de overheid uit eigen middelen of door lenen zal besteden, en de inkomsten die ze zal ontvangen (bijv. belastingen).
- Kosten en baten
- Programma: wat wordt er bereikt met de uitgaven?
- Projecten + acties: dingen die de overheid gaat bereiken en doen
- Resultaten en effecten: wat gaat de begroting bereiken?

#pagebreak()
Traditioneel werd er incrementeel begroot. Dit betekent dat er gekeken wordt naar de begroting van vorig jaar, en dat er een klein beetje bij of af wordt gedaan. 

Tegenwoordig wordt er ook gebruik gemaakt van ZBB. Dit betekent dat er vanaf nul wordt begroot. Dit zorgt ervoor dat er kritisch wordt gekeken naar de uitgaven.

Ook hier is er weer een principaal agent situatie: De agent (kabinet) stelt de begroting op en het parlement accepteer/overweegt deze en zet hem vast.

In de EU zijn er 3 partijen:
- De Europese Commissie: stelt de begroting op
- Het Europees Parlement: keurt de begroting goed
- De Raad van Ministers: stelt de begroting vast

Een begroting moet voldoen aan de volgende dingen:
- Volledigheid: alle inkomsten en uitgaven moeten erin staan
- Vergelijkbare maatstaven: Alle uitgaven moeten kunnen worden vergeleken
- Bruto ramen, rekening houden met alle kosten
- Openbaarheid: iedereen moet de begroting kunnen inzien
- Periodiciteit: de begroting moet elk jaar worden vastgesteld
- Onderworpen aan controle: de begroting moet gecontroleerd kunnen worden

== Periodiciteit:
De begroting is meestal jaarlijks. Soms eens per meerdere jaren (bijv. 5 jaar). Dit is vaak bij grote projecten.

Voorbeelden meerderjarige begrotingen:
- Meerjarenbegroting van de EU
  - Duurt 7 jaar, wordt elke 7 jaar vastgesteld. er is een mid-term review
- Rijksbegroting

== Het begrotingsproces:
+ *Voorbereidingen:* De ministeries maken hun begrotingen op. Begroting bestaat uit hoofdstukken, elk hoofdstuk wordt verdedigt door een minister.
+ *Miljoenennota*: De Miljoenennota bevat een toelichting op de Rijksbegroting, met uitleg over de economische en financiële context en de beleidskeuzes die de basis vormen voor de begroting.
+ *Behandeling in het Parlement:*
  + Derde dinsdag van september: aangeboden aan de Tweede Kamer
  + 2de kamer behandelt de begroting en debatteert per hoofdstuk. Kunnen eventuele wijzigingen voorstellen.
  + Tweede kamer stemt op begroting
  + Eerste kamer stemt op begroting, ja of nee per hoofdstuk
+ *Uitvoering:* De begroting wordt uitgevoerd, er worden verschillende rapportages gemaakt. Voorlopige Rekening, de Voorjaarsnota en de Najaarsnota.
+ *Verslaggeving en controle:* aan het eind van het jaar worden er verslagen opgesteld. De Auditdienst Rijk en algemene Rekenkamer controleert de begroting.
+ *Verantwoording:* Op de derde woensdag van mei vindt de Verantwoordingsdag plaats, waarin de regering verantwoording aflegt over het gebruik van de publieke middelen.

#pagebreak()
Bij andere overheden loopt dit proces vaak redelijk hetzelfde, het verschil zit hem in de vormgeving.

== Begrotingsstelsels:
De overheid gebruikt er 3.

*Kasstelsel:*
- Gericht op betalingen
- Uitgaven worden geregistreerd op moment van betalen
- Ontvangsten worden geregistreerd op moment van ontvangen
- Dit stelsel is simpel en eenduidig, maar biedt weinig inzicht in vermogen, waardemutaties en toekomstige kosten.

*Verplichtingenstelsel:*
- Gericht op het moment waarop een betalingsverplichting ontstaat.
- Gaat ook over betalingen, maar geeft inzicht in toekomstige kosten.
- Geeft beter inzicht in verplichtingen, maar nog steeds op basis van betalingen.
- Nadelen: investeringen worden benadeeld.

*Baten-lastenstelsel:*
- Gericht op vermogensmutaties
- Vermogen neemt toe (bate) en af (last)
- Dit stelsel is het meest geavanceerd, maar ook het meest complex. Het geeft het beste inzicht in de vermogenspositie van de overheid.

*In de praktijk:*
- *Rijk:* Gebruikt een combinatie van de drie stelsels.
- *Lagere overheden:* Vaak het stelsel van baten en lasten.
- *EU:* Gebruikt het kas-verplichtingenstelsel.

== Normering:
Normering stelt grenzen aan de uitgaven van de overheid. Dit kan bijvoorbeeld zijn dat de overheid niet meer dan 3% van het BBP mag uitgeven.

- *Tekortnormering:* Dit beperkt het begrotingstekort, het verschil tussen uitgaven en ontvangsten.
- *Schuldnormering:* Dit beperkt de totale staatsschuld, de totale schuld van de overheid.
- *Uitgaven (lasten) normering:* Dit stelt grenzen aan de uitgaven van de overheid, bijvoorbeeld door specifieke categorieën uitgaven te beperken.
- *Ontvangsten (baten) normering:* Dit kan betrekking hebben op de hoogte van belastingen of andere inkomsten van de overheid.

= Baten en lasten
Wordt bijna overal gebruikt, behalve bij het rijk en de EU. Er worden 2 belangrijke documenten gebruikt:
- *Balans:* Hierin staan de bezittingen en schulden van de overheid
- *Exploitatie begroting:* economische baten en lasten van de overheid

#pagebreak()

Baten en lasten maakt een zuivere afweging mogelijk. Investeringen worden niet benadeeld en huren/kopen worden gelijk behandeld. Het maakt werkelijke kosten beter zichtbaar. Er is beter inzicht. Het is ook mogelijk om reserves te vormen. Het is niet meer mogelijk om dingen eeuwig door te schuiven. Waardemutaties en afschrijvingen worden zichtbaar. 

== Zuivere afweging:
In het stelsel van baten en lasten wordt er anders omgegaan met investeringen. Ze worden niet beschouwd als eenmalige uitgaven. Een investering wordt opgedeeld in jaarlijkse lasten:
- afschrijvingen
- rente
- herwaarderingen
Hierdoor is het makkelijker om een vergelijking te maken tussen investeringen en andere alternatieven zoals huren of leasen. Hierdoor worden investeringen niet benadeeld zoals in het kasstelsel, waar een investering veel meer lijkt dan jaarlijks huren.

== Inzicht in de toekomst:
Met het baten en lasten systeem krijgt men meer inzicht in toekomstige lasten. Denk hierbij bijvoorbeeld aan vergrijzing met AOW en milieu. Ook is er beter inzicht in verstrekte leningen en garanties.

Voordelen hiervan:
- lasten gespreid over de tijd
- lasten worden naar voren gehaald
- toekomstige lasten zijn vroeg zichtbaar
- betalingsverschuivingen werken niet meer in het voordeel van de politiek

== Waardemutaties:
Waardemutaties kunnen zorgen voor problemen. Als de waarde van je spullen stijgt kan er worden gezegd dat er meer uitgegeven kan worden. Dit kan opgelost worden door rekening te houden met deze waardemutaties. 

== Mogelijke problemen:
+ *Onduidelijke wat de investering is*
+ *Manier van afschrijven:* De manier van afschrijven kan invloed hebben op de begroting. Als er bijvoorbeeld lineair wordt afgeschreven, dan is er in het begin veel afschrijving, en later weinig. Dit kan zorgen voor een vertekend beeld.
+ *Afschrijvingstermijn:* Het termijn van de afschrijving kan effect hebben op de begroting. Een lang afschrijvingstermijn verlaagd jaarlijkse lasten
+ *Waarderingsgrondslagen:* de manier waarop bezit wordt gewaardeerd.

*Wie bepaald dit soort dingen?*
- Vroeger minister van financiën
- Tegenwoordig _Accounting standards_
- Ook onafhankelijke controle van de Rekenkamer
#pagebreak()

== Geschiedenis

De geschiedenis van het stelsel van baten en lasten in Nederland is gevuld met terughoudendheid, twijfel en hernieuwde pogingen. Hoewel er geen integrale invoering is gekomen, heeft de discussie geleid tot een geleidelijke verschuiving naar meer B&L-elementen in de publieke sector. De ambtelijk commitment van het ministerie van Financiën in 2017 gaf de hoop dat er daadwerkelijk stappen worden ondernomen, maar de politiek moet uiteindelijk beslissen over de toekomst van het stelsel in Nederland.

== Extra's bij baten en lasten:
*Kasstroom overzicht:*
- Operationele kasstroom: gevolg bedrijfsprocessen
- Investeringskasstroom: gevolg van investeringen
- Financieringskasstroom: opgenomen en afgeloste leningen
*Kapitaaldienst:*
- Niet op de staat van baten en lasten (de gewone begroting) thuishoren
- Stromen van kapitaal
- Cashflow?

== Staatsbalans:
De staatsbalans is een overzicht van de bezittingen en schulden van de overheid. Het geeft inzicht in de financiële positie van de overheid. Het is een momentopname, en geeft geen inzicht in de resultaten van de overheid.

*Intracomptabel:* balans moet er zijn \ 
*Extracomptabel:* balans mag er zijn

Huidige staat in Nederland is dat ie extracomptabel is. Waardering lang niet altijd conform IPSAS. Er is ook geen controle.



= Prestaties en effecten

= Grote projecten

= Financiële verhoudingen

= Financiering