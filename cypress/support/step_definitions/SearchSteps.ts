import { Given,Then,When,And } from 'cypress-cucumber-preprocessor/steps';
import { GLOBOPLAY_HOME_PAGE_ELEMENTS } from '../pages/globoPlayHomePage';
import { INICIAL_PAGE_ELEMENTS } from '../pages/inicialPage';
import { CONSTANTS } from '../utils/constants';
import cypressMethods from '../utils/cypressMethods';
const url = Cypress.config("baseUrl")

Given('the user accesses GloboPlay', () => {
    cypressMethods.handleErrors()
    cypressMethods.access(url)
    cypressMethods.constainsTextClick(INICIAL_PAGE_ELEMENTS.selectSite, CONSTANTS.nameSiteTxt)
    }
);

When('the user inputs {string} in a search field', (research) => {
    cypressMethods.clickButton(GLOBOPLAY_HOME_PAGE_ELEMENTS.search)
    cypressMethods.setTextElement(GLOBOPLAY_HOME_PAGE_ELEMENTS.searchInput, research)
    }
);

Then('all videos are displayed', () => {
    cypressMethods.containsText(GLOBOPLAY_HOME_PAGE_ELEMENTS.resultTitle, CONSTANTS.resultTitleTxt)
    cypressMethods.containsText(GLOBOPLAY_HOME_PAGE_ELEMENTS.resultVideo, CONSTANTS.resultVideoTxt)
    cypressMethods.takeScreenShot('videos')
    }
);

Then('a message is displayed', () => {
    cypressMethods.containsText(GLOBOPLAY_HOME_PAGE_ELEMENTS.noResults, CONSTANTS.noResultsTxt)
    cypressMethods.takeScreenShot('inexistent-error-msg')
    }
);