package falco.display;

/**
 * An HexagonRing represents an hexagon filled with a uniform color, with an
 * hexagon inside.
**/
class HexagonRing extends Ring {
	public function new(xoff: Float, yoff: Float, innerRadius: Float, outerRadius: Float, color: Int = 0xFFFFFF, alpha: Float = 1.0, ?startangle: Float) {
		super(xoff, yoff, innerRadius, outerRadius, color, alpha, 6, startangle);
	}
}
