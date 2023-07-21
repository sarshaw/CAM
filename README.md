**Project Overview: Twitter Conversations on Complementary and Alternative Medicines**

***Work in Progress***

Complementary and Alternative Medicine (CAM) serves as an encompassing concept for a diverse array of medical approaches that fall outside the realm of conventional medical care and treatments. As stated by the National Center for Complementary and Integrative Health (NCCIH), when a non-mainstream practice is used alongside conventional medicine prescribed by healthcare professionals, it is classified as "complementary." Conversely, if a non-mainstream practice is used in lieu of conventional medicine, it is categorized as "alternative. There are ten most commonly used CAM in the USA identified by NCCIH (Clarke, Black, Stussman, Barnes, & Nahin, 2015):

- Natural products (such as herbs, botanicals, vitamins and minerals, probiotics)
- Deep breathing
- Yoga, tai chi, or qi gong (additionally, hypnotherapy, Feldenkrais method, Alexander technique, Pilates, Rolfing Structural Integration, and Trager psychophysical integration)
- Chiropractic or osteopathic manipulation
- Meditation
- Massage
- Special Diets
- Homeopathy
- Progressive relaxation
- Guided imagery

Additionally, in the realm of Complementary and Alternative Medicine (CAM) practices, various traditional healing methods, such as acupuncture, Ayurvedic medicine, traditional Chinese medicine, naturopathy, and functional medicine, are considered significant (NCCIH, 2019). This project aimed to explore the discussions surrounding all these CAM practices on Twitter.

The prevalence of CAM usage is widespread among individuals dealing with different illnesses, including diabetes, chronic pain, and even cancer, and is primarily self-administered. Moreover, individuals without any health issues also turn to CAM for various reasons, mainly to maintain a healthy lifestyle. A comprehensive survey by the National Institutes of Health (NIH) revealed an upward trend in CAM usage among Americans from 1999 to 2012 (Black, Clarke, Barnes, Stussman, & Nahin, 2015). However, despite its popularity, evidence-based scientific research often demonstrates that CAM practices and products do not consistently produce desired outcomes for the conditions studied. While some CAM approaches may show promise, there remains a need to better understand their effects on human health, safety, and potential for improving healthcare (NCCIH, 2019).

Interestingly, existing research indicates that social media platforms, particularly Twitter, serve as avenues for people to discuss the effects, benefits, side-effects, and share their general opinions and experiences of CAM (e.g., Mazzocut, Truccolo, Antonini, Rinaldi, Omero, Ferrarin, De Paoli & Tasso, 2016). Such easy accessibility to information may influence readers' decisions about using CAM without critically evaluating the accuracy of the information. This leads to the dissemination of opinions unsupported by evidence-based scientific reasoning or proof, creating an unreliable information channel (Mazzocut et al., 2016). Consequently, individuals may try CAM practices that have no tangible health benefits or could even pose risks to their well-being. This raises concerns about people potentially relying more on such information sources than seeking guidance from healthcare professionals capable of providing appropriate treatments. Therefore, it becomes crucial to explore the discussions around CAM on Twitter so that healthcare professionals and policymakers can assist individuals in making informed decisions regarding the integration of complementary and alternative health approaches based on scientific evidence.

Motivated by this pressing healthcare issue, our objective was to mine and analyze the unstructured information available about CAM on Twitter. We aimed to gain insights into the opinions, beliefs, and rumors of Twitter users concerning CAM approaches. Accordingly, we formulated two research questions to accomplish the project's research goal:

**RQ1:** What are the prevailing topics of discussion related to Complementary and Alternative Medicines and Treatments on Twitter? In simpler terms, which CAM subjects are most frequently talked about on the platform?

**RQ2:** To what extent can we accurately classify or identify skeptical tweets regarding Complementary and Alternative Medicine (CAM) approaches on Twitter?

This topic of research in the field of data analytics remains relatively unexplored. Our primary objective was to determine which fields of Complementary and Alternative Medicine (CAM) attract the most attention from the public. Understanding this aspect could shed light on the CAM methods that people find most intriguing. Additionally, we aimed to gauge public sentiment towards these approaches, discerning whether opinions are predominantly positive, negative, or neutral.

