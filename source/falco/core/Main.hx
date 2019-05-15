package falco.core;

import falco.scenes.Scene;

import starling.events.Event;
import starling.core.Starling;
import starling.display.Sprite;

import openfl.display.Sprite as OFLSprite;

class Main extends OFLSprite {
    var starling: Starling;

    public function new(sprite: Class<Sprite>) {

        super();

        starling = new Starling(sprite, stage);
        starling.addEventListener(Event.ROOT_CREATED, init);
        starling.start();

        #if (debug)
        starling.showStats = true;
        #end

    }

    function init(event: Event, root: Sprite): Void {
        starling.removeEventListener(Event.ROOT_CREATED, init);
        Scene.addRoot(root);
    }

}