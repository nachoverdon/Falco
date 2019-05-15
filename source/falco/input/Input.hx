package falco.input;

import starling.events.KeyboardEvent;
import starling.display.Stage;

class Input {
	static var keys:Array<Bool>;
	static var inputMap:Map<Int, String>;

	public static function init(stage:Stage) {
		keys = new Array<Bool>();
		inputMap = new Map<Int, String>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}

	static function exists(key:Int):Bool {
		if (Std.int(key) > keys.length - 1) {
			return false;
		}

		return keys[key];
	}

	static function onKeyDown(e:KeyboardEvent):Void {
		if (isUp(e.keyCode)) {
			keys[e.keyCode] = true;
		}
	}

	static function onKeyUp(e:KeyboardEvent):Void {
		if (isDown(e.keyCode)) {
			keys[e.keyCode] = false;
		}
	}

	public static function setInput(name:String, key:Int):Void {
		inputMap.set(key, name);
		keys[key] = false;
	}

	public static function setInputs(name:String, keys:Array<Int>):Void {
		for (key in keys) {
			setInput(name, key);
		}
	}

	public static function is(name:String):Bool {
		for (key in inputMap.keys()) {
			if (inputMap.get(key) == name && isDown(key)) {
				return true;
			}
		}

		return false;
	}

	public static function isDown(key:Int):Bool {
		return exists(key);
	}

	public static function isUp(key:Int):Bool {
		return !exists(key);
	}

	public static function isAnyDown(keys:Array<Int>):Bool {
		for (key in keys) {
			if (isDown(key)) {
				return true;
			}
		}

		return false;
	}

	public static function isAnyUp(keys:Array<Int>):Bool {
		for (key in keys) {
			if (isUp(key)) {
				return true;
			}
		}

		return false;
	}
}
