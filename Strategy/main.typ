#import "@preview/timeliney:0.0.1"
#import "@preview/cetz:0.1.2": canvas, draw, tree
#import "@preview/gentle-clues:1.0.0": *

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#0E3B43")


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
        Leiden University | Strategy// SBIS | Randstad | Group A
      ]
    )
    #place( top + right, dy: 12pt,
    text(fill: white, size: 11pt)[
      #context counter(page).display(
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

// #show strong: it => text(fill: rgb("FE7F2D"), weight: "bold")[#it.body]

// ---- START CONTENT ----

#align()[
  #text(size: 24pt, weight: "regular", font: "Noto Serif")[
  Summary Strategy]
  #pad(bottom:8pt, top: -18pt, line(length:20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
  // by Manuel Mol
])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}

// Get the models from the document
= Models:
#context {
  let labels = query(heading).map(x => {
    let label = x.at("label", default: none)
    if (label != none) {
      if "model" in str(label){
        (str(label), x.body)
      }
    }
  }).filter(x => x != none)
  for l in labels {
    let name = l.at(0)
    let body = l.at(1)
    [- #link(label(name))[
      #body
    ]]
  }
}
== Important models:
- Purpose
- purpose/mission/vision
- 

#pagebreak()


// // = Week 1
// = What is strategy
// Strategy can be broken down in 3 parts:
// - Clear consistent long term goals
// - Profound understanding of competitive environment
// - Objective appraisal of resources

// / Industry attractiveness: -

// / Strategy: Strategy is the direction and scope of an organisation over the long term: which achieves advantage for the organisation through its configuration of resources within a changing environment, to meet the needs of markets and to fulfil stakeholder expectations.

// / Strategic decisions: are large expensive and precedent-setting decisions that are made under conditions of ambiguity and uncertainty about the final decision outcome

// / VUCA: The world is: *Volatility, Uncertainty, Complexity *and* Ambiguity*

// The change in the last few years is from multiple industries to mostly tech. From a strategy perspective, you should always think long-term. Firms that are vigilant (prepared for the future) have a significantly higher likelihood of making it into the group of industry performers.

// This course will focus on *corporate strategy* and *business strategy*.

// / Strategy analysis: internal and external environment

// *Fourteen fundamental questions really important*

// == Purpose values mission vision and strategy
// Purpose: the why




// #pagebreak()
// = External analysis (competitive environment)
// External analysis has impact on the firm:
// - *Scanning*: for warning signs and trends (foresight)
// - *Monitoring:* for specific trends and patterns
// - *Forecasting:* develop projections
// - *Assessing:* determine timig and effects

// / Foresight: seeing something before it happens

// / Competitive advantage: A competitive advantage is what makes your product or service better than, or preferable to, that of your competitors.

// / Bottom up: listen to customers and act on that

// / Top down: create a strategy and build something you think customers want

// == Wild cards:
// / Black swan: _unexpected events_ of large magnitude that seems impossible until it happens
// / Black elephant: _widely predicted_ events that are rejected as unlikely until they actually occur, after which they are dismissed as unpredictable black swans
// / White leopards: hidden or camouflaged risks that can have large impacts
// / Grey rhinos: obvious risks that are ignored
// / Black jellyfish: known and normal risks that unexpectedly escalate out of control due to positive feedback

// == Scenario planning process
// + Define scope: (the industry, region or years for example)
// + Identify key drivers (from analysis like PESTEL, megatrends)
// + Develop distinct scenario stories (write name scenarios)
// + Identify the impacts (check your strategies and adapt them to the scenarios)
// + Monitor progress (look for early warning indicators)

// === How to do scenario building?
// - *Develop the scenario stories:* coherent and plausible descriptions of the environment that can come from opposing outcomes
// - *Identify the impact of these scenarios:* identify the impact on the organization, and look at future strategies to account for these scenarios
// - *Usage:* scenarios are mostly used in industries with long planning horizons, like oil and airlines.



// == Pestel:
// PESTEL analysis is a strategic framework used by businesses *to understand and analyze the external factors that can impact their operations*. It's a way of looking at the big picture outside of the company itself to identify potential opportunities and threats
// + *Political*: Government policies, regulations, political stability, trade policies, tax laws, etc.  
// + *Economic*: Economic growth, inflation, interest rates, unemployment, exchange rates, income distribution, etc. 
// + *Social*: Cultural trends, demographics, population growth, education levels, lifestyle changes, social attitudes, etc.  
// + *Technological*: Technological advancements, automation, research and development, innovation, technological disruption, etc.  
// + *Environmental*: Climate change, pollution, resource availability, sustainability, environmental regulations, etc.  
// + *Legal*: Laws related to labor, consumer protection, competition, intellectual property, product safety, etc.



// #pagebreak()
// = Internal analysis


// #pagebreak()
// // = Strategy foundation 1
// = Lecture 4
// == Platform strategies
// / Platform strategy: describes how an organization intends to create a new platform or grow an ecosystem in which the organization is embedded

// Creating a new platform involves developing a technology or service that acts as an essential foundation for an ecosystem of organizational activities.

// The magic of a platform is the ecosystem around it, that creates a network effect. The complementers are attracted to the platform. 

// The ability to develop a platform is a dynamic capability.

// There are *two types* of platforms:
// + *Transactional:* Amazon or Bol
// + *Innovation:* Android
// Sometimes a mixture can exist, called a *Hybrid platform*. An example could be Apple. For them, the innovation comes from IOS, and the transactional comes from the App Store. All parties benefit from a platform company. The more producers and consumers on your platform, the greater the value of the platform to all involved.  

// A pipeline company like Tesla derives margin from the left to the right. A platform company like Android or derives value from both sides of the value chain. 


// #pagebreak()
// = Strategy foundation 2

// #pagebreak()
// = Week 7:
// Strategy is a way of thinking. Some key concepts are:
// - Uniqueness: creating a unique and valuable position
// - Trade-offs: choosing what not to do
// - Fit across the value chain: creating a fit between activities

// THINK, TALK and ACT like a strategist.

// Strategists solve *wicked problems:*
// + Where are we now?
// + Where do we want to be?
// + How do we get there?

// == Strategic analysis:
// - Macro environment (PESTEL)
// - Competitive environment (5 forces + 1 (complementors))
// - Internal environment (Value chain)

// / Corporate level strategy: _what_ business should we be in? 

// / Business level strategy: _how_ do we compete in a specific market?

// Know the 4 flavors of the big P and small p.

// === External analysis
// *PESTEL:* Political, Economic, Social, Technological, Environmental, Legal. PESTEL is the basis for your scenarios. 

// Bariers to entry are important. The more barriers, the more attractive the industry.

