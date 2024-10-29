library(dplyr)
library(ggplot2)


dt <- read.csv("./datos_abiertos_vigilancia_iras.csv")

dt_2020 <- dt %>% filter(ano == 2020)


ggplot(dt_2020, aes(x = distrito, y = hospitalizados_60mas)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    title = "Distribución de hospitalizados mayores de 60 años por distrito en 2020",
    x = "Distrito",
    y = "Número de hospitalizados mayores de 60 años"
  )


hospitalizados_por_distrito <- dt_2020 %>%
  group_by(distrito) %>%
  summarise(total_hospitalizados = sum(hospitalizados_60mas, na.rm = TRUE))


cat("Total de hospitalizados mayores de 60 años en cada distrito en 2020:\n")
print(hospitalizados_por_distrito)