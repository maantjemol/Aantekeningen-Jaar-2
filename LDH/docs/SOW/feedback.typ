#import "../../template/template.typ": template
#show: doc => template(
  "SOW | Feedback",
  doc,
)


#pagebreak()

#let bug = box(
  image("bug.svg", height: 0.8em, fit: "contain",),
  baseline: 10%
)

#let rocket = box(
  image("rocket.svg", height: 0.8em, fit: "contain",),
  baseline: 10%
)

#let chart = box(
  image("chart-column.svg", height: 0.8em, fit: "contain",),
  baseline: 10%
)

#let smile = box(
  image("smile-plus.svg", height: 0.8em, fit: "contain",),
  baseline: 10%
)

= Uitdaging
Op dit moment is het proces om feedback te verzamelen beperkt. Feedback wordt verzameld door met eindgebruikers te praten, of via de duimpjes in Luisterlinie en ChatAI. Door gebrek aan methodes om feedback te verzamelen is er weinig inzicht in gebruikers ervaringen en gebruik. Dit maakt dat we niet goed kunnen sturen op basis van gebruikerspatronen en feedback.
= Doelstelling
// %% Beschrijf de gewenste uitkomst na afloop van dit project. %%
Door een tekort aan feedback is er geen goed inzicht in ervaringen en gebruik. Dit willen we wel graag om verschillende reden:
- *Product ontwikkeling:* Door meer gebruikers feedback te hebben weten we beter als er iets stuk is of niet werkt. Ook geeft het ons de mogelijkheid om nieuwe features te prioriteren
- *AI-adoptie:* Meer feedback betekent dat we beter kunnen bijhouden hoe de adoptie van de verschillende AI-apps verloopt. Dit geeft ons de mogelijkheid om businesscases beter te ondersteunen en de impact van AI-apps vast te stellen. 
Uiteindelijk zullen wij als AI-team deze feedback vooral gebruiken om onze producten te verbeteren. Ook geeft het ons de mogelijkheid om de waarde van AI beter uit te leggen aan de organisatie. 

Feedback moet verzameld worden op een manier die gebruikers niet stoort, en die ons toch voldoende inzicht geeft in de ervaringen van gebruikers. Dit kan gedaan worden in de applicaties zelf, maar ook via andere kanalen zoals mail, surveys, of interviews.

= Oplossingsrichting
// %% Geef een functionele en technische beschrijving van de oplossing. %%
== Feedback verzamelen
Er worden 4 verschillende vormen van feedback verzameld:

#line(length: 100%, stroke: 1pt + gray)

*#chart Gebruikersgedrag:* Welke features worden gebruikt, hoe vaak, en in welke volgorde? Dit kan worden verzameld via analytics tools/logging in de applicaties.

*#smile Gebruikerservaring:* Hoe ervaren gebruikers de applicaties en AI in het algemeen? Dit kan worden verzameld via korte surveys in of buiten de applicaties.

*#rocket Innovatie wensen:* Welke nieuwe features zouden gebruikers graag zien? Dit kan worden verzameld via een feedback formulier in of buiten de applicaties.

*#bug Problemen en bugs:* Welke problemen ervaren gebruikers? Dit kan worden verzameld via een feedback formulier in de of buiten applicaties.

#line(length: 100%, stroke: 1pt + gray)

Interviews zouden kunnen worden gebruikt om dieper in te gaan op de ervaringen van gebruikers, en om meer kwalitatieve feedback te verzamelen. Het is niet haalbaar om dit op grote schaal te doen, maar het kan waardevolle inzichten opleveren.