// == Resource based view (RBV):
// + Start with a value chain (point of depature)
// + VRIO: Value, Rarity, Imitability, Organization
// + Strategic capability: resources (what we have) and competences (what we do well) combined. 
// + If your strategic capabilities that are VRIO are *core capabilities*. These core capabilities you don't want to outsource.
// + SWOT $->$ TOWS

// / Business models: Not necessary to learn by heart, but understand the concept. How does company make money?

= Week 1 (What is strategy?)
/ Strategic management: is the process of creating and implementing a strategy. 
Strategic management consists of 3 key parts:
+ *Strategic analysis* (position): \
  Starting point. Includes general and competitive environment. Also deals with internal environment. Helps evaluate how well the organization is positioned to exploit external opportunities.
  - SWOT
  - Purpose
  - Culture
+ *Strategy formulation* (deciding on a course of action)\
  Is about the #link(<components>)[components of the strategy]
  - How to compete
  - Which businesses to include in portfolio
  - Where to compete internationally
  - Enough innovation?
  - Should other companies be bought?
+ *Strategy implementation* (putting the strategy into action)\
  The implementation of the strategy. Requires flexibility, good communication with stakeholders and a good understanding of the organizations values and culture.
  - Are the strategies suitable, acceptable and feasible?
  - What kind of process is needed
  - What are the required structures and systems
  - How should change be managed
  - Who should do what?

From this, fourteen fundamental question can be derived:
#image("image-1.png")

#pagebreak()

A successful strategy is the combination of:
+ Consistent *long-term goals* 
+ Profound understanding of the competitive *environment*
+ Objective appraisal of *resources*

You should be able to Think, Talk and Act like a strategist.
A successful strategist is expected to use a conceptual toolbox what consists of *concepts*, *theories* and *frameworks*.

The *toolbox* consists of: 
/ Tools: A technique, model, method or process which support interactions and decision making.
/ Context: The circumstances which form the setting for strategy activity to occur. 
/ Process: Refers to the steps of events, experiences and activities over time

Strategy is about being better while being different. Strategy is needed because success today does not mean success in the future. You also need to be able to account for risk. Strategy is also *important for*:
+ Enhances the quality of *decision making*
+ Facilitate coordination (*consensus*)
+ Focus the organization on *long term goals*

Strategy became prevalent in the 1970s and 80s, when the idea of competitive advantage became more important. It became more important in 1990 with globalization, innovation and collaboration. 

/ Strategy: is the *direction and scope* of an organization over the *long term* which achieves *advantage for the organization* through its *configuration of resources* within a *changing environment*, to meet the needs of markets and to fulfill stakeholder expectations.

This essentially boils down to:
+ *Where are we now?*
+ *Where do we want to be?*
+ *What is a credible path to get there?*

/ CRAP analysis: CReating Artificial Plans. You should not throw random ideas into the arena without properly thinking them thru.

/ Strategic decision: A complex, hard to define problem where the outcomes are risky. They require an understanding of the problem and rarely have on best solution, but rather a set of possible solutions. The involve tradeoffs, are influenced by political interests and connected with other organizational problems.

== Components of (organizational) strategy: <components>
+ *Corporate strategy:* _What_ business should we be in?
+ *Business strategy:* _How_ do we compete in a specific market? 
+ *Functional strategy:* _How to operate_ the business strategy?

== Market based vs Resource based:
#columns[
  === Market based:
  Emphasizes the importance of the external environment, particularly the industry structure and competitive forces

  #colbreak()

  === Resource based:
  Emphasizes the importance of the external environment, particularly the industry structure and competitive forces
]


== VUCA <model_VUCA>
The world we now live in is:
- *Volatility:* lots of change in a short period of time
- *Uncertainty:* not knowing what will happen
- *Complexity:* many interconnected parts
- *Ambiguity:* not knowing what to do

== Value, mission and vision <model_VMV>
/ Values: A set of beliefs on which policies and actions are based
/ Mission: Why the organization exists (Purpose), where it exists (Scope) and its activities
/ Vision: What the organization wants to become
/ Purpose: WHY does this company exist and what does it bring to the world?

There are two ways to look at purpose:
+ The underlying beliefs/paradigma in an organization that drive the way a company is seeking to contribute to the world and, doing this, making a profit.
+ A way to add a societal goal to the company that is really just profit oriented

The first viewpoint is "structural" and what we use.

=== Big P: <model_BigP>
The reason for its existence:
+ *Altruism:* the company is there to help others (Unilever)
+ *Heroism:* the company is there to save the world (Ford)
+ *Excellence:* the company is there to be the best (Harvard)
+ *Discovery:* the company is there to learn and discover (Google)

=== Small p: <model_smallp>
Leaders have one of the following personal purposes:
+ *Magician:* a desire for transformation and innovation (Steve Jobs)
+ *Warrior:* achieve goals and overcome obstacles (Elon Musk)
+ *Lover:* connection, harmony, and collaboration (Mahatma Gandhi)
+ *Sovereign* order, stability, and long-term sustainability (Nelson Mandela)

#pagebreak()

== Balanced Scorecard:
The balanced scorecard is a strategic planning and management system that is used to align business activities to the vision and strategy of the organization. It works by focusing on four perspectives:
+ *Financial:* how do we look to shareholders?
+ *Customer:* how do customers see us?
+ *Internal business processes:* what must we excel at?
+ *Learning and growth:* can we continue to improve and create value?

== Why companies fail
Most common causes of decline are:
- A lack of *strategic entrepreneurship*
- Insufficient steering on management information
- Cost structures too high and inflexible
- Waiting too long to change

= Week 2: (External analysis)
We want a *profound understanding* of the competitive environment to create a successful strategy.

/ Market based view: A focus on the external environment to determine the organizational strategy.
/ Macro environment: The external environment that affects the organization, but the organization cannot control.

Analysis of the Macro environment is done with the *PESTEL* framework. Based on this framework you can:
- Forecast future trends
- Do scenario analysis

Macro environment analysis goes in 4 steps:
+ *Scanning:* for warning signs and trends (foresight)
+ *Monitoring:* for specific trends and patterns
+ *Forecasting:* develop projections
+ *Assessing:* determine effects of these changes on the firm

== PESTEL <model_PESTEL>
THe PESTEL model is used to scan the general environment to identify change that can be used in the competitive environment.
- *P*\olitical: policies, regulations, tax
- *E*\conomic: economic growth, inflation, interest
- *S*\ocial: cultural trends
- *T*\echnological: advancements in technology
- *E*\nvironmental: climate change, pollution
- *L*\egal: laws and regulations

#pagebreak()

