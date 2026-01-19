#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#E50156")

#let f1(x) = calc.pow(x, 2)

#let title = "MADS predictive modeling"

#set page(
  margin: (top: 64pt, bottom: 20pt),
  header: [
    #place(
      top + left,
      dx: -80pt,
      rect(fill: primary, width: 140%, height: 32pt,)
    )
    #place(
      top + left,
      dy: 12pt,
      text(weight: "bold", fill: white, size: 11pt )[
        HAN | #title// SBIS | Randstad | Group A
      ]
    )
  ],
  footer: [
    #place(
    bottom + left,
    dx: -80pt,
    rect(fill: primary, width: 140%, height: 8pt,)
  )],
)

#show heading.where(
  level: 1
): it => [
    #set text(weight: "medium", font: "Noto Serif", size: 18pt) 
    #pad(top: 2pt, bottom: -12pt, it.body)
    #pad(bottom:2pt, line(length: 10%, stroke: 2pt + primary.darken(10%)))
]

#show heading.where(
  level: 2
): it => [
    #set text(weight: "regular", font: "Noto Serif", size: 16pt) 
    #pad(top: 2pt, bottom: -10pt, it.body)
    #pad(bottom:2pt, line(length: 10%, stroke: 1pt + primary))
]

#show heading.where(
  level: 3
): it => [
    #set text(weight: "regular", font: "Noto Serif", size: 14pt) 
    #pad(top: 2pt, bottom: -14pt, it.body)
    #pad(bottom:2pt, line(length: 10%, stroke: 1pt + primary.lighten(50%)))
]

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if y == 0 { primary.lighten(0%) }
    else {primary.lighten(95%)},
  inset: (right: 1.5em)
)

#show table.cell: it => {
  if it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#align()[
  #text(size: 24pt, weight: "regular", font: "Noto Serif")[
  #title]
  #pad(bottom:8pt, top: -18pt, line(length:20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
  by Manuel Mol
])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}


= The ML landscape
/ Machine learning: building systems that learn from data to improve their performance on specific tasks without being explicitly programmed.

/ Supervised learning: learning a function that maps inputs to outputs based on example input-output pairs.

/ Unsupervised learning: finding hidden patterns or intrinsic structures in input data without labeled responses.

/ Reinforcement learning: training agents to make sequences of decisions by rewarding desired behaviors and punishing undesired ones.

/ Batch learning: training a model on a fixed dataset all at once.

/ Online learning: updating the model incrementally as new data arrives.

/ Out of core learning: handling datasets that are too large to fit into memory by processing them in smaller chunks.

= The MADS framework