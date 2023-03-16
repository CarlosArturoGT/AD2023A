#Examen parte 2 Caargoto--214575081--
#plantilla para el pre-procesado de datos . datos faltantes 
#importar el dataset 
dataset = read.csv('Data.csv')


#tratamiento de los valores N/A  por valores verdaderos 
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)


#se muestra el código para hacer variables específicas como variables de factor.
#importar dataset
dataset = read.csv('Data.csv', stringsAsFactors = F)
str(dataset)
#codificar las variables de la categria 
dataset$Country = factor(dataset$Country,
                         levels = c("France", "Spain","Germany"),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c("No", "Yes"),
                           labels = c(0,1))
str(dataset)

#importar el data set
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]

#dividir los datos en conjunto deentrenamiento y conjunto de test 
#intalar paqueteria 'caTools'
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testig_set = subset(dataset, split == FALSE)

training_set
testig_set
