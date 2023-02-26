package arm;
import arm.Main;
import iron.Trait;
import kha.FastFloat;
import iron.math.Quat;
import iron.math.Vec4;
import iron.system.Time;
import iron.system.Input;
class PlayerLook extends Trait {
	public function new() {
		var mouse = Input.getMouse();
		var keyboard = Input.getKeyboard();
		super();
		notifyOnUpdate(function() {
			// Window - Toggle Active
			if (keyboard.started("escape")) Main.cursorVisible(true);
			if (mouse.started("left")) Main.cursorVisible(false);
			/* Player - Look */
			// Player - Body
			var multX: FastFloat = -Main.playerLookSensitivity * Time.delta;
			Main.q1.z = mouse.movementX * multX;
			Main.q1.normalize();
			Main.objectPlayerBody.transform.rot.mult(Main.q1);
			Main.syncPhysics(Main.objectPlayerBody);
			// Player - Camera
			var multY: FastFloat = -Main.playerLookSensitivity * Time.delta;
			Main.q2.x = mouse.movementY * multY;
			Main.q2.normalize();
			Main.objectPlayerCamera.transform.rot.mult(Main.q2);
			Main.syncPhysics(Main.objectPlayerCamera);
			/* MouseLook - Cap */
			var qc1 = Main.objectPlayerCamera.transform.rot;
			qc1.normalize();
			if (qc1 != Main.input_cache) Main.euler_cache = qc1.toEulerOrdered("XYZ");
			var deg = new Vec4(Main.euler_cache.x*Main.toDEG, Main.euler_cache.y*Main.toDEG, Main.euler_cache.z*Main.toDEG);
			// Cap Upward
			if (deg.x <= -90.0) {
				var qc2 = new Quat();
				qc2.x += 360.0;
				qc2.normalize();
				Main.objectPlayerCamera.transform.rot.setFrom(qc2);
				Main.objectPlayerCamera.transform.buildMatrix();
			}
			// Cap Downard
			if (deg.x <= 0 && deg.x >= -90) {
				var qc2 = new Quat();
				var value = qc2.x;
				var min = 0.0;
				var max = 180.0;
				value < min ? min : value > max ? max : value;
				qc2.normalize();
				Main.objectPlayerCamera.transform.rot.setFrom(qc2);
				Main.objectPlayerCamera.transform.buildMatrix();
			}
		});
	}
}