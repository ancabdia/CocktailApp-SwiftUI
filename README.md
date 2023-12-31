
# Welcome to TheCocktailDB App 🍹

## Contents
- [Introduction](#Introduction)
- [App Design](#figma)
- [Functionalities]()
- [Use Cases]()
- [User Stories]()
- [MVVM](#mv)
  - [Model]()
  - [View]()
  - [ViewModel]()
  - [MV with SwiftUI](#newarch)
- [SwiftUI](#swift)
  - [Async await]()
  - [Animations]()
  - [UserDefault]()
  - [Accessibility]()
- [User manual](#manual)

# Introduction
This project aims to apply the contents taught during the bootcamp training received by OpenBank during the period of July and August. 

Within this project we have applied knowledge of the different modules that have been taught such as: version control **Git/GitHub**, **UX/UI** design, iOS programming using **SwiftUI** applying **clean architecture** through different calls to an **API**, testing using **XCTest** and applying **accessibility** to the project by using **VoiceOver** labels.

The purpose of this project will be therefore, to create an application that will show through the use of the api of [API link](https://www.thecocktaildb.com/) an application that will consist of 5 screens, which will allow us to visualize the creation of cocktails, their ingredients, quantities and description of the same. To do this we can either generate cocktails randomly, or through a search engine filter the results to display.

# Design of the app
Regarding the design of the mass, through the following [link](https://www.figma.com/file/5tnJKBkseXvNR9YyYvTSIZ/Cocktails-APP?type=design&node-id=0%3A1&mode=design&t=weC67D9D0do84zlV-1) you can view the design process and mockup of the application which was made in the early stages of the project process. In order to plan the HU and use cases to implement, in addition to creating a design (UI / UX) that allows navigation through it.

# Functionalities
- Generate random cocktail of the day
- Navigate between views
- Search cocktail by name or parts of the name
- View the detail of a cocktail
  - View cocktail image
  - View cocktail title
  - View cocktail description
  - View cocktail ingredients
    - Image
    - Cocktail name
    - Amount oz/ml
  - Add to favorite button
- View list of favorite cocktails
- Modify the theme between light and dark of the application

## Use Cases (CU)
![CUdiagram](https://github.com/ancabdia/CocktailApp-SwiftUI/assets/37101338/90622ad1-6815-43b3-9fd8-af46f926ca19)


## User Stories (HU)

### HU-01
| HU-01 | Generate random cocktail |
| ----------- | ----------- |
| Objective | Allow to generate a random cocktail at app startup |
| Requirement | To have started the app. |
| Description | Once the app is launched it will allow either clicking or activating the iPhone shake event to randomly generate a cocktail for the user. |
| Conditions | NAN |

### HU-02
| HU-02 | Generate x random cocktails |
| ----------- | ----------- |
| Objective | Allow to generate a new cocktail randomly |
| Requirement | To have started the app and generated a previous cocktail |
| Description | Once a cocktail has been randomly generated, it is possible to generate a new cocktail again. |
| Conditions | To have generated a random cocktail before |

### HU-03
| HU-03 | Navigating between cocktail random and cocktail views |
| ----------- | ----------- |
| Objective | Allow to navigate to other app views |
| Requirement | To have started the app |
| Description | The user will be able to navigate in the app between the different sections of the app. |
| Conditions | NAN |

### HU-04
| HU-04 | Search cocktail by name |
| ----------- | ----------- |
| Objective | Allow to search for a cocktail by name | | HU-04 | HU-04 | Search cocktail by name |
| Requirement | To have started the app |
| Description | The user will be able to use a search engine to find a cocktail by its name. |
| Conditions | Enter a correct name |

### HU-05
| HU-05 | Display cocktail details |
| ----------- | ----------- |
| Objective | Display cocktail info |
| Requirement | To have started the app and searched for a specific cocktail to consult |
| Description | Once you have searched for a specific cocktail, you can click on it and it will generate a view of the cocktail with the detail | 
| Conditions | Include: image, name, description, ingredients and quantities of the cocktail to be searched for |

## HU-06
| HU-06 | Add to favorite |
| ----------- | ----------- |
| Objective | To add a desired cocktail to a favorite list |
| Requirement | The cocktail must not already be included in the list. |
| Description | Once the cocktail is generated, you can indicate whether you want to bookmark it or not.|
| Conditions | You must have a cocktail to display.|

### HU-07
| HU-07 | Remove from favorite |
| ----------- | ----------- |
| Objective | Allow to remove a desired cocktail from a list of favorites |
| Requirement | The cocktail must already be included in the list. |
| Description | Once the cocktail is generated, you can indicate whether you want to mark it or not. |
| Conditions | You must have a cocktail to display and it must already be in the list of favorites. |

### HU-08
| HU-08 | Consult the list of favorites |
| ----------- | ----------- |
| Objective | To allow the display of cocktails marked as favorite |
| Requirement | There must be a cocktail marked as a favorite cocktail. |
| Description | Once a cocktail is included, a reloadable list with the marked cocktails will be displayed. |
| Conditions | You must have a cocktail to display and it must already be in the list of favorites |

### HU-09
| HU-09 | Modify light/dark theme |
| ----------- | ----------- |
| Objetive | Allow toggle between light and dark mode |
| Requirement | NAN |
| Description | Enable to view the application in light or dark mode |
| Conditions | Application must be started |

# MVVM

## What is MVVM? [^1]
It is an application structure modeling standard that consists of a series of layers and phases that communicate with each other.

![image](https://github.com/ancabdia/CocktailApp-SwiftUI/assets/37101338/f0f784c7-8b33-4249-b6f4-6e5b70487954)


[^1]: https://learn.microsoft.com/es-es/dotnet/architecture/maui/mvvm


### Model
Model classes are non-visual classes that encapsulate application data. Therefore, the model can be thought of as representing the application domain model, which typically includes a data model along with validation and business logic. Examples of model objects are data transfer objects (DTOs), plain old CLR objects (POCOs), and generated entity and proxy objects.

Model classes are often used in conjunction with services or repositories that encapsulate data access and caching.

### View
The view is responsible for defining the structure, layout and appearance of what the user sees on the screen. Ideally, with limited underlying code that contains no business logic. However, in some cases, the underlying code might contain user interface logic that implements visual behavior that is difficult to express such as animations.

### ViewModel
The view model implements properties and commands to which the view can bind data, and notifies the view of state changes via change notification events. The properties and commands provided by the view model define the functionality provided by the user interface, but the view determines how that functionality is to be displayed.



### MV with SwiftUI
Along while researching MVVM architecture i found out an interesting article over using or not MVVM pattern along site with SwiftUI or using a new MV pattern. 

More info can be found over: [article](https://betterprogramming.pub/swiftui-architecture-a-complete-guide-to-mv-pattern-approach-5f411eaaaf9e) and [WWDC Apple](https://developer.apple.com/videos/play/wwdc2020/10040/)

Stop using MVVM with swiftUI: [link](https://developer.apple.com/forums/thread/699003)

## SwiftUI

### Async await [^2]

[^2]: https://www.avanderlee.com/swift/async-await/

Async await is part of the new structured concurrency changes that arrived in **Swift 5.5** during WWDC 2021. Concurrency in Swift means allowing multiple pieces of code to run at the same time.

Async stands for asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work.
Async methods replace the often seen closure completion callbacks. Completion callbacks were common in Swift to return from an asynchronous task, often combined with a Result type parameter.

Await is the keyword to be used for calling async methods. You can see them as best friends in Swift as one will never go without the other.

### Animations

#### Shake animation
https://github.com/ancabdia/CocktailApp-SwiftUI/assets/37101338/bcc88682-e14c-4448-bf58-6b1757792616

#### Refresh animation
https://github.com/ancabdia/CocktailApp-SwiftUI/assets/37101338/ac5321bb-8944-4681-bae3-0862533a28c6


### UserDefaults
[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults) allows the user to save and read their favorite cocktails and show them over a list.

### Accessibility
Accessibility was implemented over DetailCocktailView, adding diffent types of label to the view fields so they currently describe the representation of what is showing over the screen.

## User's guide
Once the application is started, you can randomly generate a cocktail in the main screen and visualize the details of the cocktail.

In the second tabItem you can search through the search and find a desired cocktail either with or without alcohol and also access the details of the same.

Finally in the Settings menu you will be able to consult the cocktails saved as favorites, by refreshing it (dragging downwards) you will be able to update the view of it. Finally, at the bottom there is a Google button where you can modify the thematic appearance of the application.
