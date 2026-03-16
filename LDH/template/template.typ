#let template(
  title,
  doc
) = {
  set text(font: "Quattrocento Sans")

  let strokeColor = rgb("#F3D2D1")
  let brandRed = rgb("#EB5750")

  let pat = tiling(size: (5pt, 5pt))[
    #place(line(start: (0%, 100%), end: (100%, 0%), stroke: 1pt + strokeColor))
    #place(line(start: (50%, 150%), end: (150%, 50%), stroke: 1pt + strokeColor))
    #place(line(start: (-50%, 50%), end: (50%, -50%), stroke: 1pt + strokeColor))
  ]

  let logo-path = "./schild.png"

  set heading(numbering: "1.")
  set page(
      paper: "a4",
      margin: (left: 2.5cm, right: 2.5cm, top: 2cm, bottom: 2cm),

      // The diagonal stripe background
      background: {
        rect(width: 100% - 4 * 24pt, height: 100% - 4 * 24pt, fill: pat)
        place(top + right, dx: 0pt, dy: 2*24pt)[
      #if logo-path != none {
        image(logo-path, width: 2 * 48pt)
      } else {
        // Fallback shape if no image provided
        box(fill: brandRed, radius: 0pt, width: 2 * 48pt, height: 2 * 48pt, inset: 10pt)[
          #place(center + horizon, text(fill: white, weight: "bold", size: 8pt)[LOGO])
        ]
      }
    ]
      }
  )

  v(4*24pt)
  text(fill: brandRed, size: 36pt, weight: "bold")[#title]
  v(-24pt)
  line(stroke: 3pt + brandRed, length: 20%)

  v(2*24pt)

  show outline.entry: it => link(
    it.element.location(),
    // Keep just the body, dropping
    // the fill and the page.
    text(weight: "bold")[
      #it.indented(
        it.prefix(),
        it.inner(),
      )
    ],
  )

  outline(title: [
    #text(fill: brandRed, size: 18pt, weight: "bold")[Inhoudsopgaven]
    #v(-6pt)
    #line(stroke: 2pt + brandRed, length: 10%)
    #v(24pt)
  ])

  set page(background: none)
  show par: set par(justify: true)
  show heading.where(level: 1): set text(size: 18pt, weight: "bold", fill: brandRed)
  show heading: set block(above: 1.5em, below: 1em)
  set page(
    numbering: "1",
    number-align: bottom + center  // Or top + left/right
  )
  doc
}
