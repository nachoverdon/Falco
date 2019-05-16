package falco.core;

import openfl.Assets;
import falco.display.Sprite;
import starling.assets.AssetManager;

/**
 * This class provides some functionality to load your assets. It is supposed to
 * be used as the entry point of your Falco app. Extend this class and pass it
 * as an argument of new falco.core.Falco().
**/
class Game extends Sprite {
	/**
	 * ArrayManager exposed statically to be able to access easily
	**/
	public static var assets(default, null):AssetManager;

	public function new() {
		super();
	}

	function loadAssets(paths:Array<String>) {
		if (assets == null) {
			assets = new AssetManager();
		}

		assets.enqueue([
			for (path in paths) {
				Assets.getPath(path);
			}
		]);
		assets.loadQueue(onAssetsLoadComplete, onAssetsLoadError, onAssetsLoadProgress);
	}

	function onAssetsLoadComplete() {}

	function onAssetsLoadError(error:String) {
		throw '[ERROR] Failed when trying to load the assets: $error';
	}

	function onAssetsLoadProgress(ratio:Float) {}
}
