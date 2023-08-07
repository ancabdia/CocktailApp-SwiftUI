
# Bienvenido a TheCocktailDB App

### Contenido
- [Introducción](#Introducción)
- [Diseño de la app](#figma)
- [Funcionalidades]()
- [MV](#mv)
  - [¿Qué es MV?]()
  - [Como funciona]()
  - [MV y SwiftUI]()
  - [Repositorio]()
- [Código de estilo]()
- [Otras herramientas]()
- [Instrucciones de uso]()

# Introducción
Este proyecto tiene como objetivo aplicar los contenidos impartidos durante la formación por parte del bootcamp recibido por parte de OpenBank durante el periodo de julio y agosto. 

Dentro del mismo se han aplicado conocimientos de los distintos módulos de los cuales se han impartido tales como: control de versiones **Git/GitHub**, diseño de **UX/UI**, programación iOS mediante **SwiftUI** aplicando **arquitectura clean** mediante distintas llamadas a una **API**, testing empleando **XCTest** y aplicando accesibilidad al proyecto mediante **VoiceOver**.

La finalidad de este proyecto será por lo tanto, crear una aplicación que mostrara a través del uso de la api de [enlace API](https://www.thecocktaildb.com/) una aplicación que constará de 5 pantallas, que nos permitirá visualizar la creación de cocktails, sus ingredientes, cantidades y descripción del mismo. Para ello podremos tanto generar cocktails de forma aleatoria, o a través de un buscador filtrar los resultados a mostrar.

# Diseño de la app
En cuanto al diseño de la misa, a través del siguiente [enlace]() se podrá visualizar el proceso de diseño y mockup de la aplicación la cual se realizo en las primeras fases del proceso del proyecto. Con el fin de planificar las HU y casos de uso a implementar, además de crear un diseño (UI/UX) que permita la navegación por la misma.

# Funcionalidades
- Generar cocktail aleatorio del día
- Navegar entre vistas
- Buscar cocktail por medio del nombre o partes del nombre
- Ver el detalle de un cocktail
  - Ver imagen del cocktail
  - Ver título del cocktail
  - Ver descricpión del cocktail
  - Ver ingredientes del cocktail
    - Imagén
    - Nombre
    - Cantidad oz/ml

## Casos de uso

### CU-01
| CU-01 | Generar cocktail aleatorio |
| ----------- | ----------- |
| Objetivo | Permitir generar un cocktail de forma aleatoria al iniciar la app |
| Requisito | Haber iniciado la app |
| Descripción | Una vez se habrá la app se permitira ya sea haciendo clic o activando el evento de shake del iPhone se generará un cocktail de forma aleatoria al usuario   |
| Condiciones | NAN   |

### CU-02
| CU-02 | Generar otro cocktail aleatorio |
| ----------- | ----------- |
| Objetivo | Permitir generar un nuevo cocktail de forma aleatoria |
| Requisito | Haber iniciado la app y generado un cocktail previo |
| Descripción | Una vez se haya generado un cocktail de forma aleatoria, se podrá volver a generar otro nuevo   |
| Condiciones | Haber generado un cocktail random previamente   |

### CU-03
| CU-03 | Navegar entre vistas cocktail random y cocktails |
| ----------- | ----------- |
| Objetivo | Permitir navegar a otras vistas de la app |
| Requisito | Haber iniciado la app |
| Descripción | El usuario podrá navegar en la app entre sus distintas secciones   |
| Condiciones | NAN   |


### CU-04
| CU-04 | Buscar cocktail por nombre |
| ----------- | ----------- |
| Objetivo | Permitir buscar un cocktail mediante su nombre |
| Requisito | Haber iniciado la app |
| Descripción | El usuario podra usar un buscador para encontrar un cocktail mediante su nombre  |
| Condiciones | Escribir algún nombre correcto   |

### CU-05
| CU-05 | Visualizar detalle de un cocktail |
| ----------- | ----------- |
| Objetivo | Permitir visualizar el detalle de un cocktail |
| Requisito | Haber iniciado la app y buscado un cocktail concreto a consultar |
| Descripción | Una vez se haya buscado un cockail concreto se podrá hacer clic sobre el mismo y se generará una vista del mismo con el detalle   |
| Condiciones | Incluir: imagen, nombre, descripción e ingredientes y cantidades del cocktail determinado   |

### CU-06
| CU-06 | Conversor de oz a ml |
| ----------- | ----------- |
| Objetivo | Permitir convertir onzas a mililitros |
| Requisito | Que el ingrediente disponga de una cantidad (oz) |
| Descripción | Una vez se generé el cocktail se podrá visualizar la cantidad en onzas o ml   |
| Condiciones | Disponer de un cocktail con cantidades de ingredientes   |

# MV

## ¿Qué es MV? [^1]
[^1]: medium: https://betterprogramming.pub/swiftui-architecture-a-complete-guide-to-mv-pattern-approach-5f411eaaaf9e developer:https://developer.apple.com/forums/thread/699003

