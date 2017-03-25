// set the unit size for the whole object. everything is done
// in terms of unit
unit = 1000;
hexLongD = unit/7;
hexShortD = .5 * hexLongD * sqrt(3);

module hex (x, y) {
    /*
    difference() {
        translate([x, y, 0]) {
            circle(d=hexLongD, $fn=6, false);
        }
    */
        translate([x, y, 0]) circle(d=.7*hexLongD, $fn=6, false);
    // }
}

module column (x, y) {
    for (i = [0:10]) {
        hex(x+0, y+(i*hexShortD));
    }
}

module column2(x, y) {
    column(x, y);
    column(x+hexLongD*.75, y+hexShortD/2);
}

module tesselation(x, y) {
    for (i = [0:10]) {
        column2(x + 1.5 * hexLongD * i, y);
    }
}

difference () {
    square([unit*1.5, unit], false);
    translate([hexShortD/2, hexShortD/2, 0]) square([(unit*1.5) - hexShortD, unit - hexLongD], false);
}

difference() {
    translate([hexShortD/2, hexShortD/2, 0]) {
        square([
            (unit*1.5) - hexShortD,
            unit - hexLongD
        ], false);
    }
    tesselation(0, hexShortD/2);
}