Our secondary goal involved categorizing tweets into three groups: those from believers in CAM practices, skeptics of CAM information, and individuals expressing a neutral stance. This analysis aimed to provide insights into the overall perception of CAM and how online information about it is perceived. The results would be valuable for further research on popular CAM fields, while also helping to debunk false information and dispel rumors that could jeopardize someone's health.

***Data***

We solely relied on Twitter as our main data source, utilizing a Python script to gather publicly available tweets accessible through Twitter's Application Programming Interface (API). Our objective was to encompass discussions about various complementary and alternative medicines (CAM). To achieve this, we employed multiple hashtags and keywords associated with each CAM approach. These hashtags and keywords were determined based on insights from the National Center for Complementary and Integrated Health, trending CAM topics on Twitter, and relevant literature, including the work of Marcon, Klostermann, & Caulfield (2016). These resources guided us in formulating query terms to effectively search and extract CAM-related tweets. Among the hashtags we employed were the following popular and commonly used CAM-related ones:

|
- AlternativeMedicine
- HolisticMedicine
- MedicinalPlants
- homeopathy
- alternativemedicine
- acupuncture
- naturalhealing
 |
- naruralremedies
- medicalcannabis
- plantmedicine
- fakemedicine
- nonpharmacologicalinterventions
- osteopathy
- taichi
- natural+cure
 |
- CBDOils
- Ayurveda
- holistichealing
- chiropractic
- cannabiscure
- traditionalmedicine
- remedies
- holistic+cure
 |
- complementary+medicine
- alternative+medicine
- naturopathy
- oil+benefits
- natural+treatments
- traditional+chinese+medicine
- herbal+medicines
 |
| --- | --- | --- | --- |

We conducted multiple searches and collected tweets using various hashtags, which were later consolidated into a comprehensive CSV file. Initially, a total of 110,860 tweets were gathered. The dataset comprised several tweet attributes: _created_ (time of the posting), _tweet\_id_ (unique identifier for each tweet), _text_ (tweet content), _retwc_ (number of retweet), _hashtag_ (hashtags contained by tweet), _source_ (source device), _username_ (who posted the tweet), _usersince_ (long the users are using Twitter), _authorid_ (unique id for each user), _followers_ (number of followers), _friends_ (friends of users), _authorloc_ (location of the tweet author), and _geoenable_ (whether the tweet was geo enabled or not).

**Repository Structure**

***R***

Multiple R notebooks for initial data cleaning and pre-processing.

To start, we applied several filters to remove unwanted content from the dataset. Specifically, we excluded promotional and advertisement tweets, duplicates, retweets, non-English tweets, and tweets unrelated to the topic of CAM. Additionally, we eliminated tweets originating from locations outside of the US and Canada. Further privacy measures were taken by anonymizing the tweets to remove any personally identifiable information, such as usernames, author IDs, and specific geolocation tags.

Subsequently, in the next step (more pre-processing codes can be found in individual Python notebooks), we proceeded with additional cleaning steps. These steps involved removing extra spaces and lines from the tweets, as well as eliminating special characters, punctuations, non-ASCII characters, emojis, non-English words, retweet handles, user names, and URLs. We filtered out these elements based on their ASCII values, including the special characters. Additionally, we excluded tweets with less than five words, as they did not provide sufficient information. Unnecessary attributes, namely source, authorid, and geoenable, were also removed as they were not used in the analyses.

After undergoing these significant cleaning steps, the final dataset comprised 69,500 unique English tweets posted by users from the US and Canada. This clean dataset was then saved into a CSV file named "clean_unique_tweet.csv."

***input_data***

The full datasets were not shared due to ethical and IRB considerations.

clean_unique_tweet.csv: provides a small sample dataset after the raw Twitter data has been cleaned and processed. 

annotated.csv: includes a small selection of tweets that have been labeled by two human annotators in relation to people's sentiments on complementary and alternative medicines (CAM). The tweets were manually categorized into three groups:

believer - indicating those who appear to agree or have faith in CAM approaches.

skeptic - representing those who seem doubtful or skeptical about the medicinal effectiveness of CAM approaches.

unknown - for tweets that were challenging to categorize based on their content.

