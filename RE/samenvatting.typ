// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *
#import "@preview/cetz:0.2.2"
#import cetz.plot

#let defaultColor = rgb("#f2542d")

#let caution-rect = rect.with(inset: 1em, radius: 0.5em, fill: defaultColor.lighten(96%), width:100%)
#let note = (content) => inline-note(rect: caution-rect)[#content]

#show: template.with(
  title: "Requirements Engineering",
  subtitle: "Samenvatting",
  short-title: "Requirements Engineering Samenvatting",
  venue: [Leiden University],
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
    (title: "Samenvatting", content: [This document provides a foundational introduction to Requirements Engineering concepts. It covers the basics of requirements, the requirements engineering process, and the different types of requirements. It also discusses the importance of requirements engineering and the challenges that come with it.\ \
    #line(length: 100%, stroke: gray)
    #outline(depth: 1,title: text(defaultColor, size: 9pt)[Contents:])
    ]),
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
  margin: (left: 1in, right: 1in), paper: "us-letter"
)

#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}

#set-page-properties()

#show terms: it => [
  #note[#text(defaultColor, weight: 600, size: 10pt)[#it.children.first().term]\ #it.children.first().description] 
]

#set quote(block: true)
#set heading(numbering: none)

#show heading: set text(defaultColor, weight: "medium")


= Introduction:
The 3 levels of Requirements Artifacts:
+ *Goals:* What the system should achieve
+ *Scenarios:* Describes a concrete example of satisfying or failing to satisfy a goal
+ *Requirements:* Define the data, functions, behavior, quality, and constraints, often imply solution

= Scenarios:
Scenarios are the glue between abstract models and reality. They can be abstracted (video) or concrete (sequence diagram). Abstraction can also be achieved by using different english levels.

== Information in scenarios:
Some typical information in scenarios:
+ *Actor:* The entity that interacts with the system
+ *Roles*: The roles of the actors
+ *Goal:* The reason for the interaction
+ *Precondition:* The state of the system before the interaction
+ *Postcondition:* The state of the system after the interaction
+ *Location*: Where the interaction takes place
+ *Req. resources:* The resources needed for the interaction

== 8 scenario types:
+ *State scenarios:*
  + *Current-state scenarios:* Describe the current situation
  + *Desired-state scenarios:* Describe the desired situation
+ *Type & Instance:*
  + *Type scenario:* describes the general process
  + *Instance scenario:* Describes a specific instance of a type scenario, added when there is need for more clarification.
+ *Alternatives:*
  + *Main scenario:* sequence of interactions to satisfy (set of) goal(s)
  + *Alternative scenario:* sequence of interactions, instead of main scenario, to satisfy the same (set of) goal(s) $->$ “Plan B”
+ *Exception scenario:* Describes what happens when something goes wrong. As a consequence one or more of the initial goals will not be satisfied.
+ *What if? scenarios:* Describes what happens when the environment changes. Documents alternative realizations.
  + *Descriptive scenario:* Describes process or workflow
  + *Explanatory scenario:* Provides background information and rationales
+ *Misuse scenarios:* Describes how the system can be misused
+ *Negative scenarios:* Goal is not satisfied. Should be explicitly not allowed.
+ *System-internal, interaction and context scenarios:*
  + *System-internal:* focus on interactions within system
  + *Interaction:* focus on interactions between system and actors
  + *Context:* focus on interactions between system and environment
#pagebreak()

== Documenting scenarios:
/ Narrative scenarios: Describe the scenario in a narrative way, as a sequence of events.

== Diagrams
+ *Sequence diagrams:* Show the sequence of interactions between actors and the system
+ *Activity diagrams:* Show the flow of activities in a scenario.
+ *Use case diagrams:* Suited for documenting relationships between use cases

= Business problems:

== Scoping the business problem:
What is the purpose of the project, what is the scope of the work and what are the goals of the project? This should take into account the needs of the stakeholders. It should also include: 
- *Constraints*: restrictions which help determine the scope of the work. They can be solutions constraints or project constraints.
- *Terminology:* define from the start to enhance clarity and understanding. make sure it's shared terminology
- *Estimated costs:* measured is always better than guess
- *Risks*: identify, assess and manage risks.
- *To go or not to go:* SWOT and other models can help here

The scope, goals and stakeholders of the business problem are interconnected. 

== Goals:
What do you want to achieve? Make sure your goals are SMART:
- *Specific:* Clearly defined
- *Measurable:* Can be measured
- *Achievable:* Can be achieved
- *Relevant:* Relevant to the stakeholders
- *Time-bound:* Achievable within a certain time frame

