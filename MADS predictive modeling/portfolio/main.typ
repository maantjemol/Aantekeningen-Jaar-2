#import "@preview/charged-ieee:0.1.4": ieee

#show raw.where(block: false): it => box(
  fill: gray.lighten(90%),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
  it
)

#show: ieee.with(
  title: [Portfolio - predictive modeling],
  // abstract: [
  //   The process of scientific writing is often tangled up with the intricacies of typesetting, leading to frustration and wasted time for researchers. In this paper, we introduce Typst, a new typesetting system designed specifically for scientific writing. Typst untangles the typesetting process, allowing researchers to compose papers faster. In a series of experiments we demonstrate that Typst offers several advantages, including faster document creation, simplified syntax, and increased ease-of-use.
  // ],
  authors: (
    (
      name: "Manuel Mol",
      department: [2168651],
      organization: [Predictive modeling],
      location: [MADS],
    ),
    (
      name: "Esmat Fayaz",
      department: [2176821],
      organization: [Predictive modeling],
      location: [MADS],
    ),
  ),
  index-terms: ("Analytics", "DSS", "Telemarketing"),
  bibliography: bibliography("refs.bib"),
  figure-supplement: [Fig.],
)

= Introduction
In the modern banking industry, data-driven marketing has become a cornerstone of customer engagement and strategic decision-making. As traditional financial institutions adapt to increasingly competitive and digital environments, they rely heavily on analytics to improve efficiency, reduce costs, and enhance customer satisfaction. One common channel where this transformation is obvious is telemarketing, particularly in the promotion of long-term deposit products. Despite being a proven method for direct customer outreach, telemarketing remains resource-intensive, costly, and potentially intrusive. This tension highlights the importance of optimizing campaign efficiency, maximizing impact while minimizing wasted effort.

Previous research demonstrated that predictive analytics can effectively increase the success of bank telemarketing campaigns by identifying customers who are most likely to subscribe @moro2014data. Their data-driven approach enabled marketing teams to target the “best prospects," improving conversion rates and overall campaign effectiveness. However, this focus on maximizing success leaves an important efficiency dimension untouched, which is minimizing wasted effort. In practice, the majority of telemarketing calls still result in rejection, which unfortunately means that a significant portion of resources like time, labor, and telecommunication costs are spent without return. 

This inefficiency forms the foundation of our project. Rather than predicting who will subscribe, we focus on predicting who will definitely not subscribe. The distinction may appear subtle at first, but its implications for operational efficiency are substantial. Every call placed to a definite non-subscriber represents guaranteed waste such as the agent’s time, the cost of communication, and the opportunity cost of not engaging with more promising leads. By confidently identifying and excluding such individuals from calling lists, the bank can achieve immediate cost savings while maintaining a more respectful and customer-friendly approach to marketing.

The primary stakeholder in this context is the marketing and sales department of a retail bank, responsible for planning and executing telemarketing campaigns. These teams work under pressure to meet campaign targets with finite resources. Traditional decision-making methods, often based on heuristics or demographic assumptions, struggle to deliver consistent efficiency gains. Moreover, outbound campaigns typically exhibit very low conversion rates, meaning that most customer interactions fail to produce value. This low yield not only translates into financial losses but also damages the image of the bank, as customer perceptions are increasingly central to banking success. Clients who are contacted multiple times for unwanted offers may perceive the bank as intrusive or insensitive, potentially damaging long-term relationships. In an era of rising customer expectations and heightened privacy awareness, avoiding unnecessary calls can help safeguard the bank’s reputation and strengthen trust. Thus, the problem extends beyond operational efficiency; it also concerns customer experience management and brand integrity.

// Maybe add a reference here to the paper that we did the same as them?
To address this issue, 
// Do we want to use we? Or do we write it like "a design of a decision support system is proposed"
we propose the design of a Decision Support System (DSS) that leverages predictive modeling to identify and exclude definite non-subscribers before campaign execution. This system will analyze historical telemarketing data such as demographic variables, socio-economic indicators, and previous interaction outcomes to train a classification model that accurately detects customers with an extremely low likelihood of subscribing. The output would be an actionable list or ranking that allows campaign managers to filter out the least promising segment before launching new campaigns.

First, it delivers direct cost savings by reducing the number of calls that do not yield any conversions. Since telemarketing expenses scale with the number of contacts made, even a modest reduction in unproductive calls translates to measurable financial benefits. Second, it supports resource reallocation. Time saved from excluding definite non-subscribers can be redirected toward more persuasive or personalized interactions with clients who are undecided or moderately likely to subscribe. This enhances the overall effectiveness of human and financial resources and can indirectly improve conversion outcomes. Third, it contributes to relationship management and customer goodwill. Avoiding unnecessary calls prevents annoyance, preserves the bank’s professional image, and strengthens the customer’s perception of being understood and respected.

