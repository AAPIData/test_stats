library(waffle)
library(extrafont)

stats <- c(`Bachelor's Degree or Higher`=5,5)
asian <- waffle(stats, rows=2, size=0.5, colors=c("#E26069", "#969696"),
       use_glyph="graduation-cap", title = "Asian Americans")
asian <- asian +  theme(legend.position="none")

stats2 <- c(`Bachelor's Degree or Higher`=3,7)
uspop<- waffle(stats2, rows=2, size=0.5, colors=c("#E26069", "#969696"),
       use_glyph="graduation-cap",title = "US Population")
uspop <- uspop +  theme(legend.position="none")

stats3 <- c(`Bachelor's Degree or Higher`=2,8)
nhpi<-waffle(stats3, rows=2, size=0.1, colors=c("#E26069", "#969696"),
       use_glyph="graduation-cap",title = "NHPI Population")
nhpi <- nhpi +  theme(legend.position="none")
iron(uspop, asian, nhpi)

