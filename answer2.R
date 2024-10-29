install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)


df <- read.csv("./datos_abiertos_vigilancia_iras.csv")


df_lima_2020 <- df %>%
  filter(ano == 2000 & distrito == "LIMA")

ggplot(df_lima_2020, aes(y = hospitalizados_men5)) +
  geom_boxplot() +
  labs(
    title = "Distribución de hospitalizados menores de 5 años en Lima en 2000",
    y = "Número de hospitalizados menores de 5 años"
  )


total_hospitalizados <- sum(df_lima_2020$hospitalizados_men5, na.rm = TRUE)
cat("Total de hospitalizados menores de 5 años en el distrito de Lima:", total_hospitalizados, "\n")