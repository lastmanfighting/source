package arm;
import iron.Trait;
import iron.Scene;
import kha.FastFloat;
import iron.math.Vec4;
import iron.math.Quat;
import iron.system.Time;
import iron.system.Input;
import iron.object.Object;
import iron.object.Animation;
import armory.trait.physics.RigidBody;
using armory.object.TransformExtension;
import armory.trait.internal.CanvasScript;
class Main extends Trait {
	/* Variables */
	// Canvas
	public static var canvas: CanvasScript;
	// // Objects
	public static var objectPlayerBody: Object;
	public static var objectPlayerCamera: Object;
	public static var objectPlayerArmaturePistol: Object;
	public static var objectPlayerArmatureRifle: Object;
	public static var objectPlayerArmatureSniper: Object;
	public static var objectPlayerWeapons: Array<Object>;
	// Animation Attributes
	public static var blendTime: Float = 1.0;
	public static var speed: Float = 1.0;
	public static var loop: Bool = false;
	/* Animation Frames */
	public static var idleStart = 0;
	public static var fireStart = 1;
	// Pistol
	public static var firePistolEnd = 14;
	public static var reloadFullPistolStart = 70;
	public static var reloadFullPistolEnd = 157;
	public static var hidePistolStart = 158;
	public static var hidePistolEnd = 170;
	public static var readyPistolStart = 171;
	public static var readyPistolEnd = 218;
	public static var ambientPistolStart = 219;
	public static var ambientPistolEnd = 248;
	public static var meleePistolStart = 249;
	public static var meleePistolEnd = 269;
	// Rifle
	public static var fireRifleEnd = 7;
	public static var reloadFullRifleStart = 8;
	public static var reloadFullRifleEnd = 88;
	public static var hideRifleStart = 151;
	public static var hideRifleEnd = 162;
	public static var readyRifleStart = 163;
	public static var readyRifleEnd = 198;
	public static var ambientRifleStart = 199;
	public static var ambientRifleEnd = 228;
	public static var meleeRifleStart = 229;
	public static var meleeRifleEnd = 248;
	// Sniper
	public static var fireSniperEnd = 11;
	public static var reloadFullSniperStart = 61;
	public static var reloadFullSniperEnd = 115;
	public static var hideSniperStart = 116;
	public static var hideSniperEnd = 127;
	public static var readySniperStart = 128;
	public static var readySniperEnd = 142;
	public static var ambientSniperStart = 143;
	public static var ambientSniperEnd = 165;
	public static var meleeSniperStart = 166;
	public static var meleeSniperEnd = 194;
	// Player Attributes
	public static var playerLookSensitivity = 0.1;
	public static var playerSpeed = 16 * Time.delta;
	public static var playerSprint = 128 * Time.delta;
	public static var playerEquippedCurrent = 2; // (0) Pistol | (1) Rifle | (2) Sniper 
	public static var playerEquippedNew = 2;
	public static var playerFireTimerLength = 30;
	public static var playerFireTimerCurrent = 0;
	public static var playerSwitchTimerLength = 120;
	public static var playerSwitchTimerCurrent = 0;
	public static var playerCursorState = false;
	// Player Rotation
	public static var toDEG: FastFloat = 57.29577951308232;
	public static var q1 = new Quat();
	public static var q2 = new Quat();
	public static var input_cache = new Quat();
	public static var euler_cache = new Vec4();
	public function new() {
		super();
		notifyOnInit(function() {
			// Initialize References
			objectPlayerBody = Scene.active.getChild("PLAYER_BODY");
			objectPlayerCamera = Scene.active.getChild("PLAYER_CAMERA");
			objectPlayerWeapons = [
				Scene.active.getChild("PLAYER_ARMATURE_PISTOL"),
				Scene.active.getChild("PLAYER_ARMATURE_RIFLE"),
				Scene.active.getChild("PLAYER_ARMATURE_SNIPER")
			];
			canvas = CanvasScript.getActiveCanvas();
		});
	}
	/* Functions */
	// Toggle - Window Active
	public static function cursorVisible(b: Bool) {
		var mouse = Input.getMouse();
		if (b) mouse.show();
		else mouse.hide();
		mouse.hidden ? mouse.lock() : mouse.unlock();
	}
	public static function playerSetEquippedStart(w: Int) {
		// Set New Equipped
		Main.playerEquippedNew = w;
		// Play First-Half Switch Animation
		switch(Main.playerEquippedCurrent) {
			case 0: playAction(hidePistolStart);
			case 1: playAction(hideRifleStart);
			case 2: playAction(hideSniperStart);
		}
	}
	public static function playerSetEquippedEnd() {
		// Set Current Equipped
		playerEquippedCurrent = playerEquippedNew;
		// Reset To Idle Animation
		playAction(Main.idleStart);
		// Set Inactive
		// Parent
		for (c1 in objectPlayerWeapons) {
			c1.visible = false;
			// Children
			for (c2 in c1.getChildren(true)) c2.visible = false;
		}
		// Set Active
		objectPlayerWeapons[playerEquippedCurrent].visible = true;
		for (c in objectPlayerWeapons[playerEquippedCurrent].getChildren(true)) c.visible = true;
	}
	// Animation - Play
	public static function playAction(f: Int) {
		for (c in Scene.active.getChildren(true)) if (c.animation != null) {
			c.animation.play(c.animation.action, blendTime, speed, loop);
			c.animation.update(f * Scene.active.raw.frame_time);
		}
	}
	// Player - Sync Physics
	public static function syncPhysics(o: Object) {
		o.transform.buildMatrix();
		var rb = o.getTrait(RigidBody);
		if (rb != null) rb.syncTransform();
	}
	// Player - Move
	public static function playerMove(v: Vec4) {
		objectPlayerBody.transform.loc.add(objectPlayerBody.transform.worldVecToOrientation(v));
		syncPhysics(objectPlayerBody);
	}
}