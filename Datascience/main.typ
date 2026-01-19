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
        Leiden University | Datascience// SBIS | Randstad | Group A
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
  Summary Datascience]
  #pad(bottom:8pt, top: -18pt, line(length:20%, stroke: 2pt + primary))
  #pad(top: -12pt, bottom: 0pt)[#emph(text(primary.darken(10%))[
  // by Manuel Mol
])]
]

#show link: it => {
  set text(blue.darken(50%))
  it
}
= Todo:
- Oefenen precision, recall, F1 score
- Oefenen Cohen's Kappa (W5)
- Oefenen TF-IDF (W6)

= Week 1: Introduction to Data Science
// • What is Data Science
// • Challenges of data
// • Task definition
// • Data types
// • Data exploration: what is in the data
// • Regression models
// • Course structure


/ Datascience: The application of techniques from computer science and statistics to datasets.

The data is often unstructured and from external parties.

/ Data driven: taking data as a starting point for research questions and hypotheses.
/ Question driven: taking a research question as a starting point for data collection.

Their are certain *data challenges*:
- Noisy data (noise, outliers, missing values)
- Large datasets (big data)
- Small datasets (small data)
- Unknown classes (or labels)
- Class imbalance (too few examples of a class)
- Heterogeneous data (different data types)
- New domain knowledge (not knowing the domain of the data)
- ...

The general steps in a data science project are:
1. *Task definition:* make a clear defeinition of the task, including research question, supervised or unsupervised, classification, regression, reranking, and what the data is and what the labels are.
2. *Data sampling*
3. *Data exploration*
4. *Preprocessing and feature engineering*
5. *Model training/learning*
6. *Model evaluation*

/ Structured data: data that is organized in a fixed format, such as a table with rows and columns, SQL databases.

/ Unstructured data: data that does not have a fixed format, such as text, images, audio, sensor data and video.

/ Semi-structured data: data that has some structure, but not a fixed format, such as JSON, XML, and HTML.

Different techniques can be used:
- Data exploration: looking at the data, visualizing it, and understanding what is in the data. (mean, median, range, quartiles, outliers using boxplots)
- Data mining: extracting patterns from the data. (unsupervised learning)
- Machine learning: using algorithms to learn from the data and make predictions. (supervised learning)


== Regression models
Regression models are used to predict a continuous value based on input features. The most common regression model is linear regression, which assumes a linear relationship between the input features and the output value.
- *Simple linear regression*: a linear model with one input feature.
- *Multiple linear regression*: a linear model with multiple input features.
- *Logistic regression*: a linear model for binary classification, which predicts the probability of a class. Sigmoid function is used to map the output to a probability between 0 and 1.

#pagebreak()

= Week 2: Visualization
A visualization is made up of different elements, such as:
- *Data properties:* attributes of data objects
- *Visual attributes:* position, size, shape, color, orientation, texture
A visualization is a mapping from data properties to visual attributes.

A visualization gives quick insights into the data. The correct visualization depends on the data itself.

/ Anscombe's quartet: refers to four different datasets that share the same basic descriptive statistics (mean, variance, correlation) but exhibit drastically different visual patterns when plotted

/ Simpson's Paradox: is a statistical phenomenon where a trend appears in various groups of data but disappears or even reverses when those groups are combined

A visualization can be good is properties are properly mapped to visual attributes.

There are a few *visualization metaphors*:
- Important is big
- Happy is up
- More is up
- Categories are containers
- Organization is a physical structure
- Similarity is proximity
- Control is up

/ KPI: Key Performance Indicator, a measurable value that demonstrates how effectively a company is achieving key business objectives

Strategic goals are measurable variabels, often SMART goals (Specific, Measurable, Achievable, Relevant, Time-bound).

Visualization mistakes (bad visualizations):
- *Axis ranges:* using a range that is too small or too large, which can distort the data (from 20 to 50 instead of 0 to 100)
- *3d:* using 3D visualizations, which can make it harder to see the data
- *Chorpleth:* using choropleth maps, which can distort the data by using colors that are too similar or too different
- *Pie charts:* using pie charts, which can be hard to read and compare
- *Overplotting:* using too many data points, which can make it hard to see the data
- *Rainbow:* using rainbow colors, which can be hard to read and compare

