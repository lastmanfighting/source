package arm;
import arm.Main;
import iron.Trait;
import iron.Scene;
import iron.system.Input;
class PlayerReload extends Trait {
	var keyboard = Input.getKeyboard();
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Player - Reload
			if ((keyboard.started("r") && (Main.playerEquippedCurrent == Main.playerEquippedNew))) {
				for (c in Scene.active.getChildren(true)) if (c.animation != null) {
					c.animation.play(c.animation.action, Main.blendTime, Main.speed, Main.loop);
					switch (Main.playerEquippedCurrent) {
						// Pistol
						case 0: c.animation.update(Main.reloadFullPistolStart * Scene.active.raw.frame_time);
						// Rifle
						case 1: c.animation.update(Main.reloadFullRifleStart * Scene.active.raw.frame_time);
						// Sniper
						case 2: c.animation.update(Main.reloadFullSniperStart * Scene.active.raw.frame_time);
					}
				}
			}
		});
	}
}