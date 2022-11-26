package arm;
import arm.GlobalVariables;
import armory.renderpath.RenderToTexture;
import kha.Font;
import kha.System;
import iron.Trait;
import iron.data.Data;
import iron.system.Time;
import kha.graphics2.Graphics;
class DrawFramerate extends Trait {
	public function new() {
		super();
		notifyOnRender2D(function(g: Graphics) {
		// Draw Rect (Framerate)
		RenderToTexture.g = g;
		RenderToTexture.g.color = Color.fromFloats(0,0,0,0.375);
		RenderToTexture.g.fillRect(((System.windowWidth()/2)-64),16,120,32);
		RenderToTexture.g = null;
		// Draw String (Framerate)
		if (GlobalVariables.FRAMERATE_NAME != GlobalVariables.FRAMERATE_LAST) {
			GlobalVariables.FRAMERATE_NAME = GlobalVariables.FRAMERATE_NAME;
			Data.getFont(GlobalVariables.FRAMERATE_NAME, (f: Font) -> {
				GlobalVariables.FRAMERATE_FONT = f;
			});
		}
		RenderToTexture.g = g;
		RenderToTexture.g.color = Color.fromFloats(1,1,1,1);
		RenderToTexture.g.fontSize = 32;
		RenderToTexture.g.font = GlobalVariables.FRAMERATE_FONT;
		var fps = Math.round(1 / Time.realDelta);
		RenderToTexture.g.drawString("FPS: " + Std.string(fps),((System.windowWidth()/2)-64),16);
		RenderToTexture.g = null;
		});
	}
}