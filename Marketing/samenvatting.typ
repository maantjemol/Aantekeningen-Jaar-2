#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *
#import "@preview/cetz:0.2.2"

#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}
#let defaultColor = rgb("#2d75f2")

#let caution-rect = rect.with(inset: 1em, radius: 0.5em, fill: defaultColor.lighten(96%), width:100%, stroke: defaultColor.lighten(80%))

#let note = (content) => inline-note(rect: caution-rect, stroke: defaultColor.lighten(60%))[#content]



#show: template.with(
  title: "Marketing in the 21st Century",
  subtitle: "Samenvatting",
  short-title: "IBIA Samenvatting",
  venue: [ar#text(fill: red.darken(20%))[X]iv],
  // This is relative to the template file
  // When importing normally, you should be able to use it relative to this file.
  
  theme: defaultColor,
  authors: (
    (
      name: "Manuel Mol                                                                                                              . ",
    ),
  ),
  kind: "Samenvatting",
  abstract: (
    (title: "Samenvatting", content: [#lorem(100)]),
  ),
  open-access: true,
  margin: (
    (
      title: "",
      content: [
      ],
    ),
  ),
  font-face: "Open Sans"
)

#set page(
  margin: (left: 1in, right: 1in), paper: "a4"
)
#let marginRatio = 0.8
#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}

#set-page-properties()


#show terms: it => [
  #note[#text(defaultColor, weight: 600, size: 10pt)[#it.children.first().term]\ #it.children.first().description] 
]

#set heading(numbering: none)

#show heading: set text(defaultColor, weight: "medium")

// Week 1
= Different roles for strategy and marketing:
== Strategic management:
*Focus on the:*
- Direction of the organization
- Allocation of capital (money)
- Overall performance

*Scope:*
- Entire organization
- Integrates all business functions

*Main questions:*
- How do we make money?
- Which industries should we be in?
- How should we compete?

== Marketing:
*Focus on the:*
- Customer needs and wants
- Experience, price, distribution, communication
- Marketing effectiveness

*Scope:*
- Customer (and partner) relationships
- Market dynamics

*Main questions:*
- How do we create value for customers
- How to build customer relationships?
- How can we capture value from customers in return?

= Definition of marketing:
History: _slides week 1:11_ 

/ Definition of marketing: #text[
  The *process* by which companies create value for customers and build strong relationships in order to capture value from customers in return (Armstrong & Kotler, 2023, p.29). 

  The twofold goal … is to attract new customers by promising superior value and to keep and grow current customers by 
  delivering satisfaction.’
]

strategy: STP

== The process of marketing:
How do you keep your customers satisfied?

#figure(caption: "Marketing strategy")[
  #image("./images/strategy.png")
]

== The marketing plan:
#figure(caption: "Marketing plan")[
  #image("./images/plan.png")
]


== Marketing orientation:
The push that directs the marketing process in an organization is the *marketing orientation*. 

=== A few orientations:
1. *Production concept* (- 1930): customers especially want cheap products which are available in large quantities.
2. *Product concept* (- 1930): customers only want the best products with all kinds of features.
3. *Selling concept* (1930–1950): customers only buy – with the foot between the door – if they are put under pressure. Make everybody happy. 
4. *Marketing concept* (1950 -): to get satisfied and loyal customers in all our decisions the needs and wants of our target group should be the focus.
5. *Societal marketing concept* (1970 -): marketing should take into consideration the potential conflicts between short-term customer satisfaction and consumer/social long-term welfare.

=== Today:
Thinking about *marketing in terms of sales doesn't work* anymore. It:
- *focuses on the needs of the seller* (vs. needs of the buyer).
- is *preoccupied with converting product into cash* (vs. satisfying customer needs through the product as a solution to the customer’s problem/needs).

=== Societal marketing concept:
- Arose as some *questioned* whether the *marketing concept was an appropriate* philosophy in an age of *environmental deterioration,* resource shortages, *population growth*, world hunger and poverty, and *neglected social services*.
- Sought to *balance *company* profits*, consumer *wants*, society’s *interests* …

=== Sustainable marketing:
- More *narrowly focused than societal marketing*; seeks to meet the *needs of current consumers* without compromising the ability of future generations to meet their own needs.
- Sustainable marketing *integrates the principles of sustainability* into *all aspects* of marketing, from product design to distribution and communication.
- Goes beyond the societal marketing concept by specifically focusing on the environmental and social sustainability of marketing practices.

=== Social criticisms on "bad" marketing: impact on society:
1. *Individual consumers*: high prices, deception, hard sell, shoddy products, planned/perceived obsolescence, poor service to the disadvantaged.
2. *Society as a whole*: false wants, too much materialism, too few social goods, cultural pollution
3. *Other businesses*: acquisitions of competitors, creating barriers to entry, basically all kinds of predatory and dominating practices



== Ethics:
There are a few ethical issues in marketing. There should be a balance between the needs of the company and the needs of the customer.
#figure(caption: "Marketing ethics")[
  #image("./images/ethics.png", width: 60%)
]


== Value:
*Value-in-Use:* The extent to which a customer feels better off (positive utility) or worse off (negative utility) through experiences somehow related to consumption

*Value-in-Exchange:* The monetary worth

*Perceived value:* customer’s evaluation of the difference between all the benefits and all the costs of a marketing offering relative to those of competing offers.
- Implies an interaction between a subject and an object
- Is relative by virtue of its comparative, personal, and situational nature
- Is preferential


#figure(caption: "Perceived value")[
  #image("./images/value.png", width: 60%)
]

*Transaction value:* the perceived benefit a customer gains from the act of purchasing itself, often associated with the feeling of getting a good deal. It includes the difference between the price the customer expects to pay and the price they actually pay.

// Week 3
= Harvard case 1:
== Should B&T launch a new product? 
*Yes:*
- More revenue
- Untapped market
- Value for customers
  - Convenience
  - Ease of transport
  - Precision usage
- Differentiation

*No:*
- There is no proven need or demand
- Cannibalization of existing products
- Existing habits of customers
- Costs

== Suggest segmentation, targeting, and positioning:
*Segmentation:* Travelers (geography) instead of households, than income, physiographic, health conscious\

*Targeting:* B&T should target travelers in Visayans, where there is a high demand for travel-friendly products. B&T can also target travelers in Mindanao, as the market is more fragmented and there is an opportunity to gain market share.\

*Positioning:* Tesla statement from the slides (week 2 or 3)

// Week 4:
= Tupperware:
== If you were Eric/Phil preparing recommendations to Tupperware, what would you say are the key challenges the company is facing at this stage of its life cycle?
- Target market issues
- Competition from cheaper brands
- Lack of modern marketing strategy
- 

== What should Tupperware do to reverse its fate to retain and increase market share?
Solutions:
- Lean into the Tupperware brand name
  - Use influencers to host Tupperware parties and promote the brand
- Innovate the product

= The assignment:
/ What is a marketing plan?: #text[
  A plan that indicates how the organization uses its available resources and marketing instruments to optimally target the market and achieve long-term (strategic marketing plan) or short-term (marketing action plan) objectives. This plan has the following functions:
  - Makes it possible to assess the logic and feasibility of the marketing policy
  - Describes the task to be performed
  - Clarifies how much money and what resources are needed
  - Provides insight into the expected results
  - Facilitates monitoring of progress and adjustments of activities.
]

== Tips:
- Use references
- Balance pros and cons
- Ensure that parts logically overlap
- Make the layout attractive


1. Make a problem statement:
  1. Separate the problems, Why is this marketing plan needed
2. Main research question
3. Scope
4. Delimitations: what is not included
