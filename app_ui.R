# this will be our UI. 
# Ynow, the one that has the Fluidpage(), sidebarPanel(), etc stuff. 
library(shiny)
library(plotly)
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
  p("with recent talk about psychiatry and mental disorders in the media, which
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
  # note: i found a tutorial on how to hyperlink 
  # https://stackoverflow.com/questions/42047422/create-url-hyperlink-in-r-shiny
)

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

ui <- navbarPage(
  "Analyzing Online ADHD communities",
  intro_panel, 
  visualization_1
)
