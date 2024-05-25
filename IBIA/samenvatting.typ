// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#f2542d")

#show: template.with(
  title: "IBIA",
  subtitle: "Samenvatting",
  short-title: "IBIA Samenvatting",
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
    (title: "Samenvatting", content: [Deze samenvatting biedt een uitgebreide beschrijving van de verschillende aspecten en processen binnen een organisatie, waaronder situatie-analyse, procesverbetering, businessmodellen, dynamische capaciteiten en technologie. Het document bevat ook inzichten in organisatorische structuren, cultuurverandering, teamdynamiek en de implementatie van agile methodologieën. Daarnaast wordt er aandacht besteed aan softwareontwikkeling, architectuur en de rol van AI in organisaties.]),
  ),
  open-access: true,
  margin: (
    (
      title: "Key Points",
      content: [
        - De Minto piramide is een effectieve manier om een advies te presenteren
        - Agile methodologieën zoals Scrum en Kanban zijn populair in softwareontwikkeling
        - Organisatiecultuur en teamdynamiek zijn belangrijke factoren voor het succes van een organisatie
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

= SCQ (& processen) 
== Situation:
Beschrijving van de situatie.
- Dit is het bedrijf, dit doen ze, feitelijk

== Complication:
Beschrijving van het probleem in de situatie.
- Dit is het huidige proces, hier lopen ze tegenaan.

== Question:
Beschrijving van de vraag als reactie op de complicatie.
- Hoe kunnen we dit proces verbeteren?

== Answer:
Beschrijving van het antwoord op de vraag of beschrijving van aanpak om tot oplossing te komen

== BPMN diagram
Voor een diagram heb je verschillende nodes die je kan gebruiken:



#figure(
  image("./images/bpmn.png", width: 50%),
  caption: "BPMN nodes",
)
Voorbeeld:

#figure(
  image("./images/bmvoorbeeld.png", width: 80%),
  caption: "BPMN diagram",
)<BPMNVoorbeeld>

#pagebreak()

= Business Model Canvas
/ Business Model Canvas: A business model describes the rationale of how an organization creates, delivers and captures values. 

#figure(
  image("./images/bmc.png", width: 80%),
  caption: "Business Model Canvas",
)


== Cost centers:
The cost centers of a business model are the most significant costs incurred while operating under a particular business model, such as fixed costs, variable costs, or economies of scale.

*Key Resources:* The most important assets required to make a business model work, including physical, intellectual, human, and financial resources.

*Key Activities:* The most important things a business must do to make its business model work, such as production, problem-solving, or platform/network management.

*Key Partnerships:* The network of suppliers and partners that complement the business model and optimize operations.

== Profit centers:
The profit centers of a business model are the ways a business generates income from its customer segments, such as product sales, subscription fees, or advertising.

*Customer Segments:* The different groups of customers a business aims to serve. This could be based on demographics, behaviors, or other characteristics.

*Channels:* The means by which a business delivers its value propositions to its customer segments, such as sales channels, distribution channels, and communication channels.

*Customer Relationships:* The types of relationships a business establishes and maintains with its customer segments, ranging from personal to automated.

#pagebreak()

== Summary
*Value Propositions:* The products or services that create value for a specific customer segment by solving their problems or satisfying their needs. Summary of the model.

*Revenue Streams:* The ways a business generates income from its customer segments, such as product sales, subscription fees, or advertising, summary of profit centers.

*Cost Structure:* The most significant costs incurred while operating under a particular business model, such as fixed costs, variable costs, or economies of scale. Summary of cost centers.

/ Dynamic capabilities: the capability of an organization to purposefully adapt an organization's resource base
= Dynamic Capabilities
3 onderdelen: sensing, seizing, transforming

== Sensing
- Het vermogen om veranderingen in de omgeving te detecteren en te begrijpen

== Seizing
- Het vermogen om snel en effectief te reageren op veranderingen in de omgeving

