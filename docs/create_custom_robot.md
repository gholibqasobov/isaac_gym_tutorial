# Creating Custom Robot in Fusion360

## Introduction

In robotics, we need a way to describe our robot (its shape, size, joints, and links) so that simulators and control software can use it.  
This description format is called **URDF** (Unified Robot Description Format).  



In this tutorial, you will:
<!-- TOC -->
* [Model a simple mobile robot in **Fusion360**](#model-a-simple-mobile-robot-in-fusion360)

* [Convert the design into **URDF format**](#model-a-simple-mobile-robot-in-fusion360)

* [Prepare it for use in simulators such as **Isaac Sim** or **Gazebo**](#prepare-it-for-use-in-simulators-such-as-isaac-sim-or-gazebo)
 
<!-- TOC -->


By the end, you’ll have your own robot model ready for simulation 🚀  



## Before You Start

- Make sure you have **Autodesk Fusion360** installed.    
- Have a basic understanding of sketches in Fusion360.  

---

## Rules for Creating Robots in Fusion360

When modeling a robot in Fusion360, there are a few important rules to follow so that the robot can be successfully exported to URDF and work correctly in simulation:

1. **Separate each moving part into its own body**  
   - Example: The chassis, each wheel, and the lidar should all be **separate bodies**.  

2. **Rename bodies clearly**  
   - This makes it easier to manage later.  
   - Example: `base_link`, `front_wheel_left`, `front_wheel_right`, etc.  

3. **Convert bodies into components**  
   - URDF requires components (links) rather than raw bodies.  

4. **Add joints between moving parts**  
   - For wheels, we will add **revolute joints** so that they can rotate.  

5. **Define materials for each component**  
   - Materials provide physical properties (like mass and friction) used by the simulator.  





=============================

# Model a simple mobile robot in **Fusion360**

In Fusion360, create a new sketch, and in Fusion360,

1. ### Create the chassis of the robot:
    - Start by creating a new sketch on the XY plane.

    - Draw a rectangle with dimensions 200 mm (length) × 100 mm (width).
    ![chassis sketch](/isaac_sim/data/first_sketch.png)

    - Finish the sketch.

    - Use the Extrude tool (E Key) to give the rectangle a height of 40 mm.

    - You now have the chassis box of the robot, measuring 200 × 100 × 40 mm
    ![Robot chassis sketch](/isaac_sim/data/base_link.png)

2. ### Create Axles for wheel joints:

    - On the side face of the chassis, create a new sketch.

    - Draw a circle with a diameter of 10 mm.

    - Use the Extrude tool to pull the circle outward by 5 mm. This creates a cylindrical axle for the wheel joint.

    - Repeat the process on each corner of the chassis (you should have 4 axles in total).
    ![Wheel joint sketch](/isaac_sim/data/base_link_with_joints.png)
    ![Wheel joint sketch](/isaac_sim/data/base_link_up.png)

3. ### Create the Wheels:
    - Select the front face of one axle and create a new sketch on it.
    - Draw a circle with a diameter of 80 mm. This will define the wheel’s outer edge.
    - Use the Extrude tool to pull the circle outward by 20 mm.
    ![Wheel sketch](/isaac_sim/data/add_wheel.png)
    - In the Extrude settings, set the operation to New Body (not Join). This ensures the wheel is treated as a separate part, which is required for URDF export. Finish the sketch
    - Repeat for remaining axles
    ![Wheels and chassis](/isaac_sim/data/bodies.png)
    - After finishing you should have 5 separate bodies in your design


4. ### Add Lidar: To make easier to track robot heading 
    - Select the top face of the chassis and create a new sketch.
    - Draw a circle with a radius of 25 mm (diameter = 50 mm).
    - Use the Extrude tool (E) to pull the circle upward by 20 mm.
    ![Lidar and wheel stripes](/isaac_sim/data/add_all_wheels.png)

5. ### Add Wheel Stripes: To track wheel rotation in simulation
    - Select the outer face of one wheel and create a new sketch.
    - Draw a thin box (for example: 6 mm wide × 10 mm tall × 3mm high) from the center of the wheel.
    - Repeat this process for each wheel.
    ![Lidar and wheel stripes](/isaac_sim/data/add_bars_to_wheels.png)

6. ### Rename the Bodies
    - In the Browser panel (left-hand side of Fusion360), expand the Bodies folder.

    - Right-click on each body and rename it to something meaningful.
    - In my case:
        ```
        Body1 → base_link (the main chassis)

        Body2 → front_wheel_right

        Body3 → front_wheel_left

        Body4 → rear_wheel_right

        Body5 → rear_wheel_left
        ```
7. ### Create Components from Bodies 
    - Right-click on Bodies folder
    - Select “Create Components from Bodies”.
    ![components ](/isaac_sim/data/renamed_components.png)



# Add revolute joints to robot

1. ### Let's add revolute joints to each wheel, so that it was able to ratate
    - Press J on your keyboard to open the Joint tool. (English Keyboard).   Alternatively, you can access it from the Assemble → Joint menu.

    - Define the Joint for a Wheel
        ```
        Select Component 1 → Click on the center (origin) of the wheel.

        Select Component 2 → Click on the origin of the corresponding axle (on the chassis).
        ```

    - In the Joint Type options, select Revolute.
    ![add revolute joints ](/isaac_sim/data/how_add_rev_joint.gif)

    -  Repeat for All Wheels


2. ### Assign Materials to the Robot
    - In the **Browser panel**, right-click on any component (e.g., `base_link`) and select **Physical Material**.  
    - In the **Physical Material window**, drag and drop materials from the library onto the robot’s parts:  
        - `base_link` → Metal (e.g., Aluminum or Steel)  
        - Wheels → Rubber (or ABS Plastic for rims)  
    - Repeat the process for all components until each has a defined material.  
     ![add materials ](/isaac_sim/data/add_materials.png)



## We have finished Modeling the Robot

![overall model ](/isaac_sim/data/progress_video-custom_robot.gif)


---


# Convert the design into **URDF format**

Now, As the robot is ready, let's install the fusion2 urdf add-in:

## Install Fusion2URDF Add-In

1. Go to the fusion2urdf GitHub page: [https://github.com/syuntoku14/fusion2urdf](https://github.com/syuntoku14/fusion2urdf) 

2. Click the green **Code** button.  

3. In the dropdown, select **Download ZIP**

![download add-in ](/isaac_sim/data/download_addin.png)


### Step 8: Install fusion2urdf Add-in

Run the following commands in your shell, depending on your operating system:  

#### Windows (PowerShell)
```powershell
cd <path to fusion2urdf>

Copy-Item ".\URDF_Exporter\" -Destination "${env:APPDATA}\Autodesk\Autodesk Fusion 360\API\Scripts\" -Recurse
```

#### macOS (bash or zsh)
```powershell
cd <path to fusion2urdf>

cp -r ./URDF_Exporter "$HOME/Library/Application Support/Autodesk/Autodesk Fusion 360/API/Scripts/"
```

---
## Export Robot as URDF
As you have installed the Fusion2URDF add-in: 

1. In Fusion 360, go to **Utilities → Add-Ins → Scripts and Add-Ins**.  
2. From the list, select **URDF_Exporter**.  
3. Choose the export directory where you want to save your URDF files.  
4. Save the settings.  
5. You should see a confirmation message indicating that the URDF was installed successfully.  
![download add-in ](/isaac_sim/data/use_addin.png)

---
# Prepare it for use in simulators such as **Isaac Sim** or **Gazebo**

One Last Step left:

### Finalize the URDF

1. Navigate to the directory where you saved the robot description.  
2. Inside the **urdf/** folder, locate the exported file.  
3. Change the file extension from **.xacro** to **.urdf**.  

---

# ✅ Now your robot model is ready!
