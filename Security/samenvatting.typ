// Update this import to where you put the `lapreprint.typ` file
// It should probably be in the same folder
#import "../template/lapreprint.typ": template
#import "../template/frontmatter.typ": loadFrontmatter
#import "@preview/drafting:0.2.0": *

#let defaultColor = rgb("#f2542d")

#show: template.with(
  title: "Security",
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
  margin: (left: 2in, right: 0.8in), paper: "us-letter"
)
#let marginRatio = 0.8
#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  pad(left:width*(1 - marginRatio), rect(width: width*marginRatio, stroke: stroke)[
    #content
  ])
}

#set-page-properties()
#show terms: it => [
  #margin-note(rect: default-rect, side: left, stroke: 0pt)[#text(defaultColor, weight: 600, size: 10pt)[#it.children.first().term:]\ #it.children.first().description] 
]

#set heading(numbering: none)

#show heading: set text(defaultColor, weight: "medium")

= Introduction to Information Security
Three important security principles are:
+ Confidentiality: Only authorized users should be able to access data.
+ Integrity: Data should not be altered by unauthorized users.
+ Availability: Data should be available when needed.

== AAAA properties:
+ Authenticity: The identity of the user should be verified.
+ Authorization: The user should have the necessary permissions.
+ Accuracy: The data should be accurate.
+ Accountability: The user should be accountable for their actions. (logs)

== STRIDE:
+ Spoofing: Pretending to be someone else.
+ Tampering: Altering data.
+ Repudiation: Denying an action.
+ Information Disclosure: Unauthorized access.
+ Denial of Service: Preventing access.
+ Elevation of Privilege: Gaining unauthorized access.

*Stride steps*
+ Define the key assets and security requirements for the system
+ Design data flow diagram(s) for the system
+ Draw trust boundaries
+ Identify threats
+ Mitigate threats with controls
+ Validate that threats were mitigated

== Successful attack:
+ System susceptibility: Vulnerability
+ Threat accessibility: Attack surface
+ Threat capability: recourses, tools, knowledge

== Why is security hard?
+ Complexity: More complex systems are harder to secure.
+ Afterthought: Security is often added after the fact.
+ Benefits are evident best after a failure

Security is needed to prevent and counteract the unwanted consequences

== Trade-offs:
+ Security vs. Usability
+ Security unaware users want security
+ Security has cost, but becomes only a direct gain when a failure occurs
+ Failure can cost less than prevention
+ Algo is secure but the implementation is not
+ Practical security is ofter weaker than theoretical security
+ Complexity increases the attack surface

= Risk management:

== Enterprise Risk Management:
+ Identify risks
+ Evaluate risks
+ Mitigate risks
+ Monitor risks
+ Review risks

== Risk assessment:
+ Assess risk and determine need
+ Implement policy and controls
+ Promote awareness
+ Monitor and evaluate

= Principles, Best Practices and Standards
== Design principles:
- Separation of duties: No single person should have all the power
- Least privilege: Only the necessary permissions

== Standards and best practices:
- ISO/IEC 27001: Information Security Management System
- NIST: National Institute of Standards and Technology
- ANSI: American National Standards Institute