== Transforming
- Het vermogen om de organisatie te veranderen om te reageren op veranderingen in de omgeving

#figure(
  image("./images/DC.png", width: 100%),
  caption: "Dynamic Capabilities",
)

/ Business Capabilities: Capabilities describe what an enterprise does, as they provide an organization's capacity to achieve a desired outcome. 
= Business Capabilities:
Een *capability* is de *wat* van een organisatie, wat ze doen. 

Naast een *wat* oon een *waarom* en een *hoe*:
- *Waarom*: missie, visie, strategie
- *Hoe*: implementatie en richting

== Dimensies van Business Capabilities
- *processen:* processen, organisatiestructuren
- *technologie:* systemen, tools
- *mensen/competenties:* communicatie naar je mensen, inspireren, motiveren
- *data:* data, analytics, AI

// #image("./images/capabilities.png", width: 100%)
#figure(
  image("./images/capabilities.png", width: 100%),
  caption: "Business Capabilities",
)
Hierop kan je je capabilities zetten. Je kan dan een set aan capabilities (links) ordenen in de capability map.
- Industrie best practice:  
- Innovation centers:
- Complaint excellence:
- Competitive advantage:

= Technologie: Architectuur, Inkoop, ontwikkeling
== Hoe kom je aan software?
// #image("./images/software-koop.png", width: 100%)
#figure(
  image("./images/software-koop.png", width: 80%),
  caption: "Software"
)

Er zijn 3 opties om aan software te komen:
+ *Kopen:* je koopt software van een leverancier, bijvoorbeeld Microsoft Office
+ *Developen:* je bouwt software zelf, dit kan intern of door een extern team in te huren
+ *Outsourcen:* je huurt een partij in om software voor je te bouwen, gaat volledig buiten je om. 

== Software selectie:
Bij een software selectie moet ja aan een aantal dingen denken:
+ Software moet passen binnen de organisatie en de mensen
+ Software moet makkelijk integreren
+ De aanpak past bij de gewoontes en partners van de organisatie
+ Softwareleverancier past bij de inkoopstrategie van het bedrijf

*Software selectie fases:*
+ *Preparation & Mobilization:* Een gemeenschappelijke taal creëren en de organisatie en leveranciers mobiliseren. Definieer de business needs, analyseer de huidige situatie en stel duidelijk geformuleerde eisen (requirements) op.
+ *Prototyping:* Het creëren van concrete voorbeelden (prototypes) van de software om de functionaliteit en bruikbaarheid te demonstreren. 
+ *Final Recommendation:* Een definitieve aanbeveling voor de beste software oplossing aan het managementteam presenteren.

== Outsourcing:
Bij delen van een architectuur kan er worden gekozen voor outsourcing:
- Het scheelt tijd en resources die vrijgemaakt kunnen worden om te focussen op de core business
- Het kan kostenbesparend zijn, maar vaak pas op lange termijn
- Het verminderen van risico's, door het uitbesteden van kennis, capaciteit en continuïteit

*Let op!* zonder enterprise-architectuur is de kans groot dat outsourcing niet goed gaat.

== Software implementatie:
// #image("./images/implementation-cycle.png", width: 100%)
#figure(
  image("./images/implementation-cycle.png", width: 100%),
  caption: "Software implementatie"
)

#pagebreak()

/ Architectuur: kunst en wetenschap van het ontwerpen en bouwen van gebouwen en andere fysieke structuren.
= Architectuur:
== Enterprise-architectuur
Als iedereen maar wat IT systemen gaat maken en toevoegen wordt het een rommel. Daarom moet er een plan komen waar mensen aan kunnen toevoegen en weglaten wat ze willen. Het moet flexibel, efficient en robuust zijn. Hiervoor is een *enterprise-architectuur* nodig.

== Problemen die we willen oplossen met enterprise-architectuur:
- Eilandautomatisering: systemen die niet met elkaar praten
- Beheersing van kosten
- Waarborgen van continuïteit
- Business & IT alignment
- Creëren van flexibiliteit
- Beheersing van risico's
- Inzicht in samenhang systemen
- communicatie
- Strategie
- Bestuur

