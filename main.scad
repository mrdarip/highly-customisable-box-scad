rows = 5;
columns = 4;

design = [
    [1,1,1,1],
    [1,3,3,1],
    [1,2,2,1],
    [1,2,2,1],
    [1,1,1,1]
];

wall_thickness = 1;
outer_wall_thickness = 2;
bottom_thickness = 2;



total_width = 100;
total_height = 100;
total_depth = 10;

inner_width = total_width - 2 * outer_wall_thickness;
inner_height = total_height - 2 * outer_wall_thickness;

echo(inner_width);

hole_width = (inner_width - (columns-1) * wall_thickness) / columns;
hole_height = (inner_height- (rows-1) * wall_thickness) / rows;

//difference() {
  //  cube(size = [total_width, total_height, total_depth]);

    for(row = [0 : rows - 1]) {
        for(column = [0 : columns - 1]) {
            translate([
                outer_wall_thickness + (hole_width + wall_thickness) * column, 
                outer_wall_thickness + (hole_height + wall_thickness) * row,
                bottom_thickness-5//remove
            ])
            {
                cube(size = [hole_width, hole_height, total_depth - bottom_thickness]);

                if(row < rows - 1){
                    translate([
                        0,
                        hole_height,
                        -1 //remove
                    ])

                    color("red") 
                    cube([
                        hole_width,
                        wall_thickness,
                        total_depth - bottom_thickness
                    ]);
                }

                if(column < columns - 1){
                    translate([
                        hole_width,
                        0,
                        -1 //remove
                    ])

                    color("red") 
                    cube([
                        wall_thickness,
                        hole_height,
                        total_depth - bottom_thickness
                    ]);
                }
            }
        }
    //}
}