package arm;
import arm.Main;
import iron.Trait;
import iron.system.Input;
class PlayerFire extends Trait {
	var mouse = Input.getMouse();
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Player - Fire Rate
			if (Main.playerFireTimerCurrent > 0) Main.playerFireTimerCurrent--;
			// Player - Fire
			if ((mouse.down("left")) && (Main.playerEquippedCurrent > -1) && (Main.playerEquippedCurrent == Main.playerEquippedNew)) {
				Main.cursorVisible(false);
				if (Main.playerFireTimerCurrent == 0) {
					Main.playAction(Main.fireStart);
					Main.playerFireTimerCurrent = Main.playerFireTimerLength;
				}
			}
		});
	}
}