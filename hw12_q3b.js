const cc = c => c.charCodeAt(0) - 'a'.charCodeAt(0)
const enc_chr = c => String.fromCharCode(((cc(c)*3+14) %26) + 'a'.charCodeAt(0))
const enc_str = s => s.split('').map(enc_chr).join('')

// qpqdyjzcrwcgjujellytcrqnurujgqrndqcrtudkqoqrjg
console.log(enc_str('everythingistotallyfinedonotsendreinforcements'))
