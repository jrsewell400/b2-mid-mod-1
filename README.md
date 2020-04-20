# README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.

Overview
 
We are creating an application to track the maintenance of rides at amusement parks. We have amusement parks, which have many rides, rides can have many mechanics working on it, and mechanics can work on multiple rides. 
 
Amusement Parks have a name and admission price
Mechanics have a name and years of experience
Rides have a name and thrill rating (1-10)
 
You will need to create all the migrations. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.
 
Read each story carefully.
 
Story 1
As a user, 
When I visit a mechanics index page
I see a header saying “All Mechanics”
And I see a list of all mechanic’s names and their years of experience
 
 
Ex: 
              All Mechanics
 
    Sam Mills - 10 years of experience 
    Kara Smith - 11 years of experience
 
 
Story 2
As a visitor, 
When I visit an amusement park’s show page
I see the name and price of admissions for that amusement park
And I see the names of all the rides that are at that theme park listed in alphabetical order
And I see the average thrill rating of this amusement park’s rides
 
Ex: Hershey Park
    Admissions: $50.00
       
    Rides: 
           1. Lightning Racer 
           2. Storm Runner
           3. The Great Bear 
 
    Average Thrill Rating of Rides: 7.8/10
       
Story 3
As a user, 
When I go to a mechanics show page 
I see their name, years of experience, and names of all rides they’re working on
And I also see a form to add a ride to their workload
When I fill in that field with an id of an existing ride and hit submit
I’m taken back to that mechanics show page
And I see the name of that newly added ride on this mechanics show page
 
Ex: 
 
Mechanic: Kara Smith
Years of Experience: 11
 
Current rides they’re working on: 
The Frog Hopper 
Fahrenheit 
The Kiss Raise
 
Add a ride to workload: 
 _pretent_this_is_a_textfield_


Story 4
As a user,
When I go to a rides show page
I see that ride's name, and thrill rating
I also see a section on the page that is titled "Rides with the same thrill rating."
Under that title, I see a list of rides from that same park with the same thrill rating of this ride.


Story 5
As a user,
When I visit the amusement park's show page
I see that the list of rides is broken up into In Order and Out of Order Rides
Next to each In Order ride I see a button to mark the ride as Out of Order
When I click this button I'm returned to the amusement park's show page
And I see that the ride's name is now under the Out of Order heading
Likewise, next to each Out of Order ride, I see a button to mark the ride as In Order
When I click that button
I'm returned to the amusement park's show page
And I see that the ride's name is now under the In Order heading.


Story 6
As a user,
When I go to a mechanics index page
I see a section on the page titled "Mechanics with The Most Rides"
And under that title, I see the 3 mechanics with the most rides they're working on