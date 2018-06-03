package falco.scenes;

import falco.core.Game;

class SceneManager {
    static var root: Game;
    static var currentScene: Scene;

    public static function addRoot(root: Game) {
        SceneManager.root = root;
    }

    public static function removeScene() {
        currentScene.removeFromParent(true);
        currentScene = null;
    }

    public static function showScene(scene: Scene) {
        if (currentScene != null) removeScene();

        currentScene = scene;
        root.addChild(currentScene);
    }

    public static function current() {
        return currentScene;
    }
}