== Foresight
You can only seize an opportunity when you know of it. Foresight is the ability to see opportunities before they happen. You can create a competitive advantage by being first to act on an opportunity.

/ Strategic foresight: thinking ahead, but not guessing

Some key questions to ask are:
- What will success look like in the future?
- Will you be ahead of behind the competition?

=== Wildcards <model_Wildcards>
- *Black swans:* unexpected events of large magnitude that seem impossible, until they happen. (9/11)
- *Black elephants:* widely predicted events that are rejected as unlikely until they actually occur (climate change)
- *White leopards:* hidden or camouflaged risks that can have large impacts (cyber attacks)
- *Grey rhinos:* obvious risks that are ignored (climate change)
- *Black jellyfish:* known and normal risks that unexpectedly escalate out of control due to positive feedback (financial crisis)

=== Scenario thinking <model_Scenario>
Scenario thinking is a way to think about future scenarios. It is not a forecast, but a tool of analysis. 

The scenario planning process consists of 5 steps:
#figure(
  image("image-2.png"),
  caption: "Scenario planning process"
)

Scenarios should be stories, being coherent and plausible. It is also important to assess the impact of each scenario on the organization. 

#pagebreak()

==== Steps for building scenarios:
+ Do PESTEL
+ Select 2 variables from your PESTEL, with the criteria being:
  - Highest level of uncertainty
  - Highest level of impact
  Then plot them like this:
  #figure(
  image("image-3.png"),
  caption: "Scenarios"
)
+ Lastly, assign a title to each scenario. 

== Five forces + 1<model_5_Forces>
Describe and analyze the effect of market structure on profitability.
The *five forces are*:
+ *Buyer power:* the power of customers to drive down prices or demand higher quality products and services.
+ *Supplier power:* the power of suppliers to drive up prices or reduce the quality of goods and services.
+ *Competitive rivalry:* the intensity of competition among existing players in the industry.
+ *Threat of new entrants:* how easily can competitor enter the market
+ *Threat of substitutes:* the treat of alternative products that satisfy the needs of customers
+ *Complementors:* companies that provide products or services that enhance the value of another company's products or services.

It is sometimes good to do some *Co-opetition*, meaning working together with competitors to form a strategic alliance


#pagebreak()
== Industry life cycle
#columns[
  There are 5 phases in a industries life cycle:
  + Development (low rivalry)
  + Growth (high growth)
  + Shake-out (slower growth)
  + Maturity (low growth, barrier of entry high)
  + Decline (extreme rivalry)
  #colbreak()
  #image("image-4.png")
]

/ Strategic Group Analysis: groups companies within an industry that have similar business models or similar combinations of strategies.
#columns[
=== Industry analysis:
Analyse the industry, ecosystems and complementors to create strategic groups and market segments
#colbreak()
#image("image-5.png")
]

=== Adoption curve:
+ *Frontier innovation*
+ *Experimenting*
+ *Piloting*
+ *Scaling*
+ *Fully scaled*

#pagebreak()
= Week 3 (internal analysis)
/ Sustainable Competitive Advantage: resources and capabilities that allow an organization to consistently outperform competitors

/ Economic rent: when an organization earns above average industry returns on capital invested

The firm has *2 main priorities* when it comes to competitive advantage:
+ *Protection:* protecting existing sources of competitive advantage, barriers to imitation, isolating mechanisms
+ *Renewal:* investing in new strategic sources of competitive advantage (dynamic capabilities)

/ Isolating mechanisms: means by which a firm can protect its existing sources of competitive advantage from being eroded by competitors

Some examples of *isolating mechanisms:*
- *Unique historical conditions:* unique conditions in the past made it possible to acquire or develop resources
- *Path dependency:* competitive advantage has evolved in such a way that gives a firm competitive advantage today
- *Patents:* exclude others from a product market by law
- *Social complexity:* specific culture, connections that are hard to imitate
- *Causal Ambiguity:* describes the degree to which would-be imitators, as well as the managers of the firm that is being imitated, understand the relationships between resources and business results.

== RBV:
/ Resource based view: Emphasizes the internal capabilities to formulate a strategy that achieves sustainable competitive advantage in it's markets and industries. *outside in approach*

Firm performance is determined by an organization's capabilities (resources and competencies). It is often seen as an alternative on the PESTEL and 5 forces frameworks.

#figure(
  image("image-7.png"),
  caption: [Strategic capabilities analysis flow]
)
#pagebreak()

=== Definitions:
/ Resources: what we have, what the organization can use towards achieving intended outcome
/ Capabilities: what we do, what the organization does
/ Competences: what we do well, capabilities that are done better then competitors
/ Strategic capabilities: combination of resources and competences
/ Core capabilities: Capabilities that differentiate a company strategically (their competitive advantage)
/ Dynamic capabilities: the capability to continually renew the firm’s resource base and capabilities
/ Resource-base Inventory: inventory of exiting resources
/ Capability audit: profiles the main capabilities the organization uses
// In strategy, we try to combine the firm's resources and capabilities with the opportunities that arise. 

_The RBV analysis framework:_\
*Resources* $->$ *Capabilities* $->$ *Competitive advantage* $->$ *Strategy*


== Value chain analysis <model_VCA>
Looks at the strategic capabilities. Consists of primary and support activities.
=== Support activities:
Activities that support the primary activities
- *HR management:* all activities around HR (hiring, firing, etc.)
- *Technological developments:* developing systems, products, tech and knowledge
- *Procurement:* activities around purchasing and arranging inputs
- *Firm infrastructure:* activities that manage, govern and arrange the other activities
=== Primary activities:
Activities that are involved in directly creating the product or service
- *Inbound logistics:* Activities associated with receiving and storing inputs
- *Operations:* Activities associated with raw inputs transforming into valuable outputs
- *Outbound logistics:* Activities associated with storing and distributing outputs
- *Marketing and sales:* Activities through which customers become aware of product
- *Services:* Activities through which the post-sale value is maintained and enhanced

An organization may *derive competitive advantage* from:
- *Optimization:* optimizing value chain components
- *Coordination:* coordinating the activities in the value chain can reduce costs

== VRIO framework <model_VRIO>
The VRIO framework can be used to determine if a capability/resource gives sustainable competitive advantage.
- *Valuable:* is the resource/capability valued by customers
- *Rare:* is the resource/capability something few competitors possess
- *Inimitable:* is the resource/capability difficult for customers to replicate
- *Supported by Organization:* Is the organization appropriately organized to exploit the resource/capability

=== VRIO analysis:
+ Evaluate each strategic capability against the VRIO criteria
+ Identify sources of competitive advantage
+ Identify options to create, protect or exploit VRIO resources and capabilities

