

# Regresion Lineal Simple Modelo de Entrenamiento
#caargoto  
#09 de Marzo de 2023

#1 importar las librerias numpy, matploitlib y pandas 

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importar el data set 
dataset = pd.read_csv('Salary_Data.csv')
x = dataset.iloc [:, :-1].values
y = dataset.iloc[:, 1].values
 

#2 dividir el data set en conjuntos de entrenamiento y conjunto de testing
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 1/3, random_state = 0)

#crear modelo de regrecion lineal simple con el conjunto de entrenamiento 
from sklearn.linear_model import LinearRegression
regression = LinearRegression ()
regression.fit(x_train, y_train)


#predecir el conjunto de test 
y_pred = regression.predict(x_test)


#visualizar los resultados de entrenamiento 
plt.scatter(x_train, y_train, color= "red")
plt.plot(x_train, regression.predict(x_train), color = "blue")
plt.title("Sueldo vs años de experiencia (conjunto de entrenamiento )")
plt.xlabel("Años de experiencia -- GOMEZ TORRE CARLOS ARTURO--")
plt.ylabel("sueldo(en $)")
plt.show()

#viualisar los resultados de test
plt.scatter(x_test, y_test, color= "red")
plt.plot(x_train, regression.predict(x_train), color = "blue")
plt.title("Sueldo vs años de experiencia (conjunto de testing) ")
plt.xlabel("años de esperiecia  --GOMEZ TORRE CARLOS ARTURO--")
plt.ylabel("sueldo (en $)")
plt.show()
