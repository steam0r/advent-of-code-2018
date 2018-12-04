jQuery(document).ready(function () {
    let grid = [];
    let rows = 1000;
    let cols = 1000;
    for (let i = 0; i < rows; i++) {
        grid[i] = [];
        for (let j = 0; j < cols; j++) {
            grid[i][j] = 0;
        }
    }
    console.log(grid);
    input.forEach(function (line) {
        let fields = line.split(/#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9])+x([0-9])+/);
        let claim = {
            "id": parseInt(fields[1]),
            "left": parseInt(fields[2]),
            "top": parseInt(fields[3]),
            "width": parseInt(fields[4]),
            "height": parseInt(fields[5])
        };
        for(let x = claim.left; x < claim.left + claim.width; x++) {
            for(let y = claim.top; y < claim.top + claim.height; y++) {
                grid[x][y]++;
            }
        }
    });
    console.log(grid);
    let multipleClaims = 0;
    for (let i = 0; i < grid.length; i++) {
        for (let j = 0; j < grid[i].length; j++) {
            if (grid[i][j] > 1) {
                multipleClaims++;
            }
        }
    }
    jQuery('#output .count').html(multipleClaims);
});