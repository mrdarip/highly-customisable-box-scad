/*====================
 Parameters
====================*/

design = [
    [1,1,1,1,2,3,3,3,2],
    [1,3,3,2,2,2,3,2,2],
    [1,2,2,1,2,3,3,3,2],
    [1,2,2,2,2,2,3,2,2],
    [1,1,1,1,2,3,2,2,2],
    [1,2,2,1,2,2,2,2,2],
    [1,2,1,1,2,2,2,2,2],
    [1,2,2,2,2,2,2,2,2]
];

wall_thickness = 2;
outer_wall_thickness = 3;
bottom_thickness = 4;

total_width = 100;
total_height = 100;
total_depth = 10;

/* ====================
    Code
====================*/

scad_tolerance = 1;

rows = len(design);
columns = len(design[0]);

inner_width = total_width - 2 * outer_wall_thickness;
inner_height = total_height - 2 * outer_wall_thickness;

hole_width = (inner_width - (columns-1) * wall_thickness) / columns;
hole_height = (inner_height- (rows-1) * wall_thickness) / rows;

difference() {
    cube(size = [total_width, total_height, total_depth]);

    for(row = [0 : rows - 1]) {
        for(column = [0 : columns - 1]) {
            translate([
                outer_wall_thickness + (hole_width + wall_thickness) * column, 
                outer_wall_thickness + (hole_height + wall_thickness) * row,
                bottom_thickness
            ])
            {
                union() {
                    cube(size = [hole_width, hole_height, total_depth - bottom_thickness]);

                    if(row < rows - 1 && design[row][column] == design[row+1][column]){
                        translate([
                            0,
                            hole_height - scad_tolerance/2,
                            0
                        ])

                        cube([
                            hole_width,
                            wall_thickness + scad_tolerance,
                            total_depth - bottom_thickness
                        ]);
                    }

                    if(column < columns - 1 && design[row][column] == design[row][column+1]){
                        translate([
                            hole_width- scad_tolerance/2,
                            0,
                            0
                        ])

                        cube([
                            wall_thickness+ scad_tolerance,
                            hole_height,
                            total_depth - bottom_thickness
                        ]);
                    }

                    if(row < rows - 1 && column < columns - 1 && design[row][column] == design[row+1][column] && design[row][column] == design[row][column+1] && design[row][column] == design[row+1][column+1]){
                        translate([
                            hole_width - scad_tolerance/2,
                            hole_height - scad_tolerance/2,
                            0
                        ])

                        cube([
                            wall_thickness+ scad_tolerance,
                            wall_thickness+ scad_tolerance,
                            total_depth - bottom_thickness
                        ]);
                    }
                }
            }
        }
    }
}