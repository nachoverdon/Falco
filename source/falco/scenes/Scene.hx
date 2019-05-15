package falco.scenes;

import falco.display.Sprite;
import falco.events.Event as FalcoEvent;
import starling.events.Event;
import starling.display.Sprite as StarlingSprite;

class Scene extends Sprite {
	public static var current(default, null):Scene;
	static var rootSprite:StarlingSprite;

	public function new()
		super();

	public static function addRoot(root:StarlingSprite):Void {
		rootSprite = root;
		rootSprite.dispatchEvent(new Event(FalcoEvent.ROOT_ADDED));
	}

	public static function removeScene():Void {
		current.removeFromParent(true);
		current = null;
	}

	public static function showScene(scene:Scene):Void {
		if (current != null) {
			removeScene();
		}

		current = scene;
		rootSprite.addChild(current);
	}
}
