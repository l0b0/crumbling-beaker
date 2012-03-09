// Constants
golden_ratio = (1 + sqrt(5)) / 2;
pi = 3.14159265;

// Configuration (all numbers in mm)
height = 100;
radius = height / 2 * golden_ratio * (3/8);
wall_thickness = height / 25;
bottom_height = height / 20; // Empty space below the bottom

// Calculations
radius_inner = radius - wall_thickness;
hull_height = height - bottom_height - wall_thickness;

// Modules
module walls() {
	cylinder(h = height, r = radius);
}
module hull_cylinder() {
	translate([0, 0, wall_thickness + bottom_height]) {
		cylinder(h = hull_height, r = radius_inner);
	}
}
module bottom_cylinder() {
	cylinder(h = bottom_height, r = radius_inner);
}
module cup() {
	difference() {
		walls();
		hull_cylinder();
		bottom_cylinder();
	}
}

// Documentation
echo (str(
	"Cup ",
	"height=", height, ", ",
	"outer radius=", radius, ", ",
	"inner radius=", radius_inner, ", ",
	"volume=", pi * pow(radius_inner, 2) * hull_height / 1000000));

// Render
cup();
