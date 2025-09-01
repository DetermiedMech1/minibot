# frozen_string_literal: true

require 'java'
require_relative 'robotContainer'
require_relative 'commands/driveCommand'

# Import WPILib Java classes
java_import 'edu.wpi.first.wpilibj.TimedRobot'
java_import 'edu.wpi.first.wpilibj2.command.Command'
java_import 'edu.wpi.first.wpilibj2.command.CommandScheduler'

puts 'Defining Robot class...'

class Robot < TimedRobot
  def initialize
    super
    puts 'Robot instance created'
  end

  def robot_init
    @robot_container = RobotContainer.new

    @drive_command = @robot_container.getDriveCommand
  end

  def robot_periodic
    CommandScheduler.getInstance.run
  end

  def teleop_init
    @drive_command.schedule
  end

  def teleop_periodic; end

  alias teleopPeriodic teleop_periodic
  alias teleopInit teleop_init
  alias robotInit robot_init 
  alias robotPeriodic robot_periodic
end

$Robot = Robot
$robot_class = Robot

Object.const_set(:ROBOT_CLASS, Robot)

Robot.new
