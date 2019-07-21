const Asciidoctor = require('asciidoctor')

var asciidoctor = Asciidoctor()

const filename = process.argv.slice(2)

const doc = asciidoctor.loadFile(filename[0],{safe: 'unsafe', parse: false, attributes:{'allow-uri-read': true}})

var lines = doc.reader.read()

console.log(lines)
