package falco.scenes;

import falco.objects.BaseObject;

import starling.display.Sprite;

class Scene extends BaseObject {
    static var rootSprite: Sprite;
    static var currentScene: Scene;

    public function new() super();

    public static function addRoot(root: Sprite): Void {
        Scene.rootSprite = root;
    }

    public static function removeScene(): Void {
        currentScene.removeFromParent(true);
        currentScene = null;
    }

    public static function showScene(scene: Scene): Void {
        if (currentScene != null) removeScene();

        currentScene = scene;
        rootSprite.addChild(currentScene);
    }

    public static function getCurrent(): Scene {
        return currentScene;
    }
}
