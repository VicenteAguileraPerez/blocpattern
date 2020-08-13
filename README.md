# blocpattern

A new Flutter application where I learn how to implement the BLoC pattern.

## Getting Started

Exist two classes in the bloc folder, these are MainBLoC and SecondBLoC.
Each one of them corresponds to each page main.dart and second.dart. 
If you use a library you can simplify the code of the blocs but in this case
I didn't use a library.
the implementation is manual.
This is the first step before to use a library.Creating an manual implementation of BLoC pattern.


## BLoC Pattern


The BLoC Pattern is a development pattern, which means Bussiness Logic Component.
This pattern says that we need to separate in a component i.e. a class all our bussiness logic of the
UI. Then we connect them, namely the BLoC with the UI.
This implementation allows in a near furure, scale the application.

If you want to implement this pattern you neet to create a folder called bloc in lib folder.
After, you always need to create a bloc class to each UI.
If the bloc classes depend on a common resource in this case the value of the counter you need to create a
repository where all the blocs related with that repository know the common resources.
Finally you need to specify the events of the blocs in this case I created a enum where I put the events that  I needed INCREMENT,
DOUBLE, CLEAR, FETCH. You can use or implement the events that you need.
