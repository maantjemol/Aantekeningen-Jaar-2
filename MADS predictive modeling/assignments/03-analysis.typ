#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#E50156")

#let f1(x) = calc.pow(x, 2)

#let title = "Exercises Chapter 3 | Week 3"

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

=== Exercise 1
When dealing with skewed data, accuracy is not preferred because it might give an inaccuracte view of the performance. If a dataset is skewed, it means that one class is more dominant than the other. For example, if 95% of the data belongs to class A and only 5% to class B, a model that always predicts class A will have an accuracy of 95%. However, this model is not useful because it fails to identify any instances of class B. In such cases, metrics like precision, recall, and F1-score are more informative as they provide insights into how well the model performs on the minority class.

=== Exercise 2
TP: True Positives
- Prediction: True
- Actual: True
TN: True Negatives
- Prediction: False
- Actual: False
FP: False Positives
- Prediction: True
- Actual: False
FN: False Negatives
- Prediction: False
- Actual: True

=== Exercise 3:
The confusion matrix will be a diagional matrix like this:
$ mat(10, 0; 0, 10) $

#pagebreak()

=== Exercise 4:
The confusion matrix:
$ mat(6, 1; 2, 3) $
- TN = 6
- TP = 3
- FP = 1
- FN = 2
  
Accuracy: $ "Accuracy" = (6 + 3) / (6 + 1 + 2 + 3) = 0.75 $
Precision: $ "Precision" = (3) / (3 + 1) = 0.75 $
Recall: $ "Recall" = (3) / (3 + 2) = 0.6 $
F1: $ "F1" = 2 dot (0.75 * 0.6) / (0.75 + 0.6) = 0.6 overline(6) $

=== Exercise 5:
/ Poor precision: with a precision of 0.25, the model has a high rate of false positives. This means that many of the instances predicted as positive are actually negative. In practical terms, this could lead to unnecessary actions or interventions based on incorrect predictions. For example, in a medical diagnosis scenario, a low precision could result in healthy patients being incorrectly diagnosed with a disease, leading to unnecessary stress and medical procedures.

/ Poor recall: with a recall of 0.5, the model is missing half of the actual positive cases. This means that many true positive instances are not being identified by the model. In practical terms, this could lead to missed opportunities for intervention or treatment. For example, in a fraud detection scenario, a low recall could result in many fraudulent transactions going undetected, leading to financial losses.

Model 1: high precision, low recall. Example: spam email filter that only flags emails as spam when it is very certain they are spam, resulting in few false positives but many false negatives.

Model 2: low precision, high recall. Example: a medical screening test that aims to identify as many potential cases of a disease as possible, even if it means some healthy individuals are incorrectly identified as having the disease.
#pagebreak()

a. model 1\
b. model 2\
c. model 2\
d. model 2\
e. model 1\
f. model 1\

=== Exercise 6
Compute the regular mean (precision + recall)/2 and the harmonic mean F1, as
well as the minimum min(precision, recall) in the following cases
a. Precision = 0.5, Recall = 0.5
b. Precision = 1, Recall = 0
c. Precision = 0.2, Recall = 0.2
d. Precision = 1, Recall = 0.2

a. Regular mean = 0.5, F1 = 0.5, Minimum = 0.5\
b. Regular mean = 0.5, F1 = 0, Minimum = 0\
c. Regular mean = 0.2, F1 = 0.2, Minimum = 0.2\
d. Regular mean = 0.6, F1 = 0.333, Minimum = 0.2\

=== Exercise 7
Harmonic mean works better for ratios because it gives more weight to lower values. In the case of precision and recall, if one of them is very low, the harmonic mean will be significantly lower than the arithmetic mean. This is important because a model with high precision but low recall (or vice versa) is not desirable in many applications. The harmonic mean ensures that both precision and recall need to be reasonably high for the F1 score to be high, making it a more balanced metric for evaluating model performance.

