# Conceptual points that we might make

* Different levels of indexical grouping are differently informative about cue distributions
    * Dialect and gender are both intermediate levels of grouping between full talker-specificity and language-level marginal ditsributions. 
    * But gender captures more coarse acoustic variation across talkers, while dialect is more specific.
    * Dialect isn't, on the whole, super informative about how to classify vowels, but gender is. There's a lot of consistency across dialects, and much of the inter-talker variation is due to individual frequency differences that cause global vowel space shifts. These differences are largely (but not entirely) accounted for by gender differences.
    * ...but dialect can still be _somewhat_ reliably decoded from vowels
* Joint inference of indexical and linguistic variables:
    * Not knowing a talker's dialect or gender doesn't really hurt you that much since you can _simultaneously_ infer gender/dialect and vowel identity. (But this requires having samples from across the vowel space)
* __IMPORTANT__: Lots of ways that indexical structure could be useful.
    * We know that listeners are sensitive to within-category acoustic phonetic differences. Adapting to a talker's specific distributions has benefits above and beyond reducing categorical confusions.
        * Processing is more efficient when you have a good generative model
        * Need to know something about distributions in order to correct for sensory uncertainty [@Feldman2009] and to make sense of deviations caused by coarticulation [@McMurray2011a; @Salverda2014].
    * There's a difference between the marginal distribution of tokens produced by a group and the distribution of generative models that talkers in that group have. 
        * Even if dialect isn't super helpful when you assume there's a single gaussian distribution that all tokens of a vowel produced by a group come from, knowing dialect might still be very informative when _adapting_ to a new talker.
    * Indexical features aren't just nuisance variables, they're things that listeners also want to find out about. So to the extent that groups produce systematically different cue distributions, listeners have a good reason to track group-specific distributions, even if ignoring/not tracking doesn't lead to lots of speech perception errors.
        * So even though _most_ of the variation is due to linguistic factors (e.g., which vowel is being produced), linguistic and indexical variation are mutually informative
* (not currently analyzed) talker vs. token as the unit of variation (indexical vs. linguistic).
* acoustic cues and phonetic categories can be/are differentially variable across talkers, and thus differentially suited for carrying socio-indexical information. Moreover, type and degree of _structure_ can differ, too.


* Overarching point: listeners can benefit from structure in the world, but we don't know (quantitatively) what that structure is. When there's structure to variability, that variability is (at least partially) predictable, which makes it easier to deal with than purely random variability. 
    * Reviewed evidence in [ideal adapter paper] that suggests people are sensitive to this strucutre. But we don't have quantitative measures of how much (and what kind) of structure there is in that variability across talkers, as it pertains to speech perception.
        * [@McMurray2011a] 
* The trick is that listeners need to infer what kind of structure there is, based on their experience. Beliefs should be __matched to the world__. The degree to which listeners should track talker- or group-level cue distribution depends, in the ideal adapter way of thinking, on the extent to which those grouping levels are informative about cue distributions (and speech recognition?).
* One way to think about the reason behind this prediction is the concept of __bias-variance tradeoff__ from machine learning [cf. @James2013, Section 2.2].
    * When you're learning a model based on data, there are two things that can hurt your accuracy:
        * _Bias_ occurs when your model makes predictions that are insufficiently sensitive to the training data, missing meaningful signals in the data.
        * _Variance_ occurs when your model is _overly_ sensitive to the data, picking up on meaningless noise as meaningful signal, which results in predictions that depend on the particular training sample (rather than the underlying strucutre of the data)
    * These two sources of errors trade off: as model complexity increases, bias (hopefully) goes down, while variance (inevitably) goes up. The sweet spot, or the optimal tradeoff between bias and variance, depends on the complexity of the data-generating process, and on the amount of data available.
* How does this apply to speech perception?
    * Listeners need to infer the proper underlying distributions for each phonetic category for the current situation. In each situation (encounter with a particular talker) the sample size is fixed. So the factor that dominates their accuracy in estimating these distributions and making accurate inferences[^dist-cat] is the complexity of the data generating process, across all talkers.
    * At the extreme of the simplest process, when there's no talker variability at all, listeners will do the best by learning a _marginal_ model, which groups tokens from all talkers together. The larger sample size from aggregating over talkers provides a more stable (lower-variance) estimate for the underlying distributions than the smaller sample from the current situation, and nothing is lost by using this simple model.
    * At the other extreme, where talkers vary randomly and arbitrarily, the marginal model that lumps together all tokens from all talkers will be _biased_ towards the central tendency of all talkers. This greater effect of bias justifies a more complex model that tracks individual talkers separately, even though this increases variance because of the smaller sample size available for each talker.
    * In the middle, where talkers don't vary arbitrarily but cluster into _groups_, this variance can be decreased by estimating distributions at the _group_ level. This introduces some additional bias (if there's within-group talker variability) but that bias is lower than the bias of the marginal model (to the extent that there are differences _between_ groups).
    * (( HOW DOES THIS RELATE TO INFERRING GENERATIVE MODEL? seems like a different perspective: one is about learning a more accurate model of the world, the other is about estimating models that are good for _doing_ something with. different objectives, in principle ))
