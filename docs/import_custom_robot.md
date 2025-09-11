Open and Start the Isaac Sim. 

```
cd ~/isaacsim
./isaac-sim.selector.sh
```


Open
File -> Import -> (Robot URDF File) -> click the robot

Before importing the model, modify the following parameters:
- Links: Movable Base (Mobile Robot), Static Base (Manipulator)
- Joint Configuration: Stiffness
- In the Table:
 - Target: Velocity (Mobile Robot), Position (Manipulator)


As you have modified the settings based on the type of your robot,
Import the Model


Let's add some environment as reference:

Click on Isaac Sim Assets [Beta] -> Environments -> flat_plane

Load as reference


Let's lift the robot, to the ground

