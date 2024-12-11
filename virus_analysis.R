
virus_data = read.csv("question-5-data/Cui_etal2014.csv")

summary(virus_data)

ggplot(virus_data, aes(x=Genome.length..kb., y=Virion.volume..nm.nm.nm.)) + 
  geom_point() 

virus_data_log <- virus_data
virus_data_log$log.genome.length = log(virus_data$Genome.length..kb.)
virus_data_log$log.virion.volume = log(virus_data$Virion.volume..nm.nm.nm.)

# Code for 5.4): 
ggplot(virus_data_log, aes(x=log.genome.length, y=log.virion.volume)) + 
  geom_point() + 
  theme_bw() +
  geom_smooth(method = "lm") + 
  labs(x = "log [Genome length (kb)]", y = "log [Virion volume (nm3)]") + 
  theme(axis.title = element_text(face = 2), size = 10)

# Code for 5.5): 

1181.807*300^(1.5152)

virus_log_lm = lm(log.virion.volume ~ log.genome.length, data = virus_data_log)

summary(virus_log_lm)
plot(virus_log_lm)

exp(7.0748)

cor.test(virus_data_log$log.genome.length, virus_data_log$log.virion.volume, method = "pearson")
cor.test(virus_data$Genome.length..kb., virus_data$Virion.volume..nm.nm.nm., method = "pearson")


