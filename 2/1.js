// Part one

const fs = require('fs');

fs.readFile('input.txt', 'utf-8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }
    
    rounds(data);
});

const shapeScores = {
    X: 1,
    Y: 2,
    Z: 3
}

const shapeBeatsShape = ['CX','AY','BZ'];
const draw = ['AX','BY','CZ'];

let points = 0;

function rounds(data) {
    const lines = data.split(/\r?\n/);

    lines.forEach(line => {
        
        if (line.length !== 3) return;

        const opponent = line[0];
        const self = line[2];

        points += shapeScores[self];
        
        if (shapeBeatsShape.includes(opponent + self)) {
            points += 6;
        }
        else if (draw.includes(opponent + self)) {
            points += 3;
        }
        
    });

    console.log(points);
}
