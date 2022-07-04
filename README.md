# rpi-bullseye-ROS2

Build ROS2-Humble for Raspbian-bullseye

Scripts for build ROS2 to running on Raspbian.

> Note: Compiled for Raspbian-bullseye (32bit)

## Support

| Version | aarch64 | arm7l |
| --- | --- | --- |
| humble | ✔ | ✔ |
| galactic | | ✔ |

- RViz : ❌
- rosbag : ❌
- rqt : ❌


## Install

On Raspberry Pi Bullseye, run only following command.

```bash
curl -s https://raw.githubusercontent.com/Ar-Ray-code/rpi-bullseye-ros2/main/install.bash | bash
```

Load ROS2

```bash
source /opt/ros/humble/setup.bash
```

## Build (Package exclusions)

```bash
export ROS_INSTALL_DIR=~/ros2_install
colcon build --continue-on-error --install-base $ROS_INSTALL_DIR --packages-skip-up-to rviz_ogre_vendor rviz_rendering rviz_common rviz_rendering_tests rviz_visual_testing_framework rviz2 rosbag2_transpor rosbag2_transport rosbag2_py ros2bag rqt_bag
```

## About author

- author : [Ar-Ray](https://github.com/Ar-Ray-code)
- [Twitter](https://twitter.com/Ray255Ar)
