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



width = 100;
height = 100;
depth = 10;

intersection() {
    cube(size = [width, height, depth]);

    for(row = [0 : rows - 1]) {
        for(column = [0 : columns - 1]) {
            cube();
        }
    }
}