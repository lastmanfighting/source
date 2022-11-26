package arm;
import arm.GlobalVariables;
import armory.renderpath.RenderToTexture;
import kha.Image;
import kha.System;
import iron.Scene;
import iron.Trait;
import iron.data.Data;
import kha.graphics2.Graphics;
class DrawScope extends Trait {
	public function new() {
		super();
		notifyOnRender2D(function(g: Graphics) {
			// Draw Image (Scope)
			if (GlobalVariables.SCOPE_NAME != GlobalVariables.SCOPE_LAST) {
				GlobalVariables.SCOPE_LAST = GlobalVariables.SCOPE_NAME;
				Data.getImage(GlobalVariables.SCOPE_NAME,(i: Image) -> {
					GlobalVariables.SCOPE_IMG = i;
				});
			}
			RenderToTexture.g = g;
			RenderToTexture.g.color = Color.fromFloats(1,0,0,GlobalVariables.SCOPE_ALPHA);
			RenderToTexture.g.drawScaledImage(GlobalVariables.SCOPE_IMG,(System.windowWidth()*-0.125),0.0,(System.windowWidth()*1.25),System.windowHeight());
			RenderToTexture.g = null;
		});
	}
}