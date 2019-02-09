/**
 * Extends the AsciiDoc syntax to support a card element. The cardset is
 * created from a dlist that is enclosed in an example block marked with the
 * card style.
 *
 * Usage:
 *
 *  [cards]
 *  ====
 *  card A::
 *  +
 *  --
 *  Contents of card A.
 *  --
 *  card B::
 *  +
 *  --
 *  Contents of card B.
 *  --
 *  ====
 *
 * To use this extension, register the extension.js file with Antora (i.e.,
 * list it as an AsciiDoc extension in the Antora playbook file), combine
 * styles.css with the styles for the site, and combine behavior.js with the
 * JavaScript loaded by the page.
 *
 * @author Dan Allen <dan@opendevise.com>
 */
const IdSeparatorChar = '-'
const InvalidIdCharsRx = /[^a-zA-Z0-9_]/g
const List = Opal.const_get_local(Opal.module(null, 'Asciidoctor'), 'List')
const ListItem = Opal.const_get_local(Opal.module(null, 'Asciidoctor'), 'ListItem')

const generateId = (str, idx) => `cardset${idx}_${str.toLowerCase().replace(InvalidIdCharsRx, IdSeparatorChar)}`

function cardsBlock () {
  this.onContext('example')
  this.process((parent, reader, attrs) => {
    const createHtmlFragment = (html) => this.createBlock(parent, 'pass', html)
    const cardsetIdx = parent.getDocument().counter('idx-cardset')
    const nodes = []
    nodes.push(createHtmlFragment('<div class="card-grid">'))
    const container = this.parseContent(this.createBlock(parent, 'open'), reader)
    const sourceCards = container.getBlocks()[0]
    if (!(sourceCards && sourceCards.getContext() === 'dlist' && sourceCards.getItems().length)) return
    const cards = List.$new(parent, 'ulist')
    cards.addRole('cards')
    const panes = {}

    nodes.push(createHtmlFragment('<div class="wrap">'))

    sourceCards.getItems().forEach(([[title], details]) => {
      const card = ListItem.$new(cards)
      cards.$append(card)
      const id = generateId(title.getText(), cardsetIdx)
      card.text = `[[${id}]]${title.text}`
      let blocks = details.getBlocks()

      nodes.push(createHtmlFragment(`<div class="card-wrap"><div class="card">`))
      nodes.push(createHtmlFragment(`<b>${title.text}</b>`))
      nodes.push(...blocks)
      nodes.push(createHtmlFragment('</div></div>'))


      const numBlocks = blocks.length
      if (numBlocks) {
        if (blocks[0].context === 'open' && numBlocks === 1) blocks = blocks[0].getBlocks()
        panes[id] = blocks.map((block) => (block.parent = parent) && block)
      }

   //   nodes.push(createHtmlFragment('</div>'))
   
    })
    parent.blocks.push(...nodes)
  })
}

module.exports.register = (registry, context) => {
  registry.block('cards', cardsBlock)
}
