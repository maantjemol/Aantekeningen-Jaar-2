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
  title: "Entrepreneurship",
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

// Week 1
= Entrepreneurship and ideas
Firms or businesses come from *entrepreneurs*. They play an essential role in making the decisions. An entrepreneur is important at the *start* and *throughout* the lifecycle of a businesses. Entrepreneurship creates *economic value*, *jobs* and *societal change or value*.

== The starting point
Entrepreneurship starts with *ideas*. Ideas start with a problem question. Things that frustrate me or people. The next step is to try to solve this problem. A process that helps with this is the *design thinking process*. This process consists of 6 steps:
- Empathize (conduct interviews)
- Define (reframe and create human-centered problem statements)
- Ideate (brainstorm)
- Prototype (create a low-fidelity prototype)
- Test (test the prototype to gather data)
- Assess (gather feedback and iterate)

#figure(
  caption: "Design thinking process",
)[#image("./images/ideate.png", width: 80%)]

The best startups come from the bad experiences of the founders. The best ideas come from the *problems* that you have.

=== Change:
The main source of opportunity is change. We can use *PESTEL* analysis to identify changes in the environment. PESTEL stands for:
- Political change
- Economic change
- Social change
- Technological change
- Environmental change
- Legal change

/ How can you source ideas?: #text[
*Consumers*
- (In)formally monitor potential ideas and needs among consumers
- Let consumers express their opinions (what do they want/need?)
*Existing products and services*
- Formally monitor and evaluate competitive products and services on the market
- Uncovering ways to improve current products
- Entrepreneurship is a response to opportunities created but not exploited by the incumbent firms
*Files from the Patent Office*: 
- in response to government regulations
- research and development
]

=== Trends:
How might we enhance/create/improve/expand/grow/develop/innovate/transform? 
- How might we improve how the elderly live independently?
- How might we redesign how adults learn in virtual worlds?

== The next step:
=== Filtering ideas:
We have a lot of ideas. We want to go from ideas to entrepreneurial opportunities. We need to think about: *Me* (am i ready for the idea), *Market* (is the rest ready for the idea) and *Money* (is it feasible). 

*Not all ideas are entrepreneurial opportunities*. Ideas must be:
- *Novel:* The idea is new and has not been done before
- *Value:* The idea provides value to the customer
- *Unmet needs:* The idea meets unmet needs

An opportunity must be:
- *Desirable:* The idea is desirable
- *Feasible:* The idea is feasible
- *Viable:* The idea is viable
