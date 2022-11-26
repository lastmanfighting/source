package arm;
import arm.GlobalVariables;
import armory.trait.physics.RigidBody;
import iron.Scene;
import iron.Trait;
import iron.math.Quat;
import iron.math.Vec4;
import iron.system.Input;
import iron.system.Time;
class PlayerLook extends Trait {
	var OBJ_PLAYER = Scene.active.getChild("Player");
	var OBJ_CAMERA = Scene.active.getChild("Camera");
	var VEC_X = Vec4.xAxis();
	var VEC_Z = Vec4.zAxis();
	var MOUSE = Input.getMouse();
	var KEYBOARD = Input.getKeyboard();
	public function new() {
		super();
		notifyOnUpdate(function() {
			if (MOUSE.started("left") && !MOUSE.locked) MOUSE.lock();
			else if (KEYBOARD.started("escape") && MOUSE.locked) MOUSE.unlock();
			if (MOUSE.moved) {
				OBJ_PLAYER.transform.rotate(VEC_Z,-MOUSE.movementX/250*GlobalVariables.PLAYER_SENSITIVITY);
				OBJ_PLAYER.transform.buildMatrix();
				OBJ_CAMERA.transform.rotate(VEC_X, -MOUSE.movementY/250*GlobalVariables.PLAYER_SENSITIVITY);
				OBJ_CAMERA.transform.buildMatrix();
			}
			var RB = OBJ_PLAYER.getTrait(RigidBody);
			if (RB != null) RB.syncTransform();
		});
	}
}