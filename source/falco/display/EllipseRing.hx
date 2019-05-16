// =================================================================================================
//
//	Starling Shapes
//	Copyright 2014 Fovea. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================
package falco.display;

import openfl.geom.Point;
import starling.display.Sprite;

/**
 * A EllipseRing represents an ellipse filled with a uniform color, with an
 * ellipse inside.
**/
class EllipseRing extends Sprite {
	var innerRadius:Float;
	var outerRadiusx:Float;
	var outerRadius2x:Float;
	var outerRadiusy:Float;
	var outerRadius2y:Float;

	/**
	 * An array containing the polygons that form this ellipse.
	**/
	public var polygons:Array<Poly4>;

	public function new(xoff:Float, yoff:Float, innerRadius:Float, outerRadiusx:Float, outerRadiusy:Float, color:Int = 0xFFFFFF, alpha:Float = 1.0,
			nsides:Int = -1, ?startangle:Float) {
		super();
		polygons = [];
		this.innerRadius = innerRadius;
		this.outerRadiusx = outerRadiusx;
		outerRadius2x = outerRadiusx * outerRadiusx;
		this.outerRadiusy = outerRadiusy;
		outerRadius2y = outerRadiusy * outerRadiusy;
		var c0:Point = new Point();
		var c1:Point = new Point();
		var p0:Point = new Point();
		var p1:Point = new Point();
		var nParts:Int = Std.int(Math.max(Math.round(outerRadiusx * 1.0), 8));
		if (nsides > -1) {
			nParts = nsides;
		}
		var angle:Float = 0;
		if (startangle != null) {
			angle = startangle;
		}
		for (i in 0...nParts) {
			var a0:Float = angle + ((i + 0.0) * 2.0 * Math.PI / nParts);
			var a1:Float = angle + ((i + 1.0) * 2.0 * Math.PI / nParts);
			var ca0:Float = Math.cos(a0);
			var sa0:Float = Math.sin(a0);
			var ca1:Float = Math.cos(a1);
			var sa1:Float = Math.sin(a1);
			c0.x = xoff + (outerRadiusx + ca0 * innerRadius);
			c0.y = yoff + (outerRadiusy + sa0 * innerRadius);
			c1.x = xoff + (outerRadiusx + ca1 * innerRadius);
			c1.y = yoff + (outerRadiusy + sa1 * innerRadius);
			p0.x = xoff + (outerRadiusx + ca0 * outerRadiusx);
			p0.y = yoff + (outerRadiusy + sa0 * outerRadiusy);
			p1.x = xoff + (outerRadiusx + ca1 * outerRadiusx);
			p1.y = yoff + (outerRadiusy + sa1 * outerRadiusy);
			var q:Poly4 = new Poly4(c0.x, c0.y, p0.x, p0.y, c1.x, c1.y, p1.x, p1.y, color);
			if (alpha != 1.0) {
				q.alpha = alpha;
			}
			this.polygons.push(q);
			addChild(q);
		}
	}

	/**
	 * Sets the color of the ellipse.
	 * @param value Color in hex, ex 0xFF00FF
	**/
	public function setpolycolor(value:Int) {
		for (i in 0...polygons.length) {
			polygons[i].color = value;
		}
	}
}
