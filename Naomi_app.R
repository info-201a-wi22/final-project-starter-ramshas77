# This file contains all work done by Naomi Moss: one interactive chart with 
# five widgets, and the report page.

# server function
server <- function(input, output) {
  output$chart1 <- renderPlotly({
    term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget',
              'adhd', 'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
    )
    
    frequency <- c(20, 16, 16, 15, 14, 12, 
                   11, 11, 10, 9, 9, 7
    )
    
    term_list <- c(input$term1, input$term2, input$term3, input$term4, input$term5)
    
    plotly_chart1 <- plot_ly(
      x = term_list,
      y = frequency,
      name = "Term Frequencies",
      type = "bar"
    )
  })
}

# ui function
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

chart1_panel <- tabPanel(
  titlePanel("Chart 1"),
  term1,
  term2,
  term3,
  term4,
  term5,
  plotlyOutput("chart1"),
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
  p("This question is important because it's important to understand their need for medication, correct diagnoses. To address this concern, we plan to use a data set from Reddit, a site where we can reasonably expect people from this community to be open and honest because there are minimal consequences. Therefore, our analysis is not intended to be a monolith, it is simply to fill in 'missing' data about that people may not share with professionals."),
  h3("Design Situation:"),
  p("Goal:"),
  h4("To use data from a community resource to better understand the needs of ADHD patients."),
  p("Human values:"),
  h4("Compassionate care, holistic health(care), correct diagnoses, initiative to provide mental support, attentive listening to patients."),
  p("Data Sources:"),
  h4("Kaggle.com, Reddit.com"),
  p("Direct Stakeholders:"),
  h4("Institutions such as doctor's offices, hospitals, psychiatric firms, pharmaceutical companies that are directly treating patients with ADHD, as well as educational institutions and workplaces that may be making accommodations for these individuals."),
  p("Indirect Stakeholders:"),
  h4("people with ADHD who need support, medication, mental health care, or any combination of the 3."),
  p("Benefits and Harms:"),
  h4("One harm could be that this data displays a mix of fact and opinion, and there is no judgement of honesty or bias. One major benefit would be that with the right coding, someone can use this data to categorize information to derive several useful concepts from the data. Examining the data in different ways like this could possibly lead to someone coming up with solutions for the problems experienced by the ADHD community. It provides representation, and can provide the direct stakeholders information about ADHD, with a reasonable expectation of user-to-stakeholder confidentiality."),
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
ui <- navbarPage(
  "Analyzing Online ADHD communities",
  chart1_panel,
  report_page
)


# app
shinyApp(ui = ui, server = server)
