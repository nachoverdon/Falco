package objects;

import utils.Color;

class Background {
    static inline var SATURATION: Float = .25;
    static inline var LIGHTNESS: Float = .2;
    static var paused: Bool = false;
    public static var color: Int;

    public static function init() {
        update();
    }

    public static function update() {
    	if (paused) return;

        color = Color.color(SATURATION, LIGHTNESS);
    }

    public static function play() {
        paused = false;
    }

    public static function pause() {
        paused = true;
    }
}
