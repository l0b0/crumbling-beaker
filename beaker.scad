// Configuration
height = 100;
golden_ratio = (1 + sqrt(5)) / 2;
radius = height / 2 * golden_ratio * (3/8);

// Modules
module walls() {
	cylinder(h = height, r = radius, center = true);
}
module cup() {
	walls();
}

// Documentation
echo (str(
	"Cup ",
	"height=", height, ", ",
	"radius=", radius));

// Render
cup();