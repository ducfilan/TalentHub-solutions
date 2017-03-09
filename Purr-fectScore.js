var input = '';
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(chunk) {
    input += chunk;
});
process.stdin.on('end', function() {
    var lines = input.trim().split(/\n/);
    var N = parseInt(lines[0]);
    var D = [];
    var P = [];
    var dLocalIndex = 0;

    var currentMovedInCat;
    var currentMovedInCatIdealCats = [];

    for (var i = 1; i <= N; i++) {
        var line = lines[i].split(/\s/);
        if (line.length == 3) {
            D.push({
            globalIndex: i - 1,
            localIndex: dLocalIndex++,
            A: parseInt(line[1]),
            B: parseInt(line[2])
        });
        }else{
            P.push({
                globalIndex: i - 1,
                Dindex: parseInt(line[1]) - 1
            });
        }
    }

    for (var i = 0; i < P.length; i++) {
        var currentMovEdincatInfo = P[i];
        currentMovedInCat = D[currentMovEdincatInfo.Dindex];

        currentMovedInCatIdealCats = D.filter(
            idealCat =>
                !(idealCat.A < currentMovedInCat.A
                || idealCat.B < currentMovedInCat.B
                || idealCat.globalIndex >= currentMovEdincatInfo.globalIndex
                || idealCat.localIndex == currentMovEdincatInfo.Dindex)
        );

        var minBInIdealCats = Math.min.apply(Math, currentMovedInCatIdealCats.map(cat => cat.B));

        currentMovedInCatIdealCats = currentMovedInCatIdealCats.filter(cat => cat.B == minBInIdealCats);
        currentMovedInCatIdealCats.sort((a, b) => a.A - b.A);
        if (currentMovedInCatIdealCats.length === 0) {
            console.log('NO');
        }else{
            console.log(currentMovedInCatIdealCats[0].localIndex + 1);
        }
    }
});