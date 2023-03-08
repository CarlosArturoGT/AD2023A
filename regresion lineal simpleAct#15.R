#Regreccion lineal simple 
#Alumno:Carlos Gomez 6-03-2023
#Analitica de datos 2023A
#Importar el dataset 
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

#dividir los datos en conjunto deentrenamiento y conjunto de test 
#intalar paqueteria 'caTools'
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testig_set = subset(dataset, split == FALSE)




#ajustamos el modelo de regresion lineal simple con el conjunto de entrenamiento 
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
#sumar  la grecion 
#predecir resultados con el conjunto de test 
y_pred = predict(regressor, newdata = testig_set)



#visualizacion de los resultados en el conjunto de entrenamiento 
#istalamos la paqueteria de "ggplot2"
#devtools = install_github("tidyverse/ggplot2")
#install.packages( 'ggbiplot')
#install.packages(" dectools")
library (ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colours = "red") + 
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regressor, newdata = training_set )), 
             colours =  "blue") +
  ggtitle("Sueldo vs Anos de Experiecia (Conjunt de Entrenamiento)") +
  xlab("a?os de experiencia (GOMEZ TORRES CARLOS ARTURO) ") + 
    ylab("sueldo (en $$)")
  
#visualizacion de los resultados enel conjunto de testigos 
  ggplot() +
    geom_point(aes(x = testig_set$YearsExperience, y = testig_set$Salary),
               colours = "red") + 
    geom_line(aes(x = training_set$YearsExperience, 
                  y = predict(regressor, newdata = training_set )), 
              colours =  "blue") +
    ggtitle("Sueldo vs Anos de Experiecia (Conjunt de testing )  ") +
  xlab("a?os de experiencia (Gomez Torres Carlos Arturo )") +
    ylab("sueldo (en $$)")
  