Goal orientation is important because it helps to ensure that the system meets the needs of the stakeholders. It also helps to reduce the risk of project failure. It provides focus and gives justification for the requirements.

Goals can be set on different levels:
- *AND-decomposition:* All subgoals must be achieved
- *OR-decomposition:* At least one subgoal must be achieved
#pagebreak()

*Goal dependencies:*
- *Requires dependency:*
  - Satisfaction of Goal X is prerequisite for satisfaction of Goal Y
- *Support dependency*
  - Satisfaction of Goal X contributes to satisfaction of Goal Y
- *Obstruction dependency:*
  - Satisfaction of Goal X hinders satisfaction of Goal Y
- *Conflict dependency:*
  - Satisfaction of Goal X excludes satisfaction of Goal Y
- *Goal equivalence:*
  - Satisfaction of Goal X leads to satisfaction of Goal Y

*How to document goals:*
+ be concise
+ bedrijvende vorm (actief), voorbeeld: "Het systeem moet..."
+ Precise documentation
+ Decompose goals
+ Explain added value
+ Document why the goal is introduced
+ Avoid unnecessary restrictions

Goals initiate the definition of the scenarios. The definition of scenarios leads to refinement of the goals. Goals can also be used to classify scenarios.

== Scope:
Your scope shouldn't focus exclusively on the system, but should also include humans. 

== Stakeholders:
Examples:
- Sponsor
- Customers
- Users
- Management


= BUC (business use case):
A BUC is a collection of related scenarios that describes how a system or product should respond to a specific business event.

== BUC requirements:
- *A "natural" partition of the work*, making an obvious and logical contribution.
- *Isolated*, with minimal connectivity to other parts of the work.
- Clearly *defined in scope*, with rules for defining that scope.
- *Recognisable to stakeholders*, using names and terms they understand.
- *Readily determined to exist*, not something that is unclear or debatable.
- *Supported by one or two known experts* for that part of the work.
#pagebreak()

== Buc structure:
- *Context*
- *One main scenario*
- *One or more alternative scenarios*
- *One or more exception scenarios*

== Scope:
The scope of each BUC includes anything that you are allowed to change, as well as anything you need to understand to determine what can or should be changed.

/ Business events: are things that happen outside the system that the system needs to respond to. They can be triggered by people, other systems, or even time passing. When a business event happens, the system should respond by *initiating the* *correct BUC*

= Motivatie voor requirements engineering:
Systems mainly driven by software. 

/ N.I.V.E.A.: Niet Invullen Voor Een Ander. 

Requirements engineering is important because it helps to ensure that the system meets the needs of the stakeholders, and it helps to reduce the risk of project failure. It reduces costs because logical errors can be detected early in the process.

RE can be embedded in the business:
+ *Processes:* Marketing, sales, production, maintenance
+ *Developmental processes:* Project management, design, quality assurance.
Involving these stakeholders reduces the risk of project failure.

== RE vs SE:
Software is build according to specifications. These specifications come from requirements. 

#figure(
  image("./images/fuik.png", width: 80%),
  caption: "Fuik van de softwareontwikkeling"
)

== Fundamental truths:
+ Requirements are about understanding the real business problem (or opportunity) and providing a solution for it.
+ We build software with optimal value for the stakeholders.
+ Understand the need to build the right software
+ Building software does not necessarily solve the whole business problem
+ Requirements have to become known to the builders
+ Customers do not always give ‘the right’ answer.
+ Requirements do not come about by chance
+ Iterative approaches (like Agile/Scrum) do NOT make requirements [engineering] redundant.
+ There is no ‘silver bullet’.
+ Requirements should be measurable and testable.
+ You will change the way the user thinks.

= Requirements engineering process:
*RE is an iterative process!* It's about what you want to build, not yet about how you want to build it.

/ 3 dimensions of RE: #text[
  + *Content:* from vague to complete
  + *Agreement:* from conflicting to agreed
  + *Documentation:* from informal to formal
]

Requirements engineering is about understanding the real business problem (or opportunity) and providing a solution for it. Requirements process is iterative

