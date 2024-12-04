var fs = require('fs')
let result = fs.readFileSync('input.txt','utf8')
let regex = new RegExp('mul\\(\\d+,\\d+\\)', 'gm');
const array = [...result.matchAll(regex)]

let sum = 0
array.forEach(element => {
    let intRegex = new RegExp('\\d+','gm')
    const numbers = [...element[0].matchAll(intRegex)]
    sum += numbers[0][0] * numbers[1][0]
});

console.log(sum)