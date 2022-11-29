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
	var OBJ_CAM = cast(Scene.active.getChild("Camera.001"),CameraObject);
	public function new() {
		super();
		// Draw RenderToTexture (Minimap)
		notifyOnInit(function() {
			OBJ_CAM.renderTarget = Image.createRenderTarget(128,128,TextureFormat.RGBA32,DepthStencilFormat.NoDepthAndStencil);
			if (GlobalVariables.MINIMAP_NAME != GlobalVariables.MINIMAP_LAST) {
				GlobalVariables.MINIMAP_LAST = GlobalVariables.MINIMAP_NAME;
				Data.getImage(GlobalVariables.MINIMAP_NAME,(image: Image) -> {
					GlobalVariables.MINIMAP_IMG = OBJ_CAM.renderTarget;
				});
			}
		});
		notifyOnRender(function(g:kha.graphics4.Graphics) {
			var ACTIVE_CAMERA = Scene.active.camera;
			Scene.active.camera = OBJ_CAM;
			OBJ_CAM.renderFrame(g);
			Scene.active.camera = ACTIVE_CAMERA;
		});
		// Draw Rect (Minimap)
		notifyOnRender2D(function(g: kha.graphics2.Graphics) {
			if (GlobalVariables.MINIMAP_IMG != null) {
				RenderToTexture.g = g;
				RenderToTexture.g.color = Color.fromFloats(1,1,1,1);
				RenderToTexture.g.drawScaledImage(GlobalVariables.MINIMAP_IMG,16,16,128,128);
				RenderToTexture.g = null;
			}
		});
	}
}