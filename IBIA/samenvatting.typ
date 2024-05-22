// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#f2542d")

#show: template.with(
  title: "IBIA",
  subtitle: "Samenvatting + aantekeningen",
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
#image("./images/bpmn.png", width: 50%)
Voorbeeld:
#image("./images/bmvoorbeeld.png", width: 100%)
#pagebreak()

= Business Model Canvas
/ Business Model Canvas: A business model describes the rationale of how an organization creates, delivers and captures values. 

#align(center)[
#image("./images/bmc.png", width: 80%)
]

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

#image("./images/DC.png", width: 100%)

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

#image("./images/capabilities.png", width: 100%)

= Technologie: Architectuur, Inkoop, ontwikkeling
== Hoe kom je aan software?
#image("./images/software-koop.png", width: 100%)

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
#image("./images/implementation-cycle.png", width: 100%)

#pagebreak()

/ Architectuur: kunst en wetenschap van het ontwerpen en bouwen van gebouwen en andere fysieke structuren.
= Architectuur:


= Mensen & competenties


= Processen en organisatie: organisatie-eenheden, agile


= AI voor organisaties


= Hoe presenteer je een advies? (1/2)


= Hoe presenteer je een advies? (2/2)


= Data: Strategie en analytics 


= Vragen Tyron:
- Moeten we de digital capability map uit ons hoofd weten?
- Hoe heet het model op pagina 15 week college 3?