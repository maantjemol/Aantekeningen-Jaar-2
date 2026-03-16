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
Nowadays, it is almost impossible for a bank to operate successfully without using advanced data analytics. As the financial world becomes more digital, organizations must find new ways to stay competitive by making internal processes smarter and reducing unnecessary spending. A clear example of this is in the area of telemarketing for products such as long-term deposits. Even though calling customers directly remains a common way to sell products, it is also very expensive; it requires significant human labor, and telecommunication costs add up quickly. Furthermore, many people find these calls intrusive, which means banks need to be much more selective about whom they choose to contact.

In the past, researchers have explored methods to optimize these campaigns. For instance, the study by #cite(<moro2014data>, form: "prose") showed that using data mining and predictive models can help a bank identify the individuals most likely to accept an offer. This was a significant step forward because it helped marketing teams increase success rates. However, even when identifying the best potential customers, a massive amount of waste remains in the system. In most telemarketing campaigns, the vast majority of people still decline the offer. This means that even with effective models, banks continue to spend a substantial amount on wages and technology for calls that yield no result.

This research takes a different approach to solve this problem. Instead of focusing exclusively on "successes," this study concentrates on predicting "failures." Specifically, the goal is to identify the individuals who are definitively not going to subscribe to a deposit. While this might appear to be a simple shift in perspective, it has a significant impact on a bank's budget. Every instance where a bank agent calls a customer with zero interest represents a waste of time. This time could have been spent engaging with a customer who was actually considering the product. By removing these "guaranteed rejections" from the contact list before a campaign starts, a bank can stop wasting resources immediately.

The primary beneficiaries of this research are marketing and sales managers in retail banks. These teams are usually under pressure to reach high targets while working with limited budgets. Traditional methods, such as segmenting by basic age groups or using intuition, are no longer sufficient. Furthermore, contacting the wrong individuals does not only incur financial costs. This also damages the reputation of the institution. In the modern world, customers prioritize privacy and do not want to be bothered with products that do not fit their needs. Frequent contact with uninterested parties can feel intrusive and erode customer trust. This research aims to save money while simultaneously ensuring the bank's brand remains good.

To address these issues, this study proposes a new Decision Support System (DSS). This system uses predictive modeling to identify and filter out non-subscribers before the bank initiates contact. This tool analyzes historical data from previous campaigns, including customer demographics, previous history with the bank, and current economic indicators such as interest rates. By training a classification model on this data, the system can identify customers who have an extremely low probability of purchasing. This provides the campaign manager with a refined list of contacts, devoid of "dead weight."

There are three main ways this system adds value to a bank. First, it leads to direct savings; since telemarketing costs are proportional to the number of calls made, reducing calls to certain non-buyers lowers expenditure. Second, it allows for better staff allocation. If agents are not occupied with guaranteed refusals, they can devote more time to high-quality conversations with "likely" or "potential" buyers. This increases overall team effectiveness. Third, it improves customer relationship management. By refraining from calling those who are not interested, the bank demonstrates respect for the customer's preferences.

Looking at the broader context, this project represents a shift in how marketing data is utilized. While most models look only for potential wins, this research argues that it is equally important to identify predictable losses. By combining these two perspectives, a bank can implement a much more balanced strategy. The proposed DSS is not intended to replace models that find high-value customers, but rather to complement them. It ensures that resources are utilized only where there is a realistic chance of success, rather than being exhausted on certain failures.

In conclusion, this project focuses on building a system that predicts who will not subscribe to bank deposits. By approaching the problem from this angle, this research helps banks reduce costs, utilize staff more wisely, and maintain customer satisfaction. It demonstrates how data science can be applied to practical business problems by focusing on efficiency and the reduction of avoidable errors.

= DSR template
To frame this research, a Design Science Research (DSR) template is employed to structure the problem according to #cite(<wieringa2014design>, form: "prose"):\ \
/ Improve: the operational efficiency of telemarketing campaigns in retail banking
/ by: designing a Decision Support System (DSS) that leverages predictive modeling to identify and exclude definite non-subscribers\
/ that satisfies: the requirement of accurately classifying customers with an extremely low likelihood of subscription to produce an actionable exclusion list\
/ in order to: help marketing departments reduce operational costs, optimize resource allocation, and safeguard brand reputation by minimizing intrusive, unsuccessful interactions. \ \



= Replicability
// If you did something different than the paper, describe how it differs. If not you can skip this part.
This research replicates the dataset and binary classification goal—predicting deposit subscriptions from #cite(<moro2014data>, form: "prose"), but modifies the methodology to reflect a different goal.

Firstly, while the original paper emphasized Decision Trees and SVMs, this implementation utilizes Random Forest and XGBoost. These ensemble methods are the current industry standard for tabular data and offer superior performance for this specific dataset structure.

Second, rather than the original ensemble of small networks, this study employs a single, larger neural network. The hidden layer contains approximately half the number of input features to test if a more complex individual model can match ensemble efficacy.

Third, to address the scarcity of "yes" responses, this work applies SMOTE-based resampling. Unlike the 2014 study, which did not explicitly balance the data, this approach generates synthetic minority cases to prevent the model from developing a "no" bias.

Finally, the 2014 paper focused on maximizing the total number of subscribers @moro2014data. This research instead seeks to minimize wasted resources by efficiently filtering out individuals unlikely to subscribe. Consequently, performance metrics are shifted to prioritize the exclusion of "no" responses over the mere volume of "yes" predictions.


= Results
// If you did the same as the paper, compare results. If you did something different, discuss the results briefly and relate metrics to your DSR-template.


The findings show that forecasting certain non-subscribers is feasible with notable compromises in prediction accuracy. Among the tested models, metrics for the negative category ("not subscribed") exhibit strong recall, especially the NN model reaching a negative recall of 0.98. This highlights an outstanding ability to spot almost all people who will decline the proposal, which completes the DSR criterion of pinpointing the "least promising group."

However, false negatives for this category are very high. Nearly all subscribers end up on the exclusion list. The XGBoost and Random Forest models deliver a more nuanced result, which offers better precision and F1 scores for the "subscribed" class while still identifying most non-subscribers. These outcomes imply that the Decision Support System can effectively eliminate a substantial number of customers, although the exact classification cutoff is a tactical decision for the bank's marketing executives.

The results meet the DSR template's need for creating a exclusion list aimed at "enhancing operational efficiency." From the viewpoint of stakeholders, the ability to reliably exclude a large number of definite refusals helps in cutting operational expenses and preserving brand image. These findings confirm that the tool functions as intended as a decision-support mechanism. It enables marketing teams to minimize disappointments by directing efforts toward areas with the highest potential for success.


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