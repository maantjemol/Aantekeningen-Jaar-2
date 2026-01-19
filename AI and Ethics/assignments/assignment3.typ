#import "@preview/cetz:0.1.2": canvas, draw, tree
#import "@preview/gentle-clues:1.0.0": *

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#238082")

#let title = "Assignment 3 | AI & Ethics:"

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

= Why Privacy Matters
I take issue with the proposition, "Privacy is relevant only to those who have something to hide." I fundamentally disagree and will argue why privacy is an essential right for everyone, regardless of whether one has something to "hide."

The idea that you only care about privacy if you are doing something wrong feels a bit like a lazy dead giveaway. It sounds logical when you first hear it, a kind of simple truth: good citizens have nothing to fear, so why should they care about peeping eyes? However, I believe this reasoning is not only short-sighted, but also dangerous. It reduces a basic human right to a kind of luxury for the sneaky among us. It disregards why privacy is important to a society like ours, and to the development of individuals within it. My opinion is that privacy is not about hiding illegality, but about preserving autonomy and human dignity.

In our modern world, where data is the new gold and technology is everywhere, our personal information is constantly being collected, analyzed and often traded. Think of our search history, location data, online purchases, social media interactions, and even smart home devices. The proposition suggests that as long as this data does not contain evidence of criminal activity, collecting it is not a problem. I find this a problematic view. It's not just about whether you are breaking the law. It is about who has control over your personal sphere. Privacy is the right to control who knows, sees or records what about you. It is the space to be yourself, to the freedom to explore thoughts and identities, to make mistakes without it becoming immediately public or permanently recorded in some database. Without this space, people start behaving differently, become more cautious, more conformist, for fear of judgment, misinterpretation or future consequences. This gets to the heart of personal freedom.

I want to look at this from different ethical perspectives from the first lecture. From a *deontological perspective*, which assumes duties and rights, you can argue that privacy is a human right, based on the idea of human dignity and autonomy. The right to a private life is fundamental, regardless of its potential consequences or usefulness to others (such as the state or corporations). Violation of privacy is then fundamentally wrong, because it affects the human dignity and autonomy of the person. From a *utilitarian perspective*, which looks at maximizing well-being for the greatest number, the argument for mass surveillance may seem stronger ("Making sure everyone is safe above all else"). However, I believe that the negative consequences of a lack of privacy, for example the erosion of trust, the effect on free speech and creativity, the risk of data misuse and the creation of a surveillance society outweigh in the long run the perceived security benefits. *Virtue ethics* asks us what kind of society we want to be. Do we want to live in a community based on trust, respect and freedom, where people are given space to be themselves? Or do we choose a society of constant distrust and control? I believe the pursuit of a society that respects privacy is a virtuous goal.

The core of my objection is that the statement "have something to hide" interprets far too narrowly. What does "have something to hide" mean? Is it only about illegal activities? Or also about embarrassing details, unpopular political views, medical conditions, financial problems, personal relationships, or simply the want to be left alone? The line is vague and very subjective. Moreover, what is acceptable today may be considered suspicious or undesirable later. Data that seems innocuous now may be used against you in the future, in a different context or under a different regime. Consider, for example, how data about religious or political preferences has had bad consequences in certain historical contexts. Privacy protects us from the unpredictability of the future and potential shifts in social norms and power relations.

A major counterargument often heard is, "But if we want to catch criminals and terrorists, we need access to data, right? Isn't a little loss of privacy a small price to pay for more security?" I believe this is a false contradiction. First, there is no convincing evidence that mass surveillance without targeted suspicion is significantly more effective in preventing crime or terrorism than traditional targeted tracking methods that do take privacy into account. Collecting vast amounts of data mainly creates a haystack in which the needle is even harder to find. Second, even if there were a security benefit, we must ask whether the end justifies the means. Giving up a fundamental right for everyone because of the potential crimes of a small minority creates a disproportionate balance of power. Power comes to those who collect and interpret the data, which are governments and large corporations. This power can easily be abused, not only for security purposes, but also for social control or political repression. The "I have nothing to hide" argument completely ignores these power dynamics. The issue is not whether you are doing something wrong now, but what a powerful entity can do with your data, now or in the future.

Moreover, the idea that only "those who have something to hide" need privacy is fundamentally inhumane. Everyone needs personal space, physically and mentally. Think of a diary you keep, a conversation behind closed doors, or simply closing the curtain at night. You do this not because you plan illegal things, but because you need control over who has access to your most personal life. Privacy allows us to build relationships based on trust, to be vulnerable with the people we choose, and to distinguish between our public and private selves. Without that distinction, our identity fades and we are reduced to the data collected about us.

In conclusion, I reject the proposition that privacy is relevant only to those who have something to hide. I strongly believe that privacy is a fundamental human right, essential to autonomy, dignity, and a free, democratic society. It is not about hiding wrongdoing, but about protecting my personal space, my freedom of thought and action, and my protection from power and control. The "I have nothing to hide" argument is a oversimplification that misses the deeper value of privacy and opens the door to a society in which we are all under constant surveillance. And that is a society in which I do not want to live, no matter how "good" we are.