# React Native Development Script

This is a develpment script used to automate repetitive task when developing in react native. Provides for fast screen, class component, and hook component creation. 

## Usage
In order to run script add create.sh to your project directory not nested inside of any internal
directories. Behavior is as followed: </br>

./create -h [name] (creates hook name in components folder) </br>
./create -c [name] (creates class name in components folder) </br>
./create -s [name] (creates class name in screens folder) </br>
./create -sd [name] (creates class  name in screens folder, adds it to Drawer Navigator) </br> 
./create -config (change defualt settings) </br> 
./create -help </br> 

If file doesnt run you need to create executable by running 
```
  chmod +x create.sh
```
(You only need to do this once). </br> </br>

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

