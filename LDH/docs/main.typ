#import "@preview/gentle-clues:1.0.0": *
#import "@preview/cetz:0.4.0": canvas, draw
#import "@preview/cetz-plot:0.1.2": plot

#set text(font: "Noto Sans")
#set par(justify: true)

#let primary = rgb("#E92A20")

#let f1(x) = calc.pow(x, 2)

#let title = "Security considerations voor ChatAI"

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
        Leger des Heils | #title// SBIS | Randstad | Group A
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
  Security 
])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}



== Toegangsbeheer & autorisatie

=== Wie mag collecties uploaden? (beperk tot rollen met formele autorisatie, bv. W&G of kwaliteitsmedewerkers)
Dit kan worden gedaan doormiddel van het permissie systeem. Hierin kunnen we vaststellen dat een bepaalde security group (aan het begin alleen developers) de rechten heeft om collecties te uploaden.

=== Wie mag collecties gebruiken? (bv. per team, functie of rol instelbaar).
Dit kan ook worden gedaan doormiddel van het permissie systeem. Hierin kunnen we vaststellen dat een bepaalde security group de rechten heeft om een collectie te gebruiken.

=== Als collecties gedeeld worden: least privilege toepassen → alleen toegang voor wie het echt nodig heeft.
De administatie interface maakt het mogelijk om dit inzichtelijk te maken en aan te passen. Hierdoor houden we overzicht en beheer over wie toegang heeft tot welke collectie.

=== TODO:
1. Mogelijkheid om toegang tot een collectie te beperken tot bepaalde gebruikers of groepen via het permissie systeem.


== Data-classificatie en labeling

=== Documenten die worden geüpload moeten een classificatielabel krijgen (bijv. Openbaar, Intern, Vertrouwelijk, Zeer Vertrouwelijk).
Dit kan worden gedaan doormiddel van een dropdown menu bij het uploaden van een bestand. Hierbij kan de uploader een classificatie kiezen die vervolgens wordt opgeslagen als metadata bij het bestand.

#pagebreak()

=== ChatAI mag geen gevoelige persoonsgegevens (zoals BSN, medische gegevens) in een collectie verwerken tenzij daar een expliciet juridisch grondslag en DPIA voor is.

Dit zal expliciet bij de collectie vermeld worden. Daarnaast zal er een check komen bij het uploaden van een bestand die controleert op gevoelige informatie. Dit kan gedaan worden doormiddel van het nieuwe PII systeem dat Fulko aan het ontwikkelen is.

=== TODO:
- Implementeren van een check bij het uploaden van een bestand die controleert op gevoelige informatie (PII).
- Implementeren van een verplichte classificatie bij het uploaden van een bestand.

== Opslag en encryptie

=== Alle documenten in Collections moeten encrypted at rest & in transit zijn.
- (At Rest → data staat stil (opslag) → beveiligd door disk/database encryptie.
  - Kan gedaan worden doormiddel van Azure Storage Service Encryption (SSE). [Meer info hier](https://learn.microsoft.com/en-us/azure/storage/common/storage-service-encryption). Dit staat standaard aan voor Azure Blob Storage.
- In Transit → data beweegt (netwerk) → beveiligd door versleutelde verbindingen.
  - Alles gaat over HTTPS.
- Controleren of de opslag binnen de Microsoft tenant plaatsvindt (en dus binnen de EU of met juiste SCC’s).
  - Ons Azure blob storage account staat in West-Europa (Nederland) onder de LdH tenant.


== Logging en auditing

=== Bijhouden wie documenten uploadt, wijzigt, verwijdert of raadpleegt. Dit is belangrijk voor forensisch onderzoek en compliance (AVG, NEN7510).
- Via application insights kunnen dit soort acties gelogd worden.

=== TODO:
- Implementeren van logging voor uploaden, wijzigen, verwijderen en raadplegen van specifieke documenten. Algemene acties worden al gelogd via application insights (toegang tot collectie etc).

#pagebreak()
== Voorkomen van data-lekken

=== AI mag niet automatisch gevoelige delen van een collectie als antwoord gebruiken zonder expliciete keuze van de gebruiker (“opt-in”).
- Er zal altijd een expliciete actie zijn om een collectie te gebruiken. Op dit moment zijn deze acties:
  - Selecteren van een collectie in de UI.
  - De LLM die vraagt of je een bepaalde collectie wilt gebruiken indien dit relevant is
- Zonder 1 van deze acties uit te voeren zal de AI nooit een collectie gebruiken.

=== Bescherm tegen prompt injection waarbij een kwaadwillende de AI kan dwingen ongewenste stukken uit een collectie vrij te geven.
- Er is op dit moment geen manier voor de AI om acties te ondernemen naar buiten toe. De enige manier waarop data uit een collectie vrijgegeven kan worden is via de chat interface. Hierin kan de AI alleen antwoorden geven op basis van de input die hij krijgt.
