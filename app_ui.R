# this will be our UI. 
# Ynow, the one that has the Fluidpage(), sidebarPanel(), etc stuff. 
library(dplyr)
library(shiny)
library(plotly)
library(stringr)
library(ggplot2)
source("app_server.R")

score_range <- range(adhd_data$score)

score_input <- sliderInput(
  inputId = "score",
  label = "Filter by Score:",
  score_range[1],
  score_range[2],
  value = score_range
)


intro_panel <- tabPanel(
  titlePanel("Introduction"),
  h1("Overview"),
  p("With recent talk about psychiatry and mental disorders in the media, which
  possibly misrepresents mental illness(1), we decided to do some research
  into Attention Deficit Hyperactivity
    disorder - also known as ADHD. With diagnosis rates on the rise, 
    We thought that what happens in the doctor's 
    office is not always representative of the community and individual's 
    entire experience, so we looked into data from a section of the social 
    networking site 'reddit', particularly a subreddit titled /adhd. The reason
    we chose this data is to get a wider scope of insights that may be missed
    when an individual with ADHD is discussing their illnesss and experience
    in a medical or professional context. Some of the ways we do this 
    is analyzing certain statistics such as 'scores' of posts, years that the
    community is active, the frequency of key words, and keywords mentioned 
    in conjunction."),
  img("", src = "https://i1.wp.com/www.additudemag.com/wp-content/uploads/2017/03/newsletter-illustration-making-decisions-can-be-difficult-ts-465347492.jpg?resize=1280%2C720px&ssl=1"),
  h2("Relevant Links"),
  p("1. https://health.usnews.com/health-news/health-wellness/articles/2015/04/16/how-mental-illness-is-misrepresented-in-the-media"),
  p("2. https://www.cdc.gov/ncbddd/adhd/data.html")
  
)
# note: i found a tutorial on how to hyperlink 
# https://stackoverflow.com/questions/42047422/create-url-hyperlink-in-r-shiny


visualization_1 <- tabPanel(
  titlePanel("Visualization 1"),
  score_input,
  plotlyOutput("table"),
  p("This table categorizes a sample of 10000 posts by 'score' and
  returns the most recent date that a post with that certain score was made.
  A 'score' is a measure of post popularity - a higher score means that more
  people like it/agree with it, and a lower score means that more people dislike
  it/disagree with it. By returning recent dates in a table like this, we can
  get some insight into trends in post popularity - a recent hated post was
  made in 2017, and the most neutral posts were made in early 2021, some 
  highly popular posts were made in 2017 and 2019, and the most popular post
  of this sample was made in early 2021. One can use the score filter to only
  look at specific scores and draw similar conclusions
  based on chosen scores and dates. Categorizing scores and years could 
  lead us to a few different insights - It could show the general attitudes of
  this online community throughout the years based on what posts they make and 
  how positively or negatively they rate others' posts. One could then use
  either the scores or the assessment of attitudes to compare before vs during
  the pandemic (or other major lifestyle-changing events). Or these trends 
  could also be lined up against certain topics or certain posts to judge 
  their popularity/importance in that way. A deeper dive into the body of
  the posts in this sample, as well as several different samples may be done 
  for more insight.")
)

term1 <- sidebarPanel(
  selectInput(
    "term1",
    label = "Pick the first term:",
    choices = term
  )
)
term2 <- sidebarPanel(
  selectInput(
    "term2",
    label = "Pick the second term:",
    choices = term
  )
)
term3 <- sidebarPanel(
  selectInput(
    "term3",
    label = "Pick the third term:",
    choices = term
  )
)
term4 <- sidebarPanel(
  selectInput(
    "term4",
    label = "Pick the fourth term:",
    choices = term
  )
)
term5 <- sidebarPanel(
  selectInput(
    "term5",
    label = "Pick the fifth term:",
    choices = term
  )
)
term6 <- sidebarPanel(
  selectInput(
    "term6",
    label = "Pick the sixth term:",
    choices = term
  )
)

chart1_panel <- tabPanel(
  titlePanel("Chart 1"),
  plotlyOutput("chart1"),
  term1,
  term2,
  term3,
  term4,
  term5,
  term6,
  p("This chart compares the frequencies of a variety of ADHD-related keywords.
    The main texts of the 101 posts with the most number of comments in the Reddit
    thread 'ADHD' have been sorted based on whether or not they contain a specific 
    ADHD-related word such as 'symptoms' or 'focus', and the number of posts 
    with that word have been tallied. Through this display of the data, we can see how popular certain keywords 
    are within the ADHD community. We can see that like 'help' and 'medication' 
    appeared the most with around twenty occurrences, whereas posts containing 
    words like 'plan' and 'doctor' are less popular, as only about 10 of the most
    popular posts contained those terms. This can tell us that posts where people
    talk about their struggles, perhaps with things such as medication or focusing,
    are popular among others on the ADHD Reddit thread and garner many comments.")
)

report_page <- tabPanel(
  titlePanel("Project Report"),
  h3("Title:"),
  p("ADHD Analyzing Online ADHD communities"),
  h3("Authors:"),
  p("Ramsha Sheikh, Sahil Bains, Naomi Moss"),
  h3("Affiliation:"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h3("Date:"),
  p("Winter 2022"),
  h3("Keywords:"),
  p("ADHD, Mental Health, Peer-to-peer Support, Symptoms"),
  h3("Introduction:"),
  p("We feel that understanding people with ADHD better is important because it's important to understand their need for medication, correct diagnoses. To address this concern, we plan to use a data set from Reddit, a site where we can reasonably expect people from this community to be open and honest because there are minimal consequences. Therefore, our analysis is not intended to be a monolith, it is simply to fill in 'missing' data about that people may not share with professionals."),
  h3("Design Situation:"),
  h4("Goal:"),
  p("To use data from a community resource to better understand the needs of ADHD patients."),
  h4("Human values:"),
  p("Compassionate care, holistic health(care), correct diagnoses, initiative to provide mental support, attentive listening to patients."),
  h4("Data Sources:"),
  p("Kaggle.com, Reddit.com"),
  h4("Direct Stakeholders:"),
  p("Institutions such as doctor's offices, hospitals, psychiatric firms, pharmaceutical companies that are directly treating patients with ADHD, as well as educational institutions and workplaces that may be making accommodations for these individuals."),
  h4("Indirect Stakeholders:"),
  p("people with ADHD who need support, medication, mental health care, or any combination of the 3."),
  h4("Benefits and Harms:"),
  p("One harm could be that this data displays a mix of fact and opinion, and there is no judgement of honesty or bias. One major benefit would be that with the right coding, someone can use this data to categorize information to derive several useful concepts from the data. Examining the data in different ways like this could possibly lead to someone coming up with solutions for the problems experienced by the ADHD community. It provides representation, and can provide the direct stakeholders information about ADHD, with a reasonable expectation of user-to-stakeholder confidentiality."),
  h3("Research questions:"),
  h4("(1) Amongst posts that have the most comments, what are the most common words or phrases mentioned?"),
  p("This question is motivated by our interest in what topics are the most popular within the two Reddit threads. This is important because it's likely that people with ADHD are most often frequenting and interacting with posts on the Reddit threads contained within our datasets. We believe that it is important to understand what topics are the most popular because that gives us insight into the most relatable and therefore widespread experiences amongst the ADHD community. We will address this question by sorting the data by most comments and highest score, and then detecting common words and strings that appear within the posts."),
  h4("(2) How often are posts related to getting social or medical help made in the ADHD Reddit thread?"),
  p("This question is motivated by our interest in whether or not people affected by ADHD posting on public forums will be open about personal topics. This is important because knowing that posts on Reddit may contain inquiries that Reddit users are uncomfortable or unwilling to ask of people they know in person may give us a more in-depth idea of what those users truly want or need. We will address this question by detecting certain words and phrases relating to personal and medical issues, counting how often they are mentioned, and comparing the two numbers."),
  h4("(3) In what context do words referring to people with significant roles appear(ex. 'doctor,' 'parents,' 'teachers,')."),
  p("This question is motivated by our interest in the relation between people with ADHD and those who may attempt to help them. This is important because understanding the concerns those with ADHD have about medical professionals and their relationships with their loved ones may help others better understand how to create an environment that makes people with ADHD safe and comfortable. We will address this question by detecting certain words and phrases relating to doctors, parents, and loved ones and counting how often they are mentioned in posts and comments."),
  h4("(4) With what frequency is ADHD mentioned in relation to other mental illnesses?"),
  p("This question is motivated by our interest in how interconnected ADHD is with other mental illnesses or mental health issues. This is important because understanding that correlation may allow people to better treat and diagnose ADHD in the future. We will address this question by detecting specific words and phrases relating to mental illnesses and mental wellbeing to see how often they are mentioned."),
  h3("The Dataset:"),
  h4("Size and complexity:"),
  p("Our dataset consists of four data files. The first file contains all questions or prompts posted to the Reddit thread 'r/ADHD.' This dataset has 8 columns and 336,191 rows. The columns list the title, main text, score, post ID, URL, number of comments, UTC of the post, and the original posting date and time of each post. The second file contains all the comments in the r/ADHD thread and has 5 columns and 1,048,576 rows. The five columns list the text body, comment ID, score, created UTC, and original date and time of posting. The third dataset contains every question or prompt posted to the Reddit thread 'r/adhdwomen,' and has 44,385 rows, each with 8 columns: the title, body of text, score, post ID, URL, number of comments, created UTC, and original date and time of the post. Lastly, the fourth file contains all the comments on the posts in r/adhdwomen. This file has recorded 202,659 total comments and contains 5 columns, the body, ID, score, created UTC, and original date and time of the comment."),
  h4("Data provenance:"),
  p("Our dataset represents Reddit users (presumably above the age of 13(1)) who have posted or commented on posts within the r/ADHD and r/adhdwomen threads. Most of the posts and comments reflect the opinions and experiences of those who are posting or someone directly related to them, and so the posts offer a representation of the lives and minds of those who have contributed to these subreddit threads. These people are all at various stages of navigating their ADHD - including but not limited to professionally diagnosed, in the diagnosis process, experiencing symptoms but not seeking a diagnosis, self diagnosis, or supporting a loved one. Each observation in our dataset represents a single post to either the r/ADHD or r/adhdwomen Reddit threads."),
  p("The variables of each observation include the title and main body of the post, the number of comments, the post's URL, and the date and time of posting. Some factors that are left out are the amount of upvotes and awards (digital medals and merits awarded to posts that other Reddit users appreciate) each post or comment has received, as well as other data about the account that made the post, such as how often they post and about what topics. These variables could be useful to gauge the personal and social implications of each post as well as the social effects it created."),
  p("Our data was collected by Kaggle user JerseyNeo around May, 2021 and contains Reddit posts up until February, 2021. One of JerseyNeo's inspirations to compile these datasets was 'To help the ADHD community,'(2) so it is likely that their reasoning was that the examination or study of this data could in some way inform others and make positive social change. As far as we can tell, there was no funding involved in the collection of these datasets, and the only entity that would financially benefit from the use of the datasets is the website Kaggle itself, and possibly reddit if viewing of this dataset leads to increased website traffic."),
  p("The data appears to be held within the website Kaggle, which appears to be a trustworthy resource, as many users have posted and kept datasets within the website."),
  p("We obtained this data by searching for ADHD-related datasets via Google and exploring the options that were available. The datasets are posted publicly, so we were able to access them easily through the internet."),
  h3("Findings:"),
  p("Our first research question was: Amongst posts that have the most comments, what are the most common words or phrases mentioned? To answer this, we sorted the posts in the ADHD Reddit thread by the number of comments on each post, and selected the 101 posts with the most comments to examine. We then sorted said posts on whether or not they contained keywords of our own choosing. We found that the most commonly mentioned word, included in 20 different posts (??? of the dataset we were working with), was the word 'help.' Amongst the other words we searched for, we found that the words 'medication' and 'focus' are tied for second with 16 posts each."),
  p("Our second research question was: At what frequency does this community mention ADHD in conjunction with other mental illnesses such as 'depression' and 'OCD?' To find the answer to this question, we sorted the data based on whether or not the word 'depression' appears in the main text of the post. We counted up the number of posts for which this was true and then did the same for OCD. We found that the term 'depression' appeared throughout the dataset 79,340 times while the word 'OCD' appears only 11,832 times."),
  p("Our third research question was: How often are words related to medical professionals or other people with an influence on someone's personal life mentioned within the titles of the first 10,000 posts in the ADHD Reddit thread? First, we sorted the dataset to find the first 10,000 posts and then sorted that new dataset to find the number of times various keywords such as 'help,' 'doctor,' 'parent,' 'teacher,' and 'desperate' appeared within the dataset. We discovered that the word 'help' appears most frequently, occurring in 440 posts. The next most common word is 'doctor,' with 143 posts, and the least commonly used word of the group is 'desperate,' with only 9 instances."),
  p("Our fourth research question was: How often are posts related to getting social or medical help made in the ADHD Reddit thread? To answer this question, we sorted the dataset to find posts with titles containing the words 'medication' or 'guidance.' We found that while the word 'medication' appears in the title of 430 posts, the word 'guidance' only appears in the title of 3 posts."),
  h3("Discussion:"),
  p("First, we found that amongst the most popular posts, the most common word used was 'help.' This is important because it shows that others with ADHD are likely well-equipped to give advice and support to others who feel similarly to them, and that conferring with peers is a preferred method of getting help for many people with ADHD. This is supported by the next most common words: medication and focus. These keywords suggest that while people do get help from medical professionals, they still want to get more personal advice on day-to-day issues."),
  p("Next, we found that 'depression' and 'OCD' appear in 79,431 and 11,832 posts respectively. This information shows us clearly that depression is a much more frequently discussed topic than OCD. This may be because of a correlation between ADHD and depression as ADHD can cause someone difficulty and may increase someone's likelihood of becoming depressed. However, this could also just be a result of depression being a more common topic of discussion. Due to social awareness, people may be more likely to be diagnosed with depression and therefore more willing to talk about it than OCD."),
  p("Next, we discovered that within the first 10,000 posts the two most common words related to getting help from people of personal influence are 'help' and 'doctor.' The common use of the word doctor shows that many people with ADHD see medical professionals. 'Doctor' appears 143 times while words like 'parent' and 'teacher' only appear 109 and 13 times respectively, which shows that people with ADHD are likely more willing to seek out help from a professional who knows about physical and mental health than an individual within their personal lives."),
  p("Lastly, we learned that there are 430 posts whose titles contain the keyword 'medication' and only 3 posts whose titles contain the word 'guidance.' This clearly shows that medication is a much more common topic in the ADHD Reddit thread than getting guidance. This could be because people are less likely to ask for advice on personal topics compared to more surface-level things such as medications. These statistics are all important to know because they show us how often people use various resources like other people online, doctors, or mentor figures, and help us understand the general wants and needs of people with ADHD."),
  h3("Conclusion:"),
  p("In summary, even if they are receiving help from medical professionals, many people with ADHD will use resources such as the ADHD Reddit thread in order to receive support and advice from peers. Additionally, ADHD can happen in conjunction with other mental illnesses such as OCD or depression, and as such it is very important that people with ADHD have online spaces to talk with others in order to support themselves as they need.")
)

match_input <- sliderInput("slider1", label = h3("Slider"), min = 0, 
                           max = 100, value = 50)

search1 <- textInput(
  inputId = "search1", 
  label = "term1",
  value = "",
  width = NULL,
  placeholder = NULL)

search2 <- textInput(
  inputId = "search2", 
  label = "term2",
  value = "",
  width = NULL,
  placeholder = NULL)

search3 <- textInput(
  inputId = "search3", 
  label = "term3",
  value = "",
  width = NULL,
  placeholder = NULL)

chart_2 <- tabPanel(
  titlePanel("Chart 2"),
  search1, 
  search2, 
  search3,
  plotlyOutput("chart_2"),
  p("    This specific chart tracks the frequency of combined terms 
    within the modified  data frame that we created called 'sample_data', 
    which lists out the first 10000 posts from a reddit thread called 'ADHD'. 
    I decided to sort the responses to view how many times a specific outlet for
    care appeared, such as 'friend', 'doctor', 'boyfriend/girlfriend', 
    etc. alongside the term for 'help'. The primary reason that we decided 
    to include these specific values of the chart  was to determine which 
    resource that people in the thread were more popular among the ADHD
    community to talk about and further seek support from. From there, 
    we're able to have a general grasp of how people with ADHD interact 
    with resources of care through the functionality of the checkbox widget
    - it searches the data set for potential string matches for the
    specific term along with 'help' to determine the general popularity
    and the relationship between the terms. ")
  
  
)


summary_takeaways <- tabPanel(
  titlePanel("Summary Takeaways"),
  h3("Summary Takeaway #1"),
  p("One specific takeaway that we have had on our project is understanding concerns of the ADHD community 
    based on our first visualization -- we took the scores of several comments under a subreddit and were able
    to generalize the popularity and attitude towards specific keywords based on the score."),
  h3("Summary Takeaway #2"),
  p("Another specific takeaway that we had on our project is searching for key terms within the data set that 
  helped us understand which words were popular among the ADHD community. Our findings were that the terms 
    'help' and 'medication' appeared among the most in the data set. This helped us realize some of the specific 
    struggles that people are undergoing and how they are tied to those key terms."),
  h3("Summary Takeaway #3"),
  p("Finally, another specific takeaway from the project that we had was understanding how frequently a combination
    of terms appeared within the data set. For this specifically, we were able to combine key community resources such
    as 'doctor', 'teacher', and 'parent' with the term 'help. The primary reasoning behind this was to get a generalized
    understanding of which community resource appeared the most alongside with calls for 'help' and understand which
   resource was mentioned the most in the comment thread.")
  
)


# chart_2_checkbox <- checkboxInput("find_term_dh", label = "Doctor & Help", FALSE)
# verbatimTextOutput("find_term_dh")

ui <- navbarPage(
  "Analyzing Online ADHD communities",
  intro_panel, 
  visualization_1,
  chart1_panel,
  chart_2,
  summary_takeaways,
  report_page
)