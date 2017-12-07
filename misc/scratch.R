### SCRATCH STUFF
##FUNCTION
add_grouplabel<- function(data){
  data %>% select(-geoid, - geodisplaylabel) %>%
    mutate(
      group_id = case_when(
        pop_id %in% major_race  ~ "Major racial groups",
        pop_id %in% asian_alone ~ "Asian Detail",
        pop_id %in% asian_combo ~ "Asian Detail Combo",
        pop_id %in% nhpi_alone  ~ "NHPI Detail",
        pop_id %in% nhpi_combo  ~ "NHPI Detail Combo")) %>% mutate(
          group_name = as.character(pop_id))
}


## Pop Groups
major_race  <- c(1,12,31,50,60,4,6,16,400,451)
asian_alone <- c(13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,72,73,75,76)
asian_combo <- c(32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,80,81,83,84,85)
nhpi_alone  <- c(51,52,53,54,55,56,57,58,96)
nhpi_combo  <- c(61,62,63,64,65,66,67,68,80,81,83,84,85,176,177) 


national_tbl_display <- function(data,group,column_names,orderby){
  data %>%
    filter(group_id ==  paste(group)) %>%
    select(column_names) %>%
    #arrange(desc(paste(orderby)))%>%
    datatable(extensions = 
                list("Buttons" = NULL, 'FixedColumns'= T, "Scroller"=T),
              rownames= FALSE, 
              options = list(
                dom = 'rtB',
                buttons = c('copy', 'csv', 'excel'),
                scrollX = TRUE,
                lengthMenu = c(25, 50, 100), pageLength = 50)) %>%
    formatCurrency(columns = c(2,3),currency = "", interval = 3, mark = ",", digits=0)
}