Initially, the annotators individually labeled 10% of the entire dataset, assigning each tweet to one of the three categories based on the expressed opinions and emotions. The Inter-Annotator Agreement, measured using Cohen's kappa, was found to be 67%, indicating moderate agreement. Due to the relatively low agreement, a second stage of annotation was conducted. During this stage, the two annotators resolved their discrepancies and independently annotated the rest of the dataset, achieving a Cohen's kappa agreement greater than 75%. The resulting annotated dataset contains two attributes for each tweet - the tweet text itself and its assigned sentiment label.

**Jupyter_Notebooks**

Contains further feature extraction, exploratory and modeling codes.

***Text_Classification.ipynb***

We used different methods to extract features from clean texts, starting with basic techniques and gradually including advanced Natural Language Processing methods. These features were then used as inputs for the models. The following new features were extracted:

- Number of words in each tweet
- Number of characters in each tweet
- The average word length of each tweet
- Number of nouns
- Number of verbs
- Number of adjectives
- Number of adverbs
- Number of pronouns

To enhance data quality, we removed common words, such as articles and verbs, and converted all words to lowercase. This process ensures that we avoid duplicates of the same words in the dataset.

Next, we utilized Python's textblob library to convert the tweets into a text blob and then split them into sequences of words or tokens. We employed four different types of feature extraction techniques, including N-gram representations, count vectors, character-level vectors, and word-level TF-IDF vectors.

For N-grams, we extracted bigrams (N=2) using the ngrams function from the textblob Python library. These N-grams represent combinations of words frequently used together in tweets, capturing the language structure of tweet texts and assisting predictive models.

To calculate the term frequency (TF) and inverse document frequency (IDF) of the tweets, we utilized Python's sklearn library. TF represents the ratio of a word's count in a sentence to the sentence's length, while IDF is the logarithm of the ratio of the total number of tweets to the number of tweets containing the word. We then calculated the TF-IDF scores for each word in the tweets (Jain, 2018). Additionally, we created a count vector or bag of words representation of tweets using sklearn.

To gain insights into the most common discussion topics related to CAM, we generated word cloud representations of the clean tweets. The word clouds highlighted frequent words such as "homeopathy," "natural," "acupuncture," "oil," and others that were commonly mentioned in the tweets.

For our classification task, we worked with labeled data, splitting it into a 70% training set and a 30% testing set. We employed four common classifiers used in text analysis: Naïve Bayes, Logistic Regression, SVM, and Random Forest. After training the models using the training data, we evaluated their performance on the test data. We used the count vector, word-level TF-IDF scores, character-level TF-IDF scores, and N-Gram representations of tweets as inputs, and the tweet labels as the predictive variable. Consequently, we built a total of 16 classification models.

**LDA_visualization.ipynb**

We utilized gensim, spacy, nltk, keras, and matplotlib to construct a topic model for the dataset using the Latent Dirichlet Allocation (LDA) algorithm. The objective was to identify commonly discussed CAM topics on Twitter. Initially, we lemmatized each word, reducing it to its root form, while retaining only nouns, adjectives, verbs, and adverbs. Subsequently, we built the LDA model.

To create the LDA topic model, we established both the text corpus and the dictionary. In the context of LDA, each document is composed of multiple subtopics or words, but generally, one topic holds dominance. Our focus was on identifying ten dominant topics in alignment with the National Center for Complementary and Integrative Health (NCCIH)'s ten common categories of CAM.

The application of LDA allowed us to compile a list of the ten most dominant topics along with their corresponding keywords and weights for each tweet. Examining the topic keywords, we observed a clear thematic separation and collective representation of CAM topics defined by the NCCIH, including yoga, ayurveda, and natural herbs.

**Sentiment_nalysis.pynb**

We employed Python's _NLTK_ library to perform sentiment analysis on tweets using the _VADER lexicon_. The aim was to analyze the sentiments of these tweets, which were part of an unlabeled dataset. Leveraging NLTK's Sentiment Intensity Analyzer algorithm, we automatically categorized each tweet as either positive (\>0), negative (\<0), or unknown (0).

