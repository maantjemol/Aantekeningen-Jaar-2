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

= Presentatie geven deel 3 <presentatie>
Je wilt dat mensen je presentatie onthouden, maar ook je naam onthouden. Dit kan je doen door je naam wat langzamer uit te spreken. 
/ Minto Piramide: start with the most important information and then build your case with supporting details

== Verhaal $->$ Vorm $->$ Inhoud:
- *Minto Piramide*
- Als je weet hoe het verhaal gaat lopen kan je de vorm bepalen en wordt de inhoud makkelijker.
- Maak bvb van te voren een template voor je presentatie. 

== Presentatie $!=$ rapport:
- Probeer niet 50 slides in 10 minuten te proppen.

== Backup:
Heb een backup plan voor als er iemand ziek is of als de techniek niet werkt. Zorg dat je op tijd bent. Laat je niet afleiden als er iets fout gaat, hou er gewoon rekening mee dat er iets mis kan gaan.

== Wees op tijd & test:
- Zorg dat je op tijd bent en dat je alles getest hebt.

== Online presentaties:
Niet iedereen heeft een goede internetverbinding. Je hoort het ook niet allemaal tegelijkertijd. Let nog meer op je stiltes en geef ruimte voor vragen. 

== Advies rapport:
- Expliciet zeggen dat mensen de *vragen aan het eind* moeten stellen!
- Stuur een uitnodiging voor de presentatie. Zet belangrijke punten in de uitnodiging. Zet het doel van de presentatie erin.
- Wees expliciet over wat het doel van je rapport is.
- Vertel wat je gaat doen (*vlak voor de key points*).
- Er worden vragen gesteld, dus notuleren is belangrijk (*iemand neerzetten die meeschrijft*)
- Vaak heb je ook nog een management samenvatting nodig. Die moet 100% op zichzelf staan. Max 1 slide. (*hoeft niet voor opdracht*). 
- Zorg voor focus
- Zet scenario's neer. Geef 3 varianten.

#pagebreak()
= AI voor organisaties:
Hoe werken die modellen, wat kan je ermee en wat heb je eraan als organisatie?

== Large language models (LLMs):
- LLMs worden bijvoorbeeld gebruikt in de zorg.

= Vergelijken van software:
- Kan je systeem in de toekomst goed werken, is het relevant voer 2 jaar
- Leg evt het process uit waar je doorheen bent gegaan als groep
- Business, capability to fit your needs
- Architecture, ability to integrate
- Delivery, meet out of the box configuration capabilities
- Company Viability, financial viability, is it big enough to support you
- TCO (total cost of ownership)
- Retail Execution
- Detailing
- Analytics and reports
- Experience
- Other
- Procurement
- Relations


Manuel:
Ik werk nu naast mijn studie als web developer maar zou na mijn studie wat meer maatschappelijk relevant werk willen doen. Mijn interesses liggen vooral in data science en ethisch hacken. Ik vind de combinatie van techniek en maatschappij heel interessant en zou daar graag meer mee willen doen. Ook conclusies trekken uit data en daarop actie ondernemen vind ik interessant.