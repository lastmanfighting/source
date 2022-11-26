package arm;
import kha.System;
import iron.Trait;
import iron.system.Input;
class SystemExit extends Trait {
	public function new() {
		super();
		notifyOnUpdate(function() {
			if (Input.getKeyboard().started("escape")) System.stop();
		});
	}
}