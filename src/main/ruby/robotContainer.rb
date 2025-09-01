# frozen_string_literal: true

require_relative 'subsystems/driveSubsystem'
require_relative 'commands/driveCommand'

java_import 'edu.wpi.first.wpilibj2.command.button.CommandXboxController'

class RobotContainer

  def initialize
    @drive_subsystem = DriveSubsystem.new
    @drive_command = DriveCommand.new(@drive_subsystem, CommandXboxController.new(0))
  end

  def getDriveCommand = @drive_command

  def getDriveSubsystem = @drive_subsystem
end
