#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#E50156")

#let f1(x) = calc.pow(x, 2)

#let title = "Linear Algebra"

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


= Concepts:

$ arrow(v) = vec(2, 3) $

/ Magnitude of a vector: the length of the vector in space.
$ ||arrow(v)|| = sqrt(2^2 + 3^2) = sqrt(13) $

/ Dot product: a measure of how much two vectors point in the same direction.
$ arrow(a) = vec(2, 2),"  " arrow(b) = vec(3, 1) $
$ arrow(a) dot arrow(b) = 2 dot 3 + 2 dot 1 = 8 $

/ Basis vector: a vector with a length of 1.
$ arrow(v) = 2 vec(1, 0) + 2 vec(0, 1) $

Other basis vectors:  
$ arrow(g_1) = vec(1/sqrt(2), -1/sqrt(2)) $
$ arrow(g_2) = vec(1/sqrt(2), 1/sqrt(2)) $

$ ||arrow(g_1)|| = sqrt((1/sqrt(2))^2 + (-1/sqrt(2))^2) = sqrt(1/2 + 1/2) = sqrt(1) = 1 $


/ Matrix-vector multiplication: transforming a vector using a matrix.
$ mat(a_11, a_12; a_21 ,a_22) vec(1, 0) = vec(a_11, a_21) $

/ Rotation matrix: a matrix that rotates vectors in space.
Rotates 45 degrees counter-clockwise:
$ 
A = mat(1/sqrt(2), 1/sqrt(2); -1/sqrt(2), 1/sqrt(2))\
$
