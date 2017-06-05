# GetBase - Ruby, Watir
One of tech task for QA Automation position (Ruby, Watir).

The task:

Choose any automation framework + programming language to create tests for this scenario:
1. Log into the Web version of Base. 
2. Create a new Lead with random name
3. Check that its Lead status is "New"
4. Go into Settings / Leads / Lead statuses and change the name of the "New" status to a different name.
5. Go back to the Lead to check if the name change is reflected.

I decide to choose ruby and watir as technology that I haven't used in my experience. 

All src you can find at: https://github.com/kyxap/getbase
Also I have integrate the tests with Travis CI, last successful test run results you can find at: https://travis-ci.org/kyxap/getbase/builds/92888667

The project can run at the local machine and install all dependencies also can run in headless mode with travis ci without any configuration updates.