== Dynamic capabilities:
There are four main processes that can be described as dynamic capabilities:
1. Reconfiguration: combine and transforms resources
2. Leveraging: replicate a system or process from one business unit to another
3. Learning: allows tasks to be performed more effectively and efficiently as an outcome of experimentation, reflecting on both failures and successes
4. relates to the ability of the firm to integrate its resources in a novel way that may result in new resource configuration.

/ Zero-Order (or Ordinary) Capabilities: (which might be considered the same as First-Order in some contexts) are what the organisation does.
/ Second-Order (or Dynamic) Capabilities: are about how the organisation changes what it does and how well it does it over time by modifying its resources and ordinary capabilities.

=== Dynamic Capabilities Analysis Flow:
+ Evaluate the existing profile of capabilities: you can:
  + Add them to the portfolio
  + Revise them
  + Extend them to new applications
  + Retire them
+ Identify resource base changes to enable revised capability profile
+ Evaluate whether the organization has adequate dynamic capabilities to deliver the required resource base changes.
+ To complete the analysis, consider the possible implications of the deployment of dynamic capabilities in terms of future capabilities for the organization

== SWOT analysis <model_SWOT>
/ SWOT: Strengths, Weaknesses, Opportunities, Threats

#pagebreak()

// We are done with analysis, now we can start with the strategy formulation.
= Week 4: (Strategy Formulation) | what
Strategy vs business model vs tactics:
- *Strategy:* The high-level plan that defines what you want to achieve and why - like designing a car based on market analysis, identifying the target audience, and determining competitive advantages
- *Business model:* The operational framework that explains how value is created and captured - like the actual car specifications, pricing structure, and distribution channels
- *Tactics:* The specific actions taken to execute the strategy within the business model - like day-to-day decisions on driving the car, choosing routes, and responding to traffic conditions

/ Corporate strategy: what business should we be in
/ Business strategy: how do we compete in a specific market

Sources of competitive advantage a typically a combination of internal and external factors:
- *Position* of the firm in the industry
- *External and internal changes* on the competitive advantage
- *Internal resources and capabilities* resource based view

capabilities are used as a foundation for strategy because internal resources and capabilities provide the basic direction for a firm's strategy.

To determine resources and capabilities, you can use an inside out approach (RBV) or an outside in approach (market based view). 

== TOWS <model_TOWS>
The TOWS analysis is based on the #link(<model_SWOT>)[SWOT analysis]. It is a tool to generate strategic options based on analysis of externally focused opportunities and threats, and the internally focused strengths and weaknesses (RBV). 

The TOWS matrix helps generate options by combination. It's like a candybox of options. 

== ANSOFF matrix: <model_ANSOFF>
#columns[
A *growth vector* is the direction in which growth occurs. There are two important criteria for growth vectors:
- The market, new or existing
- The product, new or existing
These combined create 4 growth vectors, a ANSOFF matrix:
  #colbreak()
  #figure(
    image("image-8.png"),
    caption: "ANSOFF matrix"
  )
]
#pagebreak()

The *ANSOFF matrix* is a tool to determine the growth strategy of a company. These strategies are:
+ *Market penetration:* increase market share of an existing product in an existing market
+ *Market development:* enter a new market with an existing product
+ *Product development:* enter a existing market with a new product
+ *Diversification:* enter a whole new market using a new product

== Diversification
/ Diversification: the process of a company expanding its operations by entering new markets or industries, often through the development of new products or services.

/ Related diversification: when a company expands into a new market or industry that is related to its existing business
/ Unrelated diversification: when a company expands into a new market or industry that is not related to its existing business

Questions like: _Is it cheaper for an organization to perform an activity, such as distributing its products itself, or to pay another organization to do it?_
This is called the *make or buy* decision. Vertical integration is the process of a company expanding its operations by acquiring or merging with other companies in the same supply chain.

#columns[
/ Vertical integration: the process of a company expanding its operations by acquiring or merging with other companies in the same supply chain. _For example, a car manufacturer acquiring a tire manufacturer_
/ Horizontal integration: the process of a company expanding its operations by acquiring or merging with other companies in the same industry. _For example, a car manufacturer acquiring another car manufacturer_
#colbreak()
#figure(
  image("image-9.png"),
  caption: "Vertical and horizontal integration"
)
]

== Portfolio analysis (BCG growth) <portfolio_model>
#columns[
  All business units (BUs) can be considered as part of a portfolio. Portfolio analysis helps the organization analyse the competitive position and rate of return of its BUs. The organization can then create strategies for each BU, and divide resources. The matrix consists of:
+ *Stars:* high growth, high market share
+ *Question marks:* high growth, low market share
+ *Cash cows:* low growth, high market share
+ *Dogs:* low growth, low market share
  #colbreak()
  #figure(
    image("image-11.png"),
    caption: "Portfolio analysis"
  )
]

== Platform strategy: <model_Platform>
/ Platform strategy: describes how an organization intends to create a new platform *or* grow an ecosystem in which the organization is embedded

Scale is the most important with a platform strategy. Differentiation is less important. 

A platform always has producers and consumers. Producers create platform offerings (apps), and consumers buy those offerings. The platform is the intermediary between the two.

There are 3 main *types of platforms:*
+ *Transactional:* Amazon or Bol
+ *Innovation:* Android
+ *Hybrid:* Apple. For them, the innovation comes from IOS, and the transactional comes from the App Store. All parties benefit from a platform company. The more producers and consumers on your platform, the greater the value of the platform to all involved.

With a platform strategy, you can create a network effect. The complementors are attracted to the platform (PayPal, Apple).

/ Data network effect: is when collected data leads to better products, and better product leads to more users, and therefore more data (Google Search).

/ Ecosystems: deliver benefits to all parties involved. Amazon, more sellers and more buyers, good for everyone.

There is always a customer/user (passenger) and a complementor (driver) for a platform (Uber).
#pagebreak()

= Week 5: (Strategy formulation) | how
/ Economies of scale: focus on the cost advantage of producing a large volume of goods (Tesla, high volume of cars)
/ Economies of scope: focus on the cost advantage of producing a variety of goods (Tesla, batteries for cars and homes)

== Porter's generic strategies <model_Porter_generic>
#columns[
  Porter's generic strategies are a set of strategies that can be used to create a competitive advantage. These strategies are:
  + *Cost leadership:* becoming the lowest cost producer in the industry
  + *Differentiation:* creating a unique product or service that is valued by customers
  + *Focus:* concentrating on a specific market segment or niche
  #colbreak()
  #figure(
    image("image-13.png"),
    caption: "Porter's generic strategies"
  )
]

