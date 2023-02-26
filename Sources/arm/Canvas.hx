package arm;
import arm.Main;
import iron.Trait;
import iron.system.Time;
import kha.System;
import armory.trait.internal.CanvasScript;
class Canvas extends Trait {
	public function new() {
		super();
		notifyOnInit(function() {
			// Responsive Height
			if (Main.canvas.ready) Main.canvas.getElement("Text").height = Std.int(0.05 * System.windowHeight());
		});
		notifyOnUpdate(function() {
			// Display - Framerate
			if (Main.canvas.ready) Main.canvas.getElement("Text").text = "FPS: " + Std.string(Math.round(1 / Time.realDelta));
		});
	}
}