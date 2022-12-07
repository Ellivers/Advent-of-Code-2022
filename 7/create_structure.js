const fs = require('fs');

const tree = {};
let currentdir = [];

fs.readFile('input.txt', 'utf-8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }
    
    part1(data);
});

function part1(data) {
    const lines = data.split(/\r?\n/);

    lines.forEach(line => {
        
        if (line.startsWith('$ cd')) {
            const dir = /\$ cd ([a-z/\.]+)$/.exec(line)[1];

            if (dir === '/') {
                 currentdir = [];
                 return;
            }
            if (dir === '..') {
                currentdir.pop();
                return;
            }

            currentdir.push(dir);
            return;
        }

    });
}
