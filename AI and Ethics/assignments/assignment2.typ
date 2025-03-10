#import "@preview/cetz:0.1.2": canvas, draw, tree
#import "@preview/gentle-clues:1.0.0": *

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#238082")

#let title = "Assignment 2 | AI & Ethics:"

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
    
  //   #place( top + right, dy: 12pt,
  //   text(fill: white, size: 11pt)[      
  //     #counter(page).display(
  //       "1 of 1",
  //       both: true,
  //     )
  //   ]
  // )
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

\
I choose for the question: "If the human world is biased, then why worry about bias in AI systems?". I will argue that we should worry about bias in AI systems.

The idea that "since humans are biased, we shouldn't care about AI bias" feels a bit like a cop-out. We know that culture and humans are flawed. I believe that we still shouldn't use that excuse to ignore bias in AI. The underlying issue is that AI doesn't just copy our biases. It takes in biases and reinforces them. This can have a significant impact on people's lives. I believe that there is an opportunity to do better, instead of shrugging it off by saying, "Oh well, humans suck, so our AI will too."

In this modern world, AI is used in more and more critical situations. For example, in the criminal justice system, AI is used to predict recidivism. This is just one example of how AI bias can have a significant impact on people's lives. I believe that we should strive to make AI as fair as possible, even if humans are flawed. If the AI is biased, it can lead to unfair treatment of certain groups. Humans can also be biased. However, automating this bias at scale seems like a recipe for disaster.

When looking at this from a utilitarian perspective, it seems clear that we should strive to make AI as fair or more fair than humans. For example, if an algorithm denies loans to marginalized communities, or denies healthcare, the harm to the affected people outweighs any short-term efficiency gains that you might have when using this algorithm. From a deontological perspective, we should strive to treat people fairly. Bias is by definition not fair. This means that we should strive to make AI as fair, and therefor unbiased as possible, even if humans are biased. Virtue ethics suggests that we do good things. Making AI fairer than humans is a good thing to do if it impacts the lives of others positively.

One counter argument could be: "If human bias is the source of AI bias, resources should focus on reforming flawed human systems rather than treating the symptom (AI)?". I believe that this is a false premise. Nothing prevents us from working on both human and AI bias. By working on AI bias, we can also uncover hidden biases in human systems. It could be like a mirror that shows us our own biases. 

In conclusion, I believe that we should worry about bias in AI systems. Even if humans are biased, we should strive to make AI as fair as possible. Bias in AI systems can help us learn about our own biases and work on them.

// // // Here's the thing: AI doesn't play fair. When a facial recognition system struggles to ID people with darker skin, it's not just a glitch—it's a recipe for real harm, like wrongful arrests. Or think about job-seeking algorithms that dock resumes for including the word “female” (yes, that's happened). Human bias is bad enough, but AI automates discrimination at scale. Worse, it hides behind claims of “neutrality,” making it harder to call out. At least when a person is racist, you can argue with them. Try arguing with an algorithm.

// // Let's break this down. If we're talking about real-world harm, AI bias is a disaster. An algorithm denying loans to whole neighborhoods or recommending less care to Black patients? The damage piles up fast. And ethically, it's not complicated: fairness isn't optional. If we can build AI that's less biased than humans (and we can!), why wouldn't we? It's not about being perfect—it's about refusing to bake our worst habits into tech that runs our lives.

// // But wait—critics say, “Humans are biased! Why pick on AI?” That's like saying, “I already have a broken leg, so why avoid stepping on this rake?” We're not asking AI to be flawless. We're asking it not to make things worse. Another excuse: “Fix humans first!” Sure, we should fix humans too. But here's the kicker: fixing AI bias forces us to see human bias. When we audit an algorithm, we uncover hidden prejudices in the data we feed it. It's like holding up a mirror to our own mess—and then actually cleaning some of it up.

// Bottom line: AI isn't some passive bystander. It's a tool we control. If we let it amplify our biases, we're choosing laziness over progress. Yeah, humans are messy. But that's exactly why we need to build tech that helps us rise above our worst instincts—not drag us deeper into them. Let's not settle for “good enough.” Let's make AI part of the solution.