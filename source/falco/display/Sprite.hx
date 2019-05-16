package falco.display;

import starling.events.Event;
import starling.display.Sprite as StarlingSprite;

/**
 * This is the base clase for every Falco object. It extends
 * starling.display.Sprite and adds create() and update() methods for
 * convenience.
**/
class Sprite extends StarlingSprite {
	public function new(update = true) {
		super();

		if (stage != null) {
			create();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		if (update) {
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
	}

	function onAddedToStage() {
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		create();
	}

	function onEnterFrame(event:Event, dt:Float) {
		update(dt);
	}

	function create() {}

	function update(dt:Float) {}
}
