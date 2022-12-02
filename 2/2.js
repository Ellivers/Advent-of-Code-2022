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

const draw = {
    A: 'X',
    B: 'Y',
    C: 'Z'
};

const win = {
    A: 'Y',
    B: 'Z',
    C: 'X'
};

const lose = {
    A: 'Z',
    B: 'X',
    C: 'Y'
};

let points = 0;

function rounds(data) {
    const lines = data.split(/\r?\n/);

    lines.forEach(line => {
        
        if (line.length !== 3) return;

        const opponent = line[0];
        const outcome = line[2];

        let self;
        
        if (outcome === 'Z') {
            self = win[opponent];
            points += 6;
        }
        else if (outcome === 'Y') {
            self = draw[opponent];
            points += 3;
        }
        else if (outcome === 'X') {
            self = lose[opponent];
        }

        points += shapeScores[self];
        
    });

    console.log(points);
}