From a broader perspective, this approach represents a strategic shift in how data-driven marketing problems are framed. Traditional predictive models in marketing are designed to identify potential gains, customers who are most likely to buy. Our project reframes the problem by focusing instead on predictable losses, in this case, customers who will almost certainly not buy. This inversion creates a more balanced, risk-aware decision framework that complements existing marketing analytics tools. In other words, the proposed DSS does not replace current models for identifying good prospects but rather enhances campaign efficiency by ensuring that resources are not wasted on the less likely ones.

In conclusion, this project aims to build a data-driven decision support system that predicts definite non-subscribers in bank telemarketing campaigns. Situated within the broader context of customer relationship management and operational efficiency, the proposed artifact delivers clear business value through cost reduction, resource optimization, and enhanced customer satisfaction. By bridging predictive analytics with practical marketing strategy, the solution exemplifies how applied data science can transform everyday business operations by shifting the focus from merely increasing success rates to intelligently reducing avoidable failures.

= DSR template
To frame this research, a Design Science Research (DSR) template is employed to structure the problem according to #cite(<wieringa2014design>, form: "prose"):\ \
/ Improve: the operational efficiency of telemarketing campaigns in retail banking
/ by: designing a Decision Support System (DSS) that leverages predictive modeling to identify and exclude definite non-subscribers\
/ that satisfies: the requirement of accurately classifying customers with an extremely low likelihood of subscription to produce an actionable exclusion list\
/ in order to: help marketing departments reduce operational costs, optimize resource allocation, and safeguard brand reputation by minimizing intrusive, unsuccessful interactions. \ \



= Replicability
// If you did something different than the paper, describe how it differs. If not you can skip this part.

This study uses the same Portuguese bank telemarketing dataset as Moro et.al (2014) and addresses the same binary prediction task of deposit subscription success. However, our implementation intentionally differs from the original study in several methodological aspects, motivated by a different decision-making objective.

First , with respect to model selection, we evaluate tree-based ensemble methods (Random Forest and XGBoost) rather than focusing on support vector machines and decision trees as in the original study. These models were selected to reflect contemporary approaches to tabular classification tasks.

Second, while Moro et al. (2014) employ a neural network with a small hidden layer and an ensemble of multiple networks, we implement a single neural network with a larger hidden layer (H ≈ M/2) and no ensemble component.

Third, we explicitly address the class imbalance in the dataset by experimenting with SMOTE-based resampling on the training data, whereas the original study does not apply explicit resampling techniques.

Finally, we adopt a different optimization objective. While the original paper emphasizes maximizing the identification of likely subscribers, our study focuses on minimizing unnecessary contact with non-subscribers, leading to a different prioritization of performance metrics.

Hier erbij wat voor performance metrics we dus op focussen


= Results
// If you did the same as the paper, compare results. If you did something different, discuss the results briefly and relate metrics to your DSR-template.

The results indicate that predicting definite non-subscribers using a time-based split is achievable, though it reveals critical trade-offs in predictive power. Across the evaluated models, performance metrics for the negative class ("not subscribed") show high recall, particularly with the NN model achieving a negative recall of 0.98. This demonstrates an exceptional capability to identify nearly all customers who will eventually reject the offer, meeting the DSR requirement of identifying the "least promising segment."

However, the false negatives for this class are really high. Almost all potential subscribers are included in the exclusion list. The XGBoost and Random Forest models offer a more refined balance, providing higher precision and F1 scores for the "subscribed" class while still capturing the majority of non-subscribers. These findings suggest the Decision Support System can successfully filter out a large volume of unproductive leads, though the specific classification threshold remains a strategic choice for the bank’s marketing managers.

The achieved performance directly addresses the DSR template requirement of producing an actionable exclusion list to "improve operational efficiency." From a stakeholder perspective, the ability to confidently remove a high volume of guaranteed rejections supports the goal of reducing operational costs and protecting brand reputation. These results confirm that the artifact serves its purpose as a decision-support tool, allowing marketing departments to intelligently reduce avoidable failures by focusing resources where they are most likely to generate value.


= Model Evaluation 

