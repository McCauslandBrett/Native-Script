#! /bin/bash
function menu() {
cat << creativ
  Options:
[-h] [name] (creates hook name in components folder )
[-c] [name] (creates class name in components folder)
[-s] [name] (creates class name in screens folder)
[-sd] [name] (creates class name in screens folder and adds it to Drawer Navigator)
[-sb] [name] (creates class name in screens folder and adds it to BottomTab Navigator)
[-config] (change defualt settings)
[-help]  ()
creativ
}
function CreateHook() {
  echo $1
  touch $1
  cat << EOF > $1
import React, { useState, useEffect } from 'react';
import { View, Text, Button } from 'react-native';

export const ${2} = () => {
  const [foo, setFoo] = useState(30);
  useEffect(() => {
    if (foo >= 42) {
      setFoo(42);
      }
    }, [foo])
   return (
      <View>
        <Text>Foo is {foo}.</Text>
        <Button onPress={() => setFoo(foo + 1)} title='Increase Foo!' />
      </View>
    )
}
EOF
}
function CreateClass() {
  echo $1
  touch $1
  cat << EOF > $1
import React, {Component} from 'react';
import { View, Text, StyleSheet,SafeAreaView,
         ScrollView,TextInput,TouchableOpacity,
        } from 'react-native';
import { connect } from 'react-redux';
import {bindActionCreators} from 'redux';
import {AntDesign} from "@expo/vector-icons";

class ${2} extends Component{
state = { foo: false,}
render(){
  return(
    <View>
      <Text> ${2} </Text>
    </View>
    );
  }
}
const localstyles = StyleSheet.create({});
const mapDispatchToProps = (dispatch) => {
  return bindActionCreators({},dispatch)
}
const mapStateToProps = (state) => {
  return {
    user: state.user,
    }
}
export default connect(mapStateToProps,mapDispatchToProps)(${2})
EOF
}

name=$2
type=$1

case $type in

  -h)
    path="./components/"${name}".js"
    if [[ -d "./components" && ! -f "$path"  ]]; then
       #file doesnt exist and parent directory does exist
       echo "hook"
       CreateHook "$path" $name
    fi

    ;;

  -c)
    path="./components/"${name}".js"
    if [[ -d "./components" && ! -f "$path"  ]]; then
       #file doesnt exist and parent directory does exist
       echo "class"
       CreateClass "$path" $name
    fi
    ;;

  -sd)
    if [[ -d "./screens" && ! -f "$path" ]]; then
      path="./screens/"${name}".js"

      #file doesnt exist and parent directory does exist
      CreateClass "$path" $name

      l=${#name}
      if [[ $l -gt 6 ]]; then
        n=${name:0:$l-6}
        else
          n=$name
      fi

      code="  <Drawer.Screen name=\""${n}"\" component={"${name}"} /> \\
      </Drawer.Navigator>"

       import="import "${name}" from '../screens/"${name}".js'; \\
"
      echo "${import}"

      # To check permissions uncoment line below
      # ls -l ${drawer}

      # If you have permission issues uncoment line below
      # chmod 744 ${drawer}

      #Add import
      sed -i -e "1 s|^|$import|" "./navigation/DrawerNavigator.js"

      #Put inside of nav
      sed -i -e "s|</Drawer.Navigator>|$code|" "./navigation/DrawerNavigator.js"
    fi
    ;;
    -s)
      if [[ -d "./screens" && ! -f "$path" ]]; then
        path="./screens/"${name}".js"
        #file doesnt exist and parent directory does exist
        CreateClass "$path" $name

      fi
      ;;
   -sb)
    # Screen BottomTabNavigator
      if [[ -d "./screens" && ! -f "$path" ]]; then
        path="./screens/"${name}".js"
        #file doesnt exist and parent directory does exist
        CreateClass "$path" $name
        l=${#name}
        if [[ $l -gt 6 ]]; then
          n=${name:0:$l-6}
          else
            n=$name
        fi
#         code="  <Drawer.Screen name=\""${n}"\" component={"${name}"} /> \\
# </Drawer.Navigator>"
code=" <BottomTab.Screen \\
        name=\""${n}"\" \\
        component={"${name}"} \\
        options={{ \\
        title: 'Get Started', \\
        tabBarIcon: ({ focused }) => <TabBarIcon focused={focused} name=\"md-code-working\" />,\\
        }} \\
     /> \\
 </BottomTab.Navigator>"
import="import "${name}" from '../screens/"${name}".js'; \\
"
          echo "${import}"

          # To check permissions uncoment line below
          # ls -l ${drawer}

          # If you have permission issues uncoment line below
          # chmod 744 ${drawer}

          #Add import
          sed -i -e "1 s|^|$import|" "./navigation/BottomTabNavigator.js"

          #Put inside of nav
          sed -i -e "s|</BottomTab.Navigator>|$code|" "./navigation/BottomTabNavigator.js"

        fi
        ;;
        -s)
          if [[ -d "./screens" && ! -f "$path" ]]; then
            path="./screens/"${name}".js"
            #file doesnt exist and parent directory does exist
            CreateClass "$path" $name

          fi
          ;;
       -help)
            menu
          ;;
       -config)
          echo "DrawerNavigator Delimeter (</Drawer.Navigator>)"
          read st1
          if [[ -n "$st1" ]]; then
            st11=`echo "${st1}" | sed 's:[]\[\^\$\.\*\/\>\<]:\\\\&:g'`
            sed -i -e "s|</Drawer.Navigator>|${st11}|" "./create.sh"
          fi

          echo "DrawerNavigator Path ( ./navigation/DrawerNavigator.js )"
          read st2
          if [[ -n "$st2"  ]]; then
            st22=`echo "${st2}" | sed 's:[]\[\^\$\.\*\/\>\<]:\\\\&:g'`
            sed -i -e "s|./navigation/DrawerNavigator.js|"${st22}"|" "./create.sh"
          fi

          echo "BottomTabNavigator Path ( ./navigation/BottomTabNavigator.js )"
          read st3
          if [[ -n "$st3" ]]; then
            st33=`echo "${st3}" | sed 's:[]\[\^\$\.\*\/\>\<]:\\\\&:g'`
            sed -i -e "s|./navigation/BottomTabNavigator.js.js|"${st33}"|" "./create.sh"
          fi

          echo "BottomTabNavigator Delimeter ( </BottomTab.Navigator> )"
          read st4
          if [[ -n "$st4" ]]; then
            st44=`echo "${st4}" | sed 's:[]\[\^\$\.\*\/\>\<]:\\\\&:g'`
            sed -i -e "s|</BottomTab.Navigator>|${st44}|" "./create.sh"
          fi
          ;;

  *)
    menu
    ;;
esac
