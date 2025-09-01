package frc.robot;

import edu.wpi.first.wpilibj.RobotBase;

import java.io.IOException;
import org.jruby.embed.PathType;
import org.jruby.embed.ScriptingContainer;

public final class Main {
    private Main() {
    }

    public static void main(String... args) throws IOException {
        ScriptingContainer container = new ScriptingContainer();

        Object robot = container.runScriptlet(PathType.RELATIVE, "src/main/ruby/robot.rb");
        RobotBase.startRobot(() -> (RobotBase) robot);
    }
}