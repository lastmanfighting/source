package arm;
import kha.Font;
import kha.Image;
import iron.Trait;
class GlobalVariables extends Trait {
	public static var PLAYER_SPEED: Float = 0.25;
	public static var PLAYER_SENSITIVITY: Float = 0.5;
	public static var PLAYER_WEAPON: String = "";
	public static var WEAPONS_LIST: Array<String> = ["Weapon_Pistol", "Weapon_Assault", "Weapon_Ak47", "Weapon_Sniper", "Weapon_Shotgun"];
	public static var SOUND_VOLUME: Float = 2.0;
	public static var SOUND_SCOPE = "210018__supakid13__sniper-scope-zoom-in.wav";
	public static var SOUND_SWITCH = "170273__knova__change-weapon-sound.wav";
	public static var SCOPE_FOV_INIT: Float = 0.0;
	public static var SCOPE_ALPHA: Float = 0.0;
	public static var SCOPE_ALPHA_ON: Float = 0.75;
	public static var SCOPE_ALPHA_OFF: Float = 0.0;
	public static var SCOPE_IMG: Image;
	public static var SCOPE_LAST: String = "";
	public static var SCOPE_NAME: String = "ScopeOverlay.png";
	public static var FRAMERATE_FONT: Font;
	public static var FRAMERATE_LAST = "";
	public static var FRAMERATE_NAME  = "arial.ttf";
	public static var MINIMAP_IMG: Image;
	public static var MINIMAP_LAST: String = "";
	public static var MINIMAP_NAME: String = "texture_01.png";
	public function new() {
		super();
	}
}