package scenes;

class SceneManager {
    static var root: Root;
    static var currentScene: Scene;

    public static function addRoot(root: Root) {
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
