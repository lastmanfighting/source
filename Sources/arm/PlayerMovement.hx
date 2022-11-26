package arm;
import arm.GlobalVariables;
import armory.trait.physics.RigidBody;
using armory.object.TransformExtension;
import iron.Scene;
import iron.Trait;
import iron.math.Vec4;
import iron.system.Input;
class PlayerMovement extends Trait {
	var OBJ_PLAYER = Scene.active.getChild("Player");
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Forward
			if (Input.getKeyboard().down("w")) playerMove(new Vec4(0,GlobalVariables.PLAYER_SPEED,0,1));
			// Backward
			if (Input.getKeyboard().down("s")) playerMove(new Vec4(0,-GlobalVariables.PLAYER_SPEED,0,1));
			// Left
			if (Input.getKeyboard().down("a")) playerMove(new Vec4(-GlobalVariables.PLAYER_SPEED,0,0,1));
			// Right
			if (Input.getKeyboard().down("d")) playerMove(new Vec4(GlobalVariables.PLAYER_SPEED,0,0,1));
#if arm_physics
			var RB = OBJ_PLAYER.getTrait(RigidBody);
			if (RB != null) RB.syncTransform();
#end
		});
	}
	function playerMove(v) {
		OBJ_PLAYER.transform.loc.add(OBJ_PLAYER.transform.worldVecToOrientation(v));
		OBJ_PLAYER.transform.buildMatrix();
	}
}