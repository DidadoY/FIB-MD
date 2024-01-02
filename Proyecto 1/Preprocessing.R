#-------------------------------Read Data-------------------------------


dataset <- read.csv(file = 'C:/Users/Usuario/Desktop/Uni/MD/Proyecto 1/data.csv')

#-------------------------Dropping Variables-------------------------------

nba_stats = subset(dataset, select = -(GAME_ID) )
nba_stats = subset(nba_stats, select = -(TEAM_ID) )
nba_stats = subset(nba_stats, select = -(TEAM_CITY) )
nba_stats = subset(nba_stats, select = -(PLAYER_ID) )
nba_stats = subset(nba_stats, select = -(NICKNAME) )
nba_stats = subset(nba_stats, select = -(FG_PCT) )
nba_stats = subset(nba_stats, select = -(FG3_PCT) )
nba_stats = subset(nba_stats, select = -(FT_PCT) )
nba_stats = subset(nba_stats, select = -(PLAYER_NAME) )
nba_stats = subset(nba_stats, select = -(REB) )





#hour(res) + minute(res)/60

summary(nba_stats)
#-------------------------Categorize Variables-------------------------

#Start Position
nba_stats[,3] <- factor(nba_stats[,3], levels =c('', 'G', 'F', 'C'), labels = c('Not Started', 'Guard', 'Forward', 'Center'))

#Team_Abr
nba_stats[,1] <- factor(nba_stats[,1])

#Adv_Team_Abr 
nba_stats[,2] <- factor(nba_stats[,2]) #CAMBIAR

#Comment
nba_stats[,4] <- factor(nba_stats[,4], labels = c('Played', 'NP-Injury', 'NP-Personal_Decision', 'NP-Coach_Decision', 'NP-Injury', 'NP-Suspension', 'NP-Personal_Decision', 'NP-Injury', 'NP-Personal_Decision', 'NP-Not_Team'))

#Rookie
nba_stats[,21]<- factor(nba_stats[,21], labels = c('NoRookie', 'Rookie'))

#Winner
nba_stats[,22]<- factor(nba_stats[,22], labels = c('Lose', 'Win'))

nba_stats = nba_stats[nba_stats$COMMENT == "Played",]
nba_stats = subset(nba_stats, select = -(COMMENT) )

Time.Training<- nba_stats[,4]

library(lubridate)
res <- ms(Time.Training)        # format to 'hours:minutes:seconds'
nba_stats[,4] <- period_to_seconds(res)

write.csv(nba_stats, "C:/Users/Usuario/Desktop/Uni/MD/Proyecto 1/preprocessedData.csv")
