# Making Things

Fork this repository and clone your newly created repository. At the end of the challenge, push your code to your repository and create a pull request to this repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---
### Submission

When you have completed this challenge, submit by creating a Pull Request back to the turingschool-examples repo. Include the following information:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through
---
### Requirements

* TDD all new work; any model METHODS you write must be fully tested.
---
### Not Required

* No visual styling is required or expected
---
### Before Starting User Stories

* This challenge uses a one-to-many and a many-to-many relationship (your migrations are partially built), be sure to check your setup/schema carefully.
* All model tests for validations and relationships have been made.
* You will have 7 failing model tests as soon as you set up this challenge and run your tests (Let your instructor know if you are not seeing 7 failing tests)
* Get these tests to pass before moving on to the user stories below.

### Challenge Description

You are now in charge of a global conglomerate. You will be working with Projects, Items and Manufacturers. Projects consist of items, and Items are potentially associated with a number of Manufacturers and vice versa.

Projects have a name and a manager. Items have a name and a cost. Manufacturers have a name and a location.



---

## User Stories

```
User Story 1 of 3

As a visitor,
When I visit an item's show page ("/items/:id"),
I see that item's name and cost
And I also see the name of the project this belongs to.

```

```
User Story 2 of 3

As a visitor,
When I visit the manufacturers index page ("/manufacturers")
I see a list of names of all the manufacturers
And under each manufacturers  name I see a list of all of the names of the items they belong to.
```

```
User Story 3 of 3

As a visitor,
When I visit an item's show page
I see a count of the number of manufacturers for this item

```

### Extensions

```
User Story Extension 1 - Average cost per item for project

As a visitor,
When I visit a project's show page
I see the average cost per item for the items of that project to two decimal places
```

```
User Story Extension 2 - Adding a contestant to a project

As a visitor,
When I visit a item's show page
I see a form to add a manufacturer to this project
When I fill out a field with an existing manufacturer's id
And hit "Add manufacturer to item"
I'm taken back to the item's show page
And I see that the number of manufacturers has increased by 1
And when I visit the manufacturers index page
I see that item listed under that manufacturer's name
```
 
