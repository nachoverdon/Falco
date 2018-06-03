package falco.core;

import falco.scenes.Scene;
import falco.scenes.SceneManager;
import starling.events.Event;
import openfl.display.Sprite;
import starling.core.Starling;


class Main extends Sprite {
	var starling: Starling;
    var currentScene: Scene;
	
	public function new() {
		
		super();
		
		starling = new Starling(Game, stage);
		starling.addEventListener(Event.ROOT_CREATED, init);
        starling.start();

        #if (debug)
        starling.showStats = true;
        #end

	}

    function init(event: Event, root: Game) {
		Starling.current.nativeStage.frameRate = Config.FPS;
		SceneManager.addRoot(root);
        SceneManager.showScene(new Scene());
    }

	
}