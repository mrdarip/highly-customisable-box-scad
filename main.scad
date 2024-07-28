rows = 5;
columns = 5;

design = [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 3, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1]
];

wall_thickness = 1;
outer_wall_thickness = 2;
bottom_thickness = 2;



total_width = 100;
total_height = 100;
total_depth = 10;

inner_width = total_width - 2 * outer_wall_thickness;
inner_height = total_height - 2 * outer_wall_thickness;
final_outer_wall_thickness = outer_wall_thickness - wall_thickness;

difference() {
    cube(size = [total_width, total_height, total_depth]);

    for(row = [0 : rows - 1]) {
        for(column = [0 : columns - 1]) {
            translate([
                final_outer_wall_thickness + (inner_width / columns) * column + wall_thickness,
                final_outer_wall_thickness + (inner_height / rows) * row + wall_thickness,
                bottom_thickness
                ]) 
            cube(size = [(total_width / columns) - 2 * wall_thickness, (total_height / rows) - 2 * wall_thickness, total_depth - bottom_thickness]);
        }
    }
}