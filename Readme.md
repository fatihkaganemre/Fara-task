# UI Pattern
I ve used sth between MVVM and Viper. 
- View: View is the only place which imports UIKit, I ve configured autolayout programatically
- ViewModel: It is used for passing the data to view and for getting the user Interactions from View. (Establishes communication between View and Interactor)
- ViewController: Just a man in the middle , I ve tried to keep it as simple as possible. It holds the view and calls interactor functions depends on app cycle
- Interactor: In MVVM you can call it ViewModel , I ve used Interactor name for not causing name conflicts. It is used for business logic.
- Router: As its name describes, it is used for routing. It keeps weak referrence to controller object in order to prevent retain cycle

# WebService
I didnt want to make it very complicated , I created a simple and also generic webServiceCore which any related Service e.g UserService can use.
I could use Alamofire , Moja. However I always prefer native approach.

# Depenencies
I havent use any external dependency. I tried to follow Dependency Injection and Inversion principles.
I have experience with Cocoapods, Carthage (preferebly with Rome). However there is no need for an external framework in this project. 

# Test
I implemented UnitTests with "given, when, then" pattern and for name of test functions i ve used "when_should" convention.

## P.S: I ve checked given lat and long values on Apple and Google maps and I assume either they are just test datas , or there is a mistake.
or I should convert their sign (I am not sure about that.)