== The Volere requirements process:
The Volere requirements process is a process for gathering, documenting, and managing requirements. It consists of 9 steps:
+ *Start of project*: define business problem and scope, identify stakeholders and goals. produce cost estimate and decide whether to proceed.
+ *Requirements elicitation:* gather requirements from stakeholders, document requirements, and validate them. Avoid _old wine in new bottles_.
+ *Writing and documenting requirements:* write requirements in a structured way, unambiguous (using a rationale), testable using *fit criterion*. The process of writing requirements might be even more important.
+ *Quality Gateway:* testing each requirement for completeness, correctness, measurability, absence of ambiguity and several other attributes, before allowing the requirement to be passed to the developers.
+ *Reusing requirements:* like quality requirements
+ *Reviewing the requirements:* nothing missing, consistent, conflicts resolved, etc.
+ *Iterate:* iterate on the requirements until they are complete and correct.
+ *Retrospective:* what went well, what went wrong, what can be improved.
+ *Evolution of requirements:* requirements change over time, so they need to be managed.

The Volere template is a template about _What_ to write about. The _snow card_ is a guide to _how_ to write about it.

== The future how (solution):
There are many factors to decide what the best solution is, such as: cost, constraints, PUC (Product Use Case), innovation, organizational goals, etc.

Once you understand the complete BUC, you can establish how much of it wil be solved by the product. This is the _future how_. Keep in mind the *real origin* of the business event. Also consider the users and don't forget NIVEA.

Also keep in mind the technology and systems already in place. 

/ Product Use Case: sets out functionality of the product. Good tool to consolidate the views of the stakeholders.

== Sequential strategy:
In a sequential strategy, the requirements are first gathered and then the software is developed. This is a traditional approach.

#figure(
  image("./images/sequential.png"),
  caption: "Sequential strategy"
)

+ *Conception $->$ Scoping:* establish goals, sponsors, identify key stakeholders, etc.
+ *Scoping -> Investigation:* identify the work, all stakeholders, detailed constraints, etc.
+ *Investigation $->$ product Determination:* understanding business carried out by each BUC.
+ *Product Determination $->$ Atomic requirements:* Specification for each PUC is understood and agreed. 
+ *Atomic requirements $->$ Construction:* Detailed requirements are understood and agreed.

== Iterative strategy:
Basically the same as the sequential strategy, but the steps are repeated. This is a more modern approach. Construction is done in small increments. BUC's are prioritized and the most important ones are developed first.

#pagebreak()

== Breakout:
The point at which the requirement knowledge is sufficient to move to the next activity (software development). 

In a *sequential strategy*, the breakout is at the end of the requirements phase.

== Quality Gateway:
The quality gateway is a point in the requirements process where the requirements are tested for completeness, correctness, measurability, absence of ambiguity, and several other attributes, before allowing the requirement to be passed to the developers. The requirement must pass a set of tests:
- *Within scope:* does the requirement fall within the scope of the project?
- *Relevant:* is the requirement relevant to the stakeholders/project?
- *Complete:* no missing attributes?
- *Fit criterion:* is the requirement testable?
- *Consistent:* does the requirement conflict with other requirements?
- *Viable:* can the requirement be implemented?
- *Requirement or Solution:* is the requirement a requirement or a solution?
- *Gold plating:* is the requirement more than what is needed?
- *Creep:* is the effort worth the benefit?
- *Traceable:* can the requirement be traced back to a goal?

Quality control is important, because it prevents *error propagation* and *cost escalation* down the line. Principles of quality control:
- Involve the right stakeholders:
- Separate defect detection from defect correction
- Multiple views
- Use appropriate documentation formats
- Create development artifacts (e.g. prototypes, test, architecture) 
- Repeat quality control

Some techniques for quality control are *inspection* and *prototyping*. Others are creating *checklists* and *artifacts*

== Reusing requirements:
Requirements can often be reused across projects with similar purpose. Existing stakeholders can also be a source of reused requirements. Some sources of requirements include colleagues, experiences, existing specs, domain models and books.

/ Requirement patterns: are used as a guide when choosing requirements. Can improve accuracy and completeness of requirements. There are patterns for domains, and across domains. 

== Communicating requirements:
Use a template to communicate requirements. The Volere template is a good example. It is a template about _What_ to write about. The _snow card_ is a guide to _how_ to write about it. It's important to document. The requirements artifacts should be complete, traceable, correct, unambiguous, comprehensible, consistent, rated, verifiable, upt-to-date and atomic. Use simple language. 

= Requirements elicitation:
Requirements elicitation should be focust on diversity of requirement sources. It focuses on *goals*, *scenarios* and the tree requirement types: *functional*, *constraints* and *quality* *requirements*.

== Objectives of requirements elicitation:
- identify relevant requirement sources
- elicit existing requirements
- develop new requirements

Elicitation is first diverging and then converging.

== Activities:
- *Identify relevant requirement sources:* stakeholders, documentation, existing systems, etc. Filter on relevance.
- *Elicit existing requirements:* interviews, questionnaires, workshops, etc.
- *Develop new requirements:* brainstorming, prototyping, etc.

