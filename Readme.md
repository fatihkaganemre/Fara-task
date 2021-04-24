# UI Pattern
I ve used sth between MVVM and Viper. 
- View: View is the only place which imports UIKit, I ve configured autolayout programatically
- ViewModel: It is used for passing the data to view and gets the userInteractions
- ViewController: Just a man in the middle , I ve tried to keep it as simple as possible. Defines the view and calls interactor functions depends on app cycle
- Interactor: In MVVM you can call it ViewModel , I ve used Interactor name for removing name conflict. It is used for business logic.
- Router: As its name describes, it is used for routing. It keeps weak controller object in order to prevent retain cycle

# WebService
I didnt want to make it very complicated , I created a simple and also generic webServiceCore which any related Service e.g UserService can use.

# Depenencies
I havent use any external dependency
However i tried to follow Dependency Injection and Inversion principles

#Test
I implemented UnitTests with "given, when, then" pattern and for name of test functions i ve used "when_should" convention.

P.S: I ve checked given lat and long values on Apple and Google maps and I assume either they are just test datas , or there is a mistake.
Or I shoudl convert thir sign (I am not sure about that.)

