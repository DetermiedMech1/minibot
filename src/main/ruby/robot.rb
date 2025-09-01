# frozen_string_literal: true

#ruby imports
require 'java'
require_relative 'robotContainer'
require_relative 'commands/driveCommand'

#java imports
java_import 'edu.wpi.first.wpilibj.TimedRobot'
java_import 'edu.wpi.first.wpilibj2.command.Command'
java_import 'edu.wpi.first.wpilibj2.command.CommandScheduler'

class Robot < TimedRobot
  def initialize = super

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

  #rubocop won't stop yapping about snake_case 
  #but java wants camelCase
  alias teleopInit teleop_init
  alias robotInit robot_init 
  alias robotPeriodic robot_periodic
end

$Robot = Robot
$robot_class = Robot
Object.const_set(:ROBOT_CLASS, Robot)

Robot.new
