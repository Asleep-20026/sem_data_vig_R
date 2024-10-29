df <- read.csv("./datos_abiertos_vigilancia_iras.csv")

# Paso 2: Inspeccionar el dataset
# Muestra los tipos de datos de cada columna y una vista previa de los datos
str(df)   # Ver la estructura del dataframe y tipos de datos de cada columna
head(df)  # Ver l

# Paso 1: Cargar las bibliotecas necesarias
library(dplyr)
library(ggplot2)

# Paso 2: Cargar el archivo CSV
# Cambia 'ruta/del/archivo.csv' por la ruta correcta de tu archivo en tu PC
df <- read.csv("C:/Users/RYZEN/Downloads/datos_abiertos_vigilancia_iras.csv")

# Paso 3: Filtrar los datos para el año 2020
df_2020 <- df %>% filter(ano == 2020)

# Paso 4: Crear el box plot
ggplot(df_2020, aes(x = distrito, y = hospitalizados_60mas)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    title = "Distribución de hospitalizados mayores de 60 años por distrito en 2020",
    x = "Distrito",
    y = "Número de hospitalizados mayores de 60 años"
  )

# Paso 5: Calcular y mostrar el total de hospitalizados mayores de 60 años por distrito en 2020
hospitalizados_por_distrito <- df_2020 %>%
  group_by(distrito) %>%
  summarise(total_hospitalizados = sum(hospitalizados_60mas, na.rm = TRUE))

# Imprimir resultados
cat("Total de hospitalizados mayores de 60 años en cada distrito en 2020:\n")
print(hospitalizados_por_distrito)