#pagebreak()

= Week 3: Model learning

/ Supervised learning: a type of machine learning where the model is trained on labeled data, meaning that the input data is paired with the correct output (label). The model learns to predict the output based on the input data.

/ Classification: predict categories or discrete values

/ Regression: predict continuous values

/ Multi class: each instance belongs to one of multiple classes
/ Multi label: each instance can belong to multiple classes
/ Binary: spam filter

== Families of models:
- *Example based:* kNN (nearest neighbors)
- *Decision tree:* C4.5
- *Probabilistic:* Naive Bayes, Gaussian Naive Bayes, Multinomial Naive Bayes
- *Vector space:* SVM (Support Vector Machine), linear SVM, kernel SVM
- *Neural networks:* MLP (Multi Layer Perceptron),
- *Deep learining:* CNN (Convolutional Neural Network), RNN (Recurrent Neural Network)
- *Ensemble:* Random Forest, AdaBoost, Gradient Boosting

/ Vector space model: a model that represents data as points in a high-dimensional space, where each dimension corresponds to a feature of the data. The distance between points in this space can be used to measure similarity or dissimilarity between data points.

== Missing data:
/ MCAR: Missing Completely At Random, Imagine you're collecting survey responses, and every now and then, someone accidentally skips a question because their pen ran out of ink.

/ MAR: Missing At Random, imagine in your survey, men are less likely to report their income, but women are happy to share it. The missingness of income depends on gender (which you have observed), but not on the actual income amount itself for men or women.

/ MNAR: Missing Not At Random, consider a survey asking about sensitive topics like drug use. People who actually use drugs might be less likely to answer that specific question.

There are a bunch of different ways to impute missing data, like mean imputation, median imputation, mode imputation, and more advanced methods like KNN imputation or regression imputation. The choice of method depends on the nature of the data and the amount of missingness.

== Neural networks:
Neural networks are non linear, which makes them very powerful.

/ Feedforward neural network: a type of neural network where the data flows in one direction, from the input layer to the output layer, without any loops or cycles. Each layer is fully connected to the next layer, and the output of each layer is used as input for the next layer.

/ Cross entropy loss: a loss function used in classification problems, which measures the difference between the predicted probability distribution and the true probability distribution. It is commonly used in neural networks for multi-class classification tasks.

/ Backpropagation: a method used to train neural networks, where the error is propagated backward through the network to update the weights and biases of the neurons. It uses the chain rule of calculus to compute the gradients of the loss function with respect to the weights and biases.
#pagebreak()

= Week 4: Evaluation:
/ Validation set: a subset of data to evaluate performance of the model. Split the example data in a training set and a test set (E.g. 80% for training and 20% for testing)

/ Cross validation: a technique to evaluate the performance of a model by splitting the data into multiple subsets (folds) and training the model on different combinations of these subsets. It helps to assess the model's generalization ability and reduce overfitting.

You don't do *hyper parameter tuning* on the test set but on the training set. The test set is only used to evaluate the final model. There are different types of hyper paremeter tuning, such as grid search, random search, and Bayesian optimization.

== Evaluation for classification:
- *Accuracy:* the percentage of correct predictions made by the model. It is calculated as the number of correct predictions divided by the total number of predictions.
- *Precision:* the percentage of true positive predictions out of all positive predictions made by the model. It is calculated as the number of true positives divided by the sum of true positives and false positives. (_What proportion of the assigned labels are correct?_)
- *Recall:* the percentage of true positive predictions out of all actual positive instances in the data. It is calculated as the number of true positives divided by the sum of true positives and false negatives. (_What proportion of true labels was assigned?_)
- *F1 score:* the harmonic mean of precision and recall, which balances the two metrics. It is calculated as 2 * (precision * recall) / (precision + recall).

$ "Precision" = "TP" / ("TP" + "FP") $
$ "Recall" = "TP" / ("TP" + "FN") $
$ "F1" = 2 * ("Precision" * "Recall") / ("Precision" + "Recall") $

Classifiers are not perfect. A F-score between 0.5 and 0.7 is considered acceptable, between 0.7 and 0.9 is good, and above 0.9 is excellent.

