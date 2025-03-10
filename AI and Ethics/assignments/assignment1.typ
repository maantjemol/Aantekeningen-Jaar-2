#import "@preview/cetz:0.1.2": canvas, draw, tree
#import "@preview/gentle-clues:1.0.0": *

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#238082")

#let title = "Assignment 1 | AI & Ethics:"

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
\
#align()[
  #text(size: 24pt, weight: "regular", font: "Noto Serif")[
  #title]
  #pad(bottom:8pt, top: -18pt, line(length:20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
  by Manuel Mol (s3545008)
])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}

// For this assignment you have two options; both options require you to write a short column of more than 400 and less than 500 words.

// Option one is about the more than 300 cameras that Leiden University installed during the corona crisis. These cameras were intended to automatically count the number of students in lecture rooms. Many students and staff revolted and wanted the cameras to be removed because of privacy issues. In Feb. 2023 (at the end of crisis) the university management decided to switch off the cameras definitely.

// Write a column about your opinion about these cameras. The column should have the following elements (preferably in underneath order):

// - Your opinion.
// - A motivation: do you have some fundamental point of view that you generally base yourself on (like utilitarianism or some deontological principle).
// - At least one possible counter argument that others might have against your opinion; plus a short reply on this argument.
// - A reflection on your motivation: do you always use the mentioned point of view, or are you sometimes inconsistent?
// ---
\

I choose the option about the cameras at the University of Leiden. I myself wouldn't mind these cameras in the lecture rooms. They are there to count the number of students, which is a useful tool for the university to manage the number of people and to ensure that the rooms are not overcrowded in times of crisis. My view on this is based on a utilitarian perspective. I believe that, if used in a responsible way, the cameras can be beneficial for the safety of the students, which outweighs my privacy concerns in this case, because of a few reasons.

Firstly, the cameras helped the university gain insight into the number of students, which made the university a more safe space during the crisis. This made it easier to grantee the safety of students, but also staff. Secondly, I trust the University specifically to handle this power responsibly. My trust in the University is based on their public commitment to prioritize privacy by employing privacy and security officers who hold individuals accountable and keep an eye on privacy concerns. They also have a history of responsible data handling, and have a responsibility to be trust worthy as a research and educational institution. Responsibility would also mean that the university is transparent, meaning that I trust the University to be clear about the use of the cameras.

One counter argument could be that the cameras are an invasion of privacy. People might feel uncomfortable knowing that they are being watched, and at all times being recorded. I can certainly understand this argument. This is why I think it is extra important that the university is transparent about the use of the cameras. I also think that the cameras should only be used in times of crisis, and not as a permanent solution. The cameras are however there for a good reason, and if used responsibly, I think the benefits of public safety outweigh the privacy concerns. This is however heavily dependent on my trust in the University. Other solutions could be considered, like having students sign up for lectures or people counting, but this would be less efficient and more time consuming.

My view on the cameras, and privacy in general has definitely changed over the years. I used to be very concerned about my privacy. However, I have come to realize that we live in a very safe country with strict laws around the handeling of information. I am still careful about what I share, but I have also found that being too concerned about privacy requires a lot of energy that I can use for more fun things. My view on privacy now is very stable. If I trust the organization, I don't mind sharing my information if it benefits me.