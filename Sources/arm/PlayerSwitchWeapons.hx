package arm;
import arm.GlobalVariables;
import kha.Sound;
import iron.Scene;
import iron.Trait;
import iron.data.Data;
import iron.system.Audio;
import iron.system.Input;
class PlayerSwitchWeapons extends Trait {
	public function new() {
		super();
		notifyOnUpdate(function() {
			// Pistol
			if (Input.getKeyboard().released("1")) switchWeapons(0);
			// Assault
			else if (Input.getKeyboard().released("2")) switchWeapons(1);
			// Ak47
			else if (Input.getKeyboard().released("3")) switchWeapons(2);
			// Sniper
			else if (Input.getKeyboard().released("4")) switchWeapons(3);
			// Shotgun
			else if (Input.getKeyboard().released("5")) switchWeapons(4);
		});
	}
	function switchWeapons(w) {
		Data.getSound(GlobalVariables.SOUND_SWITCH, (s:kha.Sound) -> {
			var C = Audio.play(s);
			C.volume = 10.0;
		});
		for (i in GlobalVariables.WEAPONS_LIST) if (i != GlobalVariables.WEAPONS_LIST[w]) Scene.active.getChild(i).visible = false;
		Scene.active.getChild(GlobalVariables.WEAPONS_LIST[w]).visible = !Scene.active.getChild(GlobalVariables.WEAPONS_LIST[w]).visible;
		GlobalVariables.PLAYER_WEAPON = GlobalVariables.WEAPONS_LIST[w];
	}
}
