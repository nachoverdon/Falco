package falco.core;

import falco.events.Event;
import falco.display.Sprite;

class Game extends Sprite {
	public function new() {
		super();
	}

	override function create():Void {
		addEventListener(Event.ROOT_ADDED, loadAssets);
	}

	function loadAssets():Void {}
}
