package falco.scenes;

import falco.objects.BaseObject;
import falco.events.Event as FalcoEvent;

import starling.events.Event;
import starling.display.Sprite;

class Scene extends BaseObject {
    public static var current(default, null): Scene;
    static var rootSprite: Sprite;

    public function new() super();

    public static function addRoot(root: Sprite): Void {
        rootSprite = root;
        rootSprite.dispatchEvent(new Event(FalcoEvent.ROOT_ADDED));
    }

    public static function removeScene(): Void {
        current.removeFromParent(true);
        current = null;
    }

    public static function showScene(scene: Scene): Void {
        if (current != null) removeScene();

        current = scene;
        rootSprite.addChild(current);
    }
}
