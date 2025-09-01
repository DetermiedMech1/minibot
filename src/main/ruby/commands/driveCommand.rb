# frozen_string_literal: true

require 'java'
require_relative '../subsystems/driveSubsystem'

java_import 'edu.wpi.first.wpilibj2.command.Command'

class DriveCommand < Command
  def initialize(drive_subsystem, controller)
    super()
    @driveSubsystem = drive_subsystem
    @controller = controller
  end

  def execute
    forward = -@controller.getLeftY
    rotation = @controller.getRightX
    @driveSubsystem.arcade_drive(forward, rotation)
  end

  def end(interrupted); end

  def isFinished = false
end
