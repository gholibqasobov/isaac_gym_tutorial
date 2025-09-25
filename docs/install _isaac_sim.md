Follow the following link, and install the latest version of isaac sim. (insert picture)
https://docs.isaacsim.omniverse.nvidia.com/5.0.0/installation/download.html

Download the latest version



Create a new folder named isaacsim and unzip it there:

```
mkdir ~/isaacsim
cd ~/Downloads
unzip "isaac-sim-standalone-5.0.0-linux-x86_64.zip" -d ~/isaacsim
```

Install the isaac sim:

```
cd ~/isaacsim
./post_install.sh
```


Open and Start the Isaac Sim. 

```
cd ~/isaacsim
./isaac-sim.selector.sh
```

(Picture of isaac sim)


========================================================================================

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






=============================
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

#### macOS (powershell or zsh)
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
