package arm;
import arm.Main;
import iron.Trait;
import iron.system.Input;
class PlayerMelee extends Trait {
	var keyboard = Input.getKeyboard();
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Player - Melee
			if ((keyboard.started("f")) && (Main.playerEquippedCurrent == Main.playerEquippedNew)) {
				switch (Main.playerEquippedCurrent) {
					// Pistol
					case 0: Main.playAction(Main.meleePistolStart);
					// Rifle
					case 1: Main.playAction(Main.meleeRifleStart);
					// Sniper
					case 2: Main.playAction(Main.meleeSniperStart);
				}
			}
		});
	}
}