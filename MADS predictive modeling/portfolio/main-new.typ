#set page("us-letter",columns: 2, margin: (
  top: 2cm,
  bottom: 2cm,),
  numbering: "1"
)
#set heading(numbering: "1.1")
#set text(region: "GB")
#show heading: it => [
  #if it.depth > 1 {
    set text(10pt, weight: "extrabold", font: "Noto Sans")
    upper[#block(it)]
  } else {
    pad(bottom: 4pt)[
    #set text(12pt, weight: "extrabold", font: "Noto Sans")
    #upper[#block(it)]
    ]
  }
  ]

#set par(justify: true)

#show table.cell.where(y: 0): strong

// Set the table properties
#set table(
  stroke: none,
  // Optionally, define a stroke on the bottom of the first row (header)
  // stroke: (x, y) => (if y == 0 {(bottom: 0.7pt + black)}),

  // Align cells based on their column index (left for first column, center for others)
  align: (x, y) => (
    if x == 0 { left }  // First column (Source) aligns left
    else { center }    // Other columns align center
  )
)


#place(
    top,
    float: true,
    scope: "parent",
    clearance: 30pt,
    {
      text(18pt, weight: "extrabold", font: "Noto Sans")[
        PORTFOLIO - PREDICTIVE MODELING
      ]
      text(12pt, weight: "semibold", font: "Noto Sans")[
        
        #link(<manuel>)[Manuel Mol#super()[1]],
      ]
      text(10pt, weight: "semibold", font: "Noto Sans")[

        #super()[1]2168651 <manuel>,
        \ \
      ]
    }
)

// =====================================//
//                                      //
//            Hier schrijven            //
//                                      //
// =====================================//


= Example header