/ The Brown Cow Model: #text[
  The Brown Cow Model. This shows four views of the work, each of which provides the business analyst and the stakeholders with information that is useful at different stages of the requirements discovery process. The four views are:
  + *How (solution) now:* What is the current situation?
  + *What (essence) now:* BUCs, essence of the work
  + *Future what (essence):* Future state situation
  + *Future how(solution):* Comprehensive future state situation
]

== Techniques:
- *Interviews:* structured, semi-structured, unstructured
  - *Preparation:* Define a goal, invite people, speak participants language, align interviews incase of multiple interviewers
  - *Execution:* Explain goal, ask questions, focus on subject, sum up and _thank participants_ (positive feedback) 
  - *Followup:* Summarize, send summary, ask for feedback
  - *Critical success factors:* communication skills, no leading questions, active listening, etc.
- *Questionnaires:* open, closed, Likert scale
  - *Critical success factors:* clear questions, clear instructions, stakeholders need to be motivated, etc.
- *Workshops:* brainstorming, prototyping, etc.
  - *Critical success factors:* participants need to understand goal, invite the right people, motivate, avoid groupthink, etc.
- *Observation:* observing the stakeholders in their natural environment, either watching or participating.
  - *Critical success factors:* willingness to cooperate, objectivity, etc.
- *Perspective based reading:* reading the requirements from different perspectives
  - *Critical success factors:* selecting the right perspectives.
#pagebreak()

*Assistance techniques:*
- *Mind mapping:* visual representation of ideas
- *Prototyping:* creating a model of the system
- *Brainstorming:* generating ideas
- *Checklist*
- *KJ method:* grouping ideas

== Understanding the real problem:
Understanding the real problem is important because it helps to ensure that the system meets the needs of the stakeholders. It also helps to reduce the risk of project failure. It provides focus and gives justification for the requirements.


= What is a requirement?
#quote("A condition or capability needed by a user to solve a problem or achieve an objective that must be met or possessed by a system or system component to satisfy a contract, standard, specification, or other formally imposed document", attribution: "IEEE")

== Types of requirements:
+ *Functional requirements:* What the system should do 
+ *Constraints:* What the system should not do, constraints on the functional requirements that restrict the way in which the product or system should be developed
+ *Non-functional (Quality) requirements:* How the system should do it, quality attributes of the system, such as _performance, usability, reliability_, etc. They are important primarily to users or developers. They should not be hidden inside the functional requirements. They must have a *business justification*

== Fit criteria:
Fit criteria are used to determine whether a requirement has been met. They are used to test the requirements. They should be clear, unambiguous, and measurable. You need to understand the *rationale* to understand the fit criteria.

Fit criteria can be derived in a few different ways:
- *Scale measurement:* using a scale to measure the requirement
- *Quality requirements:* max 1 incident per 1000 hours, always available, etc.
- *Study:* study existing practices and new practices and see if there is a change
- *What is considered failure:* what is considered a failure of the requirement
- *Completed*
- *Create tests*

*Forms of fit criteria:*
- Text and numbers
- Graphics: diagrams, sketches, etc.

== Completeness:
Determine whether requirements are missing, prioritize requirements, and determine whether requirements are consistent and without conflicts.

Steps:
+ *Review specification*
+ *Inspections $->$ Fagan inspections:*  a formal review process that involves a team of people who review the requirements document and identify any errors or omissions.
+ *Find missing & conflicting requirements*
+ *Prioritize requirements*

= Data driven RE:
take profit of the existence of large amounts of data in the form of feedback to guide requirement engineers in their decisions about what requirements to include in subsequent system releases.

Feedback can be analyzed using NLP and ML. Feedback can be gathered implicitly thru usage data or explicitly thru surveys. Context is important.

/ FAME: Framework for Adaptive Process Modeling and Execution. It is a framework that allows for the modeling and execution of adaptive processes. It is based on the idea that processes can be modeled as a set of activities that are executed in a specific order. The framework allows for the modeling of processes that are adaptive, meaning that they can change based on the context in which they are executed.

*Crowdbased RE:* is an umbrella term for automated or semi-automated approaches to gather and analyse information from a crowd to derive validated user requirements.

== Decision making:
Two key dimensions of decision making:
- Visualize data in an actionable manner
- Arrange decisions in the form of a software release plan

