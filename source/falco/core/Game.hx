package falco.core;

import falco.events.Event;
import falco.objects.BaseObject;

class Game extends BaseObject {
    public function new() {
        super();
    }

    override function create(): Void {
        addEventListener(Event.ROOT_ADDED, loadAssets);
    }

    function loadAssets(): Void {}
}