* (( OKAY BUT WHAT ABOUT SOCIO-INDEXICAL VARIABLES ))
    * The question now is what _is_ the level of grouping across talkers? Does it vary across phonetic categories and cues?
    * A reasonable place to start is by looking at socio-indexical variables. Sociolinguistics has identified a number of these grouping variables that systematically affect phonetic cue distributions. Provides a good starting point for quantifying the how informative groups are for the purposes of adaptation and comprehension. This is not typically the focus of sociolinguistics, which instead focuses on identifying socially-conditioned variation (like how ongoing sound changes are socially stratified) and evaluating how well listeners pick up on socio-indexical variables like age, gender, sexual orientation, race, etc. from their lingustic consequences.
    * The approach we take here also addresses this latter point: the problem of inferring socio-indexical variables from a talker's speech is formally very similar to the proble of inferring phonetic categories from speech. 
    * And, in fact, the ability to infer these grouping variables is directly connected to the utility of tracking groups at all for speech perception. In some cases, listeners know, for instance, a talker's gender or age from extra-lingustic cues, but in others they must also _infer_ those variables at the same time as they infer phonetic categories. This leads us to ask how _jointly_ informative linguistic (phonetic) categories and socio-indexical grouping variables are.

[^dist-cat]: Something about how distributions and categorization aren't teh same thing...
[^hierarchical-model]: We've described these possible structure as lumping together _tokens_ from multiple talkers. However, the ideal adapter framework calls for a _hierarchical_ model, where _talkers_ are lumped together to estimate cross-talker variability that then serves as a prior distribution for future encounters with the same or different talkers. As discussed below, ignoring the hierarchical structure in this way is conceptually and technically simpler, and still provides a lower bound for classification accuracy. But it may _under-estimate_ the utility of grouping talkers for the purposes of adapting to a new talker. The logic of the bias-variance tradeoff still applies in a hierarchical framework.

* Ideal adapter; Generalization/adaptation depends on degree and type of talker variation
    * why? talker's own productions are most informative. but small sample size -> noise. so to the extent that 1. talkers vary and 2. some talkers are more similar than others, it behooves listeners to track group level distributions
    * overall _level_ of talker variation. (don't need to worry about adapting if there's no talker variation)
    * _structure_ of talker variation: when talker cluster into groups where within-group similarity is high and between-group similarity is low, can get a long way pooling experience with all talkers in the group.
* Ideal adapter: track group-level distributions to the extent that they're useful. 
    * at least two senses of "useful" are relevant here:
        * useful for inferring socio-indexical variables
        * for speech recognition


# Outline

## Introduction

* Ideal adapter predicts that listeners should track cue distributions at the level of _groups_ of talkers, but only to the extent that those groups are useful.
    * What is useful? Greater within-group than between-group similarity of talkers' cue distributions. Means that you lose less information (lower bias) by lumping together talkers within group.
    * Another way grouping can be useful is if the groups correspond to _socio-indexical_ variables that a listener is interested in making inferences about. Here, too, it only makes sense to track groups to the extent that the cue distributions are actually different for different groups. Analogously, listeners have no reason to track phonetic category distributions over cues that are totally uninformative about that category (e.g., VOT for vowel place).
* This paper
    * spell out this prediction in more detail.
    * test how informative some prominent socio-indexical variables are about two different kinds of contrasts: stop consonant voicing and vowel place.
        1. how much does knowing an unfamiliar talker's group improve comprehension (approximation of the utility of group-level priors on cue distributions)
        2. can you infer an unfamiliar talker's indexical group?

### When should listeners not adapt? Not generalize?

## Methods

* Datasets
    * Nationwide speech project (Vowel F1/F2)
        * 48 talkers: 4 each of male/female, from 6 dialect regions
        * F1 and F2 for 5 repetitions of isolated word vowels
        * For normalized formants, used Lobanov normalization (z-score F1 and F2 for each talker).
    * Buckeye corpus (word initial stop VOT)
        * 24 (out of 40) talkers, balanced male/female, young/old (40 y.o.)
        * VOT automatically extracted for word-initial voiced and voiceless stops in conversational speech
        * about 30 voiced, 50 voiceless per place per talker (range: 5-150).
