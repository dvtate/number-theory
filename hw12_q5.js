const clamp = n => n % 26 >= 0 ? n % 26 : (n % 26 + 26);
const cc = c => typeof c == 'string' 
	? c.charCodeAt(0) - 'a'.charCodeAt(0) 
	: String.fromCharCode(clamp(c) + 'a'.charCodeAt(0));
	
const enc_chr = c => cc(((cc(c)*3+14) %26))
const enc_str = s => s.split('').map(enc_chr).join('')

// q3b qpqdyjzcrwcgjujellytcrqnurujgqrndqcrtudkqoqrjg
console.log(enc_str('everythingistotallyfinedonotsendreinforcements'))

const hill = ([c1, c2]) => cc((-5*cc(c1) + 2*cc(c2))) + cc((3*cc(c1)-cc(c2)))

// q5b
// prints: [ 'he', 'ar', 'th', 'eb', 'el', 'ls' ] 
console.log(['pp','ih', 'ho','gr','ap','vt'].map(hill))