== Architectuur raamwerk:
Een verzameling van gestandaardiseerde gezichtspunten op de architectuur van een systeem. 

== Domeinen:
- *Businessarchitectuur:* geeft inzicht in de processen en organisatie van een bedrijf
- *Informatiearchitectuur:* geeft inzicht in de informatievoorziening en gegevensstromen van een bedrijf
- *Applicatiearchitectuur:* geeft inzicht in de software en onderlinge relaties
- *Technologiearchitectuur:* geeft inzicht in de technologie en infrastructuur, zoals servers en netwerken

= Technologie:
De 4 industriële revoluties:
+ *Mechanisatie*, water- en stoomkracht
+ *Massaproductie*, elektriciteit, autofabrieken, de lopende band
+ *Automatisering*, elektronica, IT, robotica
+ *Digitalisering*, AI, IoT, big data
#pagebreak()

== Gartner hype cycle:
#figure(
  image("./images/hype-cycle.png", width: 50%),
  caption: "Gartner Hype Cycle",
)<Hype-cycle>

In @Hype-cycle is te zien dat de hypecycle bestaat uit 5 fases:
+ *Technology Trigger:* de technologie wordt geïntroduceerd
+ *Peak of Inflated Expectations:* de technologie wordt gehypet
+ *Trough of Disillusionment:* de technologie valt tegen en is eigenlijk minder cool dan gedacht
+ *Slope of Enlightenment:* de technologie wordt beter begrepen en er komen meer toepassingen
+ *Plateau of Productivity:* de technologie is volwassen en wordt breed toegepast

*BCG* maakt een ander model waarin value en maturity tegen elkaar worden gezet.

== Interne en externe factoren die bedrijven forceren te veranderen:
+ *Flat world:* door globalisering en technologie is de wereld kleiner geworden
+ *Start-up disruptors:* start-ups kunnen met nieuwe technologieën en businessmodellen bestaande bedrijven ontwrichten
+ *Digital live:* de digitalisering van de wereld
+ *Faster innovation:* door technologie kunnen bedrijven sneller innoveren
+ *Sustainability & regulations:* bedrijven moeten duurzamer worden en voldoen aan regelgeving

#pagebreak()

= Mensen & competenties
== Team dynamiek
Een belangrijk model voor team dynamiek is het *Tuckman model*:
- *Forming:* het team wordt gevormd
- *Storming:* er ontstaan conflicten
- *Norming:* er worden afspraken gemaakt
- *Performing:* het team werkt goed samen
- *Adjourning:* het team wordt opgeheven

Deze fases gaan bijna altijd in deze volgorde. Een ander model wat vaak wordt gebruikt is het *Belbin teamrollen model*. Dit bestaat uit een aantal rollen die in een team aanwezig moeten zijn om goed te kunnen functioneren:

- *Doen:* de actiegerichte rol _(bedrijfsman en brononderzoeker)_
- *Denken:* de creatieve rol _(plant en waarschuwer)_
- *Willen:* de motiverende rol _(vormen en voorzitter)_
- *Voelen:* de sociale rol _(zorgdrager en groepswerker)_

Al deze mensen hebben verschillende kwaliteiten en valkuilen. Het is belangrijk om een goede mix van deze rollen in een team te hebben.
/ Bedrijfscultuur: De wijze waarop de leden van de organisatie zich intern in hun onderlinge relaties en extern in hun relaties met klanten en leveranciers gedragen
== Organisatie cultuur
Binnen een organisatie is gedrag bepalend. Het model van *competing values framework/Organizational Culture Assessment Instrument* geeft inzicht in hoe de organisatie zich intern in hun onderlinge relaties en extern in hun relaties met klanten en leveranciers gedragen.

#figure(
  image("./images/competing-values.png", width: 100%),
  caption: "Competing values framework / Organizational Culture Assessment Instrument",
)