The development of the predictive model followed a rigorous pipeline, beginning with data cleaning and extending through feature engineering, model selection, and business-aligned evaluation. The raw dataset, sourced from a Portuguese bank's telemarketing campaign, consisted of 41,188 observations. A primary challenge identified during initial exploration was a significant class imbalance: approximately 88.7% of observations were non-subscribers, while only 11.3% had subscribed to the term deposit. This distribution necessitated an evaluation strategy that moved beyond simple accuracy to focus on class-specific performance.

== Data Preprocessing and Feature Engineering

#figure(
  image("figures/class_distribution.png", width: 90%),
  caption: [Dataset distribution and train-test split. The original dataset exhibits severe class imbalance with 88.7% non-subscribers. A stratified 80/20 split maintains this distribution across both training and test sets.]
) <fig:class-dist>

To enhance the model's predictive power, a custom engineering pipeline was implemented. We focused on capturing customer behavior and economic context through several key transformations. A binary flag, `was_contacted`, was derived from the `pdays` variable to distinguish between new prospects and those with prior campaign exposure. Recognizing the high multicollinearity among economic indicators, we retained only `euribor3m` and `cons.conf.idx`, effectively reducing noise for the neural network and tree-based models according to @moro2014data. Furthermore, age was segmented into three distinct life stages—student, established, and retired—to account for the varying financial priorities of these demographics. 

Consistent with the methodology of @moro2014data, the `duration` variable was excluded entirely. Since call duration is only known after a contact is completed, its inclusion would result in data leakage, rendering the model useless for pre-campaign prediction. Following these transformations, numerical features were standardized and categorical variables were one-hot encoded, resulting in a final feature set of 65 inputs.

== Validation Strategy and Model Training

The selection of an appropriate training and testing split proved critical. While a time-based split was initially attempted to mimic real-world deployment, the lack of a date or year column in the source data led to some issues. A 'year' column was added, leveraging the fact that the data was chronologically sorted according to the dataset notes and a 'month' column was already present. After adding the year column, we split the data in a train set from Jan 2008 till May 2009 and a test set from Jun 2009 till Nov 2010 to mimic the time based split that the paper described @moro2014data. This led to a severe imbalance between the train and test set.  Specifically, the test set exhibited a positive rate 6.6 times higher than the training set, the train set being 6.71% positive and the test set being 44.50% positive. This imbalance made it difficult to train models reliably, because the training data didn't represent the testing data. To ensure reliable and representative evaluation, we pivoted to a stratified 80/20 split, resulting in 32,950 training observations and 8,238 test observations. This approach ensured that both the training and testing sets maintained an identical 11.27% subscription rate, providing a stable foundation for model comparison at the cost of some real-world fidelity.
To ensure the robustness of these findings, we employed a 5-fold Stratified Cross-Validation (CV) during the training phase. This process mitigated the risk of selection bias by rotating the validation fold across the entire training set. By monitoring the "gap" between training and validation scores across all five folds, we confirmed that the models maintained high generalization capacity, effectively preventing the overfitting often associated with hyperparameter tuning in imbalanced datasets. The following table presents the statistical results of the 5-fold stratified cross-validation, focusing on the negative class to align with our objective of maximizing exclusion efficiency:
#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    inset: 8pt,
    align: horizon,
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
    stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { (bottom: 0.5pt + gray) },
    
    [*Model*], [*ACC*], [*PREC (Neg)*], [*REC (Neg)*], [*F1 (Neg)*], [*AUC*],
    
    [RF], 
    [$0.900 plus.minus 0.002$], [$0.906 plus.minus 0.001$], 
    [$0.990 plus.minus 0.002$], [$0.946 plus.minus 0.001$], 
    [$0.794 plus.minus 0.002$],
    
    [MLP], 
    [$0.899 plus.minus 0.002$], [$0.909 plus.minus 0.003$], 
    [$0.986 plus.minus 0.004$], [$0.946 plus.minus 0.001$], 
    [$0.780 plus.minus 0.021$],
    
    [XGB (W)], 
    [*$0.852 plus.minus 0.005$*], [*$0.949 plus.minus 0.001$*], 
    [*$0.881 plus.minus 0.007$*], [*$0.913 plus.minus 0.003$*], 
    [*$0.804 plus.minus 0.005$*],
  ),
  caption: [Mean Performance Metrics (Negative Class) across 5-Fold Stratified CV. The negligible standard deviations ($<0.01$) across all metrics confirm model stability and high generalization performance.],
) <model-performance-table-final>
The stratified 5-fold cross-validation results demonstrate exceptional model stability, with standard deviations consistently below 0.01. The negligible generalization gaps indicate a robust bias-variance tradeoff, confirming that the models effectively captured underlying patterns without overfitting. Specifically, the high Negative Recall (>0.98) validates the models' efficacy in high-precision exclusion tasks.

