package arm;
import arm.GlobalVariables;
import armory.renderpath.RenderToTexture;
import kha.Image;
import kha.graphics4.DepthStencilFormat;
import kha.graphics4.TextureFormat;
import iron.Scene;
import iron.Trait;
import iron.data.Data;
import iron.object.CameraObject;
class DrawMinimap extends Trait {
	public function new() {
		super();
		notifyOnRender2D(function(g: kha.graphics2.Graphics) {
			// Draw Rect (Minimap)
			var cam = cast(Scene.active.getChild("Camera.001"),CameraObject);
			cam.renderTarget = Image.createRenderTarget(
				128,
				128,
				TextureFormat.RGBA32,
				DepthStencilFormat.NoDepthAndStencil
			);
			notifyOnRender(function(g:kha.graphics4.Graphics) {
				var activeCamera = Scene.active.camera;
				Scene.active.camera = cam;
				cam.renderFrame(g);
				Scene.active.camera = activeCamera;
			});
			if (GlobalVariables.MINIMAP_NAME != GlobalVariables.MINIMAP_LAST) {
				GlobalVariables.MINIMAP_LAST = GlobalVariables.MINIMAP_NAME;
				Data.getImage(GlobalVariables.MINIMAP_NAME,(image: Image) -> {
					GlobalVariables.MINIMAP_IMG = cam.renderTarget;
				});
			}
			RenderToTexture.g = g;
			RenderToTexture.g.color = Color.fromFloats(1,1,1,1);
			RenderToTexture.g.drawScaledImage(GlobalVariables.MINIMAP_IMG,16,16,128,128);
			RenderToTexture.g = null;
		});
	}
}