#pagebreak()

Er zijn een aantal *culturele lagen* binnen een organisatie. Vanaf binnen naar buiten zijn dat:
+ *Waarden:* de diepste laag, de overtuigingen van de organisatie
+ *Rituelen:* de gewoontes en gebruiken van de organisatie
+ *Helden:* de mensen die de organisatie groot hebben gemaakt
+ *Symbolen:* de uiterlijke kenmerken van de organisatie

Daardoorheen is de *werkwijze* van de organisatie verwikkeld.

Hofstede heeft ook nog een ander model bedacht, de *culturele dimensies*. Dit model bestaat uit 6 dimensies:
+ *Power distance:* de mate waarin de minder machtige leden van de samenleving en organisaties de ongelijkheid in de macht accepteren
+ *Individualism vs. collectivism:* de mate waarin mensen zichzelf als individu zien of als onderdeel van een groep
+ *Masculinity vs. femininity:* de mate waarin een samenleving of organisatie masculiene of feminiene waarden heeft
+ *Uncertainty avoidance:* de mate waarin een samenleving of organisatie onzekerheid vermijdt
+ *Long-term orientation vs. short-term norm:* de mate waarin een samenleving of organisatie gericht is op de lange termijn of de korte termijn
+ *Indulgence vs. restraint:* de mate waarin een samenleving of organisatie zichzelf toestaat om plezier te hebben

== Cultuurverandering
Er zijn *8 succesfactoren* voor cultuurverandering:
#figure(
  image("./images/successf.png", width: 100%),
  caption: "Cultuurverandering, 8 succesfactoren",
)

Een ander probleem bij cultuur verandering is *weerstand*. Om uit te vinden waar weerstand vandaan komt kan het *WWK-model* worden gebruikt:
- *Weten:* mensen weten niet waarom er iets verandert _(doelen, route, impact, wat heb ik hieraan?)_
- *Willen:* mensen willen niet veranderen _(motivatie, vertrouwen)_
- *Kunnen:* mensen kunnen niet veranderen _(kennis, vaardigheden)_
#pagebreak()

Een ander model wat kan helpen bij cultuurverandering zijn de *6 competenties:*
- *Bestuurlijk organisatorische competenties:* Ondernemen, leidinggeven, organiseren, visie
- *Sociaal communicatieve competenties:* Communiceren, samenwerken, klantgerichtheid, netwerken
- *Intellectuele competenties:* creativiteit, analyseren, leren, probleemoplossen
- *Emotionele competenties:* inlevingsvermogen, zelfvertrouwen, zelfsturing, stressbestendigheid
- *Taakgerichte competenties:* inzet, flexibiliteit, initiatief
- *Competentie ontwikkeling:* reflecteren, leren, ontwikkelen, coachen


#pagebreak()
= Processen en organisatie: organisatie-eenheden, agile
== Wat is een organisatiestructuur?
/ Business unit: separate division within a company. It has its own strategy, goals, and objectives. 
Een organisatiestructuur is opgebouwd uit drie substructuren:
+ *Functiestructuur:* alle voorkomende functies in het bedrijf
+ *Persoonlijke structuur:* koppelt functies uit de functiestructuur aan mensen
+ *Organieke structuur:* de manier waarop de functies en mensen met elkaar samenwerken, daarin weeggegeven de divisies, sectoren, afdelingen en teams

== Hoofdtaken van besturing:
- *Richting van de organisatie* bepalen, externe afstemming tussen organisatie en omgeving
- *Inrichting van de organisatie*, organisatiestructuur, processen en systemen
- *Beheersing van bedrijfsprocessen*, op gang brengen en op koers houden van doelgerichte activiteiten
- *Netjes achterlaten* van de organisatie


== Agile
*Watervalmethode:* een lineaire aanpak van softwareontwikkeling, waarbij de fasen van het project in een vaste volgorde worden doorlopen.

