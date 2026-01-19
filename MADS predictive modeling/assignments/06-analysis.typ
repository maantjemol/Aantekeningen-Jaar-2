#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#E50156")

#let f1(x) = calc.pow(x, 2)

#let title = "Exercises Chapter 3 | Week 6"

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

= Exercise 1:
For each of the following classification types specify (1) how many outputs there are, (2) how
many classes per output, and (3) give an example of an application

- *Binary classification:*
  - _Outputs_: $1$
  - _Classes_: $2$
  - _Example_: Spam detection (spam or not spam)
- *Multiclass classification:*
  - _Outputs_: $1$
  - _Classes_: $> 2$
  - _Example_: Dog cat classification (dog, cat, hamster, ...)
- *Multilabel classification:*
  - _Outputs_: $> 1$
  - _Classes_: $> 2$
  - _Example_: Animal detection in picture multiple animals(dog, cat, hamster, ...)
- *Multioutput classification:*
  - _Outputs_: $> 1$
  - _Classes_: $> 2$
  - _Example_: Predicting multiple attributes of an object (e.g., color, size, shape)

= Exercise 2:
The difference between per row normalization and per column normalization of a confusion matrix is that per row normalization shows the distribution of predicted classes for each actual class, while per column normalization shows the distribution of actual classes for each predicted class.

Recall is calculated with row normalization, precision is calculated with column normalization.

= Exercise 3:
- *Recall* can be found under row normalization
- *Precision* can be found under column normalization

= Exercise 4:
The percentages in the error only normalized confusion matrix shows what percentage of predicted classes were predicted as some value for each class, and what percentage of the total true classes were predicted as some value for each class.

The percentages in the error only normalized confusion matrix shows what percentage of predicted classes were predicted as some value for each class, and what percentage of the total true classes were predicted as some value for each class.

#pagebreak()

== Non-normalized
#table(
  columns: (4),
  align: (center, center, center, center),
  // Header
  [**Predicted Class $arrow.r$**\ **Actual Class $arrow.b$**\ ],
  [**Predicted: 0**],
  [**Predicted: 1**],
  [**Row Sum (Actual Total)**],
  // Row 1: Actual 0 (Healthy)
  [**Actual: 0 (Healthy)**],
  [950 (TN)],
  [10 (FP)],
  [960],
  // Row 2: Actual 1 (Disease)
  [**Actual: 1**],
  [30 (FN)],
  [10 (TP)],
  [40],
  // Footer: Column Sum
  [**Column Sum**],
  [980],
  [20],
  [**Total: 1000**]
)

== Row normalized
#table(
  columns: (auto, auto, auto),
  align: (center, center, center, center),
  // Header
  [*Predicted Class $arrow.r$*\ *Actual Class $arrow.b$*\ ],
  [*Predicted: 0*],
  [*Predicted: 1*],
  // Row 1: Actual 0 (Healthy)
  [*Actual: 0 (Healthy)*],
  [*0.990*\ Correctly classified $99.0%$ of healthy],
  [*0.010*\ Misclassified $1.0%$ of healthy],
  // Row 2: Actual 1 (Disease)
  [*Actual: 1 (Disease)*],
  [*0.750*\ Misclassified $75.0%$ of diseased],
  [*0.250*\ Correctly classified $25.0%$ of diseased],
)

== Column normalized
#table(
  columns: (auto, auto, auto),
  align: (center, center, center, center),
  // Header
  [*Predicted Class $arrow.r$*\ *Actual Class $arrow.b$*\ ],
  [*Predicted: 0*],
  [*Predicted: 1*],
  // Row 1: Actual 0 (Healthy)
  [*Actual: 0 (Healthy)*],
  [*0.969*\ Precision for predicting Healthy],
  [*0.500*\ False Discovery Rate for predicting Disease],
  // Row 2: Actual 1 (Disease)
  [*Actual: 1 (Disease)*],
  [*0.031*\ False Omission Rate for predicting Healthy],
  [*0.500*\ Precision for predicting Disease],
)