== Treacy & Wiersema <model_Treacy_Wiersema>
#columns[
  Treacy & Wiersema's value disciplines are a set of strategies that can be used to create a competitive advantage. These strategies are:
  + *Operational excellence:* focus on efficiency and cost reduction, cost leadership
  + *Customer intimacy:* focus on building strong relationships with customers (best total solution)
  + *Product leadership:* focus on innovation and product development, differentiation
  #colbreak()
  #figure(
  image("image-14.png"),
    caption: "Treacy & Wiersema's value disciplines"
  )
]

== New strategic playbooks:
Some new strategic concepts are adopted by outperforming companies. Some examples are:
+ *Borrow someone's road:* Leveraging existing infrastructure to accelerate growth
+ *Partner with Third parties:* Collaborate with other organizations (Office and iOS)
+ *Reveal strategy:* Share your strategy with the world
+ *Be good:* Be a good company ethically
+ *Let competition go:* Find unique market niches
+ *Small scale attacks:* agile to test and refine strategies

== Testing strategic options:
Rumelt's criteria for testing strategic options:
- *Consistency:* is the option consistent with what an organization hopes to achieve?
- *Consonance:* is the option consistent with the external environment?
- *Advantage:* how much value that the option creates can be captured by the organization?
- *Feasibility:* it the option achievable with the current resources and capabilities?

Day (2007) uses the following criteria with a score:
- *Is it real?*
- *Can we win it?*
- *Is it worth doing?*
You then count the scores and get totals.

== How to implement a strategy?
To make a growth strategy (strategic option) work, there are a few options you can consider:
+ *Internal development:* developing a new product or service internally
+ *Joint ventures:* a partnership between two or more organizations to develop a new product or service
+ *Strategic Alliances:* a partnership between two or more organizations to share resources and capabilities
+ *Mergers and acquisitions:* acquire necessary resources and capabilities from another organization
+ *Platforms:* create a platform to leverage existing resources and capabilities?

#pagebreak()
== Investment and Risk:
#columns[
  amount of ownership and investment/risk give you different growth strategies:
  - *Exporting:* low ownership (no control over distribution and marketing), low investment/risk. It is only selling products to other countries \ ...
  - *Wholly Owned Subsidiary:* completely new company in a foreign market, owned and operated entirely by your company. High ownership, high investment/risk
  #colbreak()
  #figure(
    image("image-15.png"),
    caption: "Investment and risk"
  )
]


== Strategic Alliance Motives:
#columns[
  There are 4 main motives for a strategic alliance:
  + *Scale alliance:* achieving economies of scale
  + *Access alliance:* gaining access to new markets or tech
  + *Collusive alliance:* collaborate with competitors to reduce competition
  + *Complementary alliance:* combine resources and capabilities to create outputs
  #colbreak()
  #figure(
    image("image-16.png"),
    caption: "Strategic Alliance Motives"
  )
]

== Mergers and Acquisitions:
/ Merger: the combination of two or more companies into a single entity, relatively equal
/ Acquisition: the purchase of one company by another, where the acquiring company is larger and more powerful
A firm that acquires a complementary product is said to be engaging in *horizontal integration*

== Innovation and strategy:
/ Organizational innovation: new and improved ways to organize work, structure, and processes
/ Open innovation: ideas flowing between organizations to be exploited in novel ways
/ Business Model Innovation (strategic innovation): innovation in the business model, how the company creates and captures value
/ Platform innovation: the creation or growth of a foundation for an ecosystem of organizational activities
\
/ Blue ocean strategy: creating a new market space, making the competition irrelevant
/ Platform strategy: describes how an organization intends to create a new platform or grow an ecosystem in which the organization is embedded

=== Magic business model triangle: <magic_model>
#columns[
The Magic business model triangle describes a business model of which the first two elements (WHO and WHAT) address its external aspects and the second two (HOW and VALUE) address its internal dimensions
It is normal to borrow brilliance from others. You can borrow a business model, but you need to adapt it to your own company.
  - *Who:* the customer
  - *What:* the product
  - *How:* value proposition
  - *Value:* why does the business model create value 
  #colbreak()
  #figure(
    image("image-17.png"),
    caption: "Magic business model triangle"
  )
]

=== Five phases of platform development:
1. *Ideate:* find opportunities
2. *Design:* how do we create value
3. *Monetize:* how do we make money
4. *Scale:* how do we grow
5. *Manage:* how do we manage the platform

/ Ecosystem thinking: "Ecosystem Thinking" means looking beyond your own company and industry and understanding how you can work with others to create new value and thrive in a rapidly changing world.
/ Core ecosystem: complementors, live inside the platform
/ Outside ecosystem: Suppliers/partners, outside the platform
/ Platform leaders: organizations that successfully establish their product, service, or technology as an industry platform where they can influence the direction of the industry.

==== Platform ecosystem vs Innovation ecosystem:
Platforms (ecosystems) strive to achieve control
over their ecosystems, whereas in innovation
ecosystems the focus is on alignment rather than
control and the individual partners and the quality of
their relationships play an important role.

#pagebreak()

== Industry globalization:
For industry globalization, there are 4 main drivers:
- *Market drivers:* similar customer needs, global customers
- *Cost drivers:* economies of scale, low cost labor
- *Government drivers:* trade barriers, free trade agreements
- *Competitive drivers:* global competitors, global supply chains

With some additional drivers:
- *Lower communication costs:* lower cost of communication
- *Lower transportation cost:* lower cost of transportation
- *ICT development:* lower cost of technology?
- *Technology development:* lower cost of technology

There are 3 considerations when entering the global market:
- Are there potential benefits for our firm?
- Do we have the right management skills?
- Will cost outweigh the benefits?

There are a number of *factors that increase the level of complexity* as firms expand their international reach:
- Differing *competitive conditions* between countries.
- Differing *availability of resources* required for business operations.
- Differing *political and economic* conditions.
- Volatility of *exchange rates*.
- Differing *demographics*, *social norms* and behaviours, cultures, and religions

== CAGE framework:
The CAGE framework is a tool used to analyze the differences between countries and regions. It helps organizations understand the potential challenges and opportunities of entering new markets. The CAGE framework consists of four dimensions:
- *Cultural differences:* differences in language, religion, values
- *Administrative differences:* differences in laws, regulations, and political systems
- *Geographic differences:* physical distance, differences in climate
- *Economic differences:* differences in income, natural resources, infrastructure
#pagebreak()

= Week 6: System, Change & Leadership
/ Functional strategy: how to operate the business strategy
There are a few different types of functional strategies:
- *Marketing strategy:* how to market the product or service
- *Financial strategy:* how to manage the finances of the organization
- *Operational strategy:* how to manage the operations of the organization
- *Human resources strategy:* how to manage the human resources of the organization
- *IT strategy:* how to manage the IT of the organization

