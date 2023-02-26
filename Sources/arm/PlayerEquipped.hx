package arm;
import arm.Main;
import iron.Trait;
import iron.system.Input;
class PlayerEquipped extends Trait {
	var keyboard = Input.getKeyboard();
	public function new() {
		super();
		notifyOnInit(function() {
			// Get Default
			Main.playerSetEquippedEnd();
		});
		notifyOnUpdate(function() {
			/* Player - Set Equipped */
			// Pistol
			if (keyboard.started("1")) Main.playerSetEquippedStart(0);
			// Rifle
			if (keyboard.started("2")) Main.playerSetEquippedStart(1);
			// Sniper
			if (keyboard.started("3")) Main.playerSetEquippedStart(2);
		});
	}
}