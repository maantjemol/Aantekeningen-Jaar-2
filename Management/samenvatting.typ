#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#1d4fe3")

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
    (title: "Samenvatting", content: [

Deze samenvatting biedt een uitgebreid overzicht van financieel management in de publieke sector. We onderzoeken de specifieke uitdagingen en dilemma's die publieke organisaties  ervaren in het beheren van hun financiële middelen, te midden van complexe maatschappelijke doelstellingen.
#line(length: 100%, stroke: gray)
#outline(depth: 1, fill: "", title: [Inhoud])

    ]),
  ),
  open-access: true,
  margin: (
    (
      title: "Key Points",
      content: [
        - De publieke sector is gericht op een doel, en niet op winst. De publieke sector bestaat uit publiek georiënteerde organisaties, zoals de overheid en de middenveld organisaties.
        - De sector is divers georganiseerd en er zijn veel verschillende producten. De bekostiging is vaak via belastingen, en dus ook niet markt georiënteerd.
        - De crisis van 2008 heeft geleid tot een herziening van het Europees begrotingsraamwerk, waarbij de nadruk ligt op jaarlijkse uitgavenplafonds.  
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
#set quote(block: true)
#show heading: set text(defaultColor, weight: "medium")

= Define marketing
