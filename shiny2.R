library(shiny)
library(ggplot2)  # for the diamonds dataset
library(DT)
library(readxl)
library(tidyverse)
library(highcharter)
library(glue)

#topic_selected <- params$topic
#national_dta <- read_excel("national_dta.xlsx",sheet = topic_selected)
setwd("~/quick_stats")
national_dta <- read_excel("national_dta.xlsx",sheet = "CVAP")

knitr::knit_hooks$set(inline = function(x) { if(!is.numeric(x)){ x }else{ prettyNum(round(x,2), big.mark=",", digits=6) } })


ui <- fluidPage(
  title = "Examples of DataTables",
  sidebarLayout(
    sidebarPanel(
      selectInput("pop_group", label = "Population Group:",
                  choices = c("Major Racial Group", "Asian Detailed Origin", "Asian Detailed Combo","NHPI Detailed Combo", "NHPI Detailed Origin"))
    )
  )
)

server <- function(input, output) {
  
  # choose columns to display
  diamonds2 = diamonds[sample(nrow(diamonds), 1000), ]
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(diamonds2[, input$show_vars, drop = FALSE])
  })
  
  # sorted columns are colored now because CSS are attached to them
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(mtcars, options = list(orderClasses = TRUE))
  })
  
  # customize the length drop-down menu; display 5 rows per page by default
  output$mytable3 <- DT::renderDataTable({
    DT::datatable(iris, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  })
  
}


shinyApp(ui, server)