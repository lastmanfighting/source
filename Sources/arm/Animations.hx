package arm;
import arm.Main;
import iron.Trait;
import iron.Scene;
import iron.system.Input;
class Animations extends Trait {
	public function new() {
		super();
		notifyOnInit(function() {
			for (c in Scene.active.getChildren(true)) if (c.animation != null) c.animation.play(0);
		});
		notifyOnUpdate(function() {
			/* Animation Frames */
			/*
				// Pistol
					• 0-14 fire (0 -> 1)
					• 15-96 reload mag
					• 70-157 reload full
					• 158-170 hide
					• 170-218 ready (170 -> 171)
					• 219-248 ambient
					• 249-270 melee (270 -> 269)
				// Rifle
					• fire > 0-7 (0 -> 1)
					• reload full > 8-88
					• reloadclip > 89-150
					• hide > 151-162
					• ready > 162-198 (162 -> 163)
					• ambient > 199-228
					• melee > 229-249 (249 -> 248)
				// Sniper
					• 0-11 fire (0 -> 1)
					• 12-60 bolt action
					• 61-115 reload mag
					• 116-127 - hide (127 -> 128)
					• 127-142 ready
					• 143-165 ambient
					• 166-195 melee (195 -> 194)
			*/
			/* Manager - Animations */
			for (c in Scene.active.getChildren(true)) if (c.animation != null) {
				if (c.animation.currentFrame() == 0 && (Main.playerEquippedCurrent == Main.playerEquippedNew)) c.animation.setFrame(Main.idleStart);
				switch (Main.playerEquippedCurrent) {
					// Pistol
					case 0:
						// Idle
						// Fire
						if (c.animation.currentFrame() == Main.firePistolEnd) c.animation.setFrame(Main.idleStart);
						// Reload Full
						if (c.animation.currentFrame() == Main.reloadFullPistolEnd) c.animation.setFrame(Main.idleStart);
						// Hide
						if (c.animation.currentFrame() == Main.hidePistolEnd) Main.playAction(Main.readyPistolStart);
						// Ready
						if (c.animation.currentFrame() == Main.readyPistolEnd) Main.playerSetEquippedEnd();
						// Walk
						if (c.animation.currentFrame() == Main.ambientPistolEnd) c.animation.setFrame(Main.ambientPistolStart);
						// Melee
						if (c.animation.currentFrame() == Main.meleePistolEnd) c.animation.setFrame(Main.idleStart);
					// Rifle
					case 1:
						// Fire
						if (c.animation.currentFrame() == Main.fireRifleEnd) c.animation.setFrame(Main.idleStart);
						// Reload Full
						if (c.animation.currentFrame() == Main.reloadFullRifleEnd) c.animation.setFrame(Main.idleStart);
						// Hide
						if (c.animation.currentFrame() == Main.hideRifleEnd) Main.playAction(Main.readyRifleStart);
						// Ready
						if (c.animation.currentFrame() == Main.readyRifleEnd) Main.playerSetEquippedEnd();
						// Idle
						if (c.animation.currentFrame() == Main.ambientRifleEnd) c.animation.setFrame(Main.ambientRifleStart);
						// Melee
						if (c.animation.currentFrame() == Main.meleeRifleEnd) c.animation.setFrame(Main.idleStart);
					// Sniper
					case 2:
						// Fire
						if (c.animation.currentFrame() == Main.fireSniperEnd) c.animation.setFrame(Main.idleStart);
						// Reload Full
						if (c.animation.currentFrame() == Main.reloadFullSniperEnd) c.animation.setFrame(Main.idleStart);
						// Hide
						if (c.animation.currentFrame() == Main.hideSniperEnd) Main.playAction(Main.readySniperStart);
						// Ready
						if (c.animation.currentFrame() == Main.readySniperEnd) Main.playerSetEquippedEnd();
						// Idle
						if (c.animation.currentFrame() == Main.ambientSniperEnd) c.animation.setFrame(Main.ambientSniperStart);
						// Melee
						if (c.animation.currentFrame() == Main.meleeSniperEnd) c.animation.setFrame(Main.idleStart);
				}
			}
		});
	}
}