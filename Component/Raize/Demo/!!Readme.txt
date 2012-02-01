RAIZE COMPONENTS - DEMONSTRATION PROGRAM

The demonstration program contained in this directory was created entirely
using the components that are included with Raize Components.  The purpose of 
the demonstration program is to highlight many of the features and capabilities 
of the components and controls in Raize Components.

                                          
Delphi Developers
-----------------
To compile and run the RCDemo program in Delphi, simply load the RCDemo.dpr 
project file into Delphi and compile and run the program.
                     

C++Builder Developers
---------------------
Since the RCDemo program was written in Delphi, it is not possible to load the 
RCDemo.dpr file into C++Builder. However, there is actually very little code in 
the demonstration project. Most of the code is simply used to display the 
various frames containing the component groups.

Using the following steps you can build the RCDemo in C++Builder.

1. Create a new project in C++Builder.

2. Select the "Project|Add to project" menu item.  Switch the file type to 
Pascal files. And then add MainForm.pas file from the Demo folder.

3. Next, Select the "Project|Remove from project" menu item and remove the 
Unit1.cpp file from the project.

4. Next, Select the "Project|Options" menu item and switch to the "Packages" 
page. Make sure the "Build with runtime packages" check box is checked.

5. Save the new project to RCDemoBCB.bpr.

You will now be able to run the demo project.


