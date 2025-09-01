# frozen_string_literal: true

require 'java'

# Import WPILib Java classes
java_import 'edu.wpi.first.wpilibj.TimedRobot'
java_import 'edu.wpi.first.wpilibj.XboxController'
java_import 'edu.wpi.first.wpilibj.drive.DifferentialDrive'
java_import 'edu.wpi.first.wpilibj.motorcontrol.PWMVictorSPX'
java_import 'edu.wpi.first.wpilibj.smartdashboard.SmartDashboard'

puts 'Defining Robot class...'

class Robot < TimedRobot
  def initialize
    super
    puts 'Robot instance created'
  end

  def robotInit
    puts "robotInit"
  end

  def robotPeriodic; end

  def autonomousInit
    puts 'Autonomous mode started'
  end

  def autonomousPeriodic; end

  def teleopInit
    puts 'Teleop mode started'
  end

  def teleopPeriodic
    speed = -@controller.get_left_y
    rotation = @controller.get_right_x

    puts "Speed: #{speed} Rotation: #{rotation})"
  end

  def disabledInit
    puts 'Robot disabled'
  end

  def disabledPeriodic; end

  def testInit
    puts 'Testing'
  end

  def testPeriodic
    # Test mode code here
  end
end

$Robot = Robot
$robot_class = Robot

Object.const_set(:ROBOT_CLASS, Robot)

Robot.new