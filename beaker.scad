// Configuration
height = 100;
radius = 50;

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