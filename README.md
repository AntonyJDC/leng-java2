# Manual de Usuario: Analizador Léxico y Sintactico con Flex, Yacc y C
## Descripción General
Este programa utiliza Flex y Yacc para analizar léxicamente y sintacticamente un conjunto de tokens, operadores y estructuras de control dentro de código fuente. Identifica y categoriza constantes enteras, reales, cadenas, identificadores, operadores, comentarios y estructuras de control, mostrando los resultados directamente en la consola. También detecta y reporta errores sintacticos.
Requisitos del Sistema

  -	Flex y Bison instalado en un sistema operativo compatible (Linux).
  -	Compilador GCC para compilar y ejecutar el programa generado por Flex.

## Instalación de Prerrequisitos:

### Linux (Debian/Ubuntu):

  1.	Abra la terminal.
  2.	Ejecute `sudo apt update` para actualizar los paquetes.
  3.	Instale Flex y Bison con `sudo apt-get install flex bison`.
  4.	Instalación de GCC sudo `apt-get install build-essential`.

### Instalación y Ejecución del programa

  1.	Guarde los archivos adjuntos del código del programa.
  2.	En la terminal, navegue al directorio donde se encuentra el archivo y ejecute el siguiente comando para generar el código fuente C y los archivos de definición de tokens desde archivo .y:

  `bison -d LAB02_Arteaga_Cardona_Dominguez_Pinerda.y`

  3.	Compile el archivo Flex para generar el código fuente C correspondiente: (en caso de que no esté compilado en su directorio):

  `flex LAB02_Arteaga_Cardona_Dominguez_Pinerda.l`

  4.	Una vez que tienes los archivos de código fuente de Bison y Lex, compílalos juntos para crear el ejecutable final. Utiliza el siguiente comando para enlazar todo y crear el ejecutable:
   
   `gcc -o LAB02_Arteaga_Cardona_Dominguez_Pinerda LAB02_Arteaga_Cardona_Dominguez_Pinerda.tab.c lex.yy.c`

  5.	Ejecute el programa, debe añadir el archivo de entrada que se desea analizar como mostramos a continuación:
     
     `./LAB02_Arteaga_Cardona_Dominguez_Pinerda entrada.txt > salida.txt`

## Funcionalidades del Programa

Este programa está diseñado para analizar y procesar la sintaxis de un lenguaje de programación o datos estructurados especificados. Utiliza Flex para el análisis léxico, identificando tokens como identificadores, operadores, y literales, y Bison para el análisis sintáctico, validando la estructura gramatical según las reglas definidas.

- Reconocimiento de Tokens: El programa identifica distintos tipos de tokens, incluyendo palabras clave, operadores, y estructuras del lenguaje.
- Manejo de Errores Léxicos y Sintácticos: Detecta y reporta errores, proporcionando la línea y posible sugerencia de corrección.
- Almacenamiento y Reconocimiento de Identificadores: Mantiene una tabla de símbolos para gestionar los identificadores y su alcance.
- Procesamiento de Comentarios: Ignora los comentarios para no interferir en el análisis sintáctico.
- Salida Detallada: Ofrece una salida que facilita la depuración y el entendimiento del flujo de análisis.

## Estructura del Programa

El programa se divide en varias secciones clave, facilitando su mantenimiento y escalabilidad:

- Sección de Definiciones (Flex): Define patrones para tokens utilizando expresiones regulares. Incluye definiciones para palabras clave, identificadores, números, operadores, y comentarios.
- Reglas de Análisis Léxico (Flex): Cada patrón tiene una acción asociada que puede ser devolver un token o ejecutar un código para manejar espacios, comentarios, o errores.
- Reglas de Gramática (Bison): Define la estructura gramatical del lenguaje, especificando cómo los tokens deben organizarse para formar instrucciones válidas.
- Manejo de Errores (Bison): Incluye reglas para detectar y reportar errores sintácticos.
- Tabla de Símbolos: Implementa una tabla de símbolos que gestiona información sobre los identificadores como tipo, alcance, y posiblemente valores iniciales.
- Función main (C): Inicializa el análisis, maneja la entrada/salida de archivos, y muestra los resultados y errores encontrados durante el análisis.

## Salida del Programa

La ejecución del programa produce una salida en un archivo que indica el recuento de errores sintacticos correspondientes por cada linea, si no hay simplemente da un mensaje de 'Bien'.
