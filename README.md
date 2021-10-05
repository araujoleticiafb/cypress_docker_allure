## Automated Web UI Testing

This is a repository that contains the structure of Automated Web UI Testing.

### 🔧 Tools & Technologies

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
$ docker run -it -p 8787:8787 YOUR_IMAGE_NAME
```
> **NOTE 1:** Replace **YOUR_IMAGE_NAME**.

### View Allure Reports
```sh
$ http://localhost:8787
```
> **NOTE 2:** When running tests using Docker you could not click on the URL, which is displayed at the end of tests. So you must change http://172.17.0.3:8787 to http://localhost:8787.

## ✨ Running locally

### Pre Requirements

**Verify node version**
```sh
node -v
```

**Verify NPM version**
```sh
npm -v
```

**Clone the project**

**Install dependencies at package.json**
 ```sh
 $ npm install
```
> **NOTE 3:** If 'npm install' does not install all dependencies follow the steps:<br/>
> npm install -g allure-commandline --save-dev<br/>
> npm i -D @shelex/cypress-allure-plugin<br/>
> npm i --save-dev @types/mocha<br/>
> npm install --save-dev @types/cypress-cucumber-preprocessor<br/> 

**Given permission**
```sh
$ chmod +x start.sh
```
**Install Allure Report**

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
### Running tests with interface graphic
```sh
$ npm run cy:open
```
### Running tests in headless mode
```sh
$ npm run test:allure
```
#### View Allure Reports
```sh
$ npm run allure:open
```
Click on the URL, which is displayed.
