#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#2f3445")

#let f1(x) = calc.pow(x, 2)

#let title = "MADS data exploration"

#set page(
  margin: (top: 64pt, bottom: 20pt),
  header: [
    #place(
      top + left,
      dx: -80pt,
      rect(fill: primary, width: 140%, height: 32pt),
    )
    #place(
      top + left,
      dy: 12pt,
      text(weight: "bold", fill: white, size: 11pt)[
        HAN | #title// SBIS | Randstad | Group A
      ],
    )
  ],
  footer: [
    #place(
      bottom + left,
      dx: -80pt,
      rect(fill: primary, width: 140%, height: 8pt),
    )],
)

#show heading.where(
  level: 1,
): it => [
  #set text(weight: "medium", font: "Noto Serif", size: 18pt)
  #pad(top: 2pt, bottom: -12pt, it.body)
  #pad(bottom: 2pt, line(length: 10%, stroke: 2pt + primary.darken(10%)))
]

#show heading.where(
  level: 2,
): it => [
  #set text(weight: "regular", font: "Noto Serif", size: 16pt)
  #pad(top: 2pt, bottom: -10pt, it.body)
  #pad(bottom: 2pt, line(length: 10%, stroke: 1pt + primary))
]

#show heading.where(
  level: 3,
): it => [
  #set text(weight: "regular", font: "Noto Serif", size: 14pt)
  #pad(top: 2pt, bottom: -14pt, it.body)
  #pad(bottom: 2pt, line(length: 10%, stroke: 1pt + primary.lighten(50%)))
]

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) => if y == 0 { primary.lighten(0%) } else { primary.lighten(95%) },
  inset: (right: 1.5em),
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
  #pad(bottom: 8pt, top: -18pt, line(length: 20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
    by Manuel Mol
  ])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}


= Week 6
== Math terms
$
  mu: "population mean"\
  sigma: "population standard deviation"\
  theta: "parameter of interest"\
  H: "hypothesis"\
  H_0: "null hypothesis"\
  H_1: "alternative hypothesis"\
  p: "p-value"\
  n: "sample size"\
  alpha: "significance level"
$

== Hypothesis
/ p-value: the probability that the result is purely due to chance. The propability that you incorrectly conclude the null hypothesis is false when it is actually true (Type I error).
/ Hypothesis: a statement about a population parameter that we want to test using sample data
/ Null hypothesis ($H 0$): a statement of no effect or no difference (e.g., $H 0$: the mean of group A is equal to the mean of group B)
/ Alternative hypothesis ($H 1$): a statement that contradicts the null hypothesis (e.g., $H 1$: the mean of group A is not equal to the mean of group B)
/ Hypothesis test: a statistical method used to determine whether there is enough evidence in a sample of data to infer that a certain condition is true for the entire population

When you can reject the null hypothesis, it means that the observed data is unlikely to have occurred under the assumption that the null hypothesis is true. This does not necessarily mean that the alternative hypothesis is true, but it suggests that there is evidence against the null hypothesis.

/ Type I error: the null hypothesis is true, but we reject it (FP)
/ Type II error: the null hypothesis is false, but we fail to reject it (FN)
\
/ Power: the probability that you correctly reject the null hypothesis when it is false ($1 - "Type II error rate"$). The power of a test is the probability that it will detect an effect when there is an effect to be detected. A higher power means a lower chance of making a Type II error, which is failing to reject a false null hypothesis.

#pagebreak()

#columns(2)[
  == Power function

  The power function is a way of looking at a hypothesis test not just as a single "yes/no" decision, but as a sliding scale of reliability. It measures the probability that you will reject the null hypothesis for any possible true value of the parameter you are testing:

  $
    pi(theta)=P("Reject "H_0"​ when the true value is "theta)
  $
  #colbreak()

  #image("/assets/image.png")
]

/ Power function: a function that gives the probability of correctly rejecting the null hypothesis for each possible true value of the parameter being tested.

== Central limit theorem
/ Central limit theorem: the CLT states that if you take enough samples from a population, the *means* of those samples will form a normal distribution, regardless of the original population's shape.

=== Example:
Suppose you have a fair six-sided die. The distribution of a single roll is Uniform: you have an equal $1/6$ chance of getting any number from $1$ to $6$. The average of a single roll is $3.5$.

==== Rolling One Die ($n=1$)
If you roll the die $1,000$ times and plot the results, your graph will look like a flat block. You’ll have roughly the same number of 1s, 2s, 3s, etc. This is not a bell curve.

==== Rolling Two Dice ($n=2$)
Now, roll two dice and calculate their average. To get an average of 1, you must roll $(1,1)$. To get an average of $3.5$, you could roll $(1,6),(2,5),(3,4)$, and so on. There are more ways to get a middle average than the extremes. The graph starts to look like a triangle.


==== Rolling Thirty Dice ($n=30$)
If you roll 30 dice and average them, and repeat this process many times, the distribution of those averages will be a nearly perfect bell curve centered at $3.5$. Even though the individual dice follow a "flat" distribution, their averages follow a "normal" one.

#pagebreak()

== Tests
/ T-test: a statistical test used to determine if there is a significant difference between the means of two groups, which may be related in certain features. It is commonly used when the sample sizes are small and the population standard deviation is unknown.

/ Z-test: a statistical test used to determine if there is a significant difference between the means of two groups when the population standard deviation is known and the sample size is large (typically $n > 30$).

/ Binomial test: a statistical test used to determine if the observed proportion of successes in a sample is significantly different from a hypothesized proportion. It is commonly used when the data consists of binary outcomes (success/failure) and the sample size is small.

// When to use which test?
Use a *t-test* when:
- The sample size is small (typically $n < 30$).
- The population standard deviation is unknown.
- The data is approximately normally distributed.

Use a *z-test* when:
- The sample size is large (typically $n > 30$).
- The population standard deviation is known.
- The data is approximately normally distributed.

Use a *binomial test* when:
- The data consists of binary outcomes (success/failure).
- The sample size is small.