*Agile:* een iteratieve aanpak van softwareontwikkeling, waarbij het project in korte sprints wordt opgedeeld en de klant nauw betrokken is bij het proces.

Er zijn verschillende opvattingen van agile, maar *4 kenmerken* komen altijd terug:
+ Flexibele strategie
+ Multidisciplinaire teams
+ In korte cycli werken
+ Visueel werken (informatie delen en zichtbaar maken)

#figure(
  image("./images/agile.png", width: 100%),
  caption: "Agile"
) <Agile>

In @Agile is te zien dat agile bestaat uit een aantal stappen:
+ *Backlog:* een lijst van taken die gedaan moeten worden
+ *Stories:* de taken die gedaan moeten worden
+ *Sprint:* een korte periode (3 weken) waarin een aantal taken worden gedaan
+ *Oplevering:* de taken worden opgeleverd
#pagebreak()

De belangrijkste punten in *agile:*
- *Mensen en hun onderlinge interactie* $>$ processen en hulpmiddelen
- *Werkende producten* $>$ allesomvattende documentatie
- *Samenwerking met de klant* $>$ contractonderhandelingen
- *Inspelen op verandering* $>$ het volgen van een plan

Een aantal werkwijzen die gebruikt kunnen worden bij agile zijn:
+ *Scrum:* een framework voor het ontwikkelen, leveren en onderhouden van complexe producten
+ *Kanban:* een methode om te visualiseren, beheren en verbeteren van het werk
+ *Spotify model:* een model waarbij teams worden opgedeeld in squads, tribes, chapters en guilds

== Scrum:
/ Scrum: Een raamwerk waarbinnen mensen *complexe, adaptieve problemen* adresseren en tegelijkertijd op een productieve en creatieve wijze producten van de hoogst mogelijk waarde leveren
Er zijn drie rollen in scrum:
+ *Product owner:* bepaalt wat er gemaakt moet worden
+ *Scrum master:* zorgt ervoor dat het team goed kan werken
+ *Team:* maakt het product

\
#line(length: 100%, stroke: gray)

= Hoe presenteer je een advies?
*De 5 P's:* Proper Preparation Prevents Poor Performance\
*De 3 V's:* 
- *Visueel* (lichaamstaal):
  - Sta recht op
  - Kijk richting het publiek
  - Sta in balans
  - Rustige houding
  - Let op handgebaren
- *Vocaal* (intonatie)
  - Volume
  - Emphasis
  - Tempo
  - Toonhoogte
  - Stilte
  - Oogcontact
- *Verbaal* (inhoud)

#pagebreak()
== Minto piramide:
#figure(
  image("./images/minto.png", width: 100%),
  caption: "Minto piramide"
)<Minto>

De Minto piramide (@Minto) bestaat uit 4 lagen:
+ *Key message*
+ *Supporting points*
+ *Data*
+ *Conclusion*

\
#line(length: 100%, stroke: gray)
= AI voor organisaties
/ Generative AI: AI that can create new content, such as images, text, and music.
Populaire genAI modellen zijn:
\ Tekst:
- *ChatGPT:* OpenAI
- *Llama*: Meta
- *Gemini:* Google
- *Claude:* Anthropic
Beeld:
- *DALL-E:* OpenAI
Muziek:
- *Elevenlabs*
Stem:
- *Pi.ai*

== LLM:
Een LLM is een *Large Language Model* en is een AI model dat is getraind op een grote hoeveelheid tekst. Het model kan worden gebruikt om tekst te genereren, zoals nieuwsartikelen, verhalen of gedichten.

LLMs kunnen gebruikt worden in: Contentcreatie en marketing, Klantenservice, Besluitvorming, Product ontwikkeling, Operationele efficiëntie en technologie voorspellingen.

#pagebreak()
== Risico's van AI:
+ *Bias:* AI kan bevooroordeeld zijn
+ *Misleiding*
+ *Plagiaat*
+ *Ethische kwesties*


