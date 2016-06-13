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

* Ideal adapter predicts that listeners should track _group-level_ cue distributions, conditioned on socio-indexical variables, for two reasons:
    1. Helps with adapting to an unfamiliar talker.
    2. Allows you to _infer_ socio-indexical variables
* This prediction applies to the extent that socio-indexical variables are _informative_ about phonetic cue distributions. That is, to the extent that cue distributions differ reliably for different values of a socio-indexical variable, like age, sex, or dialect region.
* This paper
    * spell out this prediction in more detail.
    * test how informative some prominent socio-indexical variables are about two different kinds of contrasts: stop consonant voicing and vowel place.
        1. how much does knowing an unfamiliar talker's group improve comprehension (approximation of the utility of group-level priors on cue distributions)
        2. can you infer an unfamiliar talker's indexical group?

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
    * Overall, with normalized input accuracy is fairly good, even using marginal distributions (around 75%).
    * Grouping provides little advantage over marginal, especially for normalized input. Knowing dialect provides a slight boost, but it's not reliable. Sex provides a 15-20% boost in accuracy for un-normalized input.
    * When the group must be _inferred_, accuracy actually _increases_ in many cases. This suggests that either some talkers are mis-classified (or the classification scheme itself isn't capturing the true cluster structure) or that there are residual effects of individual differences in talkers' overall F1/F2.
    * The pattern varies across vowels, though. Most vowels reflect the overall pattern, with little 

### How useful are cue distributions for socio-indexical inference?

* Classifying the group of a talker
* Vowel formants:
    * Easy to infer sex (even with normalization)
    * Harder to infer dialect. Performance is at chance with un-normalized input, but well above chance with normalized input.
    * Dialect+sex is the same as dialect alone. Only change is that chance level is lower, which puts un-normalized performance above chance (but still at chance for dialect alone, after marginalizing out sex).
* VOT: 
    * Not possible to infer group at all.

# Discussion

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
