## Automated Web UI Testing

This is a repository that contains the structure of Automated Web UI Testing.

### 🛠️ Tools & Technologies

This project use the framework [Cypress](https://www.cypress.io/) used with [TypeScript](https://www.typescriptlang.org/), [Cucumber](https://cucumber.io/) and [Docker](https://github.com/cypress-io/cypress-docker-images/blob/master/included/8.3.0/Dockerfile).
Additionally, [Allure Report](https://docs.qameta.io/allure/) is applied to show tests results. 

### 📦 Project organization

The project has the following structure:

  ```
    ├──cypress
    │  ├──[fixtures]
    │  ├──[integration]
    │  │  ├──[Name.feature]
    │  ├──[puglins]
    │  ├──[support]
    │  │  ├──[pages]
    │  │  |  ├──[NamePage.ts]
    │  │  ├──[step_definations]
    │  │  |  ├──[NameStpes.ts]
    │  │  ├──[utils]
    │  │  |  ├──[constants.ts]
    │  │  |  ├──[cypressMethods.ts]
    
  ```

## 🚀 Running with Docker
Download and install [Docker](https://www.docker.com/products/docker-desktop).

### Build

```sh
$ docker build -t YOUR_IMAGE_NAME .
```

### Run
```sh
$ docker run -it -p 8787:8787 YOUR_IMAGE_NAME ci ${@tagsName} or ${no-tag}
```
> **NOTE 1:** Replace **YOUR_IMAGE_NAME**.
> >- ci: execute test on docker
> >- local: execute test locally
> >- no-tag: execute all tests
> >- @tagsName: execute a specific test

**Exemplo**
```sh
$ docker run -it -p 8787:8787 YOUR_IMAGE_NAME ci @e2e
```
### 📊 View Allure Reports
```sh
$ http://localhost:8787
```
> **NOTE 2:** When running tests using Docker you could not click on the URL, which is displayed at the end of tests. So you must change http://172.17.0.3:8787 to http://localhost:8787.
> > 🐛 [Error base image Cypress](https://github.com/cypress-io/cypress/issues/4351#issuecomment-559489091) 

## 📍 Running locally
### ⚙️ Pre Requirements

**1. Verify node version**
```sh
node -v
```

**2. Verify NPM version**
```sh
npm -v
```

**3. Clone the project**

**4. Install dependencies at package.json**
```sh
 $ npm install
```
> **NOTE 3:** If 'npm install' does not install all dependencies follow the steps:
> >- npm i -D @shelex/cypress-allure-plugin
> >- npm install --save-dev @cypress/browserify-preprocessor
> >- npm i --save-dev @types/mocha
> >- npm install --save-dev typescript
> >- npm install -D cypress-xpath
> >- npm install --save-dev @types/cypress-cucumber-preprocessor 

**5. Given permission**
```sh
$ chmod +x start.sh
```
**6. Install Allure Report**

MacOS
```sh
$ brew install allure
```
Linux
```sh
$ sudo apt-add-repository ppa:qameta/allure
sudo apt-get update 
sudo apt-get install allure
```
### 🖥️ Running tests with interface graphic
```sh
$ npm run cy:open
```
### ⬛ Running tests in headless mode
All tests:
```sh
$ npm run test:allure
```
Tests with tag:
```sh
$ npm run test:allure:e2e
```
#### 📊 View Allure Reports
```sh
$ npm run allure:open
```
Click on the URL, which is displayed.