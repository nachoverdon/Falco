package falco.display;

/**
 * An HexagonDisk represents an hexagon filled with a uniform color.
**/
class HexagonDisk extends HexagonRing {
	public function new(xoff: Float, yoff: Float, radius: Float, color: Int = 0xFFFFFF, alpha: Float = 1.0, ?startangle: Float) {
		super(xoff, yoff, 0, radius, color, alpha, startangle);
	}
}