== Evaluation for regression:
- *Mean Squared Error (MSE):* the average of the squared differences between the predicted values and the actual values. It is calculated as the sum of squared errors divided by the number of instances.

== Evaluation for ranking:
- *Accuracy\@1:* the percentage of instances where the top-ranked item is the correct one. It is calculated as the number of correct top-ranked items divided by the total number of instances.
- *Succes\@n:* the percentage of instances where at least one of the top n ranked items is the correct one. It is calculated as the number of instances with at least one correct item in the top n divided by the total number of instances.
- *Mean Reciprocal Rank:* the average of the reciprocal ranks of the first correct item in the ranked list. It is calculated as the sum of the reciprocal ranks divided by the number of instances. The reciprocal rank is the inverse of the rank of the first correct item in the list. So if the correct item appears at rank 2, the reciprocal rank is $1/2 = 0.5$.
#pagebreak()

= Week 5 (Data collection):
You get example data by using existing datasets or creating new labelled data.
- Benchmark datasets: datasets that are used to evaluate the performance of models. They are often used in competitions and research papers.
- Expert classifications: data that is labelled by experts in the field. This can be done by manual annotation or by using existing classifications.
- User generated data: data that is generated by users, such as social media posts, reviews, and comments. This data can be used to train models, but it is often noisy and unstructured.

/ Inter-rater agreement: a measure of the agreement between multiple annotators or raters on the same data. It is often used to assess the reliability and consistency of annotations. Common measures include Cohen's Kappa, Fleiss' Kappa, and Krippendorff's Alpha.

/ Cohen's Kappa: Cohen's Kappa is a score that tells you how much two people (or things) agree when they're putting items into categories, after taking into account how much they might agree just by luck. "We agreed 90% of the time, but after considering that we'd agree by chance X% of the time, our real agreement is actually better than just guessing." 0 is slight agreement, 1 is perfect agreement.
#pagebreak()

= Week 6 (Preprocessing):
/ Matrix representation: a way to represent data as a matrix, where each row is an instance and each column is a feature. This is often used in machine learning to represent data for training and testing models.

/ Vector representation: a way to represent data as a vector, where each element is a feature of the data. This is often used in natural language processing to represent text data.

If you have raw data, feature extraction is needed to get the data into a matrix.

/ Dense: a matrix where all elements are non-zero, meaning that every feature is present for every instance.

/ Sparse: a matrix where many elements are zero, meaning that not every feature is present for every instance. This is often the case in text data, where many words may not appear in every document.

== NLP:
/ Lemmatization: the process of reducing a word to its base or root form, which is called a lemma. For example, "running" becomes "run", "better" becomes "good". This helps to reduce the number of unique words in the data and makes it easier to analyze.
/ Stemming: the process of reducing a word to its stem or root form, which may not be a valid word. For example, "running" becomes "run", "better" becomes "better". This is often used in natural language processing to reduce the number of unique words in the data.

Features can be extracted from text data using different techniques, such as:
- *one hot encoding:* a technique to represent categorical data as binary vectors, where each category is represented by a unique binary vector. For example, if you have three categories (A, B, C), they can be represented as [1, 0, 0], [0, 1, 0], and [0, 0, 1].

- *Bag of words:* a technique to represent text data as a matrix, where each row is a document and each column is a word. The value in each cell is the frequency of the word in the document. This is often used in natural language processing to represent text data for training and testing models.

- *TF:* Term Frequency, a measure of how often a word appears in a document. It is calculated as the number of times a word appears in a document divided by the total number of words in the document.

- *IDF:* Inverse Document Frequency, a measure of how important a word is in a collection of documents. It is calculated as the logarithm of the total number of documents divided by the number of documents containing the word. This helps to reduce the weight of common words and increase the weight of rare words.

- *TF-IDF:* a combination of Term Frequency and Inverse Document Frequency, which is often used to represent text data in natural language processing. It is calculated as the product of TF and IDF for each word in a document.

== Image data:
Images are often represented as matrices, where each pixel is represented by a value (or multiple values for color images). The values can be normalized to a range between 0 and 1 or standardized to have a mean of 0 and a standard deviation of 1.

/ Convolutional Neural Networks (CNNs): a type of neural network that is specifically designed for image data. It uses convolutional layers to extract features from the image, followed by fully connected layers to make predictions. It uses progresively smaller and simpeler filters to extract features from the image.

