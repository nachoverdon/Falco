package falco.core;

import openfl.Assets;
import falco.display.Sprite;
import starling.assets.AssetManager;

class Game extends Sprite {
	public static var assets(default, null):AssetManager;

	public function new() {
		super();
	}

	function loadAssets(paths:Array<String>) {
		if (assets == null)
			assets = new AssetManager();

		assets.enqueue([for (path in paths) Assets.getPath(path)]);
		assets.loadQueue(onAssetsLoadComplete, onAssetsLoadError, onAssetsLoadProgress);
	}

	function onAssetsLoadComplete() {}

	function onAssetsLoadError(error:String) {
		trace('[ERROR] Failed when trying to load the assets: $error');
	}

	function onAssetsLoadProgress(ratio:Float) {}
}
