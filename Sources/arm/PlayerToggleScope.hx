package arm;
import arm.GlobalVariables;
import iron.Scene;
import iron.Trait;
import iron.data.Data;
import iron.system.Audio;
import iron.system.Input;
class PlayerToggleScope extends Trait {
	var OBJ_CAMERA = Scene.active.getCamera("Camera");
	public function new() {
		super();
		notifyOnInit(function() {
			GlobalVariables.SCOPE_FOV_INIT = OBJ_CAMERA.data.raw.fov;
		});
		notifyOnUpdate(function() {
			if (GlobalVariables.PLAYER_WEAPON == GlobalVariables.WEAPONS_LIST[3]) {
				if (Input.getMouse().started("right")) {
					playerScope(true, 2, false);
				} else if (Input.getMouse().released("right")) {
					playerScope(false, 1, true);
				}
			}
		});
	}
	function playerScope(b, i, v) {
		Data.getSound(GlobalVariables.SOUND_SCOPE, (s:kha.Sound) -> {
			var C = Audio.play(s);
			C.volume = 10.0;
		});
		if (b) GlobalVariables.SCOPE_ALPHA = GlobalVariables.SCOPE_ALPHA_ON;
		else GlobalVariables.SCOPE_ALPHA = GlobalVariables.SCOPE_ALPHA_OFF;
		OBJ_CAMERA.data.raw.fov = (GlobalVariables.SCOPE_FOV_INIT/i);
		OBJ_CAMERA.buildProjection();
		Scene.active.getChild(GlobalVariables.PLAYER_WEAPON).visible = v;
	}
}
