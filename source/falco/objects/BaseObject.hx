package falco.objects;

import starling.events.Event;
import starling.display.Sprite;

class BaseObject extends Sprite {
    public function new() {
        super();

        if (stage != null) create();
        else addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    function onAddedToStage(): Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        create();
    }

    function onEnterFrame(event: Event, dt: Float): Void {
        update(dt);
    }

    function create(): Void {}

    function update(dt: Float): Void {}
}