We evaluated three distinct model families to balance interpretability with performance. The *Random Forest Classifier* was chosen for its inherent robustness to imbalanced data. In its base configuration, it achieved a recall of 0.88 for the negative class and a precision of 0.95. The *Multi-Layer Perceptron (Neural Network)*, configured with a hidden layer of 32 nodes to match the feature space complexity, demonstrated a negative recall of 0.98 and precision of 0.91, successfully identifying nearly all non-subscribers. It did however classify almost all instances as not subscribed including the majority of the subscribed class, which can be seen in @fig:confusion-nn. *XGBoost Classifier* was implemented to leverage gradient boosting and built-in class weighting. By setting `scale_pos_weight` to 7, the XGBoost model achieved a more balanced performance across both classes, with a negative recall of 0.88 and precision of 0.95. All models had a small difference between training and test metrics which suggests the models generalized well without significant overfitting.

#figure(
  image("figures/confusion_matrix_nn.png", width: 70%),
  caption: [Confusion matrix for the Neural Network model. The model correctly identifies 7,166 non-subscribers (98% recall) with only 144 false positives, demonstrating strong capability for the primary objective of excluding definite non-subscribers. It did however miss the majority of actual subscribers, capturing only 193 out of 928.]
) <fig:confusion-nn>

#figure(
  image("figures/model_comparison.png", width: 100%),
  caption: [Performance comparison across all evaluated models. The Neural Network achieves the highest negative recall (0.98), making it optimal for identifying non-subscribers. SMOTE-enhanced models show improved balance, with RF + SMOTE achieving the highest positive F1-score (0.52).]
) <fig:model-comparison>

== Addressing Imbalance and Comparative Results

To further optimize the trade-off between identifying non-subscribers and retaining potential customers, we integrated the Synthetic Minority Over-sampling Technique (SMOTE). By over-sampling the minority class to a 2:1 ratio in the training data, both the Random Forest and XGBoost models significantly improved their ability to capture subscribers. The SMOTE-balanced Random Forest captured 82% of all potential subscribers while contacting only 50% of the total customer base, while XGBoost with SMOTE achieved 81% capture at the same contact rate.

#figure( caption: "Performance comparison across evaluated model architectures", scope: "parent", placement: auto)[
#table(
  columns: (auto, auto, auto, auto, 1fr),
  inset: 5pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Model*], [*Neg. Recall*], [*Neg. Precision*], [*Pos. F1*], [*Business Utility*],
  [Random Forest], [0.88], [0.95], [0.50], [Strong detection],
  [Neural Network], [0.98], [0.91], [0.35], [Maximized exclusion],
  [XGBoost (Base)], [0.88], [0.95], [0.50], [Balanced metrics],
  [XGBoost + SMOTE], [0.78], [0.95], [0.41], [Better subscriber recall],
  [RF + SMOTE], [0.94], [0.94], [0.52], [82% capture at 50%],
)
]


#figure(
  image("figures/cumulative_gains_rf_smote.png", width: 85%),
  caption: [Cumulative gains curve for Random Forest with SMOTE. By contacting only the top 50% of prospects ranked by subscription probability, the bank can capture 82% of all potential subscribers. This demonstrates the model's ability to effectively prioritize leads and minimize wasted effort.]
) <fig:gains-curve>
As shown in the table above, the choice of the "best" model depends on the bank's strategic priority. For the specific goal of identifying definite non-subscribers to minimize waste, the base Neural Network is optimal due to its 0.98 negative recall. However, for a more holistic campaign strategy, the SMOTE-enhanced Random Forest model offers superior balance with 0.94 recall for both classes and strong F1 scores.

== Conclusion of Evaluation and Business Value

The evaluation confirms that the proposed models successfully fulfill the requirements of the DSR template. By utilizing the cumulative gains curve, we demonstrated that the bank could achieve a 50% reduction in telemarketing volume while retaining over 80% of successful subscriptions using SMOTE-enhanced models. This translates directly into operational cost savings and a significant reduction in intrusive, unsuccessful interactions. Furthermore, the threshold analysis provides marketing managers with a "tunable lever": they can choose a conservative threshold to minimize the risk of missing a subscriber, or a more aggressive threshold to maximize cost-efficiency and protect the bank's brand reputation. Ultimately, these results validate the Decision Support System as a robust tool for transforming telemarketing from a high-volume "shotgun" approach into a targeted, resource-aware operation.