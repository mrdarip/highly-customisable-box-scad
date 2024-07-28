rows = 5;
columns = 5;

design = [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 3, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1]
];

wall_thickness = 2;
outer_wall_thickness = 2;
bottom_thickness = 2;



total_width = 100;
total_height = 100;
total_depth = 10;

intersection() {
    cube(size = [total_width, total_height, total_depth]);

    for(row = [0 : rows - 1]) {
        for(column = [0 : columns - 1]) {
            cube();
        }
    }
}