Data augmentation is often used to increase the size of the dataset by applying transformations to the images, such as rotation, scaling, flipping, noise, and cropping. This helps to improve the generalization ability of the model and reduce overfitting.

= Week 7: Error analysis and XAI
*Error analysis* is the process of analyzing the errors made by a model to understand why it is making those errors and how to improve it. This can be done by looking at the confusion matrix, which shows the number of true positives, false positives, true negatives, and false negatives for each class. Also useful to look at the precision, recall, and F1 score for each class to understand the performance of the model. 

If you want more detailed *error analysis*, you can loop over the classifier output and print the data points that were misclassified. These can then be analyzed. 

When writing a report. Show the results in a table. Mark best results in bold. use 3 decimanls for proportions and 1 decimal for percentage. Describe what you see. When reporting signicifance, report test and p-value. Show analysis of results, such as confusion matrix, precision, recall, F1 score, and ROC curve.

== Explainable AI (XAI):
/ Explainable AI: Any method that can automatically derive explanations to gain insight into the workings of black-box methods.

Usecased of XAI:
- Provide explanations to end users (domain experts)
- Debug AI models
- Identify and mitigate bias
- Understand feature importance for a given problem

There are different types of explanations. Mainly either global or local and model agnostic or model specific.
/ Global: explanations that provide an overview of the model's behavior and how it works across all instances.
/ Local: explanations that provide insights into the model's behavior for a specific instance or prediction.
/ Model agnostic: explanations that can be applied to any model, regardless of its architecture or implementation.
/ Model specific: explanations that are tailored to a specific model and its architecture.

/ LIME: Local Interpretable Model-agnostic Explanations, a method that provides local explanations for individual predictions by approximating the model with a simpler interpretable model in the vicinity of the instance being explained. It uses perturbations of the input data to generate explanations.

/ Shapely values: a method that provides global explanations by calculating the contribution of each feature to the model's predictions. It is based on cooperative game theory and assigns a value to each feature based on its contribution to the overall prediction. (explained better #link("https://g.co/gemini/share/5a8699a682a6")[here])

/ Gradcam: Gradient-weighted Class Activation Mapping, a method that provides local explanations for image data by visualizing the regions of the image that contribute most to the model's predictions. It uses the gradients of the output with respect to the input image to highlight important regions.

=== Explanation for time series: 
- *Point-wise:* relies on attention weights to highlight important points in the time series. Is per point in the time series. Can become global by aggregating local explanations
- *Subsequence:* looks at a sequence of points in the time series and highlights important subsequences. Is per subsequence in the time series.
- *Instance based:* Feature based: characterize instances with extracted numerical or descriptive features. Prototype based: instances that characterize the data by a few representative instances. Counterfactual based: For a given instance, find its minimal perturbated counterpart that changes the prediction of a classifier and compare the difference.

/ XAI for predictive maintenance: Predictive maintenance uses data to predict when a machine will fail. By using XAI, we can understand which features are important for the predictions and how they contribute to the overall prediction. This can help to identify potential issues and improve the maintenance process.

/ Counterfactual explanations: work by changing the input sequence until the classifier predicts a different class. This can be done by perturbing the input sequence and finding the minimal perturbation that changes the prediction. The counterfactual explanation is the difference between the original input sequence and the perturbed input sequence.

/ Shapelets: Shapelets are informative parts of time-series. Finding them can be time consuming. With the right shapelets we can classify time-series data. Shapelets can be used to extract features from time-series data, which can then be used to train a classifier. They are often used in time-series classification tasks.

/ post-hoc counter factual explanations: one change the interesting segments and let the model guess the changing parts. 

= Week 8: text
Text is hard since it's unstructured data. It is also often in different languages, which makes it harder to process. It is also noisy (spelling errors, grammer OCR errors). Language is also infinite, the number of new words with new data increases rapidly. Text is sequential data, meaning that the order of the words matters.


From text to feature:
+ gather text data
+ clean up the text data (remove stop words, punctuation, special characters, etc.)
+ tokenize the text data (split the text into words or phrases)
+ normalize the text data (convert to lowercase, lemmatization, stemming, etc.)
+ vectorize the text data (convert the text into a numerical representation, such as TF-IDF, word embeddings, etc.)

