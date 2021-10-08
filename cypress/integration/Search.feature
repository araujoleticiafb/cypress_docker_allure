@search
Feature: Search
As a user
I want to be able to search

    Background:
        Given the user accesses GloboPlay

    @e2e
    Scenario: Check if results are displayed when inputting valid research   
        When the user inputs 'jobs' in a search field
        Then all videos are displayed
    
    @smoke
    Scenario: Check message when inputting invalid research   
        When the user inputs 'rtr' in a search field
        Then a message is displayed