To compare and validate our results, we used a pre-trained dataset called wiki-news-300d-1M.vec. This dataset is widely used and contains a 1 million-word vector trained on Wikipedia 2017, UMBC web base corpus, and statmt.org news dataset. By applying this function to the tweet texts, we attempted to identify terms associated with positive, negative, and neutral sentiments in the tweets. This analysis was instrumental in answering our second research question about public sentiments regarding CAM topics.

The sentiment analysis provided valuable insights into people's opinions on CAM practices. The results revealed that slightly over half (50%) of the users or tweets expressed positive sentiments towards CAM approaches, while around 30% of the tweets did not exhibit any clear positive or negative polarity. Notably, approximately 20% of people showed negative sentiments towards CAM approaches, which was particularly intriguing.

**output_data**

***Text_Classification.html***
**LDA_visualization.html**
**Sentiment_nalysis.html**

Contains the outputs of the data analysis. The data analysis outputs in notebooks sometimes fail to load interactive plots. Viewing the results by downloading and running the .html files would be easier.


**data**
Should contain the pre-trained word vector model used in sentiment analysis.

Download and unzip pre-trained word vectors --
wiki-news-300d-1M.vec.zip from https://fasttext.cc/docs/en/english-vectors.html

**References**

Asur, S., & Huberman, B. A. (2010, August). Predicting the future with social media. In _Proceedings of the 2010 IEEE/WIC/ACM International Conference on Web Intelligence and Intelligent Agent Technology-Volume 01_, pp. 492-499. IEEE Computer Society.

Black LI, Clarke TC, Barnes PM, Stussman BJ, Nahin RL. (2015). Use of complementary health approaches among children aged 4-17 years in the United States: National Health Interview Survey, 2007-2012. _National health statistics reports; no 78_. Hyattsville, MD: National Center for Health Statistics.

Clarke TC, Black LI, Stussman BJ, Barnes PM, Nahin RL. (2015). Trends in the use of complementary health approaches among adults: United States, 2002-2012. _National health statistics reports; no 79_. Hyattsville, MD: National Center for Health Statistics.

Jain, S. (2018, February). Ultimate guide to deal with Text Data (using Python) - for Data Scientists and Engineers. _Analytics Vidhya._ Retrieved from https://www.analyticsvidhya.com/blog/2018/02/the-different-methods-deal-text-data-predictive-python/

Prier, K. W., Smith, M. S., Giraud-Carrier, C., & Hanson, C. L. (2011, March). Identifying health-related topics on twitter. In _International conference on social computing, behavioral-cultural modeling, and prediction_, pp. 18-25. Springer, Berlin, Heidelberg.

Scanfeld, D., Scanfeld, V., & Larson, E. L. (2010). Dissemination of health information through social networks: Twitter and antibiotics. _American journal of infection control, 38(3),_ 182-188.

Gage-Bouchard, E. A., LaValley, S., Warunek, M., Beaupin, L. K., & Mollica, M. (2018). Is cancer information exchanged on social media scientifically accurate? _Journal of Cancer Education, 33(6)_, 1328-1332.

Marcon, A. R., Klostermann, P., & Caulfield, T. (2016). Chiropractic and spinal manipulation therapy on twitter: case study examining the presence of critiques and debates. _JMIR public health and surveillance, 2(2)._

Mazzocut, M., Truccolo, I., Antonini, M., Rinaldi, F., Omero, P., Ferrarin, E., & Tasso, C. (2016). Web conversations about complementary and alternative medicines and cancer: content and sentiment analysis. _Journal of medical Internet research, 18(6)_.

Oyeyemi, S. O., Gabarron, E., & Wynn, R. (2014). Ebola, Twitter, and misinformation: a dangerous combination? _Bmj, 349,_ g6178.

[1](#sdfootnote1anc)National Center for Complementary Integrative Health. [2019-05-02]. Complementary, Alternative, or Integrative Health: What's In a Name. Retrieved from https://nccih.nih.gov/health/integrative-health

[2](#sdfootnote2anc) https://nccih.nih.gov/about

[3](#sdfootnote3anc) https://developer.twitter.com/en.html

[4](#sdfootnote4anc)National Center for Complementary Integrative Health. [2019-05-02]. Complementary, Alternative, or Integrative Health: What's In a Name. Retrieved from https://nccih.nih.gov/health/integrative-health