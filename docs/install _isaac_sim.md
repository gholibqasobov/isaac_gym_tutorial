# Installing and Launching Isaac Sim

## Introduction

In this guide, we will walk you through the process of installing NVIDIA Isaac Sim on both Linux and Windows platforms. Isaac Sim is a powerful simulation tool designed for robotics development, enabling users to test and validate their robots in realistic virtual environments. 



## Before You Start

Before installing Isaac Sim, it is important to ensure your computer meets the minimum system requirements.



To verify compatibility, you can use the **Isaac Sim Compatibility Checker** provided by NVIDIA. 

![Robot chassis sketch](/isaac_sim/data/install_isaac_sim//compatability_checker.png)

You can download and run the compatibility checker from the following link:  
[https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/install_workstation.html#isaac-sim-compatibility-checker](https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/install_workstation.html#isaac-sim-compatibility-checker)

---



### In this tutorial, we will:

<!-- TOC -->
* [Install Isaac Sim in Linux](#install-isaac-sim-in-linux)
* [Install Isaac Sim in Windows](#install-isaac-sim-in-windows)
* [Launch Isaac Sim](#launch-isaac-sim)
* Quick Start Guide
<!-- TOC -->




By the end of this guide, you will have a fully operational Isaac Sim environment, ready to simulate and experiment with various robotic applications.  



<br><br>
# Install Isaac Sim in Linux

1. ### Download Isaac Sim:
    - Visit the official NVIDIA Isaac Sim download page to get the latest version for Linux:

        [https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/download.html](https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/download.html)

        ![Install Isaac Sim](/isaac_sim/data/install_isaac_sim/isaac_sim_lv_install.png)


2. ### Install Isaac Sim:

    - After downloading, open a terminal (CTRL + ALT + T), and run these commands to create an Isaac Sim folder, unzip the archive, and install it:
        - Create a new folder for Isaac Sim:

            ```powershell
            mkdir ~/isaacsim
            ```
        - Navigate to your Downloads folder:
            ```powershell
            cd ~/Downloads
            ```
        - Unzip the downloaded file into the new folder:  
            ```powershell
            unzip "isaac-sim-standalone-5.0.0-linux-x86_64.zip" -d ~/isaacsim
            ```
        - Run post-installation script:
            ```powershell
            cd ~/isaacsim
            ./post_install.sh
            ```
        > **Note:** The zip file name may vary depending on the Isaac Sim version you download. Adjust the command accordingly.

<br><br>

# Install Isaac Sim in Windows

1. ### Download Isaac Sim:
    - Visit the official NVIDIA Isaac Sim download page to get the latest version for Windows:

        [https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/download.html](https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/download.html)

        ![Install Isaac Sim](/isaac_sim/data/install_isaac_sim/isaac_sim_lv_install.png)


2. ### Install Isaac Sim:

    - After downloading, open a terminal (Press `Win + R`, type `cmd`, and press Enter), and run these commands to create an Isaac Sim folder, unzip the archive, and install it:
        - Create a new folder for Isaac Sim:

            ```powershell
            mkdir C:\isaacsim
            ```
        - Navigate to your Downloads folder:
            ```powershell
            cd %USERPROFILE%\Downloads
            ```
        - Unzip the downloaded file into the new folder:  
            ```powershell
            tar -xvzf "isaac-sim-standalone-5.0.0-windows-x86_64.zip" -C C:\isaacsim
            ```
        - Run post-installation script:
            ```powershell
            cd C:\isaacsim
            post_install.bat
            ```
        > **Note:** The zip file name may vary depending on the Isaac Sim version you download. Adjust the command accordingly.

<br><br>
        
# Launch Isaac Sim

After completing the installation and post-installation steps, you can launch Isaac Sim by following the instructions for your operating system.


1. ### Linux
    ```powershell
    cd ~/isaacsim
    ./isaac-sim.selector.sh
    ```


2. ### Windows

    ```powershell
    cd C:\isaacsim
    isaac-sim.selector.bat
    ```
    > Note: On Windows, you can launch Isaac Sim by double-clicking the `isaac-sim.selector.bat` file in the installation folder.  
    > If needed, right-click and select **Run as administrator** to avoid permission issues.



<br><br>
# Quick Start Guide

Now that you have successfully installed Isaac Sim, let’s run an example using a differential drive robot from the library and teleoperate it with your keyboard using action graphs.

* First of all, open Isaac Sim according to your Operation System, if you haven't already.
        <br><br>
         ![start-isaac-sim](/isaac_sim/data/install_isaac_sim/start_isaac_sim.png)
    <br><br>
    > **Note:** The first time you launch Isaac Sim and run the example robot, it may take longer to start. You might see a message saying "Isaac Sim is not responding." Please be patient and avoid clicking anything - this should resolve itself after a short while.
        ![start-isaac-sim](/isaac_sim/data/install_isaac_sim/wait_isaac_sim.png)


## Overview of Isaac Sim
If the app was launched successfully, you should see the following:

![isaac-sim-overview](/isaac_sim/data/install_isaac_sim/isaac_sim_overview.png)

> You can learn more about Isaac Sim and how to use it by visiting the official documentation: https://docs.isaacsim.omniverse.nvidia.com/5.0.0/introduction/quickstart_isaacsim.html 

In this tutorial we wil focus on using a differential drive robot from the library.

---
### 1. Accessing the Isaac Sim Asset Library

To use example robots and environments from the Isaac Sim library:

1. On the **top-left toolbar**, go to `Window` → `Browsers` → click on **Isaac Sim Assets**.

2. A panel titled **Isaac Sim Assets [Beta] - Terminal** will appear at the bottom of the screen.

![library-assets](/isaac_sim/data/install_isaac_sim/import_library.png)

This asset browser gives you access to a rich library of pre-built content including:

- Robots
- Environments
- Sensors
- Materials
- And more


### 2. Loading an Environment

1. In the **Isaac Sim Assets [Beta]** panel, navigate to the `Environments` folder.

2. Browse the list and choose an environment suitable for your robot (e.g., a simple warehouse or flat ground).

3. Click on the environment asset to select it.

4. Then click the **"Load as Reference"** button.

![imoprt-env](/isaac_sim/data/install_isaac_sim/import_env.png)

5. After environment was loaded, you might see a blurry image of the environment. 
    - Navigate to Top-Left panel, and change from `RTX-Real-Time` to `RTX-Interactive (Path Tracing)`
![imoprt-env](/isaac_sim/data/install_isaac_sim/resolve_blurry_image.png)



### 3. Loading a Robot

1. In the **Isaac Sim Assets [Beta]** panel, navigate to the `Robots` folder.

2. Browse the list, choose a robot, and load as reference.
    - In this tutorial, for sake of simplicity, choose 2-wheel differential drive robot. Ex: jetbot

3. Then click the **"Load as Reference"** button.

![imoprt-env](/isaac_sim/data/install_isaac_sim/load_robot.png)


### 4. Teleoperating the Robot with Keyboard

Now, as we have the robot loaded, let's operate it using keyboard

![imoprt-env](/isaac_sim/data/install_isaac_sim/robot_preview.png)
---
1. First of all, if the robot has a camera fixed to it, hide it by
    - click on the camera
    - on the right panel, a tree of robot will expand
    - clock on the `eye` sign besides the `jetbot_camera`
    ![imoprt-env](/isaac_sim/data/install_isaac_sim/hide-camera.png)
    - now, the camera should be invisible.
    ![imoprt-env](/isaac_sim/data/install_isaac_sim/robot_preview_wt_camera.png)


---
2. Let's run the simulation
    - Click and drag the directional arrows to move the robot along the X, Y, or Z axes.
    ![imoprt-env](/isaac_sim/data/install_isaac_sim/transform_robot.gif)
    - Position the robot above the ground.
    - Click `Play` Simulation to see the robot fall.
    - Click `Stop` Simulation to end the simulation.

---

3. Add Differential-Drive Controller:
    - On the **top-left toolbar**, go to `Tools` → `Robotics` → `OmniGraph Controllers` → click on `Differential Controller`.
    ![imoprt-env](/isaac_sim/data/install_isaac_sim/add_diff_controller.png)
    - As `Robot Prim`: `jetbot` (or your custom robot)
    - `wheel radius`: 0.05 (in meters)
    - `distance between wheels`: 0.1 (in meters)
    - Tick `Use Keyboard Control (WASD)`: ticked
    - Click `OK`
    ![imoprt-env](/isaac_sim/data/install_isaac_sim/robot_diff_controller_graph.png)

    - Now you can see a `differential_controller` graph appear in `Graphs` folder
    - Open the graph to view. Right click on `differential_controller`, choose `Open Graph`
     ![imoprt-env](/isaac_sim/data/install_isaac_sim/view_graph.png)
    - Now you can view the graph that was created to control the robot using keyboard inputs.

---

4. Controlling Robot with Keyboard

    Now you are ready to start operating your robot with keyboard. For this:
    - Click `Play` Simulation see the robot fall.
    - Use `W, A, S, D` Keys in Keyboard to control the robot.
    - When you have finished, click `Stop` Simulation to end the simulation.

    ![imoprt-env](/isaac_sim/data/install_isaac_sim/move_robot.gif)

---


# ✅ You are ready to go!
