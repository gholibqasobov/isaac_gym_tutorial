You will learn to create your own (Mobile) Robot and Convert to URDF in Fusion360

It is assumed that You have Fusion360 installed

There are several rules for creating the robot, in order to correctly transform it from Fusion360 to URDF

in Fusion360,

1. Create the chassis of the robot:
    - create a rectangle (200x100)
    - create axles for wheel joints (10x5)

2. On one of the wheel joints, create the wheel as a New Body (Important)
    - crate a new sketch on the face of wheel joint
    - create the wheel (as a new body) (80x20)
    - repeat for all the joints
    - In the end you should have 5 bodies as depicted in the picture

3. Let's add a lider in order to define the head of the robot
    - create a new sketch on top of the robot body
    - add a circle of radius 25, and height of 20

4. Create Components from Bodies
    - Rename the Bodies if necessary 
        - in my case it was renamed to 
            - Body1 -> base_link
            - Body2 -> front_wheel_right
            - Body3 -> front_wheel_left
            - Body4 -> rear_wheel_right
            - Body5 -> rear_wheel_left
    - Right Click on Bodies -> Create Components from Bodies


5. Let's add revolute joints to each wheel, so that it was able to ratate
    - Press "J" in your keyboard (works only in English keyboard)
    - As Component 1 choose Inner Origin of Wheel, As Component 2, choose origine mode of body joint, Revolute, and save
    - Repeat for all the wheels


6. As a final step, we should define the materials for the robot:
    - Right click on any component (base_link, as an example) -> Physical Material
    - Add materials to wheels an chassis of the robot




Now, As the robot is ready, let's install the fusion2 urdf add-in:


1. Open the following link:
https://github.com/syuntoku14/fusion2urdf

and download it as zip file, unzip it

2. Installation
Run the following commands in Your Shell

Windows (in PowerShell)

```
cd <path to fusion2urdf>
Copy-Item ".\URDF_Exporter\" -Destination "${env:APPDATA}\Autodesk\Autodesk Fusion 360\API\Scripts\" -Recurse
```

masOS (in bash or zsh)

```
cd <path to fusion2urdf>
cp -r ./URDF_Exporter "$HOME/Library/Application Support/Autodesk/Autodesk Fusion 360/API/Scripts/"
```


In Fusion
- Navigate to Utilities -> Add-Ins -> Scripts and Add-Ins
- From the list, click URDF_Exporter, choose the directory, and save
- You must the a message indicating the URDF was installed successfully

One last step,

Navigate to the directory, where you saved the robot description
- In urdf/ directory , change robot extionsion from .xacro  to .urdf


Now, you are setup to import the robot to Isaac Sim