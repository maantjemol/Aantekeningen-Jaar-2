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
  title: "Entrepreneurship cases",
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

= GEOX
== Would you describe the founder of Geox as an innovator or inventor, and why?
I would describe the founder of Geox as an innovator. He did invent the idea of a breathable soles, but also commercialized it and made it a success. He converted his great idea into a successful product.

== Which aspects of creativity and problem solving do you recognize in the case?
- Mario encountered a problem, damp feet when walking in warm environments, and came up with a creative solution, a breathable sole.
- He fixed this problem in a creative way, by first cutting holes in the soles of his shoes, and later by inventing a new technology in collaboration with universities.
- He kept this problem solving up by continuously improving the technology and expanding the product range. Geox also has a big focus on R&D.

== Who are Geox's key competitors?
Geox's key competitors are Nike, Adidas, and C&J Clark. These companies are also big players in the sports and casual footwear industry.

== What strategies and options are available to Geox for sustaining its position in these industries?
- Geox has more then 50 patents, which gives them a competitive advantage. This makes it harder for other companies to copy their technology.
- Geox has a big focus on R&D, which allows them to continuously improve their products and come up with new products.

== What factors, other than product innovation, does Geox owe its competitive advantage to?
- Geox was founded in Italy and has a strong focus on fashion, not only technology. They realized that they have to ensure that the shoes looked good, and stay on top of fashion trends.
- They have a strong marketing strategy that focuses on the fashion and technology aspects of the shoes.