== Componenten
Praktisch gezien zouden hier een aantal componenten voor gebouwd moeten worden:
- *In-app feedback verzameling (#chart #bug #rocket):* Een interface binnen de applicaties om snel feedback te verzamelen. Dit kan bijvoorbeeld een pop-up zijn die verschijnt na het gebruik van een feature, of een feedback knop in het menu. Deze interface zou gebruikers moeten aanmoedigen om feedback te geven zonder hen te storen. Het zou ook de mogelijkheid moeten bieden om verschillende soorten feedback te verzamelen (ervaring, wensen, problemen). Deze knop moet altijd zichtbaar zijn, maar mag niet opdringerig zijn. Het moet gebruikers aanmoedigen om feedback te geven zonder hen te storen.
- *Analytics integratie (#chart):* Integratie van analytics tools in de applicaties om gebruikersgedrag te verzamelen. Dit zou ons moeten helpen om inzicht te krijgen in hoe gebruikers de applicaties gebruiken, welke features populair zijn, en waar gebruikers mogelijk vastlopen.
- *Feedback dashboard (#chart #smile #bug #rocket):* Een dashboard voor het AI-team om de verzamelde feedback te analyseren en te visualiseren. Dit dashboard zou verschillende filters en visualisaties moeten bieden om de feedback te analyseren en te begrijpen. Dit zou ons moeten helpen om trends en patronen in de feedback te identificeren, en om prioriteiten te stellen voor productontwikkeling.
- *Surveys (#smile):* Korte surveys om meer inzicht te krijgen in hoe AI wordt gebruikt en wat voor impact dit heeft op gebruikers. Deze surveys zouden gericht moeten zijn op het verzamelen van kwalitatieve feedback over de gebruikerservaring en de impact van AI. Deze surveys kunnen worden verspreid via verschillende kanalen, zoals e-mail of in-app.

= Afhankelijkheden
Om dit project succesvol te laten verlopen en de feedbackloop effectief te implementeren, zijn de volgende randvoorwaarden en rollen cruciaal:

- *Technische Infrastructuur:* - Beschikbaarheid voor een centrale database of survey platform voor het opslaan van ruwe feedbackdata.
- *Privacy & Compliance:* - Goedkeuring van de FG voor het verzamelen van gebruikersgedrag en het koppelen van feedback aan gebruikersprofielen (GDPR/AVG compliance).
- *Rollen & Verantwoordelijkheden:*
  - *Full-stack Developer:* Verantwoordelijk voor de bouw van de in-app interface en de koppeling met het dashboard.
  - *Security Officer:* Betrokken bij de validatie van data-opslag en anonimisering van gebruikersgegevens.

= Activiteiten
Het project wordt uitgevoerd in de volgende fasen:

1. *Kick-off & Design:* Definiëren van de exacte vragenlijsten en het visuele ontwerp van de feedback-knop.
2. *Tool Selectie:* Definitieve keuze voor de analytics-stack en survey-tooling.
3. *Ontwikkeling In-app Component:* Bouwen van de universele feedback-widget die in zowel Luisterlinie als ChatAI geplaatst kan worden.
4. *Data Pipeline Inrichting:* Opzetten van de flow van applicatie naar de centrale database/survey platform.
5. *Dashboard Bouw:* Ontwikkelen van de visualisaties in de gekozen BI-tool (bijv. PowerBI of Grafana).
6. *Test Fase:* Uitrol naar een selecte groep om de kwaliteit van de data te testen.
7. *Evaluatie & Optimalisatie:* Aanpassen van de interface op basis van de eerste pilot-resultaten (bijv. minder opdringerig maken van pop-ups).
8. *Full Release:* Uitrol naar alle gebruikers binnen de organisatie.

= Kosten-/tijdinschatting
De geschatte doorlooptijd voor de implementatie van de basisstructuur is *6 tot 8 weken*.

#table(
  columns: (1fr, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Onderdeel*], [*Inspanning (uren)*], [*Kostenindicatie*],
  [Ontwikkeling Frontend], [60 - 80 uur], [Intern / Projectbudget],
  [Backend & Data Pipeline], [40 - 50 uur], [Intern],
  [Dashboarding & Analyse], [24 - 32 uur], [Intern],
  [*Totaal*], [*124 - 162 uur*], []
)

_De ureninschatting is gebaseerd op een modulaire aanpak waarbij de componenten herbruikbaar zijn voor toekomstige AI-applicaties._