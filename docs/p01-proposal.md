# Analyzing Online ADHD communities: Project Proposal

## Overview Table

|Element | Brief Description|
|---------------| --------------
|Code name | _mental_health_data_
|Project title| Analyzing Online ADHD communities |
|Authors | **Ramsha Sheikh** 206-550-7739 **Naomi Moss** 925-888-9565 **Sahil Bains** 253-391-7800 |
|Affiliation |  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington |
|Date | Winter 2022|
|Abstract | For example: **(1)** "Our main question is what the main concerns of the ADHD community is. **(2)** "We are concerned that people with ADHD may not accurately share their experiences with professionals out of fear of judgement, involuntary hospitalization, etc. **(3)** Consider that reddit is not the only source of information about experiences from people with ADHD. |
|Keywords | ADHD, Mental Health, Peer-to-peer Support, Symptoms|

## 1.0 Introduction
 This question is important because it's important to understand their need for medication, correct diagnoses. To address this concern, we plan to use a data set from Reddit, a site where we can reasonably expect people from this community to be open and honest because there are minimal consequences. Therefore, our analysis is not intended to be a monolith, it is simply to fill in "missing" data about that people may not share with professionals.

## 2.0 Design Situation
**Goal:** To use data from a community resource to better understand the needs of ADHD patients.

**Human values:** Compassionate care, holistic health(care), correct diagnoses, initiative to provide mental support, attentive listening to patients.

**Data Sources:** Kaggle.com, Reddit.com  

**Direct Stakeholders** Institutions such as doctor's offices, hospitals, psychiatric firms, pharmaceutical companies that are directly treating patients with ADHD, as well as educational institutions and workplaces that may be making accommodations for these individuals.

**Indirect Stakeholders** people with ADHD who need support, medication, mental health care, or any combination of the 3.

**Benefits and Harms** One harm could be that this data displays a mix of fact and opinion, and there is no judgement of honesty or bias. One major benefit would be that with the right coding, someone can use this data to categorize information to derive several useful concepts from the data. Examining the data in different ways like this could possibly lead to someone coming up with solutions for the problems experienced by the ADHD community. It provides representation, and can provide the direct stakeholders information about ADHD, with a reasonable expectation of user-to-stakeholder confidentiality.

## 3.0 Research questions

**(1)** Amongst posts that have the most comments, what are the most common words or phrases mentioned?

  This question is motivated by our interest in what topics are the most popular within the two Reddit threads. This is important because it???s likely that people with ADHD are most often frequenting and interacting with posts on the Reddit threads contained within our datasets. We believe that it is important to understand what topics are the most popular because that gives us insight into the most relatable and therefore widespread experiences amongst the ADHD community. We will address this question by sorting the data by most comments and highest score, and then detecting common words and strings that appear within the posts.

**(2)** How often are deeply personal topics mentioned?

This question is motivated by our interest in whether or not people affected by ADHD posting on public forums will be more candid and open than they may typically be with people in person. This is important because knowing that posts on Reddit may contain more truthful information about the personal experiences of those with ADHD can better inform both peers and medical professionals on how to support those with ADHD. We will address this question by detecting certain words and phrases relating to personal issues and counting how often they are mentioned.

**(3)** In what context do words referring to people with significant roles appear(ex. "doctor," "parents," "teachers,").

  This question is motivated by our interest in the relation between people with ADHD and those who may attempt to help them. This is important because understanding the concerns those with ADHD have about medical professionals and their relationships with their loved ones may help others better understand how to create an environment that makes people with ADHD safe and comfortable. We will address this question by detecting certain words and phrases relating to doctors, parents, and loved ones and counting how often they are mentioned in posts and comments.

**(4)** With what frequency is ADHD mentioned in relation to other mental illnesses?

This question is motivated by our interest in how interconnected ADHD is with other mental illnesses or mental health issues. This is important because understanding that correlation may allow people to better treat and diagnose ADHD in the future. We will address this question by detecting specific words and phrases relating to mental illnesses and mental wellbeing to see how often they are mentioned.

## 4.0 The Dataset

### Size and complexity

