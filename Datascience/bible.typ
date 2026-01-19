
#set text(font: "Noto Sans")
#set par(justify: true)
#set list(marker: square(size: 8pt, stroke: black.lighten(70%)))
#let bible(plan) = {
  let i = 1
  while i <= plan.len() {
    heading(level: 4)[Day #i:]
    box(stroke: blue.lighten(60%), radius: 2pt, inset: 6pt)[
    #let day = plan.at(i - 1)
    #for chapter in day {
      [- #chapter]
    }]
    i+= 1
  }
}
#set page(columns: 3)
#bible(json("plan.json"))