Functional strategies need to be in line with the business and corporate strategy to be effective.

/ Organizational structure: is concerned with the division of labour intro tasks and the coordination of these tasks

Organization structure follows from the strategy. Changes in the environment require changes in strategy, which in turn require changes in the organization structure. *Structure follows strategy*

Structure should be flexible, to allow for changes in the environment and the strategy. 

/ Corporate parenting: the role of the parent company in managing its subsidiaries. It is about how the parent company can add value to its subsidiaries and how it can create synergies between them.

== Types of structure:
There are 8 different organizational structures ranging from simple, complex, and innovation-orientated structures.
=== Simple structures:
==== Functional structure
A functional structure is a type of organizational structure in which the organization is *divided into different departments or functions*, each with its own specific responsibilities and tasks. Sales department, marketing department, etc.

=== Complex structure
==== Multidivisional
A multidivisional structure separates the organization into *different divisions*, each with its own management team and resources. Each division is responsible for its own operations and performance. This structure is often used by large organizations with multiple product lines or markets. (General Electric, with GE aviation, GE healthcare, etc.)

==== Holding
A holding structure splits the organization into *different companies*, each with its own management team and resources. The holding company owns the different companies, but does not manage them directly. (Tata sons, with Tata steel, Tata motors, etc.)

==== Matrix
A matrix structure is a type of organizational structure in which the organization is divided into *different departments or functions*, but *also has a project-based structure*. This means that employees may report to *multiple managers, depending on the project* they are working on. This structure is often used by organizations that need to be flexible and adaptable to changing environments. (IBM, with its matrix structure)

==== Network
A network structure is a type of organizational structure in which the organization is divided into *different departments or functions*, but also has a *network of external partners and suppliers*. This means that the organization can be more flexible and adaptable to changing environments. (Nike, with its network of suppliers and partners)

==== Transnational
A transnational structure is a type of organizational structure in which the organization is divided into *different departments or functions*, but also has a *global presence with suppliers, distributors, manufactures and designers*. This means that the organization can be more flexible and adaptable to changing environments. (Unilever, with its global presence and local operations)

=== Innovation-orientated structure
==== Project-based structure
In a project based structure, teams are created, undertake the work, and then disband. Appropriate for organizations that deliver large and expensive goods (building a ship), or time-limited events (sports events).

==== Adhocracy
An adhocracy is a type of organizational structure in which the organization is *flexible and adaptable*, with a focus on innovation and creativity. This structure is often used by organizations that need to be able to respond quickly to changing environments. (Google, with its flexible and adaptable structure)

=== Transnational:
/ Multinational corporations: are corporations that operate in multiple countries. International trade may be done in different ways, like exporting, licensing and joint ventures. Foreign direct investments are key for multinational corporations.
#pagebreak()

== Strategy maps <strategy_map_model>
/ A strategy map: represents HOW an organization creates value
#figure(
  image("image-18.png"),
  caption: "Strategy map"
)
Don't have to know this one by heart, but understand the concept.

== Systems
/ Systems: are the internal mechanisms that make an organization function. They are the "micro-structures" that dictate how work gets done. They guide actions, monitor performance, and assess overall effectiveness.

They operate as either:
- *Operational systems*: These handle day-to-day tasks.   
- *Control systems*: These monitor and regulate performance.  

*Financial Control Systems* focus on financial decisions, *Dynamic Control Systems* focus on:
- *Believe systems:* explicit values of the organization
- *Boundary systems:* explicit limits of the organization
- *Diagnostic control systems:* explicit goals of the organization, allows for monitoring
- *Interactive control systems:* explicit feedback of the organization, allows for learning

Some other types of control systems:
- *Planning:* directly overseeing the strategic decisions by management
- *Cultural:* fostering shared norms and values
- *Performance targets:* focus on outputs
- *Internal market systems:* Creates an internal marketplace within the organization, Involves internal "contracts" for resources and the supply of outputs between different departments.



#pagebreak()

== The balanced scorecard:
The Balanced Scorecard (BSC) is a strategic performance management tool that helps organizations translate their strategic goals into measurable objectives. Rather than relying solely on financial metrics, it provides a more comprehensive view of organizational performance by considering multiple perspectives:
- *Financial:* How do we look to our shareholders? (e.g., profitability, revenue growth)   
- *Customer:* How do customers see us? (e.g., customer satisfaction, market share)   
- *Internal Processes:* What must we excel at? (e.g., operational efficiency, quality)
- *Learning and Growth:* How can we continue to improve and create value? (e.g., employee skills, innovation

It is used to translate strategy into operational terms:
- Objectives
- Measures
- Targets
- Initiatives

The appropriate approach to strategic controls (KPIs) depends on the level of environmental turbulence and the clarity of strategic objectives.

/ single loop learning: improving the existing system
/ double loop learning: improving the assumptions, then the system

== Strategic change:
/ Strategic change: is the process of implementing new strategies or modifying existing ones to adapt to changing environments and achieve organizational goals. It involves a systematic approach to managing the transition from the current state to the desired future state.

*Types of change could include* change to competitive position, diversification, innovation, vertical boundaries, acquisitions, strategic alliances or geographical scope.

Change always consists of drivers and barriers. Drivers are the forces that push for change, while barriers are the forces that resist change.

=== Drivers of change:
/ Environmental scanning: Think of it as a company constantly checking its surroundings (market, technology, customers) to see what's changing.

/ Strategic drift: company slowly falling behind because it doesn't notice small, gradual changes in its environment. This often happens because managers are wedded to their existing paradigm.

=== Change barriers:
Change barriers include: Social and political structures, organizational routines, institutional isomorphism, etc.

=== Kotter's 8 steps for change:
#figure(
  image("image-19.png"),
  caption: "Kotter's 8 steps for change"
)

=== Greiner's 5 phases of growth:
When a company grows, it goes through 5 phases:
+ *Creativity:* the company is small and informal, with a focus on innovation and creativity
+ *Direction:* the company is larger and more formal, with a focus on direction and control
+ *Delegation:* the company is larger and more decentralized, with a focus on delegation and empowerment
+ *Coordination:* the company is larger and more formal, with a focus on coordination and control
+ *Collaboration:* the company is larger and more decentralized, with a focus on collaboration and innovation

== Culture:
/ Path dependency: the idea that the past influences the future. It is a concept that describes how the decisions we make today are influenced by the decisions we made in the past.

Culture is successful for an organization when the values are widely shared and acted on. 

/ Culture: The way we do things around here

