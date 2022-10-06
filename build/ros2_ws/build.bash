#!/bin/bash

DISTRO=$1

if [ -z "$DISTRO" ]; then
    DISTRO=humble
    echo "No distro specified, using default: ${DISTRO}"
fi

wget https://raw.githubusercontent.com/ros2/ros2/${DISTRO}/ros2.repos
vcs import src < ros2.repos

export COLCON_OPTION="colcon build --continue-on-error --install-base $(pwd)/${DISTRO}/ --packages-skip-build-finished --packages-select"
COLCON_OPTION="colcon build --continue-on-error --install-base $(pwd)/${DISTRO}/ --packages-skip-build-finished --packages-select"

BUILD=`echo "$COLCON_OPTION "{\
"osrf_pycommon osrf_testing_tools_cpp google_benchmark_vendor",\
"ament_cppcheck ament_lint ament_package gtest_vendor ament_cmake_core ament_flake8 gmock_vendor ament_cmake_export_definitions ament_cmake_export_include_directories ament_cmake_export_libraries ament_cmake_export_link_flags ament_cmake_include_directories ament_cmake_libraries ament_cmake_python ament_cmake_version ament_pep257 ament_cmake_export_dependencies ament_cmake_export_interfaces ament_cmake_export_targets ament_cmake_target_dependencies ament_cmake_test ament_copyright ament_cmake_gtest ament_cmake_pytest ament_cpplint ament_lint_auto ament_lint_cmake ament_xmllint domain_coordinator ament_cmake_gen_version_h ament_cmake_gmock ament_cmake_lint_cmake ament_cmake ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_pep257 ament_cmake_xmllint uncrustify_vendor ament_pycodestyle ament_uncrustify ament_cmake_uncrustify ament_lint_common ament_cmake_ros",\
"ament_cmake_google_benchmark ament_index_python launch launch_xml launch_yaml launch_testing mimick_vendor performance_test_fixture python_cmake_module launch_testing_ament_cmake",\
"rcutils rcpputils rcl_logging_interface",\
"pybind11_vendor rcl_logging_noop test_interface_files",\
"fastcdr iceoryx_hoofs iceoryx_posh iceoryx_binding_c cyclonedds rosidl_cli rpyutils foonathan_memory_vendor fastrtps ament_index_cpp fastrtps_cmake_module rmw_implementation_cmake rosidl_adapter rosidl_typesupport_interface rti_connext_dds_cmake_module spdlog_vendor rosidl_parser tracetools rosidl_cmake rosidl_runtime_c libyaml_vendor rmw rosidl_generator_c rosidl_runtime_cpp rosidl_typesupport_introspection_c rcl_logging_noop rcl_logging_spdlog rcl_yaml_param_parser rosidl_generator_cpp rosidl_typesupport_introspection_cpp rosidl_typesupport_fastrtps_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_c rosidl_generator_py rosidl_typesupport_cpp rosidl_default_generators rosidl_default_runtime builtin_interfaces lifecycle_msgs rmw_dds_common unique_identifier_msgs action_msgs rcl_interfaces rmw_connextdds_common rmw_cyclonedds_cpp rmw_fastrtps_shared_cpp rmw_connextdds rmw_connextddsmicro",\
"test_msgs rcl_logging_spdlog",\
"rmw_fastrtps_cpp rmw_fastrtps_dynamic_cpp",\
"rmw_implementation",\
"rcl",\
"rcl_action rcl_lifecycle",\
"statistics_msgs std_msgs geometry_msgs sensor_msgs_py tf2_msgs visualization_msgs rosgraph_msgs nav_msgs sensor_msgs",\
"eigen3_cmake_module orocos_kdl_vendor rclpy",\
"composition_interfaces tinyxml2_vendor yaml_cpp_vendor console_bridge_vendor class_loader pluginlib libstatistics_collector rclcpp",\
"tf2 rclcpp_action rclcpp_components",\
"launch_ros launch_testing_ros ros2cli",\
"ros2test ros_testing rclcpp_lifecycle",\
"message_filters tf2_ros",\
"urdfdom_headers tinyxml_vendor urdf_parser_plugin urdfdom urdf tf2_py tf2_ros_py image_transport",\
"tf2_geometry_msgs rosbag2_test_common sqlite3_vendor shared_queues_vendor",\
"rosbag2_storage rosbag2_storage_default_plugins rosbag2_cpp rosbag2_compression"\
}" &&"`

${BUILD}


echo "All packages built successfully"
unset COLCON_OPTION
exit 0
