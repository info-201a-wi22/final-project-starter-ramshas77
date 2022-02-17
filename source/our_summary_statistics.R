# Our data includes four different datasets about ADHD posts on Reddit. The main dataset 
# that we will be using is called "ADHD" and stores all of the posts made on the Reddit thread "ADHD."
# This dataframe has 336066 rows and 8 columns.
# One column in this dataframe stores the number of comments each post in "ADHD" has.
# The post with the most comments -titled "/sigh"- has over 1.5 billion comments.

# Our five statistics!

# Statistic 1:
# What is the title of the post with the most comments and how many comments does it have?
max_comments <- max(adhd_data$num_comments, na.rm = TRUE)
# 1505919691 comments
max_titles <- adhd_data[adhd_data$num_comments == max_comments, "title"]
# "/sigh"

# Statistic 2:



# Statistic 3:



# Statistic 4:



# Statistic 5: 