== Challenges:
- Integration with Data-oriented Analysis Cycles.
- Integration with Other Software Engineering Approaches.
- User Motivation and Trust.
- Context-Driven Feedback Gathering.
- Analysis of Implicit Feedback.
- Use of Domain Knowledge.
- Adoption by Companies

== Lessons learned:
Data-driven RE is promising but not free. It is different for every company, requires expertise and needs to be implemented in a incremental way. It also requires full transparency.
#pagebreak()

= Scrum & Agile:

== Product management vs project management:
- *Product management:* continuous, success when customer profitability, managed on customer adding value
- *Project management:* temporary, success when project is on time, on budget, on scope, managed on time, money and scope.

/ VUCA: #text[
  Volatile, Uncertain, Complex, Ambiguous:
  + *Volatile:* The nature and dynamics of change, and the nature and speed of change forces and change catalysts.
  + *Uncertain:* The lack of predictability, the prospects for surprise, and the sense of awareness and understanding of issues and events.
  + *Complex:* The multiplex of forces, the confounding of issues, no cause-and-effect chain and confusion that surrounds organization.
  + *Ambiguous:* The haziness of reality, the potential for misreads, and the mixed meanings of conditions; cause-and-effect confusion.
]

The answer to VUCA is VUCA: Vision, Understanding, Courage, Adaptability.

== Agile:
A focus on the 3 V's: Value, Vision, Validation. The agile mindset is about delivering value to the customer. Agile frameworks embody this mindset into practical tools and techniques.

== Scrum:
Scrum Artifacts:
- *Product Backlog:* a prioritized list of all the work that needs to be done on the project.
  - Feature requests
  - Bug fixes
  - Quality requirements
- *Sprint Backlog:* a list of tasks that need to be completed during the sprint. selected on:
  - Value (ROI, customer satisfaction)
  - Risk (dependencies, market trends, feature)
  - Size (smaller)
- *Increment:* the sum of all the product backlog items completed during a sprint.

/ DOVE: Description, Order, Value, Effort. This is a way to prioritize the product backlog.

/ Technical debt: is the cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer. It is a metaphor referring to the eventual consequences of poor system design, software architecture or software development within a code base.

*Scrum events:*
- *The sprint:* a time-boxed period of development, typically 2-4 weeks.
- *Sprint planning:* a meeting at the beginning of the sprint where the team decides what work they will complete during the sprint.
- *Daily stand-up:* a short meeting where the team discusses what they did yesterday, what they will do today, and any obstacles they are facing.
- *Sprint review:* a meeting at the end of the sprint where the team demonstrates the work they completed during the sprint.
- *Sprint Retrospective:* a meeting at the end of the sprint where the team discusses what went well, what could be improved, and what actions they will take to improve.

*Roles:*
- *Product Owner:* responsible for the product backlog and for maximizing the value of the product. Closer to the team than a product manager.
- *Scrum Master:* responsible for ensuring that the team is following the scrum process and removing any obstacles that are preventing the team from being successful.
- *Development Team:* responsible for delivering the product increment.

*User story:*
*As a [role], I want [goal], so that [reason].* A good user story should can be written by listening. You can use the snow card to write user stories.

= RE management:
As a RE manager, you manage requirements engineering artifacts, system context (changes in environment, like new tech) and the requirements engineering process (choose approach).

/ Traceability: is the ability to trace requirements from their origin to their implementation. It is important because it validates, avoids gold plating, and helps to manage change. It also makes sure someone is accountable for the requirement.

== RE prioritization:
Resources are limited, you need to prioritize. You can use the MoSCoW method: Must have, Should have, Could have, Won't have. The should be classified into different priority classes for each of the five RE activities:
- *Elicitation* 
- *Documentation* 
- *Agreement* 
- *Validation* 
- *Management* 

Preparation activities:
+ *Determine which stakeholders to involve:* based on project goals
+ *Select the artifacts which are subject to prioritization:* goals first
+ *Define the prioritization criteria:* importance, urgency, risk, cost, etc.
+ *Select the appropriate prioritization technique.:* ranking, top 10, MoSCoW, Kano model, etc.

== Configuration management:
CM applied over the life cycle of a system provides visibility and control of its performance, functional, and physical attributes. CM verifies that a system performs as intended, and is identified and documented in sufficient detail to support its projected life cycle. It's about the versions of the requirement artifacts and Consistency between them.
#pagebreak()

= Negotiation:
Negotiation is about finding a solution that satisfies all parties. It's about finding a win-win solution. It's not conflict resolution. Negotiation is aimed at agreement between stakeholders, so all stakeholders should be involved. 
+ Identify
+ Analyse
+ Resolve
+ Document