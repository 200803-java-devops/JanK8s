# JANK8S

## Overview
This group project is a CI/CD tool that helps project integration and deployment. Once the code is pushed to github, this projet will start building, testing, packaging and deploying with notification. 

## Features
- [ ] User Stories
- [ ] Documentation
- [ ] Cloud Hosting
- [ ] Containerization
- [ ] Orchestration
- [ ] Continuous Integration
- [ ] Continuous Delivery
- [ ] Development Environment
- [ ] Testing Environment
- [ ] Production Environment
- [ ] Reports

## Tech Stack
- [ ] Jenkins
- [ ] Docker
- [ ] Amazon Web Services:
    - [ ] EKS
    - [ ] ECR (or DockerHub)
- [ ] GitHub
- [ ] Kubernetes
- [ ] Slack/Discord/Email

## User Story:

### Initiative:


  > As a developer, when I push my code to the master branch, I want my changes to be integrated onto a build/artifacts repository and pushed to/updated on a production server so that I do not have to do those steps myself.

### Epics:
 - CI: As a developer, when I push my code to the master branch, I want my changes to be built, tested, and integrated onto a build/artifacts repository so that integration occurs automatically.
    > As a developer, when I push my code to the master branch, I want my code to be built and pushed to an artifact/build repository so that I do not have to do it myself.

    > As a developer, when a build fails, I want to be notified why the build failed so that I can debug my code more easily.

    > As a developer, when my code is built, I would like my code to be tested so that  I know the code is functional.

    > As a developer, when my code fails a test, I want to know what test it failed, and why, so that I can debug my code more easily.

 - CD: As a developer, when I push my code to the master branch, I want my changes to appear on a production server, so that I do not have to manually deploy new builds.
    > As a developer, when code pushed to the master branch is built and tested, I want the projects to be packaged and placed on the production server so that it is continuously and automatically deployed.

    > As an operator, when a current build is unsatisfactory, I want to be able to roll back to an earlier build, so that I can make sure that the application is always running smoothly.

    > As an application user, when I use the application, I want it to always be available so that I can use it whenever I want.


 - Communication: As a developer I want to be notified of the results of the Pipeline process sent to me so that I can easily access the results and know the status of my latest builds
    > (stretch) As a developer I want to be notified of the results of the Pipeline process sent to me on slack so that I can easily access the results and know the status of my latest builds.
    
    > As I developer I want to be notified of the results of the Pipeline process sent to me over email so that I can easily access the results and know the status of my latest builds.

## Presentation
- [ ] 5-10 minute slide deck
- [ ] 10 minute live demonstration
- [ ] 5 minute questions & answers

## Usage
### Run
```xxx```