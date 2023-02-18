package arm;
import kha.Color;
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
class Game extends Trait {
	/* Variables */
	// Canvas
	var canvas: CanvasScript;
	// Scene - Objects
	var objectPlayerBody = Scene.active.getChild("PLAYER_BODY");
	var objectPlayerCamera = Scene.active.getChild("PLAYER_CAMERA");
	var objectPlayerArmature = Scene.active.getChild("Main");
	// Arguments - Animation
	var blendTime: Float = 0.25;
	var speed: Float = 1.0;
	var loop: Bool = false;
	// Attributes - Player
	var playerLookSensitivity = 0.1;
	var playerSpeed = 32 * Time.delta;
	var playerEquipped = true;
	var playerFireDelayLength = 30;
	var playerFireDelayCurrent = 0;
	var playerCursorState = false;
	// Shorthand
	var keyboard = Input.getKeyboard();
	var mouse = Input.getMouse();
	var toDEG: FastFloat = 57.29577951308232;
	var q1 = new Quat();
	var q2 = new Quat();
	var input_cache = new Quat();
	var euler_cache = new Vec4();
	public function new() {
		super();
		/* Functions */
		// Toggle - Window Active
		function cursorVisible(b) {
			if (b) mouse.show();
			else mouse.hide();
			mouse.hidden ? mouse.lock() : mouse.unlock();
		}
		// Player - Sync Physics
		function syncPhysics(o) {
			o.transform.buildMatrix();
			#if arm_physics
			var RB = o.getTrait(RigidBody);
			if (RB != null) RB.syncTransform();
			#end
		}
		// Player - Move
		function playerMove(v) {
			objectPlayerBody.transform.loc.add(objectPlayerBody.transform.worldVecToOrientation(v));
			syncPhysics(objectPlayerBody);
		}
		// Player - Visibility
		function setPlayerVisibility(b) {
			for (c in objectPlayerArmature.getChildren(true)) c.visible = b;
		}
		// Animation - Play
		function playAction(f) {
			for (c in Scene.active.getChildren(true)) if (c.animation != null) {
				c.animation.play(c.animation.action, blendTime, speed, loop);
				c.animation.update(f * Scene.active.raw.frame_time);
			}
		}
		// Animation - Idle
		function resetAnimation() {
			setPlayerVisibility(true);
			playAction(199);
		}
		// Player - Equipped
		function resetEquipped() if (!playerEquipped) playerEquipped = true;
		notifyOnInit(function() {
			resetAnimation();
		});
		notifyOnUpdate(function() {
			/* Canvas */
			canvas = Scene.active.getTrait(CanvasScript);
			if (canvas.ready) {
				canvas.getElement("Text").text = "FPS: " + Std.string(Math.round(1 / Time.realDelta));
				canvas.getElement("Text").color_text =  kha.Color.White;
			}
			/* Manager - Animations */
			for (c in Scene.active.getChildren(true)) if (c.animation != null) {
				// Fire
				if (c.animation.currentFrame() == 7) resetAnimation();
				// Reload Full
				if (c.animation.currentFrame() == 88) resetAnimation();
				// Hide
				if (c.animation.currentFrame() == 161) {
					c.animation.setFrame(161);
					setPlayerVisibility(false);
				}
				// Ready
				if (c.animation.currentFrame() == 198) {
					resetAnimation();
				}
				// Idle
				if (c.animation.currentFrame() == 228) c.animation.setFrame(199);
			}
			/* Manager - Window Active */
			if (keyboard.started("escape")) cursorVisible(true);
			if (mouse.started("left")) cursorVisible(false);
			// Manager - Player - Fire Rate
			if (playerFireDelayCurrent > 0) playerFireDelayCurrent--;
			/* Mouse Look - Mechanics */
			// Player - Body
			var multX: FastFloat = -playerLookSensitivity * Time.delta;
			q1.z = mouse.movementX * multX;
			q1.normalize();
			objectPlayerBody.transform.rot.mult(q1);
			syncPhysics(objectPlayerBody);
			// Player - Camera
			var multY: FastFloat = -playerLookSensitivity * Time.delta;
			q2.x = mouse.movementY * multY;
			q2.normalize();
			objectPlayerCamera.transform.rot.mult(q2);
			syncPhysics(objectPlayerCamera);
			/* MouseLook - Cap */
			var qc1 = objectPlayerCamera.transform.rot;
			qc1.normalize();
			if (qc1 != input_cache) euler_cache = qc1.toEulerOrdered("XYZ");
			var deg = new Vec4(euler_cache.x*toDEG, euler_cache.y*toDEG, euler_cache.z*toDEG);
			// Cap Upward
			if (deg.x <= -90.0) {
				var qc2 = new Quat();
				qc2.x += 360.0;
				qc2.normalize();
				objectPlayerCamera.transform.rot.setFrom(qc2);
				objectPlayerCamera.transform.buildMatrix();
			}
			// Cap Downard
			if (deg.x <= 0 && deg.x >= -90) {
				var qc2 = new Quat();
				var value = qc2.x;
				var min = 0.0;
				var max = 180.0;
				value < min ? min : value > max ? max : value;
				qc2.normalize();
				objectPlayerCamera.transform.rot.setFrom(qc2);
				objectPlayerCamera.transform.buildMatrix();
			}
			/* Player - Movement */
			// Forward
			if (keyboard.down("w")) playerMove(new Vec4(0,playerSpeed,0,1));
			// Backward
			if (keyboard.down("s")) playerMove(new Vec4(0,-playerSpeed,0,1));
			// Right
			if (keyboard.down("d")) playerMove(new Vec4(playerSpeed,0,0,1));
			// Left
			if (keyboard.down("a")) playerMove(new Vec4(-playerSpeed,0,0,1));
			/* Player - Toggle Weapon */
			if (keyboard.started("q")) {
				if (playerEquipped) {
					playAction(151);
					playerEquipped = !playerEquipped;
				} else {
					setPlayerVisibility(true);
					playAction(162);
					playerEquipped = !playerEquipped;
				}
			}
			/* Player - Reload */
			if (keyboard.started("r")) {
				setPlayerVisibility(true);
				for (c in Scene.active.getChildren(true)) if (c.animation != null) {
					c.animation.play(c.animation.action, blendTime, speed, loop);
					c.animation.update(8 * Scene.active.raw.frame_time);
				}
				resetEquipped();
			}
			/* Player - Fire */
			if (mouse.down("left")) {
				setPlayerVisibility(true);
				cursorVisible(false);
				resetEquipped();
				if (playerFireDelayCurrent == 0) {
					playAction(0);
					playerFireDelayCurrent = playerFireDelayLength;
				}
			}
		});
	}
}