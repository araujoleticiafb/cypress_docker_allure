class CypressMethods {

   public access(url: string) {
      return cy.visit(url)
   }

   public getElement(element: string) {
      return cy.get(element)
   }

   public constainsElementClick(element: string) {
      cy.contains(element).click({ force: true })
   }

   public constainsTextClick(element: string, text: string) {
      cy.get(element).contains(text).click({ force: true })
   }

   public setTextElement(element: string, value: string) {
      cy.get(element).type(value)
   }

   public clickButton(element: string) {
      cy.get(element).click()
   }

   public clickfirstButton(element: string) {
      cy.get(element).first().click()
   }

   public doubleClick(element: string) {
      cy.get(element).dblclick({ force: true })
   }

   public elementToBeVisible(element: string) {
      cy.get(element).should('be.visible')
   }

   public elementExists(element: string): boolean {
      if (cy.get(element).should('be.exist')) return true
      else return false
   }

   public haveText(element: string, text: string) {
      cy.get(element).should('have.text', text)
   }

   public haveTextChildren(element: string, children: string, text: string) {
      cy.get(element)
            .within(() => {
                return cy.get(children)
        })
        .should('have.text', text)
   }

   public containsValue(element: string, subElement: string, value: string) {
      cy.get(element)
         .invoke(subElement)
         .should('match', value)
   }

   public containsText(element: string, text: string) {
      cy.get(element).contains(text)
   }

   public ifElementVisible(element: string) {
      cy.get(element).then(($el) => {
         Cypress.dom.isVisible($el)
      })
   }

   public isAtacched(element: string) {
      cy.get(element).then(($el) => {
         Cypress.dom.isAttached($el)
      })
   }

   public isDisplayed(element: string): boolean {
      if (cy.get(element).should('be.visible')) return true
      else return false
   }

   public isNotDisplayed(element: string): boolean {
      if (cy.get(element).should('not.be.visible')) return true
      else return false
   }

   public isClicable(element: string): boolean {
      if (cy.get(element).should(('be.visible')) && cy.get(element).should('be.enabled')) return true
      else return false
   }

   public isEnable(element: string): boolean {
      if (cy.get(element).should('be.enabled')) return true
      else return false
   }

   public elementEnable(element: string) {
      cy.get(element).should('be.enabled')
   }

   public isSelected(element: string) {
      if (cy.get(element).should(('be.selected'))) return true
      else return false
   }

   public enter(element: string) {
      cy.get(element).type('{enter}')
   }

   public getAttribute(element: string, attr: string): string {
      var value: string
      cy.get(element).invoke(attr).then(ele => {
         value = ele.text()
      })
      return value
   }

   public getTitle() {
      return cy.title()
   }

   public getLength(element: string): number {
      var i: number
      cy.get(element).its('length').then(length => {
         i = length
      })
      return i
   }

   public getText(element: string): string {
      var txt
      cy.get(element).then(ele => {
         txt = ele.text()
      })
      return txt
   }

   public clearInput(element: string) {
      cy.get(element).clear()
   }

   public invokeElementAndClick(element: string, attribute: string, condition: string) {
      cy.get(element).invoke(attribute).then((attr) => {
         if (attr == condition) {
            cy.wrap(attr).click()
         }
      })
   }

   public handleErrors() {
      cy.on('uncaught:exception', err => {
         if (!err.message.includes(`Cannot read properties of null (reading 'scrollHeight')`) || !err.message.includes(`Cannot read properties of null (reading 'appendChild')`)) {
            return false
         }
      })
   }
}

const cypressMethods = new CypressMethods()
export default cypressMethods