Our dataset consists of four data files. The first file contains all questions or prompts posted to the Reddit thread ???r/ADHD.??? This dataset has 8 columns and 336,191 rows. The columns list the title, main text, score, post ID, URL, number of comments, UTC of the post, and the original posting date and time of each post. The second file contains all the comments in the r/ADHD thread and has 5 columns and 1,048,576 rows. The five columns list the text body, comment ID, score, created UTC, and original date and time of posting. The third dataset contains every question or prompt posted to the Reddit thread ???r/adhdwomen,??? and has 44,385 rows, each with 8 columns: the title, body of text, score, post ID, URL, number of comments, created UTC, and original date and time of the post. Lastly, the fourth file contains all the comments on the posts in r/adhdwomen. This file has recorded 202,659 total comments and contains 5 columns, the body, ID, score, created UTC, and original date and time of the comment.

### Data provenance

Our dataset represents Reddit users (presumably above the age of 13(1)) who have posted or commented on posts within the r/ADHD and r/adhdwomen threads. Most of the posts and comments reflect the opinions and experiences of those who are posting or someone directly related to them, and so the posts offer a representation of the lives and minds of those who have contributed to these subreddit threads. These people are all at various stages of navigating their ADHD - including but not limited to professionally diagnosed, in the diagnosis process, experiencing symptoms but not seeking a diagnosis, self diagnosis, or supporting a loved one. Each observation in our dataset represents a single post to either the r/ADHD or r/adhdwomen Reddit threads.

The variables of each observation include the title and main body of the post, the number of comments, the post???s URL, and the date and time of posting. Some factors that are left out are the amount of upvotes and awards (digital medals and merits awarded to posts that other Reddit users appreciate) each post or comment has received, as well as other data about the account that made the post, such as how often they post and about what topics. These variables could be useful to gauge the personal and social implications of each post as well as the social effects it created.

Our data was collected by Kaggle user JerseyNeo around May, 2021 and contains Reddit posts up until February, 2021. One of JerseyNeo???s inspirations to compile these datasets was ???To help the ADHD community,???(2) so it is likely that their reasoning was that the examination or study of this data could in some way inform others and make positive social change. As far as we can tell, there was no funding involved in the collection of these datasets, and the only entity that would financially benefit from the use of the datasets is the website Kaggle itself, and possibly reddit if viewing of this dataset leads to increased website traffic.

The data appears to be held within the website Kaggle, which appears to be a trustworthy resource, as many users have posted and kept datasets within the website.

We obtained this data by searching for ADHD-related datasets via Google and exploring the options that were available. The datasets are posted publicly, so we were able to access them easily through the internet.

## 5.0 Expected Implications

Some expected implications for technologists, designers, and policymakers would be analyzing the data sets and assimilate groupings - this could open up the window of opportunity for technologists to create powerful data visualizations that can be interpreted by the majority population and could lead to many changes for the good in society. Taking a closer look at the datasets could also greatly influence policymakers in having a greater scope to the statistical realities when it comes to a certain subject, and then applying those decisions in direct reflection of those statistics. Some factors about how designers could be affected would be that could present the data in different visualizations that could go to exemplify the data that can be understand by more people.

## 6.0 Limitations

A certain limitation that would need to be discussed would be that we wouldn't be able to cover a great amount of detail in relation to how someone who might have been studying the psychology behind ADHD for a great period of time, which goes to portray a sort of one-sided perspective on our part. Another limitation that our project may carry is that a set of data or two may not carry accurate data, which could skew the precision of what our visualizations look like. Another significant limitation in our project could be that we miss providing the central solution to the problem that we're trying to solve, which could mean that while we bring up datasets that we believe present a problem in society, we don't necessarily give solutions through our visualizations."

##Acknowledgements
We want to thank Min Kim, our T.A for helping us get familiar with collaboratively using github.
We also want to thank Reddit founders for creating the platform, and Reddit users for being so active in the creation of the data.

## References

 **(1)** ???Reddit User Agreement.??? Reddit User Agreement, 2021, https://www.redditinc.com/policies/user-agreement-september-12-2021#:~:text=No%20one%20under%2013%20is,when%20you%20access%20the%20Services
 **(2)** "JerseyNeo". ???Reddit ADHD Dataset.??? Kaggle, 13 May 2021, https://www.kaggle.com/jerseyneo/reddit-adhd-dataset.

## Appendix A:

**Questions**
1. If we start to feel like we've taken on a bigger workload than we can handle (particularly with the research questions) are we allowed to drop or change some of the research questions? Or is this project proposal set in stone?
