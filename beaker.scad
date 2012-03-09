// Constants
golden_ratio = (1 + sqrt(5)) / 2;
pi = 3.14159265;

// Configuration (all numbers in mm)
height = 100;
radius = height / 2 * golden_ratio * (3/8);
wall_thickness = height / 25;
bottom_height = height / 10; // Empty space below the bottom

// Calculations
hull_radius = radius - wall_thickness;
hull_height = height - bottom_height - wall_thickness;
bottom_outer_cylinder_height = bottom_height / 2;
bottom_inner_cylinder_height = bottom_height;
bottom_outer_cylinder_radius = hull_radius;
bottom_inner_cylinder_radius = hull_radius - (bottom_inner_cylinder_height - bottom_outer_cylinder_height);

// Modules
module walls() {
	// To see the bottom plate, replace radius with hull_radius
	cylinder(h = height, r = radius);
}
module hull_cylinder() {
	translate([0, 0, wall_thickness + bottom_height]) {
		cylinder(h = hull_height, r = hull_radius);
	}
}
module bottom_cylinders() {
	union() {
		cylinder(h = bottom_outer_cylinder_height, r = bottom_outer_cylinder_radius);
		cylinder(h = bottom_inner_cylinder_height, r = bottom_inner_cylinder_radius);
	}
}
module cup() {
	difference() {
		walls();
		hull_cylinder();
		bottom_cylinders();
	}
}

// Documentation
echo (str(
	"Cup ",
	"height=", height, ", ",
	"outer radius=", radius, ", ",
	"inner radius=", hull_radius, ", ",
	"volume=", pi * pow(hull_radius, 2) * hull_height / 1000000));

// Render
cup();
