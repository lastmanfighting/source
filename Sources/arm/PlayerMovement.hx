package arm;
import arm.Main;
import iron.Trait;
import iron.system.Input;
import iron.math.Vec4;
class PlayerMovement extends Trait {
	var keyboard = Input.getKeyboard();
	public function new() {
		super();
		notifyOnUpdate(function() {
			/* Player - Movement */
			// Forward
			if (keyboard.down("w") || keyboard.down("up")) Main.playerMove(new Vec4(0,Main.playerSpeed,0,1));
			// Backward
			if (keyboard.down("s") || keyboard.down("down")) Main.playerMove(new Vec4(0,-Main.playerSpeed,0,1));
			// Right
			if (keyboard.down("d") || keyboard.down("right")) Main.playerMove(new Vec4(Main.playerSpeed,0,0,1));
			// Left
			if (keyboard.down("a") || keyboard.down("left")) Main.playerMove(new Vec4(-Main.playerSpeed,0,0,1));
		});
	}
}