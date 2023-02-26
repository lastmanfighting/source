package arm;
import arm.Main;
import iron.Trait;
import iron.system.Input;
class PlayerSprint extends Trait {
	var keyboard = Input.getKeyboard();
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Player - Sprint
			if (keyboard.started("shift")) Main.playerSpeed *= Main.playerSprint;
			else if (keyboard.released("shift")) Main.playerSpeed /= Main.playerSprint;
		});
	}
}