// Configuration
height = 100;
golden_ratio = (1 + sqrt(5)) / 2;
radius = height / 2 * golden_ratio * (3/8);
wall_thickness = height / 25;

// Calculations
radius_inner = radius - wall_thickness;

// Modules
module walls() {
	cylinder(h = height, r = radius, center = true);
}
module hull_cylinder() {
	cylinder(h = height, r = radius_inner, center = true);
}
module cup() {
      difference() {
		walls();
		hull_cylinder();
	}
}

// Documentation
echo (str(
	"Cup ",
	"height=", height, ", ",
	"radius=", radius));

// Render
cup();