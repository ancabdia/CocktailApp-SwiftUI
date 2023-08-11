
# Bienvenido a TheCocktailDB App 🍹

### Contenido
- [Introducción](#Introducción)
- [Diseño de la app](#figma)
- [Funcionalidades]()
- [Historias de usuario]()
- [MVVM](#mv)
  - [Model]()
  - [View]()
  - [ViewModel]()
- [Manual de uso](#manual)

# Introducción
Este proyecto tiene como objetivo aplicar los contenidos impartidos durante la formación por parte del bootcamp recibido por parte de OpenBank durante el periodo de julio y agosto. 

Dentro del mismo se han aplicado conocimientos de los distintos módulos de los cuales se han impartido tales como: control de versiones **Git/GitHub**, diseño de **UX/UI**, programación iOS mediante **SwiftUI** aplicando **arquitectura clean** mediante distintas llamadas a una **API**, testing empleando **XCTest** y aplicando accesibilidad al proyecto mediante **VoiceOver**.

La finalidad de este proyecto será por lo tanto, crear una aplicación que mostrara a través del uso de la api de [enlace API](https://www.thecocktaildb.com/) una aplicación que constará de 5 pantallas, que nos permitirá visualizar la creación de cocktails, sus ingredientes, cantidades y descripción del mismo. Para ello podremos tanto generar cocktails de forma aleatoria, o a través de un buscador filtrar los resultados a mostrar.

# Diseño de la app
En cuanto al diseño de la misa, a través del siguiente [enlace](https://www.figma.com/file/5tnJKBkseXvNR9YyYvTSIZ/Cocktails-APP?type=design&node-id=0%3A1&mode=design&t=weC67D9D0do84zlV-1) se podrá visualizar el proceso de diseño y mockup de la aplicación la cual se realizo en las primeras fases del proceso del proyecto. Con el fin de planificar las HU y casos de uso a implementar, además de crear un diseño (UI/UX) que permita la navegación por la misma.

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
  - Botón de añadir a favorito
- Consultar lista de cocktails favoritos
- Modificar el tema entre claro y oscuro de la aplicación

## Historias de Usuario (HU)

### HU-01
| HU-01 | Generar cocktail aleatorio |
| ----------- | ----------- |
| Objetivo | Permitir generar un cocktail de forma aleatoria al iniciar la app |
| Requisito | Haber iniciado la app |
| Descripción | Una vez se habrá la app se permitira ya sea haciendo clic o activando el evento de shake del iPhone se generará un cocktail de forma aleatoria al usuario   |
| Condiciones | NAN   |

### HU-02
| HU-02 | Generar x cocktails aleatorios |
| ----------- | ----------- |
| Objetivo | Permitir generar un nuevo cocktail de forma aleatoria |
| Requisito | Haber iniciado la app y generado un cocktail previo |
| Descripción | Una vez se haya generado un cocktail de forma aleatoria, se podrá volver a generar otro nuevo   |
| Condiciones | Haber generado un cocktail random previamente   |

### HU-03
| HU-03 | Navegar entre vistas cocktail random y cocktails |
| ----------- | ----------- |
| Objetivo | Permitir navegar a otras vistas de la app |
| Requisito | Haber iniciado la app |
| Descripción | El usuario podrá navegar en la app entre sus distintas secciones   |
| Condiciones | NAN   |

### HU-04
| HU-04 | Buscar cocktail por nombre |
| ----------- | ----------- |
| Objetivo | Permitir buscar un cocktail mediante su nombre |
| Requisito | Haber iniciado la app |
| Descripción | El usuario podra usar un buscador para encontrar un cocktail mediante su nombre  |
| Condiciones | Escribir algún nombre correcto   |

### HU-05
| HU-05 | Visualizar detalle de un cocktail |
| ----------- | ----------- |
| Objetivo | Permitir visualizar el detalle de un cocktail |
| Requisito | Haber iniciado la app y buscado un cocktail concreto a consultar |
| Descripción | Una vez se haya buscado un cockail concreto se podrá hacer clic sobre el mismo y se generará una vista del mismo con el detalle   |
| Condiciones | Incluir: imagen, nombre, descripción e ingredientes y cantidades del cocktail determinado   |

### HU-06
| HU-06 | Añadir a favorito |
| ----------- | ----------- |
| Objetivo | Permitir añadir un cocktail deseado a una lista de favoritos |
| Requisito | Que el cocktail no este ya incluido en la lista |
| Descripción | Una vez se generé el cocktail se podrá indicar si se quiere marcar o no   |
| Condiciones | Disponer de un cocktail que visualizar   |

### HU-07
| HU-07 | Eliminar de favorito |
| ----------- | ----------- |
| Objetivo | Permitir eliminar un cocktail deseado de una lista de favoritos |
| Requisito | Que el cocktail este ya incluido en la lista |
| Descripción | Una vez se generé el cocktail se podrá indicar si se quiere marcar o no   |
| Condiciones | Disponer de un cocktail que visualizar y este ya en la lista de favoritos   |

### HU-08
| HU-08 | Consultar lista de favoritos |
| ----------- | ----------- |
| Objetivo | Permitir visualizar cocktails marcados como favoritos |
| Requisito | Que exista algun cocktail marcado |
| Descripción | Una vez se incluya un cocktail se podra ver una lista recargable con los cocktails marcados   |
| Condiciones | Disponer de un cocktail que visualizar y este ya en la lista de favoritos   |

### HU-09
| HU-09 | Modificar tema claro/oscuro |
| ----------- | ----------- |
| Objetivo | Permitir alternar entre modo claro y oscuro |
| Requisito | NAN |
| Descripción | Permitir ver la aplicación en modo claro o oscuro   |
| Condiciones | Tener arrancada la aplicación   |

# MVVM

## ¿Qué es MVVM? [^1]
Es un estandar de modelado de estructura de aplicaciones que consta de una serie de capas y fases que se comunican entre sí.

[^1]: https://learn.microsoft.com/es-es/dotnet/architecture/maui/mvvm

### Model
Las clases de modelo son clases no visuales que encapsulan los datos de la aplicación. Por lo tanto, el modelo se puede considerar como que representa el modelo de dominio de la aplicación, que normalmente incluye un modelo de datos junto con la lógica de validación y de negocios. Algunos ejemplos de objetos de modelo son objetos de transferencia de datos (DTO), objetos CLR antiguos sin formato (POCO) y objetos de entidad y proxy generados.

Las clases de modelo se suelen usar junto con servicios o repositorios que encapsulan el acceso a datos y el almacenamiento en caché.

### View
La vista es responsable de definir la estructura, el diseño y la apariencia de lo que ve el usuario en la pantalla. Idealmente, con un código subyacente limitado que no contiene lógica de negocios. Sin embargo, en algunos casos, el código subyacente podría contener lógica de interfaz de usuario que implementa el comportamiento visual que es difícil de expresar como las animaciones.

### ViewModel
El modelo de vista implementa propiedades y comandos a los que la vista puede enlazar datos, y notifica a la vista los cambios de estado mediante eventos de notificación de cambios. Las propiedades y comandos que proporciona el modelo de vista definen la funcionalidad que ofrece la interfaz de usuario, pero la vista determina cómo se va a mostrar esa funcionalidad.

![image](https://github.com/ancabdia/iOS_Bootcamp_APP/assets/37101338/d9e04972-40dc-498e-acad-3bf0134e015c)

## Manual de uso
Una vez arrancada la aplicación podrá en la pantalla principal generar un cocktail de forma aleatoria y visualizar el detalle del mismo.

En en el segundo tabItem podra realizar una busqueda a través del buscado y encontrar un cocktail deseado ya sea con alcohol o sin el mismo y de igual manera acceder al detalle del mismo.

Por último en el menu de Settings podrá consultar los cocktails guardados como favoritos, realizando un refresh de la misma (arrastrando hacía abajo) podrá actualizar la vista de la misma. Finalmente en la parte inferior constará de un toogle botón donde podrá modificar la aparaciencia temática de la apliacición.
