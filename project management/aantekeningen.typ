#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *
#import "@preview/cetz:0.2.2"

#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}
#let defaultColor = rgb("#2d75f2")

#let caution-rect = rect.with(inset: 1em, radius: 0.5em, fill: defaultColor.lighten(96%), width:100%, stroke: defaultColor.lighten(80%))

#let note = (content) => inline-note(rect: caution-rect, stroke: defaultColor.lighten(60%))[#content]



#show: template.with(
  title: "Project management",
  subtitle: "Samenvatting",
  short-title: "",
  venue: [ar#text(fill: red.darken(20%))[X]iv],
  // This is relative to the template fsile
  // When importing normally, you should be able to use it relative to this file.
  
  theme: defaultColor,
  authors: (
    (
      name: "Manuel Mol                                                                                                              . ",
    ),
  ),
  kind: "Samenvatting",
  abstract: (
    (title: "Samenvatting", content: [#lorem(100)]),
  ),
  open-access: true,
  margin: (
    (
      title: "",
      content: [
      ],
    ),
  ),
  font-face: "Open Sans"
)

#set page(
  margin: (left: 1in, right: 1in), paper: "a4"
)
#let marginRatio = 0.8
#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}

#set-page-properties()


#show terms: it => [
  #note[#text(defaultColor, weight: 600, size: 10pt)[#it.children.first().term]\ #it.children.first().description] 
]

#set heading(numbering: none)

#show heading: set text(defaultColor, weight: "medium")


= Het plan van aanpak (4-5 pagina's)
Er zit een duidelijk verschil tussen het doel van het project en het daadwerkelijke resultaat wat je krijgt uit het project.

/ APDRA: #text[
  Achtergrond, Probleemstelling, Doelstelling, Resultaat, Afbakening.\
]
Het plan van aanpak kan gemaakt worden door de APDRA en GO-KIT te volgen.
/ GO-KIT + R: #text[
  - *Geld*: Mag in ons geval ook tijd zijn (40 uur)
  - *Organisatie:* rollen verdelen, wie doet wat?
  - *Kwaliteit*: Wat zijn de eisen van het project?
  - *Informatie*: Hoe en waar documenteer je alles?
  - *Tijd*: Wanneer moet wat af zijn, tijdsplan?
  - *Risico's*: Anticiperen op dingen die gaan gebeuren.
]

