package falco.scenes;

import falco.objects.BaseObject;

class Scene extends BaseObject {
    public function new() super();

    function changeScene(scene: Scene) {
        SceneManager.showScene(scene);
    }
}
