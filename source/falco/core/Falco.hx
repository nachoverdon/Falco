package falco.core;

import falco.scenes.Scene;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Sprite;
import openfl.display.Sprite as OFLSprite;

/**
 * This is the main entry point of your Falco application.
**/
class Falco extends OFLSprite {
	var starling: Starling;

	public function new(sprite: Class<Sprite>) {
		super();

		starling = new Starling(sprite, stage);
		starling.addEventListener(Event.ROOT_CREATED, init);
		starling.skipUnchangedFrames = true;
		starling.start();

		#if (debug)
		starling.enableErrorChecking = true;
		starling.showStats = true;
		#end
	}

	function init(event: Event, root: Sprite) {
		starling.removeEventListener(Event.ROOT_CREATED, init);
		Scene.addRoot(root);
	}
}