=== Dimensions of culture:
+ *Artifacts:* visible elements of culture (dress code, office layout)
+ *Values:* the beliefs and values that guide behavior (mission statement, code of conduct)
+ *Assumptions:* the underlying beliefs and values that are taken for granted (unwritten rules, norms)

#figure(
  image("image-20.png"),
  caption: "Dimensions of culture"
)

== Leadership:
*Effective leadership* is vital for success. A leader is effective if they act *decisively*, *efficient* and *anticipate and react to challenges* well.

Leadership involves the ability to communicate goals clearly and guide employees. The best strategy will fail if it is poorly communicated and ineffectively implemented.

Strategic leadership matters because they shape the organization. They must do this under conditions of uncertainty. 

Management is about coping with *complexity*. The whole purpose of systems and structures is to help
normal people who behave in normal ways to complete
routine jobs successfully, day after day. It’s not exciting
or glamorous. But that’s management

Leadership is about coping with *change*. What executives need to do is not organize people but align
them. 

#figure(
  image("image-21.png", width: 80%),
  caption: "Management vs Leadership"
)

=== Leadership skills:
There are 5 main skills important to leadership:
- *Emotional intelligence:*  is ability to understand and manage your emotions, as well as recognize and influence the emotions of those around you.
- *Negotiation:* is the process of reaching an agreement between two or more parties. It involves communication, persuasion, and compromise.
- *Change management:* is the process of planning, implementing, and managing change within an organization. It involves understanding the impact of change on people and processes, and developing strategies to support the transition.
- *Decision making:* is the process of making choices or reaching conclusions based on available information. It involves evaluating options, weighing risks and benefits, and selecting the best course of action.
- *Employee engagement:* is the level of commitment and involvement an employee has towards their organization and its goals. It involves creating a positive work environment, fostering open communication, and recognizing and rewarding employee contributions.

The *6 VUCA leadership skills* are:
- *Anticipate:* look around them, and see what is coming
- *Challenge:* reframe problem, challenge the status quo
- *Interpret:* make sense of the world
- *Decide:* make decisions with a balance of speed, rigor, quality and agility
- *Align:* align the organization to the strategy and stakeholders
- *Learn:* learn from the past and adapt to the future

=== Top Leadership Qualities
- *Vision*: clear idea of the future
- *Courage*: willingness to take risks
- *Integrity*: honesty and strong moral principles
- *Humility*: willingness to learn from others
- *Strategic Planning*: anticipate trends and plan for the future
- *Focus*: focus on the goal
- *Cooperation*: get people to work for you because they want to

The 4 behaviors that account for 89% of leadership effectiveness:
- *Be supportive*
- *Operate with strong result orientation*
- *Seek different perspectives*
- *Solve problems effectively*

=== Leadership styles:
Leadership style comes from your *motivations*, *imprint on others* and *functions* (practices you employ to get things done)
#pagebreak()

==== Toxic triangle:
#columns()[
- *Destructive Leaders:* These leaders possess certain characteristics that make them harmful.
- *Susceptible Followers:* These are the people who are drawn to and support the destructive leader.
- *Conducive Environments:* These are the situations that allow destructive leadership to thrive.
Much can be learnt from
studying ‘bad’ or ‘toxic’ leadership,
not least the possibility of
preventing it happening again
#colbreak()
#figure(
  image("image-22.png"),
  caption: "Toxic triangle"
)
]

==== Narcissistic Leaders:
Productive Narcissistic Leaders:
- Great vision;
- Scores of followers.
But are:
- Sensitive to criticism;
- Poor listeners;
- lack of empathy;
- Distaste for mentoring;
#pagebreak()

#align()[
  #text(size: 24pt, weight: "regular", font: "Noto Serif")[
  Cases]
  #pad(bottom:8pt, top: -18pt, line(length:20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
  // by Manuel Mol
])]
]

= Yahoo
In a 2006 memo, Yahoo! senior vice president Brad Garlinghouse criticized the company's unfocused strategy, describing it as "spreading peanut butter" across too many areas, leading to a lack of clear vision, accountability, and decisiveness. He argued for a radical reorganization involving focusing the company's vision, restoring accountability through leadership changes and performance incentives, and executing a significant restructuring with headcount reductions to eliminate redundancies and improve efficiency. Garlinghouse stressed the need for swift action to capitalize on Yahoo!'s assets and regain its competitive edge in the evolving online landscape.

== Why were the issues facing _Yahoo!_ described as strategic?   
The issues facing Yahoo! were described as strategic because they fundamentally impacted the company's long-term direction, resource management and structure.

== Identify examples of issues that fit each of the 3 components of strategic management
The three components of strategic management are:
+ *Strategic analysis:*\
  There is an evolving competitive landscape going on. Seeing and recognizing this is part of the strategic analysis.
+ *Strategic formulation*:\
  The strategic formulation is the process of creating a strategy to address the issues identified in the analysis. In this case, it was about focusing on the core business and eliminating redundancies.
+ *Strategic implementation:*\
  The strategic implementation is the process of implementing the strategies created in the formulation phase. That means in this case a restructuring of the company to account for headcount/overhead and capitalizing on Yahoo's assets.
#pagebreak()

= Ryanair
Ryanair, Europe's leading low-cost airline, was founded in Ireland in 1985 and initially struggled with losses. Inspired by Southwest Airlines' successful low-cost model in the US, Ryanair's new CEO Michael O'Leary implemented similar strategies, such as maximizing seat capacity, frequent flights, and using a single aircraft type (Boeing 737-800s) to streamline maintenance and operations. This led to Ryanair's first profit in 1991 and established the foundation for its current success, carrying millions of passengers across Europe with a focus on cost efficiency.

== What is the #underline[Big P] for Ryanair?
The 4 big P's are *heroism, excellence, altruism and discovery*. From these 4, the one that fits Ryanair best is *heroism*. This is because Ryanair was the first low-cost airline in Europe, and they have a heroic goal of making flying accessible to everyone.

== What is the #underline[Small p] for the founder of Ryanair?
The 4 small p's are *warrior, magician, lover and sovereign*. The one that fits the founder of Ryanair best is *warrior*. He is fierce and determined about cutting costs, fast decision making and going to the extreme. 

