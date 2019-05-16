package falco.input;

import starling.events.KeyboardEvent;
import starling.display.Stage;

/**
 * This class provides you with Input handling methods to easily manage
 * controlls.
**/
class Input {
	static var initialized:Bool = false;
	static var keys:Array<Bool>;
	static var inputMap:Map<Int, String>;

	/**
	 * Initializes the Input handling and sets the event listeners.
	 * @param stage
	**/
	public static function init(stage:Stage) {
		if (!initialized) {
			keys = new Array<Bool>();
			inputMap = new Map<Int, String>();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			initialized = true;
		}
	}

	static function exists(key:Int):Bool {
		if (Std.int(key) > keys.length - 1) {
			return false;
		}

		return keys[key];
	}

	static function onKeyDown(e:KeyboardEvent) {
		if (isUp(e.keyCode)) {
			keys[e.keyCode] = true;
		}
	}

	static function onKeyUp(e:KeyboardEvent) {
		if (isDown(e.keyCode)) {
			keys[e.keyCode] = false;
		}
	}

	/**
	 * Sets the given name and associates it with the key
	 * @param name
	 * @param key
	**/
	public static function setInput(name:String, key:Int) {
		inputMap.set(key, name);
		keys[key] = false;
	}

	/**
	 * Sets the given name and associates it with various keys, in case you want
	 * several keys to perform the same action. Ex: W and Up Arrow
	 * @param name
	 * @param keysArr
	**/
	public static function setInputs(name:String, keysArr:Array<Int>) {
		for (key in keysArr) {
			setInput(name, key);
		}
	}

	/**
	 * Checks if a key associates with the given name is being pressed.
	 * @param name
	 * @return Bool
	**/
	public static function is(name:String):Bool {
		for (key in inputMap.keys()) {
			if (inputMap.get(key) == name && isDown(key)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Checks if the key is being pressed.
	 * @param key
	 * @return Bool
	**/
	public static function isDown(key:Int):Bool {
		return exists(key);
	}

	/**
	 * Check if the key is not being pressed.
	 * @param key
	 * @return Bool
	**/
	public static function isUp(key:Int):Bool {
		return !exists(key);
	}

	/**
	 * Check if any of the given keys are being pressed.
	 * @param keysArr
	 * @return Bool
	**/
	public static function isAnyDown(keysArr:Array<Int>):Bool {
		for (key in keysArr) {
			if (isDown(key)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Check if any of the given keys are not being pressed.
	 * @param keysArr
	 * @return Bool
	**/
	public static function isAnyUp(keysArr:Array<Int>):Bool {
		for (key in keysArr) {
			if (isUp(key)) {
				return true;
			}
		}

		return false;
	}
}