* Model
    * Model each category as a Bi- or uni-variate normal distribution (for vowels and stops, respectively)
    * Use maximum likelihood estimate (sample mean and covariance) based on all tokens from category at the relevant grouping level.
    * Grouping levels:
        * Marginal (all tokens)
        * Sex (male/female)
        * Age (young/old, VOT only)
        * Dialect (North/New England/Mid-Atlantic/South/Midland/West, vowels only)
        * Diaelct+Sex (12 levels, vowels only)
        * Talker
* Comparing distributions directly
    * For each group, compute KL divergence from marginal model for each category, and average.
    * For each grouping _level_, use the average KL divergence of the individual groups from marginal as a measure of how much the marginal distributions fail to account for the group-specific distributions.
* Classifying groups from observations
    * Classify which group each _talker_ belongs to.
    * Compute posterior probability of group given talker's observations $p(g | x)$:[^notation]
        * Because the category $v_i$ of each observation $x_i$ is _unknown_, each observation $x_i$'s likelihood under group $g$ is the average of the likelihood under group $g$'s model for each category $v_i=j$:
        * $p(x_i | g) = p(x_i | g) = \sum_j p(x_i | v_i=j, g)p(v_i=j)$
        * These likelihoods combine in the usual way to give the posterior:
        * $p(g | x) \propto p(x | g)p(g) = \prod_i p(x_i | g) p(g)$
* Speech recognition
    * For talker $t=i$, classify each observation's $x_i$ phonetic category $v_i$.
    * If we assume that talker $t$'s group is _known_, this is straightforward: $p(v_i | x_i, g) \propto p(x_i | v_i, g) p(v_i)$
    * If the group must also be inferred, there are two steps:
        1. Get the posterior probability of each group based on _all_ observations from the talker $p(g | x)$, as above.
        2. Get marginal probability of category $v_i$ by taking average of each group-specific probability, weighted by posterior of group, $p(v_i | x_i) = \sum_j p(v_i | x_i, g=j) p(g=j | x)$.
* Controls
    * For classification, if test data is included in the training set, this artificially inflates accuracy at test.  Cross-validation controls for this by splitting data into training and test sets.  For group-level models (sex, age, dialect, and dialect+sex), we use leave-one-talker-out cross-validation: train each group's models with test talker's observations held out. For the talker-specific models, we use 6-fold cross-validation (or leave-one-out when there were fewer than 6 tokens in a category for a talker), where each phonetic category is split into 6 approximately equal subsets. Then, one subset of each category is selected for test, the models are trained on the remaining five, and the test data is classified as above.
    * For the vowel data, the different levels of grouping have very different group sizes. The broadest (sex) has 24 talkers per group (23 after holdout), while the most specific (dialect+sex) has only 4 (3 after holdout).  This introduces a systematic bias in favor of broader groupings, because small sample sizes lead to noisier estimates of the underlying model, and hence lower accuracy (on average) at test. To correct for this, in addition to leave-one-out validation, we randomly selecting subsampled each group to be the same size when training models. We use a different random subsample for each talker's training set, with two group sizes: 3 talkers per group (corresponding to the Dialect+Sex grouping) and 7 talkers per group (corresponding to Dialect). These provide a useful lower bound on the true group-level accuracy, and allows accuracy to be compared across grouping levels.

[^notation]: $x_i$ refers to a single observed cue value (possibly multidimensional, in the case of vowel formants), and $x$ (without subscript) refers to a _vector_ of multiple observations (from a single talker, unless otherwise specified). $v_i$ refers to observation $i$'s category, and $g$ to a talker's group. $\sum_j$ refer to a sum over all possible values of $j$.

## Results

### How _informative_ are socio-indexical variables?

* KL divergence between marginal and other levels for vowels and stops
    * Vowels:
        * Talker is by far the most informative
        * Sex is informative for un-normalized, not so much for normalized
        * On the whole, Dialect is the least informative grouping factor (except on normalized input, where sex is essentially uninformative). But for some vowels, it _is_ informative, especially `ae` and `aa`, both of which are known to vary across dialects [both participate in the northern cities shift, and `aa` is undergoing a merger with `ao`, cf. @Clopper2005].
    * Stop voicing
        * Again, talker is the most informative of the grouping factors examined.
        * But compared to vowels, it is far less informative. Comparable to the _least_ informative of all grouping variables (sex, for normalized input).

