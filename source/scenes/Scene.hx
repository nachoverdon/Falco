package scenes;

import objects.BaseObject;

class Scene extends BaseObject {
    public function new() super();

    function changeScene(scene: Scene) {
        SceneManager.showScene(scene);
    }
}
