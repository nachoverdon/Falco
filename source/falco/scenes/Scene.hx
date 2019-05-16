package falco.scenes;

import falco.display.Sprite;
import falco.events.Event as FalcoEvent;
import starling.events.Event;
import starling.display.Sprite as StarlingSprite;

/**
 * This class handles scenes, allowing you to switch between scenes, removing
 * scenes...
**/
class Scene extends Sprite {
	public static var current(default, null):Scene;
	static var rootSprite:StarlingSprite;

	public function new()
		super();

	/**
	 * Sets the starling.display.Sprite as root, so that we can start using
	 * the event system.
	 * @param root
	**/
	public static function addRoot(root:StarlingSprite) {
		rootSprite = root;
		rootSprite.dispatchEvent(new Event(FalcoEvent.ROOT_ADDED));
	}

	/**
	 * Removes the current scene.
	**/
	public static function removeScene() {
		current.removeFromParent(true);
		current = null;
	}

	/**
	 * Sets the given scene, removing the previous one.
	 * @param scene
	**/
	public static function showScene(scene:Scene) {
		if (current != null) {
			removeScene();
		}

		current = scene;
		rootSprite.addChild(current);
	}
}