== Why, historically, has the airline industry been so unprofitable? (#link(<model_5_Forces>)[5 Forces Analysis])
Porters 5 forces consist of the *power of buyers, the power of suppliers, the threat of newcomers, the threat of substitutes and the intensity of rivalry*. This course also includes a +1, the *complementors*. The airline industry has been unprofitable because of the high power of suppliers like Boeing, the high threat of substitutes to both rivals and substitutes like trains, the high barrier to entry and the high intensity of rivalry in the low cost space. These forces created fierce rivalry and low profitability.

== Compare the economics of the traditional full-service airline business to that of the low-cost airline business: Why is the profitability so different? (#link(<model_5_Forces>)[5 forces] differences)
The difference is in the power of buyers. Buyers for low cost airlines are very price sensitive, meaning that they will jump ship fast if prices are lower at another airline. The more traditional airlines are less price sensitive, and they are more focused on the service, and therefore differentiate on more then price.

== How has the competition between Ryanair and other low-cost airline businesses  like EasyJet affected the industry’s profits?
The competition between Ryanair and other low-cost airlines like EasyJet has led to a price war, which has driven down prices and reduced profitability for all players in the industry. This has forced airlines to cut costs and find new ways to differentiate themselves.

== What are the Complementors, if any for Ryanair?
The complementors for Ryanair are the *airports and travel agencies* that work with them. They help to create a better experience for the customers, and they also help to drive traffic to the airline. The more complementors there are, the better the experience for the customer, and the more likely they are to fly with Ryanair.

#pagebreak()

= Rocket Internet
Famous and highly successful for Reverse Engineering in multiple  business occasions are firms created by the Berlin-based company  builder Rocket Internet. Founded and led by the Samwer brothers, who belong among  Europe’s most successful entrepreneurs, one of these reverse- engineered companies is the e-Commerce heavyweight Zalando.  Created as a clone of US-based retailer Zappos, Zalando proves  that Reverse Engineering can also be applied to whole business models. Writing a constant growth story, the firm showed € 5.4  billion revenues in 2018 while leading the field of German online  shops, followed by other highly respectable companies such as  Otto and Amazon.

== Which Rocket Internet resources and competences can you identify in the case?
Resources are the things that a company has, while competences are the things that a company does. In the case of Rocket Internet, some resources and capabilities include:
+ *Financial resources:* Rocket Internet has a lot of money to invest in new companies and ideas.
+ *Human resources:* Rocket Internet has a team of highly skilled and experienced professionals who can help to develop and grow new companies.
+ *Capability to reverse engineer:* Rocket Internet has a strong capability to reverse engineer successful business models and apply them to new markets.

== Which of them would you define as VRI and which as #link(<model_VRIO>)[VRIO]?
#link(<model_VRIO>)[VRI(O)]: Valuable, Rare, Inimitable, Supported by organization.
+ *Financial resources:* the financial resources are both valuable and rare, but not inimitable. They are supported by the organization. _Not VRIO_
+ *Human resources:* the human resources are valuable, rare and inimitable. They are supported by the organization. _VRIO_
+ *Capability to reverse engineer:* the capability to reverse engineer is valuable, rare and inimitable. It is supported by the organization. _VRIO_

This makes the combination of their human resources and capability to reverse engineer a *core capability*. 

== On the whole, how important are the Samwer brothers to Rocket Internet? What would change if they left or sold the company?
The Samwer brothers are somewhat important for Rocket Internet. They are part of the core capability of reverse engineering, and definitely have an eye for opportunities. They can however probably replaced by a team of people in the organization with the right training if they would leave or sell the company.

== Which dynamic capabilities do you think will be necessary in  future? 
Dynamic capabilities are the capabilities that allow a company to adapt to change. Some of the dynamic capabilities that will be necessary in the future include:
+ *Agility:* the ability to quickly adapt to changing market conditions and customer needs
+ *Innovation:* the ability to create new products and services that meet customer needs
+ *Collaboration:* the ability to work with other companies and organizations to create new products and services

#pagebreak()

= Apple:
Apple is a technology company that designs, manufactures, and sells consumer electronics, software, and services. It is known for its innovative products, such as the iPhone, iPad, and Mac computers. Apple has a strong brand and a loyal customer base, which has helped it to become one of the most valuable companies in the world.

== Define another option for Apple Inc. based on the given TOWS matrix example.
=== SWOT
#set par(justify: false)
#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  table.header([Strengths], [Weaknesses], [Opportunities], [Threats]),
  [
  - _S1_: Strong brand
  - _S2_: Innovative products
  - _S3_: Strong customer base
  - _S4_: Strong financial position
  ],
  [
  - _W1_: High prices
  - _W2_: Limited product range
  - _W3_: Dependent on iPhone sales
  ],
  [
  - _O1_: Growing demand for technology
  - _O2_: Demand for AI  is growing
  - _O3_: Growing demand for wearables
  ],
  [
  - _T1_: High competition
  - _T2_: Economic downturn
  - _T3_: Tariffs and trade wars
  ],
)

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if y == 0 or x == 0 { primary.lighten(0%) }
    else {primary.lighten(95%)},
  inset: (right: 1.5em)
)

#show table.cell: it => {
  if it.y == 0 or it.x == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

=== TOWS
#table(
  columns: (auto, 1fr, 1fr),
  table.header([], [Strengths], [Weaknesses]),
  [
  Opportunities
  ],
  [
  _S3_ + _O2_: Selling AI features to existing customers with strong brand recognition and customer base.
  ],
  [
  _O3_ + _W2_: Expanding product range to include wearables, but with high prices.
  ],
  [
  Threats
  ],
  [
  _S4 + T2_: Using strong financial position to weather economic downturns and invest in new technologies.
  ],
  [
  _W3 + T1:_ Using strong brand to compete with high competition, but dependent on iPhone sales.
  ],
)
#set par(justify: true)

#pagebreak()

= W.L. Gore:
W.L. Gore & Associates, a privately owned, \$3 billion company with over 10,000 "associates" (employee-owners), thrives through an unconventional, innovative, and trust-based culture, eschewing traditional hierarchies, budgets, and strategic plans in favor of small, interconnected plant clusters, peer-driven leadership, and a "transactive memory" system that fosters rapid knowledge sharing and problem-solving, enabling them to consistently profit and innovate across diverse industries from Gore-Tex fabrics to medical devices.

== What is the role of culture in helping W. L. Gore to compete successfully?
The culture plays a big role in the success of W.L. Gore. One of the core values is trust, which helps to foster a culture of innovation and collaboration. The company has a flat organizational structure, which allows for quick decision making and a focus on the customer. This culture of trust and collaboration helps to create a strong sense of ownership among employees, which leads to higher levels of engagement and productivity.

== In the absence of overt strategic control systems, how is the behavior of Gore’s associates motivated and guided?
In essence, Gore's approach emphasizes intrinsic motivation, collaboration, and shared responsibility, creating a self-regulating environment where associates are driven to excel. Leadership emerges organically based on an individual's ability to attract "followers" among their peers. The size of the teams, and the plants themselves, are kept small, so that everyone knows each other. This creates a more personal, and therefore more accountable environment.   