#pagebreak()
= Vragen Tyron:
- Moeten we de digital capability map uit ons hoofd weten? (nee)
- Hoe heet het model op pagina 15 week college 3?

= Tentamenstof dingen: 
Oefententamen gaat vooral om de manier van vragen. Veel toepassingsvragen in het tentamen. *Ligt alles wat je doet toe*.
== Tentamenvragen:
- Hoe moet je enterprise information system selecteren (software selectie)
- Schrijf een SAQ (situatie, complicatie, vraag, #strike[antwoord]). Zorg dat het niet 1 regel is. Wees relevant. 
  - Situation: beschrijf de feitelijke dingen (4 tot 5 zinnen)
  - Complicatie: wat is het probleem (4 tot 5 zinnen)
  - Question: 1 vraag mag, het liefst 2 vragen
  - Voorbeeld: wat bekent de nieuwe introductie van elektrische auto's voor BMW?
  - Zorg dat er nooit iets van je complicatie in je situatie staat. Hou situatie feitelijk. 
- Processen:
  - Tegen het logistieke proces van productie tot verzending van X.
- Business model canvas: Ken deze, je moet hem zelf kunnen opstellen. 9 dingen onder elkaar. 
  - Vul eerst value-proposition in. dan key partners en de rest van de linker kant. 
  - Daarna revenue streams en de rest van de rechterkant.
  - Minimal 2 dingen per vakje met *toelichting*
- Weet hoe je een organogram maakt
- Weet hoe je een planning maakt
- De dimensies van Business Capabilities weten (die 4 uit de opdracht)
- Digital capability map hoef je niet uit je hoofd te kennen. Het geeft je context in voor een organisatie. 
- Capabilities map: gebruik die om je capabilities te ordenen.
- Gartner Hype Cycle: kan je uitleggen waarom een technologie in een bepaalde fase zit. Je kan de assen gebruiken om dingen uit te leggen
- Technologie trends zijn niet zo interessant
- Weet hoe je de culturele lagen kan toepassen:
  - Nike: Symbolen: de swoosh, Helden: Michael Jordan
  - Apple: Symbolen: de appel, Helden: Steve Jobs
- Ken de 8 stappen voor cultuur veranderen
- Kan organogram tekenen
- Hoe kan een technologie toegevoegde waarde hebben voor:
  - Een persoon
  - Een team
  - Een organisatie
- Ken diverse hoofdactiviteiten
- Ken de theorie van presenteren, dingen als Minto piramide
- *Schrijf duidelijk*

== Voorbereiding:
*Eerste vraag:* opwarmen, niet super moeilijk\
*Tweede vraag:* iets meer toepassen\
*Derde vraag:* toepassen
3 grote onderdelen: 
- Verbanden leggen
- Toepassing modellen

1.b Leg uit waarom Business & IT alignment relevant is voor een organisatie:
- Als je dat soort dingen niet goed doet krijg je problemen, als je het wel goed doet kan je kansen creëren.

1.c Leg uit hoe het concept van business capabilities bijdraagt aan Business & IT alignment:
- In de business capabilities zitten domeinen. Als je die 4 hebt heb je alignment

1.e Leg uit goe Agile kan bijdragen aan het dichter bij elkaar krijgen van Business & IT:
- Agile is multidisciplinair, je hebt mensen vanuit de business en IT in een team.

3.a Leg uit wat het business model canvas is:
- Niet de elementen
- Legt uit hoe een business model canvas inzicht geeft in wat de waarde van een bedrijf is

3.c Werk het business model canvas uit voor Coolblue:
- 18 punten, 2 per vakje, toelichting
- Hou het algemeen: bezorg bedrijven in plaats van PostNL
- Denk vooral aan onderscheidende dingen
- Value proposition: denk aan de slogan. _Het leveren van producten en diensten met de focus op goede klantenservice_


3.d Beschrijf de SCQ van AH omtrent de stakingen in de distributiecentra die in de maand mei plaatsvonden. 