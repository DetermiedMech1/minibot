# frozen_string_literal: true

java_import 'com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX'
java_import 'edu.wpi.first.wpilibj.drive.DifferentialDrive'
java_import 'edu.wpi.first.wpilibj.smartdashboard.SmartDashboard'
java_import 'edu.wpi.first.wpilibj2.command.SubsystemBase'

class DriveSubsystem < SubsystemBase
  def initialize
    super
    @left_motor = WPI_TalonSRX.new(0)  # Replace with actual CAN ID
    @right_motor = WPI_TalonSRX.new(1) # Replace with actual CAN ID

    @left_motor.configOpenloopRamp(0.25)
    @right_motor.configOpenloopRamp(0.25)

    @left_motor.setInverted(true)
    @right_motor.setInverted(false)

    @drive = DifferentialDrive.new(@left_motor, @right_motor)
  end

  def arcade_drive(forward, rotation)
    @drive.arcadeDrive(forward, rotation)
  end
end