### How _useful_ are socio-indexical variables for speech comprehension

* Probability of correct recognition
* Vowels
    * Overall, with normalized input, accuracy is fairly good, even using marginal distributions (around 75%).
    * Grouping provides little advantage over marginal, especially for normalized input. Knowing dialect increases accuracy a few percentage points, but it's not clear whether this is reliable. Sex provides a 15-20% boost in accuracy for un-normalized input.
    * When the group must be _inferred_, accuracy actually _increases_ in many cases. This suggests that either some talkers are mis-classified (or the classification scheme itself isn't capturing the true cluster structure) or that there are residual effects of individual differences in talkers' overall F1/F2 (with some groups randomly being a better match in terms of average F1/F2).
    * The pattern varies across vowels, though. For some vowels, knowing dialect provides a substantial increase in accuracy. These include vowels that are known to vary with dialect: e.g., `ae` and `eh` participate in the northern cities shift. <!-- IS THIS REAL? seems to depend on subsample size/particular random draw... RUN MULTIPLE REPLICATES AND AVERAGE -->
* VOT
    * Accuracy is extremely high: 90-95%, even for marginal.
    * Doesn't depend on grouping. There's a numerical advantage for talker-specific models in some phonemes, but it's not significant (or even close). This might be a ceiling effect though, because many talkers are at 100% accuracy.
    * This suggests that there's _very little utility_ for tracking group-specific VOT distributions for age and sex (although that doesn't rule out the possibility that other groupings could be useful, like native language background).

### How useful are cue distributions for socio-indexical inference?

* Classifying the group of a talker, without knowing phonetic categories
* Vowel formants:
    * Easy to infer sex (even with normalization)
    * Harder to infer dialect. Performance is at chance with un-normalized input, but well above chance with normalized input.
    * Dialect+sex is the same as dialect alone. Only change is that chance level is lower, which puts un-normalized performance above chance (but still at chance for dialect alone, after marginalizing out sex).
* VOT: 
    * Not possible to infer group at all.

# Discussion

* We've looked at how much socio-indexical variables (groups) tell you about linguistic variables, and vice versa.
    * Varies by category, group.
    * Sex is highly informative about vowels across the board, and vice-versa.
    * Dialect is only weakly informative, and then only for certain dialect group/phonetic category combinations.
    * Talker identity is the most informative. <!-- TODO can we decode talker from vowels? -->
    * But for stop consonant voicing, there's little talker variability and hence little room for socio-indexical variables (which operate largely at the talker level) to tell you anything. And likewise, there's little room for VOT to be informative about socio-indexical variables.
* <!-- Why does this matter? --> 
    * Adaptation/recalibration varies substantially across contrasts and cues, especially when it comes to generalization across talkers. The ideal adapter provides, in principle, and explanation for these differences: <explain>
    * (( OR: ...provides a quantitative framework for explaining? for addressing these differences? ))
    * The analysis here provides some evidence that this explanation is correct. When there's no differences across talkers, listeners benefit from assuming that talkers' distributions are the same, until they get evidence to the contrary.
* <!-- How is this any different from what we already know? --> Demonstrates that ideal observer models (like the ideal adapter) provide a useful computational toolbox for investigating questions that are of interest to both psycholinguists (how do listeners deal with talker variability?) and sociolinguists (how do talkers vary in the realization of linguistic variables based on socio-indexical features?). To contast with previous analysis of this data: need a whole bunch of ANOVAs/t-tests to test whether realization of each category differs. This has a number of disadvantages that the current method addresses: it's hard to interpret, it doesn't directly quantify _how_ different dialect groups' realizations of each category, and it doesn't address the extent to which the linguistic variable (vowel formants) actually provides any information about the socio-indexical variable.

## Caveat about group/token level prior

* Model each category as a single gaussian distribution.
* Really, each category is a _mixture_ of talker-specific distributions.
* For the purposes of _adaptation_, need to explicitly model this. But it's harder.
* And really what we're trying to get at here is how far the group-level prior _alone_ gets you. This is a __lower bound__ on the utility of group-level knowledge.
* Modeling each category as a single distribution of tokens provides an approximation of the predictive distribution you'd get for an _unfamiliar_ talker, where you marginalize out the talker-level models 

## Overall formant differences

<!-- MAYBE?? -->

* There's substantial variabilty in talkers' overall F1/F2s that is _not_ captured by gender. There's more of a continuum than two distinct clusters.
* Vowel extrinsic normalization: might do better with an intrinsic vowel normalization scheme.
