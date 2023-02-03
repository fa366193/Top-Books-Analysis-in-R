# Libraries needed

library(ggplot2)
library(reshape2)
library(plyr)
library(tidyverse)

# Creating datasets
Books <- read_csv("books.csv")
TopRating_authors<- select(Books, authors, average_rating)
TopRating_booktitles<- select(Books, title, average_rating)
Topnum_pages<- select(Books, title, num_pages)
Top_publishers<- select(Books, title, publisher)

# Creating dataset with only Broadway Books and Scholastic Inc titles
colnames(Top_publishers)[colnames(Top_publishers) == "title"] <- "title"
Top_publishers_vs <- Top_publishers[(Top_publishers$publisher == "Scholastic Inc." | Top_publishers$publisher == "Broadway Books"), ]


#Plotting Scholastic Inc vs Broadway Books
ggplot(Top_publishers_vs, aes(x = publisher, fill = publisher)) + 
  geom_bar(stat = "count", aes(fill = publisher)) +
  labs(x = "Publisher", y = "No. of Books", title = "Publisher Number of Books") +
  geom_label(stat = "count", aes(label = ..count..)) +
  theme_bw() 

#Top 30 Books with highest number of pages

ggplot(Topnum_pages[1:30, ], aes(x = title, y = num_pages)) + 
  geom_bar(stat = "identity", aes(fill = num_pages)) +
  labs(x = "title", y = "num_pages", title = "Top 30 Titles", subtitle = "With Highest Number of Pages") +
  coord_flip() +
  theme_bw() 

#Top 30 Authors with highest average rating

ggplot(TopRating_authors[1:30, ], aes(x = authors, y = average_rating)) + 
  geom_bar(stat = "identity", aes(fill = average_rating)) +
  labs(x = "authors", y = "average_rating", title = "Top 30 Authors", subtitle = "With Highest average rating") +
  coord_flip() +
  theme_bw() 

#Top 30 Books with highest average rating

ggplot(TopRating_booktitles[1:30, ], aes(x = title, y = average_rating)) + 
  geom_bar(stat = "identity", aes(fill = average_rating)) +
  labs(x = "title", y = "average_rating", title = "Top 30 Books", subtitle = "With Highest average rating") +
  coord_flip() +
  theme_bw() 
