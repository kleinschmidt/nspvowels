# Conceptual points that we might make

* Different levels of indexical grouping are differently informative about cue distributions
    * Dialect and gender are both intermediate levels of grouping between full talker-specificity and language-level marginal ditsributions. 
    * But gender captures more coarse acoustic variation across talkers, while dialect is more specific.
    * Dialect isn't, on the whole, super informative about how to classify vowels, but gender is. There's a lot of consistency across dialects, and much of the inter-talker variation is due to individual frequency differences that cause global vowel space shifts. These differences are largely (but not entirely) accounted for by gender differences.
* ...but dialect can still be _somewhat_ reliably decoded from vowels
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
