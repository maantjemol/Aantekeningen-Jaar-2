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
  // You can make all dates optional, however, `date` is by default `datetime.today()`
  
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
Gevolgen hiervan zijn crisessen en schandalen, en soms wordt er ook minder doelmatig en "goed" gepresteerd.
  