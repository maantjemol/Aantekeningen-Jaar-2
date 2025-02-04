#import "@preview/cetz:0.1.2": canvas, draw, tree
#import "@preview/gentle-clues:1.0.0": *

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#0E3B43")

#let title = "Summary AI and Ethics"

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
        Leiden University | #title// SBIS | Randstad | Group A
      ]
    )
    #place( top + right, dy: 12pt,
    text(fill: white, size: 11pt)[      
      #counter(page).display(
        "1 of 1",
        both: true,
      )
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


= About ethics and about ethical theory
== What is ethics?
Ethics is about *value judgments*. What do you think is right and wrong. It is not about law. Ethics goes with emotions and feelings about what is right and wrong. These are *not irrational*.

== Ethical theories:
There are three main ethical theories:

*Consequece ethics (utilitarianism)*\
Focus on the outcome. The outcome is the most important. The end justifies the means. Very close to *utilitarianism*. It is very intuitive, flexible and easy to understand. However, Happiness is hard to determine, and this theory can have strange consequences. It doesn't provide a direction for right or long.
- addition & subtraction

*Deontological ethics (duty ethics)*\
focus on the action. The action is the most important. The laws and principles are sacred. Duty ethics. Principles that are treated as sacred. Very predictable and consequent. Often in correspondence to intuition. It is however unclear where these principles come from. There is also less space for ad hoc decisions and a sense of justice. There is no space for adjusting the rules or exceptions.
- reasoning

*Virtue ethics*\
Focus on the person. The person is the most important.