const fs = require('fs');

if (!fs.existsSync('data')) {
    console.error('Please run this in the "7" directory.');
}

const tree = [];
let currentdir = [];
let lsmode = false;

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
        if (line === '') return;

        if (lsmode && !line.startsWith('$')) {
            let searchdir = tree;
            for (let i = 0; i < currentdir.length; i++) {
                const d = currentdir[i];
                searchdir = searchdir.find(a => a.name === d)?.contents || searchdir;
                if (i === currentdir.length-1 && /^\d+ /.test(line)) {
                    searchdir.push({
                        name: /^\d+ ([a-z\.]+)$/.exec(line)[1],
                        size: +/^(\d+) /.exec(line)[1]
                    });
                }
            }
        }

        if (line.startsWith('$ cd')) {
            lsmode = false;
            const dir = /\$ cd ([a-z/\.]+)$/.exec(line)[1];

            if (dir === '/') currentdir = [];
            if (dir === '..') {
                currentdir.pop();
                return;
            }

            currentdir.push(dir);
            let searchdir = tree;
            for (const d of currentdir) {
                const founddir = searchdir.find(a => a.name === d);
                searchdir = founddir?.contents || searchdir;
                if (founddir === undefined) {
                    searchdir.push({
                        name: d,
                        contents: []
                    });
                    break;
                }
            }
            return;
        }

        if (line.startsWith('$ ls')) {
            lsmode = true;
        }

    });

    fs.writeFile('data/day7/functions/setup.mcfunction', `data modify storage day7:storage root.tree set value ${JSON.stringify(tree)}`, (e) => {if (e) console.error(e)});
}
