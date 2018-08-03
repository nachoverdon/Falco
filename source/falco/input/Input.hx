package falco.input;

import starling.events.KeyboardEvent;
import starling.display.Stage;

class Input {
    static var keys: Array<Bool>;
    static var inputMap: Map<UInt, String>;

    public static function init(stage: Stage) {
        keys = new Array<Bool>();
        inputMap = new Map<UInt, String>();
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
    }

    static function exists(key: UInt): Bool {
        if (key > keys.length - 1) return false;

        return keys[key];
    }

    static function onKeyDown(e: KeyboardEvent): Void {
        if (isUp(e.keyCode)) keys[e.keyCode] = true;
    }

    static function onKeyUp(e: KeyboardEvent): Void {
        if (isDown(e.keyCode)) keys[e.keyCode] = false;
    }

    public static function setInput(name: String, key: UInt): Void {
        inputMap.set(key, name);
        keys[key] = false;
    }

    public static function setInputs(name: String, keys: Array<UInt>): Void {
        for (key in keys) setInput(name, key);
    }

    public static function is(name: String): Bool {

        for (key in inputMap.keys()) {
            if (inputMap.get(key) == name && isDown(key)) return true;
        }

        return false;
    }

    public static function isDown(key: UInt): Bool {
        return exists(key);
    }

    public static function isUp(key: UInt): Bool {
        return !exists(key);
    }

    public static function isAnyDown(keys: Array<UInt>): Bool {

        for (key in keys)
            if (isDown(key)) return true;

        return false;
    }

    public static function isAnyUp(keys: Array<UInt>): Bool {

        for (key in keys)
            if (isUp(key)) return true;

        return false;
    }
}
