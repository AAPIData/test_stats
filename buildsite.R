#Set our working directory. 
#This helps avoid confusion if our working directory is 
#not our site because of other projects we were 
#working on at the time. 
setwd("~/quick_stats/")
#render your sweet site. 
rmarkdown::render_site()

setwd("~/quick_stats/")
topics = c("Poverty","Nativity","Education","Insurance")

for(topic in topics)
  rmarkdown::render(input = "report_template.Rmd", 
                    output_file = paste0("state/",topic,".html"),
                    params = list(topic = topic)
  )


national_topics = c("Poverty","Nativity","Education","Insurance")

for(topic in topics)
  rmarkdown::render(input = "national_report_template.Rmd", 
                    output_file = paste0("national/",national_topics,".html"),
                    params = list(national_topics = national_topics)
  )





