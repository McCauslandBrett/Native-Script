# React Native Development Script

This is a develpment script used to automate repetitive task when developing in react native. Provides for fast screen, class component, and hook component creation. 

## Usage
In order to run script add create.sh to your project directory not nested inside of any internal
directories. Behavior is as followed: </br>

./create -h [name] (creates hook name in components folder) </br>
./create -c [name] (creates class name in components folder) </br>
./create -s [name] (creates class name in screens folder) </br>
./create -sd [name] (creates class  name in screens folder, adds it to Drawer Navigator) </br> 
./create -sb [name] (creates class  name in screens folder, adds it to BottomTabNavigator) </br> 
./create -config (change defualt settings) </br> 
./create -help </br> 

If file doesnt run you need to create executable by running 
```
  chmod +x create.sh
```
(You only need to do this once). The script will not overwrite existing files so commands must be run for non-existing components. The script containes the boiler plate code that will be used, if you want to change the boiler plate code this is the one area of the script that does require manual changing. When making such changes follow the formating already provided. The naming method for screens that are placed into navigation is as followed: If the name is longer than 6 characters it will shorten the name by six characters using the front of the string. This is based on best programming practices for react native to tack on the word Screen to components that are used as screens, this means the script under these best practices will result in removing the word screen from the navigation name. </br> </br>. </br> </br>

## Defualt Structure Dependencies
Required Directories: </br>
- Expects directory named screens </br>
- Expects directoy named components </br>
- Expects directoy named navigation </br>

Required Screens: </br>
- DrawerNavigator.js </br>
- BottomTabNavigator.js </br>

Delimeters: </br>
- Drawer: Expects DrawerNavigator delimeter to be </Drawer.Navigator> </br>
- BottomTabNavigator: Expects BottomTabNavigator delimeter to be </BottomTab.Navigator> </br>

## Video Documentation
- Coming Soon

## Author

* **Brett McCausland** - [McCauslandBrett](https://github.com/McCauslandBrett)