These vectors can be used to train all sorts of models, like SVM, random forest and Naive Bayes.

== Embeddings:
/ Word embeddings: a technique to represent words as vectors in a high-dimensional space, where similar words are closer together. This is often used in natural language processing to capture the semantic meaning of words. Examples include Word2Vec, GloVe, and FastText.

Embeddings are created by the idea that words that appear in similar contexts have similar meanings. This is often done by training a neural network on a large corpus of text data to learn the relationships between words.

You can mask words and predict those words given the context. That is how BERT works. 

/ Transformer: a type of neural network architecture that is designed to process sequential data, such as text. It uses self-attention mechanisms to capture the relationships between words in a sequence, allowing it to handle long-range dependencies and parallelize computations. Transformers are the backbone of many state-of-the-art natural language processing models, including BERT, GPT-3, and T5.

/ BERT: Bidirectional Encoder Representations from Transformers, a pre-trained language model that uses transformers to capture the context of words in a sentence. It is trained on a large corpus of text data and can be fine-tuned for specific tasks, such as text classification, named entity recognition, and question answering.

Huggingface is a library that provides pre-trained models. 

== GPT:
GPT is a Generative Pre-trained Transformer, a type of language model that uses transformers to generate text. After each word, predict the most probable next word given all the previous words. It is trained on a large corpus of text data and can be fine-tuned for specific tasks, such as text generation, summarization, and translation. GPT3.5 was finetuned for chat conversations. Some problems with GPT are:
- Computational power: GPT models are large and require a lot of computational power to train and run.
- Closed source: GPT models are often closed source, meaning that the code and data used to train them are not publicly available.
- The output is fluent but not always correct

/ Reasoning: CoT (Chain of Thought) reasoning is a technique used in natural language processing to improve the performance of language models by breaking down complex tasks into smaller, manageable steps. It involves generating intermediate reasoning steps that lead to the final answer, allowing the model to better understand the problem and provide more accurate responses. This approach is particularly useful for tasks that require multi-step reasoning or logical deduction.

= Week 9: Modelling II
- *KNN:* works best with small data, low dimensional
- *Decision tree:* low dimensional, human interpretable
- *Naive Bayes:* small dataset, text data, imbalance classes are a problem
- *SVC:* works well with high dimensional data, small dataset, kernel trick can be used to handle non-linear data
- *Random forest:* needs lots of data, can be powerful
- *Deep learning:* lots of data, high dimensional, requires lot of compute and extensive parameter tuning. *transfer learning* can be used to improve performance on small datasets.

/ Transfer learining: Learn feature representations on a large dataset, then use these representations to learn to classify other classes in a much smaller set. Works well on text and image data.

== Significance testing:. 
We have two classifiers. They give different result sets. “The added features give a small improvement”. Are the differences caused by the differences in the classifier? In other words: are the classifiers really performing differently?

*Null-hypothesis*: both result sets are generated by the same (or equally
performing) classifier

What is the probability that the found differences (or larger) would occur
if the null hypothesis were true?

If this probability ($"P-value"$) is very low ($<0.05$) we can safely say that the
differences in the results are truly caused by differently performing
classifiers. The test used depends on the data:
- Dependent/paired or independent samples
- Categorical or continuous data

/ Dependent samples: samples that are related to each other. In the case of classifiers, this means that the same data is used to evaluate both classifiers. For example, if you have a dataset and you evaluate both classifiers on the same dataset same order, the samples are dependent.

/ Independent samples: samples that are not related to each other. In the case of classifiers, this means that different datasets are used to evaluate both classifiers. For example, if you have two different datasets and you evaluate both classifiers on these datasets, the samples are independent.

Tests to use:
#image("image.png")

= Week 10: Preprocessing II
== Timeseries:
/ Time series classification / regression: A (part) of a time series is being classified. the classification model takes features for each part. 

/ Time series forecasting: A time series is being predicted. The model takes the previous values of the time series as input and predicts the next value(s). Each measurement could be a feature.

/ Sliding window: A technique to create features from a time series by taking a fixed-size window of the time series and using it as input for the model. The window is slid over the time series to create multiple features. This is often used in time series classification and regression tasks. Overlap is often used to create more features. For each window, features are calculated, such as mean, median, standard deviation, etc.

