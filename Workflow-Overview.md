# Workflow Overview

This doc serves as reference for how we'll work together and make sure we're working effectively.

### Sprints

We should work in Sprints to timebox our work and make sure we meet goals.

See [Sprints.md](https://github.com/CS4347-Team-Orange/library-setup/tree/main/Sprints.md) for project schedule.

### Take a ticket from the board.

In "This Sprint" - Tickets next up will be at the top.  Pull your next ticket from the top down as you move through the sprint.

Move the ticket to In Progress, and Assign yourself.

### Create Branch

Create a branch that starts with the issue number, eg for issue #2 - Seed Sample Data, I'm going to create a branch named `2-seed-sample-data` on the project.  The source branch will be master.

You can reference [this doc](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository) for creating branches.

### Write Code

* check it out on your local machine 
* start working the ticket.  

Use development modes to get it working.

### Test Code

Do a `bash start.sh` in your terminal and run your use case tests if the app comes up.  If it all checks out, go ahead and commit/push to the branch you're working on.

**Please also push regularly** - losing changes stinks, and if your computer breaks - your code will be safely stored on github.

When you push to your branch, Travis-CI will execute the tests.  You should get an email with the results, althogh you can also check from the branch's page directly eg []()

### Open Pull Request

If you're not familiar with a PR - It's essentially a request for review you create for your code.  It highlights differences between the source branch (your changes), and the target branch (main).  It allows people to comment on the changes, and allows for designated approvers to approve, request changes, or reject the PR.  It also provides an easy interface for merging the code.

Thanks to CI/CD, your tests will run _again_ when a pull request is opened, and each time you make changes.

##### Pull request requirements

* Drop a message in the PR linking the issue to the PR, eg "Implements #4 - XYZ Ticket".  
* Add the other project members as reviewers

The `#4` will auto-link the PR to the issue, which will automatically move the ticket across the Kanban board as we work on the PR.

Please try to complete initial code reviews within 24 hours.

### Merge Pull Request

It's the person who created the ticket's job to follow up for feedback and merge once all approvers have passed.

We'll merge tickets in weekly sync's as needed.