/ Shapelets: are informative parts of time-series. They are subsequences that are representative of the time series and can be used for classification. Shapelets can be learned from the data and are often used in conjunction with other features.

/ SAX: Symbolic Aggregate approXimation, a technique to convert a time series into a symbolic representation by discretizing the values into symbols. This is often used to reduce the dimensionality of the time series and make it easier to analyze. It can be used for classification and regression tasks. It consists of two steps: PAA, Piecewise Aggregate Approximation, which reduces the dimensionality of the time series by dividing it into equal-sized segments and computing a representative value for each segment, and SAX, which maps the PAA values to discrete symbols.

/ RNN: Recurrent Neural Networks, a type of neural network designed for sequential data. RNNs can take into account the temporal dependencies in the data and are often used for tasks such as time series forecasting and classification.

== Feature normalization:
When having data, the data needs to be prepared into a matrix representation (csv list, table, columns and rows etc). Sometimes features are on different scales, which might cause problems for certain models. These features can be normalized to a common scale. This is often done by subtracting the mean and dividing by the standard deviation (z-score normalization) or by scaling the values to a range between 0 and 1 (min-max normalization).

== Dimensionality reduction:
Reasons for dimensionality reduction:
- Reduce dimensionality (and thereby complexity)
- Improve classifier (reduces overfitting)
- When reduced to only 2 or 3 dimensions: gives interpretable information (visualization)

Two options:
- Select top-k features:
  - Based on Mutual Information (MI): a measure of the mutual dependence between two variables. It is often used to select features that are most informative for the target variable.
  - Based on Chi-squared: a statistical test that measures the association between two categorical variables. It is often used to select features that are most informative for the target variable.
  - Or use frequency as criterion (not the most frequent, not the long tail)
- Matrix transformation techniques:
  - PCA, word embeddings, NMF (Non-negative Matrix Factorization), auto encoders

/ PCA: project data onto a lower-dimensional space by finding the directions of maximum variance in the data. It is often used to reduce the dimensionality of the data while preserving as much information as possible. PCA is a linear technique and works best with linearly separable data.

/ T-SNE: t-distributed Stochastic Neighbor Embedding. It works by minimizing the divergence between two probability distributions: one that measures pairwise similarities in the high-dimensional space and another that measures pairwise similarities in the low-dimensional space. It is often used for visualization of high-dimensional data, but can be computationally expensive and may not preserve global structure. UMAP is a faster alternative to t-SNE that preserves more of the global structure of the data.

/ LDA: Linear Discriminant Analysis, a technique that projects data onto a lower-dimensional space while maximizing the separation between classes. It is often used for classification tasks and can be used to reduce the dimensionality of the data while preserving class information

= Week 11: Imbalanced data
/ SMOTE: Synthetic Minority Over-sampling Technique, a technique to balance the class distribution in a dataset by generating synthetic samples for the minority class. It is often used to address class imbalance in classification tasks.

/ Hyperparameter optimization: the process of tuning the hyperparameters of a model to improve its performance. This can be done using techniques such as grid search, random search, or Bayesian optimization.

When to use cross validation:
- When you have a small dataset and want to maximize the use of the data for training and testing
- When you want to evaluate the performance of a model on different subsets of the data. We can't use the test set for hyperparameter tuning, since that would lead to overfitting. The test set is only used to evaluate the final model.
#pagebreak()

= Week 12: Ethics & big data
Big data consists of 4 V's:
- *Volume:* the amount of data is large, often in terabytes or petabytes
- *Velocity:* the speed at which data is generated and processed is high, often in real-time or near real-time
- *Variety:* the data comes in different formats and types, such as structured, unstructured, and semi-structured data
- *Veracity:* the quality and accuracy of the data is uncertain, often due to noise, missing values, and inconsistencies

/ FACT: Fairness, Accuracy, Confidentiality, and Transparency. These are important aspects to consider when working with data and machine learning models. Fairness refers to the absence of bias in the data and the model, accuracy refers to the performance of the model, confidentiality refers to the protection of sensitive data, and transparency refers to the ability to understand and explain the model's behavior.

New regulation makes XAI extra important. 

