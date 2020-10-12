---
title: "Data Skills for the Life Sciences"
author: "Module lead: IAIN STOTT  /   email istott@lincoln.ac.uk"
date: "Last updated 2020-10-12"
output: 
  learnr::tutorial:
    progressive: true
    theme: default
runtime: shiny_prerendered
description: "This workbook accompanies the University of Lincoln School of Life Sciences Level 2 Module BGY2011M Data Skills for the Life Sciences."
---








<!--html_preserve--><div style="top:20px;right:20px;position:absolute;cursor:inherit; width: 250px; margin-top: -100px; z-index: 100000;">
<div class="panel-body">
<div class="form-group shiny-input-container">
<label class="control-label" for="shinytheme-selector">Theme:</label>
<div>
<select id="shinytheme-selector" class="form-control"><option value="default" selected>default</option>
<option value="cerulean">cerulean</option>
<option value="cosmo">cosmo</option>
<option value="cyborg">cyborg</option>
<option value="darkly">darkly</option>
<option value="flatly">flatly</option>
<option value="journal">journal</option>
<option value="lumen">lumen</option>
<option value="paper">paper</option>
<option value="readable">readable</option>
<option value="sandstone">sandstone</option>
<option value="simplex">simplex</option>
<option value="slate">slate</option>
<option value="spacelab">spacelab</option>
<option value="superhero">superhero</option>
<option value="united">united</option>
<option value="yeti">yeti</option></select>
</div>
</div>
</div>
<script>$('#shinytheme-selector')
  .on('change', function(el) {
    var allThemes = $(this).find('option').map(function() {
      if ($(this).val() === 'default')
        return 'bootstrap';
      else
        return $(this).val();
    });
    // Find the current theme
    var curTheme = el.target.value;
    if (curTheme === 'default') {
      curTheme = 'bootstrap';
      curThemePath = 'shared/bootstrap/css/bootstrap.min.css';
    } else {
      curThemePath = 'shinythemes/css/' + curTheme + '.min.css';
    }
    // Find the &lt;link&gt; element with that has the bootstrap.css
    var $link = $('link').filter(function() {
      var theme = $(this).attr('href');
      theme = theme.replace(/^.*\//, '').replace(/(\.min)?\.css$/, '');
      return $.inArray(theme, allThemes) !== -1;
    });
    // Set it to the correct path
    $link.attr('href', curThemePath);
  });</script>
</div><!--/html_preserve-->

<style type="text/css">
body{
  padding-top: 90px;
}

.topicsList .topic{
  border-bottom: 0px;
}

.topicsList .topic.current{
  background-color: inherit;
  padding-left: 25px;
}

@media screen and (max-width: 767px) {
  .topicsList {
    background-color: rgba(255, 255, 255, 0.98);
    box-shadow: 0 5px 25px 0px rgba(0, 0, 0, 0.15);
    -webkit-box-shadow: 0 5px 25px 0px rgba(0, 0, 0, 0.15);
    color: #333;
  }

  .topicsHeader h1, .topicsHeader .h1, .topicsHeader h2, .topicsHeader .h2, .topicsHeader h3, .topicsHeader .h3, .topicsHeader h4, .topicsHeader .h4, .topicsHeader h5, .topicsHeader .h5, .topicsHeader h6, .topicsHeader .h6 {
    color: #333;
    text-shadow: none;
  }

  #doc-metadata h1, #doc-metadata #h1, #doc-metadata h2, #doc-metadata #h2, #doc-metadata h3, #doc-metadata #h3, #doc-metadata h4, #doc-metadata #h4, #doc-metadata h5, #doc-metadata #h5, #doc-metadata h6, #doc-metadata #h6, #doc-metadata a {
    color: #333;
    text-shadow: none;
  }
  .scroll-250 {
    max-height: 250px;
    overflow-y: auto;
    background-color: inherit;
  }

}
</style>

































## 0 --- Data
\

This page introduces the data sets you'll be using during the course.  
\

The _**GAMES**_ data will be used during pre-session home-working part of each Chapter, and will be used to help learn theory and skills in data handling, visualisation and analysis.  
\

The _**BIOLOGICAL DATA SETS**_ will be used to apply data theory and skills to real, published biological data sets, during online workshops.  

$~$

### **--- GAMES DATA**
\ 

#### _The **GAMES** data is a data set you'll use during the home-working part of each Chapter._  
\

The data is based on some simple games/tests and basic information about yourselves. You'll be asked to fill this out during the first lecture for the module. Please look at the information below and fill in the form at the end of this seection. The data is stored anonymously.  

$~$

#### **VARIABLES IN THE GAMES DATA**
\

1. **ROLE**, saved as `role` in the data, is one of:

* _student_ at Lincoln (coded as `student` in the data)
* _staff_ at Lincoln (coded as `staff` in the data)
* _external_ to Lincoln (coded as `external` in the data)
* _child_ (coded as `child` in the data)
* _baby_ (coded as `baby` in the data)

2. **TUTOR GROUP**: your tutor group ID for the module. 
See document on blackboard if you're not sure.
This information will be coded anonymously so that it is not clear which tutor
group is which (makes everything even more anonymous).
Saved as `group` in the data.

3. **EYESIGHT**: your **glasses prescription** (if any). 
If you have a different prescription for 
each eye then take the average.
Saved as `eyesight` in the data.

4. **CONTINENTS**: how many continents you've visited in your life (
including your home continent).
Saved as `continents` in the data.

5. **COUNTRIES**: how many countries you've visited in your life 
(including your home country).
Saved as `countries` in the data-

6. **HEARING**: your score in the hearing test (see below).
Saved as `hearing` in the data.

7. **REACTION** your score in the reaction test (see below). 
Saved as `reaction` in the data.

8. **HARDWARE**, saved as `hardware` in the data, is whether for the two games above, you were using a:

* mouse (coded as `mouse` in the data)
* touchpad or touchscreen (coded as `touch` in the data)  

$~$

##### **HIGH FREQUENCY HEARING TEST**

For the following test you'll need speakers or earphones. Please make sure that the volume is not turned up too loud!  

Once you click, a noise will be produced, starting from 20000Hz and decreasing. You need to click again as soon as you hear the noise. Younger people tend to be able to hear higher frequencies.  

If, for whatever reason, you are unable to take the test, please skip this question.  
\

<div align="center">
   <iframe width="360" height="540" src="https://humanbenchmark.com/tests/hearing" frameborder="0" allowfullscreen>
   </iframe>
</div>

$~$

##### **REACTION TEST**

This reaction test will measure your reaction time three times; please record the average time in the form. Note: although the test involves clicking when a colour turns from red to green, the test is still suitable for those with any kind of colour blindness as the prompt will change from "Wait for green" to "Click!"  
\

<div align="center">
   <iframe width="360" height="540" src="https://humanbenchmark.com/tests/reactiontime/" frameborder="0" allowfullscreen>
   </iframe>
</div>

$~$

##### **FORM FOR COMPLETING GAMES DATA**

<div align="center">
  <iframe src="https://docs.google.com/forms/d/e/1FAIpQLSevukh74bKwyNouV3g3An5bg0pKV2WeIvI_bLT6nlnSnOD03w/viewform?embedded=true" width="640" height="1138" frameborder="0" marginheight="0" marginwidth="0">Loading…
  </iframe>
</div>
\


### **--- BIOLOGICAL DATA**
\

#### _The **BIOLOGICAL** data consists of data sets that you'll work on in online workshops_.  
\

#### _**EACH GROUP WILL WORK ON ONE OF THE DATA SETS:**_

* **GROUP 1** (timetabled as BM/BV/BCB1, Tuesdays 17:00-18:00): **CELLULAR AGEING**
* **GROUP 2** (timetabled as BM/BV/BCB2, Wednesdays 16:00-17:00): **CELLULAR AGEING**
* **GROUP 3** (timetabled as BM/BV/BCB3, Wednesdays 17:00-18:00): **CELLULAR AGEING**
* **GROUP 4** (timetabled as EQS/Z/BIO, Fridays 16:00-17:00): **URBAN DOGS**
* **GROUP 5** (timetabled as ECL/Z/BIO, Mondays 17:00-18:00): **CARNIVORE LIFE HISTORY**
\

There are three data sets, each focused on different levels of the hierarchy of biological organisation. In the modern age, it is becoming more common to publish scientific research and data "open access", which is essentially a form of creative commons license for science. This usually allows the unrestricted use and redistribution of the work, provided it is cited. All three data sets are freely available online in data archives, and all three research articles are also open-access.  
\

#### **CELLULAR AGEING**

[Huh _et al._ (2016) Maintenance of age in human neurons generated by microRNA-based neuronal conversion of fibroblasts. _eLife_, 5:e18648. DOI: 10.7554/eLife.18648.](https://elifesciences.org/articles/18648)  
\

<center>
![Neurons](www/neurons.jpg){width="80%"}
</center>  
\  

When studying old age brain disorders, it is difficult to get samples of the affected cells. New techniques mean it is possible to instead convert fibroblast cells (from the skin) into neurons using an approach termed "microRNA-based cellular reprogramming", but it's important that the converted neurons behave as if they're the same 'age' as their parent fibroblasts . This article measures a number of aspects of cellular age to determine whether or not that is the case.  

The variables are:

* `SampleNo`: the sample number
* `Donor`: the donor ID
* `DNAmAge`: the cell age (measured by applying an epigenetic biomarker to DNA methylation data).
* `Tissue` The tissue type
  + `fibroblasts`, the pre-conversion fibroblast cells
  + `neuron`, the post-conversion medium spiny neuron cells.
* `Age` the age of the donor
* `Gender` the gender identity of the donor
  + `male`
  + `female`
\

The file for this data is called `cell_age_data.csv`.  
\

#### **URBAN DOGS**

[Majumder _et al._ (2016) Denning habits of free-ranging dogs reveal preference for human proximity. _Scientific Reports_, 6:32014. DOI: 10.1038/srep32014.](https://www.nature.com/articles/srep32014)  
\

<center>
![Sleepy dog](www/dog.jpg){width="80%"}
</center>  
\  

In urban settings, it is common for mammals to build their dens away from human activity, but dogs have evolved in the presence of humans. It is unclear then, what governs the choices of den site for feral dogs in urban landscapes versus rural. This study follows 148 dogs in India and scores dens on a number of characteristics to determine whether urban and rural dogs are making similar den choices.  

The variables are:

* `Year`: the year of the study
* `Mother`: the ID of the mother of the litter
* `LitterSize`: the size of the litter 
* `LitterSizeCategory`: the size of the litter as a categorical variable
  + `small`, 1-4 pups
  + `large`, > 4 pups
* `TotalScore`: the total score for den quality across all criteria
* `StructureScore`: the score for den structure (den area, height, level i.e. above or below ground)
* `ResourceScore`: the score for access to resources (distance to food and water)
* `QualityScore`: the score for den quality (shade and light availability)
* `DisturbanceScore`: the level of human disturbances.

(More information on scoring is available in the supplementary material for the article).
\

The file for this data is called `urban_dogs_data.csv`.  
\

#### **CARNIVORE LIFE HISTORY**
\
[Jones _et al._ (2009) PanTHERIA: a species-level database of life history, ecology, and geography of extant and recently extinct mammals. _Ecology_, **90**, 2648. DOI: 10.1890/08-1494.1.](https://esajournals.onlinelibrary.wiley.com/doi/10.1890/08-1494.1)  
\

<center>
![Mammal skull](www/skull.jpg){width="80%"}
</center>  
\  

The PANTHERIA data base (_pan_ = all-encompassing; _theria_ = the group formed of most extant mammals) is an open-access data base of mammal life history and ecology data. Life history refers to timings of events in an organism's life, such as age at reproductive maturity, reproductive rate, longevity, etc., and ecological data encompasses anything to do with an organism's environment and interactions with other species. Data bases like this one are often used to conduct macro-ecological and macro-evolutionary (and macro-eco-evolutionary) studies; looking at how species and their life forms have evolved according to their lineages and ecologies. This subset of the data is for the carnivores.  

The variables are:

* `Family`: the species' Family, e.g. Felidae (cats), Otariidae (eared seals), Ursidae (bears)...
* `Genus`: the Genus
* `Species`: the Species (binomial)
* `AdultBodyMass`: Average adult body mass in grams
* `BasalMetabolicRate`: basal metabolic rate in millilitres of oxygen per hour
* `LitterSize`: the average litter size
* `LittersPerYear`: the average number of litters per year
* `GestationLength`: the gestation length in days
* `MaxLongevity`: the maximum known longevity in days
* `SexualMaturity`: the average age at sexual maturity in days
* `TrophicLevel`: the trophic level
  + `1`, `2`, or `3`
\

The file for this data is called `pantheria_data.csv`.  

$~$

_Bonus points for anyone with the closest guess what species the skull belongs to!_   

$~$
































## 1 --- Introduction 
\

### Welcome to Data Skills for the Life Sciences! 

This page contains important 
information on the module: it's worth reading through carefully, and the 
information will always be here for you to refer back to. The first few sections
describe everything you need to know to set yourself up for the course. It's 
really important you complete these as soon as possible.  
\  

We'll cover:

* 1.1 This book and its content
  + 1.1.1 `R` Code, including
    - `R`
    - RStudio
    - R packages
  + 1.1.2 Picture and Video
  + 1.1.3 Interactive Elements
    - Quizzes
    - Exercises
* 1.2 Completing each Chapter
* 1.3 Other resources
  + Books
  + Cheatsheets
  + ShinyGLM
  + Forums
  + Collaboration
* 1.4 The analytical process which will underpin how we learn to analyse data
* 1.5 A walkthrough to install `R` and RStudio
* 1.6 The Learning and Assessment Schedule  
\  

Click the button below to continue.  


$~$

***
### 1.1 --- THIS BOOK

First, some information on this web book.  
\ 

The book accompanies every student for 
the first 9 weeks of the module, after which the teaching and content start
to diverge for different programmes. This divergence allows programmes to learn 
analytical techniques which are relevant to their courses: some stay with 
content in this book, and some do not.  
\  

Here's a quick video tutorial on the layout of this book, and how it 
functions.  

<!--
<center>
![](https://youtu.be/HtTUsOKjWyQ){width="80%"}
</center>  
\  
-->


$~$

### CONTENT TYPES

Within the book you will find a diversity of content, which we'll go through 
in the next sections.  
\  


### 1.1.1 --- `R` Code

We are learning how to visualise, manage and analyse data in `R`. `R` is a 
**programming language**, and people who use it are variously called "programmers", 
"coders" or "developers".  
\

##### **Why R?**

You may have come across other programs that allow you to work with data, 
plot data and run statistical analyses. So why a programming language, and 
_why R?_  
\ 

##### **WHAT IS `R`?**
_Think of_ `R` _as a language_ you're writing in. 
"Running" R code from within a file allows you 
to communicate with the computer and instruct it to do something, 
resulting in outputs like plots or data.  
\ 

##### **WHAT ARE THE BENEFITS OF USING `R`?**

There are a _huge number of benefits to using R_, listed here and elaborated on in the video below.

1. It's **_free_**.
2. It's **_open source_**.
3. It's **_cross-platform_**.
4. It's **_transparent_** and **_replicable_**.
5. It's **_powerful_** and **_fast_**.
6. It's **_flexible_**.
7. It makes you **_employable_**.  
\ 

##### **WHAT IS RSTUDIO?**
We will be working with `R` in a program called **RStudio**; think of this like 
`R`'s Microsoft Word; i.e. a program that allows you to create, save and open `R` code
files; to edit those files and write `R` code. RStudio enables you to run `R` 
code, and get whatever output you need, whether it's a calculation, a subset 
of data, or a graph, for example.  
\ 

This video explains some of these concepts:  
\  

<center>
![](https://youtu.be/-BLSElo-ZP4){width="80%"}
</center>
\  
\  


##### **WHAT DOES `R` CODE LOOK LIKE?**

`R` often seems scary when you first 
encounter it, but as outlined in the _R Basics_ chapter, thinking of it like 
a language can help. As with learning a language, practise makes perfect. 
\ 

First of all, `R` code is always written in a `fixed width font`, where every 
character has the same width. This way it's easier to read, as the characters align 
vertically from line to line.  Short pieces of code may be written as `inline code`. 
Longer pieces of code (especially if they run over multiple lines) are written as a 
**code chunk**. Here's an example:  


```r
# draw random numbers
random <- rnorm(1000, 0, 1)

# plot distribution
ggplot(as.data.frame(random), aes(x = random)) + 
    geom_density()
```

<img src="DataSkills_files/figure-html/unnamed-chunk-1-1.png" width="624" style="display: block; margin: auto;" />

```r
# mean
mean(random)
```

```
## [1] 0.03250772
```

```r
# standard deviation
sd(random)
```

```
## [1] 0.9940777
```
\  

##### **WHAT DOES THE ABOVE CODE DO?**

1. Draws 1000 random numbers from a normal distribution with mean of 0 and 
standard deviation of 1.
2. Plots thie distribution of these numbers (this should look roughly like 
a normal-distribution-bell-curve).
3. Calculates the mean of the distribution (which should be close to zero)
4. Calculates the standard deviation of the distribution (which should be 
close to 1).
5. Any lines which start with `#` are _comments_: anything after the # symbol is ignored and not run as code. This means you can keep a commentary alongside your code, detailing what it does.  
\

##### **HOW CAN I "READ" THE CODE?**  

This is something that takes practice. Chapter 1 'R Basics' will help understand the vocabulary and grammar of `R` code. When understanding `R` code, most of the time you have to think relatively logically and apply a little common sense. Like reading any language, it takes practice!  

The paragraph below walks you through interpreting some elements of the above code chunk  

Take a look at the code, including the _comments_ (lines beginning with `#`, as explained above).
Certain elements might start to match up. For example, 
`rnorm` could mean "random normal". `1000` is how many random normal numbers we want, 
`0` is the mean, and `1` is the standard deviation. It makes sense then, that putting them together using 
`rnorm(1000, 0, 1)` calculates the data we want for step one of the above list: 1000 random numbers from a normal distribution with mean 0 and standard deviation 1. The 
next part uses `ggplot` and `geom_density`, so that has something 
to do with making a density plot (step 2). `mean` must calculate the mean
(step 3), and `sd` must calculate the standard deviation (step 4). The values of these can be seen below the lines that calculate them.  
\

You'll get to learn the specifics with time. `R` is _very_ literal and logical: you'll become used to this! Learning to "read" it definitely comes with practice.  
\

##### **WHAT DOES THE CODE MAKE?**

There are a couple of types of **outputs** from the above code chunk:

* Data outputs that have been calculated are shown as text outputs.
  + These can be saved for use later by 'assigning' the values to objects using the backwards arrow `<-`. We see that in the above code for the object `random`, and we'll learn more about this process later. 
* You can also see that the code produces plot outputs as well.
* Data and plots are probably the primary outputs `R` makes, but the possibilities are endless: spatial data, interfacing with online databases and servers   


$~$

### 1.1.2 --- Picture & Video

Picture and video content is used to help explain analytical concepts or ideas 
in data, data visualisation and statistics, and to give technical run-throughs.  
\ 

##### **PICTURE**
Here's a GIF of the _Datasaurus rex_, which we'll be coming back to later in the 
course, to understand a certain statistical concept:  
\ 

<center>
![Datasaurus rex](www/datasaurus_dozen.gif){width="60%"}
</center>  
\  

##### **VIDEO**
Here's a video of what _not_ to do when you get angry with `R`. Because _trust me_,
I know from personal experience that `R` will make you angry at some point, 
and that's ok. Deep breath, walk away.  
\ 

<center>
![](https://youtu.be/HtTUsOKjWyQ){width="80%"}
</center>  


$~$

### 1.1.3 --- INTERACTIVE ELEMENTS

Interactive content is really important. It will test your 
knowledge as  you work through these worksheets, and inform your home learning.  
\ 

##### **QUIZZES**

Quizzes are multiple choice questions, which will test your knowledge and skills 
in understanding, visualising and analysing data. They may have single answers 
or multiple possible correct answers, as seen below.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 1 &gt;</strong> (Interactive Elements - quizzes)</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz031-1" class="tutorial-question panel-body">
<div id="qz031-1-answer_container" class="shiny-html-output"></div>
<div id="qz031-1-message_container" class="shiny-html-output"></div>
<div id="qz031-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz031-2" class="tutorial-question panel-body">
<div id="qz031-2-answer_container" class="shiny-html-output"></div>
<div id="qz031-2-message_container" class="shiny-html-output"></div>
<div id="qz031-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz031-3" class="tutorial-question panel-body">
<div id="qz031-3-answer_container" class="shiny-html-output"></div>
<div id="qz031-3-message_container" class="shiny-html-output"></div>
<div id="qz031-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

##### **EXERCISES**

Exercises are designed to make you better coders, and involve you correcting 
or typing your own R code, which you can run to see a result, or an error, 
depending on whether you have it correct...  
\

#### **<** EXERCISE 1 (Interactive elements - exercises) **>**
_Write the code `6 * 7` in the box below and then click **Run Code** to get the correct answer._  

<div class="tutorial-exercise" data-label="ex113_1" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex113_1-hint" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# The answer to life, the universe and everything...
```

</div>
\

Sometimes exercises will have **Hints** and/or **Solutions** to help you get to 
the right answer. Take another look at the exercise above and notice that 
there's a "Solution" button, with a solution to completing the exercise.  

The button may sometimes say "Hint", in which case there is a hint to help you, 
rather than a full solution. There may be multiple hints and/or solutions to 
click through!  

It goes without saying to try to complete the exercise _before_ looking at the 
hint or solution. Like any language, coding in `R` requires practice. This is 
the only time I'll instruct you to click the solution button, copy the solution and paste it in the box, 
then click **Run Code** to get the desired figure.  
\  

#### **< EXERCISE 2 >** (Interactive elements - exercises)
_Edit the code below to:_ 

1. _Draw 1000 random numbers from a normal distribution with mean of 42 and standard_
_deviation of 12._
2. _Calculate the mean of the distribution._
3. _Calculate the standard deviation of the distribution._  

_Remove the hash `#` from the start of each line first._

<div class="tutorial-exercise" data-label="ex113_2" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# draw random numbers
random <- rnorm(1000, , 12)

# mean
mean(random)

# standard deviation
sd()
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex113_2-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# draw random numbers
# 42 is the mean and it is the second argument in rnorm().
random <- rnorm(1000, 42, 12)

# mean
# the function is mean(), not mean_average().
mean(random)

# standard deviation
# add 'random' inside the parentheses.
sd(random)
```

</div>
\  

Lots of what we do when coding is taking existing code and adapting it for our 
own needs.  


$~$

***
### 1.2 --- COMPLETING EACH CHAPTER

_There is one chapter per week, starting with **R Basics** in week 1._ 
Each chapter is arranged like this:  
\ 

##### **MAIN CONTENT**
_**MOST SECTIONS OF EACH CHAPTER IS TO BE COMPLETED AT HOME BEFORE EACH ONLINE WORKSHOP.**_  

These first sections of each chapter use code, images, videos, quizzes and exercises for learning
and practicing concepts and skills in R, data, data handling, data visualisation 
and statistics.  
\ 

##### **ONLINE WORKSHOP**
_**THE "ONLINE WORKSHOP" SECTION IS THE LAST SECTION OF EACH CHAPTER AND IS TO BE COMPLETED DURING ONLINE WORKSHOPS.**_  

During these workshops you will be working in your tutor
groups. You'll have some analytical tasks each week to complete, working with 
real biological data to apply the concepts and skills learned in part 1 of the 
chapter. These will all be collated in an R file which will take you through the 
whole analytical process, from start to finish.  


$~$

***
### 1.3 OTHER RESOURCES

Resources external to this book are also important to the module. A list of 
useful resources will be provided at the top of each Chapter.  
\  

##### **BOOKS**
There are several books that we'll be using throughout the course, and  in the 
spirit of programming, these are all available open source, for free, online. 
Different books will be useful at different parts of the module. 

1. [_R for Data Science_](https://r4ds.had.co.nz/) by Garrett Grolemund and Hadley Wickham.
2. [_Statistical Modeling: A Fresh Approach (2nd ed)_](https://dtkaplan.github.io/SM2-bookdown/) by Daniel Kaplan.
3. [_An Introduction to Statistical Learning with Applications in R_](http://faculty.marshall.usc.edu/gareth-james/ISL/ISLR%20Seventh%20Printing.pdf) by Gareth James, Daniela Witten, Trevor Hastie, Robert Tibshirani.
4. [_Learning statistics with R: A tutorial for psychology students and other beginners (Version 0.6)_](https://learningstatisticswithr.com/lsr-0.6.pdf) by Danielle Navarro.

I also recommend [_Getting Started with R: An Introduction for Biologists (2nd ed)_](http://r4all.org/books/gswr2/) 
by Andrew Beckerman, Dylan Childs, and Owen Petchey, if you're looking to buy a book to help you both now and in the future.  
\  

##### **CHEAT SHEETS**
The RStudio team publish `R` and RStudio cheat sheets which can be really useful 
to refer to, such as this 
[base R cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/base-r.pdf) 
and this 
[RStudio cheatsheet](http://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf).
At the top of each chapter will be links to relevant cheatsheets for that chapter.  
\  

##### **ShinyGLM**
I've developed an interactive web app called 
[ShinyGLM](https://iainmstott.shinyapps.io/ShinyGLiM/)
which helps to understand how code and its 
outputs are related to one another. You'll probably use it a fair bit, starting 
from Chapter 2 "Data distributions".  
\  

##### **THE INTERNET**
Data Scientists and statisticians probably spend at least as much time googling as they do writing 
code. If you're having trouble, chances are someone else had the same trouble as 
you: search for the solution to your problem! The skill to find solutions to data and statistics problems is a hugely important part of learning data skills, and will form part of what we learn.  
\

##### **THE FORUM**
Programmers use forums _all the time_, such as 
[RStudio Community](https://community.RStudio.com),
[Stack Overflow](https://stackexchange.com), and 
[GitHub Community](https://github.community).
These forums are places to:

* Ask questions about things you need help understanding.
* Post code that is giving errors.
* Report bugs and errors in resources and software you use.

I have set up a blackboard forum for these purposes. This includes reporting 
any bugs, spelling mistakes or errors in this book. Software isn't a static 
thing, and if there are things that need fixing, then they need fixing!  
\  

##### **EACH OTHER**
Coding is usually a collaborative endeavour. Work with each other: in your 
tutor groups, in your friendship groups, over video chat, via email, in person 
(so long as it's in necessary bubbles, appropriately socially distanced and 
adhering to national and local government guidelines at all times). Share 
knowledge and information 
(_except for the purposes of either of the assessments, which are to be completed individually!_)  


$~$

***
### 1.4 THE ANALYTICAL PROCESS

This module is all about analysing data. 
Any analytical process is really just a means of understanding your data, and 
relationships between variables in that data. That's why I do not consider this
to be a "statistics course"; it is a course in giving you many skills to
understand data in many ways. Statistics is one part of that.  
\  

<center>
![The analytical process and its feedbacks](www/Process.png){width="80%"}
</center>  
\  

There is a process to analysis, with a few different steps and feedbacks between 
them, as illustrated above. It's important not to dive right into statistical 
analysis without understanding your data, your variables and the relationships 
between them first. For that reason, much of the course will be dedicated to 
understanding data, and how to plot data.  
\ 

#### **1.5.1 FIRST half of the course (weeks 1-6)**
\ 

##### **TIDY DATA**

* data exploration
* data subsetting
* data manipulation  
\ 

##### **PLOTS**

* Single-variable distributions and summary statistics
* Two- and three-variable plots to explore hypotheses  
\  

Data handling and plotting is also the best vehicle to learn how to 
code: data handling and plots are harder to code but easier to interpret, 
whereas statistical analyses are easier to code but harder to interpret.  
\ 

#### **1.5.2 SECOND half of the course (weeks 8-16)**
\ 

##### **MODEL**

* fitting a statistical model  
\ 

##### **MODEL FIT**

* assessing how well a statistical model fits the data  
\ 

##### **RESULTS**

* Understanding and interpreting the results of a statistical model  
\  

#### **1.5.3 General Linear Model (GLM)**

The "statistical model" we will be working with (mostly) is the 
_general linear model (glm)_. This is a framework which brings together 
many traditional statistical analyses. You will learn where these traditional 
analyses fit into the glm framework.  

There are naturally feedbacks between the steps of the analytical process, where new information may mean you need to revise earlier steps (hence the backwards arrows).  
\ 

_In order to be able to achieve this, we're going to need the right software..._


$~$

***
### 1.5 INSTALLING `R` and RSTUDIO
\

**RStudio** is the program (or to give the technical term, an 
"Integrated Development Environment" or _IDE_), which we'll be using to code 
in a `R`. The very first thing you need to do is install both of 
these. The following video walks you through installation and briefly explains 
the difference between the two.  
\  

<center>
![](https://youtu.be/d7lARa168gk){width="80%"}
</center>  
\  

$~$

***
### LEARNING SCHEDULE
\

Below is a diagram of the learning schedule (you can find a pdf copy on blackboard also).

* The top row shows the timings of **ASSESSMENTS**. Detailed information can be found on blackboard in the "Assessments" folder: there is one pdf file for each assessment, called "Assessment Briefings".
  + An online Multiple Choice Questionnaire must be completed on _Friday 27th October (week 7)_.
  + A data analysis report must be handed in on or before _Wednesday 27th January (week 16)_.
* The **SCHEDULE** has one row for each programme, and shows the topics covered for each programme, week-by-week. Everyone takes takes the same topics until week 9, after which the teaching and content start to diverge for different programmes. This divergence allows programmes to learn analytical techniques which are relevant to their courses.
* The **STAFF** section shows which staff are teaching in which weeks, topic-by-topic.  
\


<center>
![Learning Schedule](www/Schedule.png){width="100%"}
</center>  
\  

$~$

***
##### **END OF CHAPTER**
***































## 2 --- R Basics
\

Welcome to your first R tutorial! In this tutorial we'll be covering the very basics of R, which is a programming language originally developed for 
understanding data and doing statistics. This tutorial includes:  

* `R` packages
* the anatomy ("vocabulary" and "grammar") of R code
* objects
   + assignment to objects
   + object classes
* functions
   + function arguments
* outputs
* code comments
* loading data into `R`  
\
* What programming languages are
  + types of programming language
  + the anatomy ("vocabulary" and "grammar") of R code
* What RStudio is, and how RStudio works with R
* The structure of R
  + base R packages
  + add-on R packages
* Reading data into `R`.  
\  

With this information, we'll put our newfound knowledge into practice and 
do some basic coding in R to get used to this new way of working with data. If 
you're familiar with R already, this should still serve as a 
useful reminder!  

$~$

***
### **2.1 RESOURCES**
\

##### BOOKS
 
* Beckerman, Childs & Petchey (2017) _Getting started with R, an 
introduction for Biologists_, 2nd ed. pp 1 - 34, Chapter 1, "Getting and 
getting acquainted with R".  
\ 

##### CHEATSHEETS:

* [RStudio IDE cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf) by RStudio
* [base-R cheatsheet](http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf) by RStudio
\ 

##### WEB LINKS:

* [R for beginners](https://education.rstudio.com/learn/beginner) by RStudio  
\ 

Let's get started!  


$~$

***
### **2.2 R PACKAGES**
\

Lots of things can be done with what is called _base R_, 
which is a set of R functions and tools that load every time you start R 
(and therefore every time you start RStudio, as R is run from within RStudio).  

Some tasks require add-on _R packages_ with 
extra functions and tools. Think of these like dictionaries of extra vocabulary 
and grammar which allow R to communicate with the computer in more elaborate ways.  
\ 

This video explains briefly how `R` packages work:  
\

<center>
![](https://youtu.be/-BLSElo-ZP4){width="80%"}
</center>
\  


$~$

##### **IMPORTANT: TWO SCHOOLS OF THOUGHT**

In this module, we'll be using a collection of packages, built by RStudio, collectively called the
[**tidyverse**](https://www.tidyverse.org) (although we'll only be using a 
few of the ones that are on offer).  

The tidyverse is a new, emerging way of working with and visualising data 
in `R`. It's fast becoming a standard way of coding, although some old-schoolers
have taken a while to get used to it*. I'll often refer to it as the 'new', 'modern' 
or 'contemporary' way of doing things, simply because it was born in the last 
few years.  

An alternative way of working with data and data visualisation is using 
base `R`, and many people still do. This has been around since the inception 
of `R`. I'll often refer to it as the 'old' or 'traditional' way of doing 
things, simply because it has been around longer.  

There is no one 'correct' way of doing things. I use a mix of the two for my research, 
as do many people, and in fact it's almost impossible to use the tidyverse 
approach without using some base `R`.  
Many of your lecturers that use `R` will work only in base `R`.  

We're using the _tidyverse_ in this module as it generally has a more coherent 
approach to coding, and because it's easier to do more powerful things more 
quickly.  
\

Even I was one of those old-schoolers until just over a year ago! 

$~$

***
### **2.3 THE ANATOMY, VOCABULARY AND GRAMMAR OF `R` CODE**
\

There are 6 key components to `R`code: **objects**, **assignment**, **functions**, **arguments**, **outputs** and **comments**.  
\

<center>
![](https://youtu.be/-BLSElo-ZP4){width="80%"}
</center>
\  

##### **OBJECTS**
R is used for _Object-Oriented Programming (OOP)_. This means that when coding 
in R, you create **objects**, which are packets of data saved in the 
computer's RAM. These objects can be recalled and used throughout that R 
session, until they are either overwritten or removed.  

Think of it like filling a weekend bag full of things: your bag is full of 
objects ready to use; your `R` session is also full of objects ready for you 
to use.  
\

##### **CLASSES**
These objects have different **classes**, which define
what the object is and how `R` works with it. `R` will work with objects 
differently, depending on their class: for example, it is possible to calculate 
the mean of some numbers, but it's not possible to calculate a mean of some words!  

Similarly, you might have two similar-looking objects in your weekend bag, but 
their "class" would mean you use them in unique ways. Your toothbrush and your 
hairbrush are both brushes, but you (presumably) use them differently.  
\

##### **FUNCTIONS** AND **ASSIGNING**
Objects are usually created using **functions**. These create or process data 
in some way and save it to the RAM (like putting something in the bag). The 
way this is done is using an **assigning arrow** `<-`. The object goes on the 
left, and the function on the right.  
`answer <- 6 * 7`  
\

The next sections go into greater depth on these topics.  

$~$

***
### **2.4 OBJECTS**
\

This section covers how to create objects, what classes mean, what functions 
are and how they work.  

Objects are created using **functions**. Simple functions include `+ - * /`, 
only one of which is not an Ed Sheeran album.  
\

#### **< EXERCISE 1 >** Objects
_Use the functions `+ - * /` to:_

1. _Choose any number_
2. _Add the next highest integer number_
3. _Add 9_
4. _Divide by 2_
4. _Subtract your original number_

_Hint: don't forget the order of operations: `*` and `/` are executed before `+` and `-`! Parentheses `( )` can help group the right operations._
<div class="tutorial-exercise" data-label="ex24_1" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex24_1-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# If your number is 42
((42 + 43 + 9) / 2) - 42

# Whatever number you chose, your answer is 5.
```

</div>
\

More complicated functions take the form 
`function(argument1, argument2, ...)`. Each function has its own specific
set of arguments, and a different object is created depending on what 
these arguments are.

```r
numbers <- seq(1, 10, 1)
numbers
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

The function `seq()` means "sequence". This sequence is the integer numbers 
starting at 1 and ending at 10.  
\

We can do certain things with this vector. For example, we might want to see a 
summary about it, find out what its length is, calculate the mean or see the 
first 5 elements:

```r
summary(numbers)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.00    3.25    5.50    5.50    7.75   10.00
```

```r
length(numbers)
```

```
## [1] 10
```

```r
mean(numbers)
```

```
## [1] 5.5
```

```r
numbers[1:5]
```

```
## [1] 1 2 3 4 5
```
\

In this case `1:5` does the same thing as `seq(1, 5, 1)`. There are often many 
ways to get any single output in `R`, in the same way that there are often 
many different ways to say one thing in a spoken language.  
\

We can change or add arguments to make a function behave differently. For example,
adding an argument _digits_ to the `summary()` function gives the results to 
a certain number of decimal places.

```r
summary(numbers, digits = 1)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       1       3       6       6       8      10
```
\

Going back to the original creation of the `numbers` object, we can change the 
arguments of `seq` to create a different object: the two-times-table up to 20.

```r
numbers2 <- seq(2, 20, 2)
numbers2
```

```
##  [1]  2  4  6  8 10 12 14 16 18 20
```
\

#### **< EXERCISE 2 >** Objects
_Create an object called `numbers3` which is a sequence_ 
_of numbers from 3 to 21, in steps of 2._
<div class="tutorial-exercise" data-label="ex24_2" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex24_2-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
seq(3, 21, 2)
```

</div>

As we have `numbers2` and `numbers3`, maybe we should be consistent and change 
the name of `numbers` to `numbers1`. We can do that by creating a new object and 
removing the old one:

```r
numbers1 <- numbers
rm(numbers)
```
\

We created `numbers1` from another object `numbers`. In fact, you can
create object using multiple other objects, and objects can be created in 
different ways.

```r
# We could create numbers2 by multiplying numbers1 by 2
numbers1 * 2
```

```
##  [1]  2  4  6  8 10 12 14 16 18 20
```

```r
# We could add 1 to every number in numbers2
numbers2 + 1
```

```
##  [1]  3  5  7  9 11 13 15 17 19 21
```

```r
# We could add together numbers1 and numbers2
numbers1 + numbers2
```

```
##  [1]  3  6  9 12 15 18 21 24 27 30
```
\

Note how `R` processes objects: both `numbers1` and `numbers2` have 10 individual 
numbers (termed _elements_ of the vector), 
so `R` adds the two first elements, the two second elements, the two third elements, 
etc. If we provide `R` with fewer than 10 elements, then it recycles the shorter 
vector: so if we add `1` to `numbers1` then it adds 1 to every element.  
\  

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 1 &gt;</strong> (Objects)</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz24_1-1" class="tutorial-question panel-body">
<div id="qz24_1-1-answer_container" class="shiny-html-output"></div>
<div id="qz24_1-1-message_container" class="shiny-html-output"></div>
<div id="qz24_1-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz24_1-2" class="tutorial-question panel-body">
<div id="qz24_1-2-answer_container" class="shiny-html-output"></div>
<div id="qz24_1-2-message_container" class="shiny-html-output"></div>
<div id="qz24_1-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz24_1-3" class="tutorial-question panel-body">
<div id="qz24_1-3-answer_container" class="shiny-html-output"></div>
<div id="qz24_1-3-message_container" class="shiny-html-output"></div>
<div id="qz24_1-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->

$~$

***
### **2.5 OBJECT CLASSES**
\

Objects always have a **class** which defines how `R` processes and interacts with 
them. There are 5 different class types that it's important to know at this point.

* **numeric**
* **character**
* **factor**
* **logical**
* **data.frame**

$~$

### 2.5.1 `numeric`
\

The objects `numbers1`, `numbers2` and `numbers3` have the class _numeric_: 
this means a set (called a _vector_) of 
numbers. You can see that the class of `numbers1` is numeric using the function 
`class()`:

```r
class(numbers1)
```

```
## [1] "numeric"
```
\

We have already seen a fair bit of how numeric vectors are processed by `R`.  
\


### 2.5.2 `character`
\

We'll create a new object which looks kinda like `numbers1`, but is
not actually the same.

```r
characters1 <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
characters1
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
```
\

The `c()` function is really important. It means "concatenate", and basically 
glues together the arguments you give it. The `characters1` object 
looks similar to the `numbers1` object, but it's not. Note the quote marks 
around each vector element.  
\

#### **< EXERCISE 3 >** Classes - `character`
_Find out the class of `characters1`._
<div class="tutorial-exercise" data-label="ex252_3" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
characters1 <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex252_3-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# the answer is 'character'.
class(characters1)
```

</div>

Let's try and find the same information about `characters1` as we did for `numbers1`.

```r
summary(characters1)
```

```
##    Length     Class      Mode 
##        10 character character
```

```r
length(characters1)
```

```
## [1] 10
```

```r
mean(characters1)
```

```
## Warning in mean.default(characters1): argument is not numeric or logical:
## returning NA
```

```
## [1] NA
```

```r
characters1[1:5]
```

```
## [1] "1" "2" "3" "4" "5"
```
\

One of these functions went kinda wrong. As far as R is concerned, the 
elements of `characters1` are words, and it can't calculate the mean of some 
words. It returns `NA`, meaning "Not Applicable": R language for something which 
doesn't exist or is missing.  

The _Warning_ message makes sure you're aware that
the code did run and give an output, but something probably went wrong.  

R can also return an _Error_ message, which tells you that
the function has failed to run at all, and gave no output.  

_Pay attention to these messages_: usually if you get 
an Error or a Warning, much of your subsequent code will fail as it depends
on things being calculated properly.  
\

It's possible to convert things between different classes, although the 
behaviour is sometimes unpredictable so be careful!

```r
characters2 <- as.character(numbers2)
characters2
```

```
##  [1] "2"  "4"  "6"  "8"  "10" "12" "14" "16" "18" "20"
```
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 2 &gt;</strong> (Classes - <code>character</code>)</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz252_2-1" class="tutorial-question panel-body">
<div id="qz252_2-1-answer_container" class="shiny-html-output"></div>
<div id="qz252_2-1-message_container" class="shiny-html-output"></div>
<div id="qz252_2-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz252_2-2" class="tutorial-question panel-body">
<div id="qz252_2-2-answer_container" class="shiny-html-output"></div>
<div id="qz252_2-2-message_container" class="shiny-html-output"></div>
<div id="qz252_2-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz252_2-3" class="tutorial-question panel-body">
<div id="qz252_2-3-answer_container" class="shiny-html-output"></div>
<div id="qz252_2-3-message_container" class="shiny-html-output"></div>
<div id="qz252_2-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->


### 2.5.3 `factor`
\

A **factor** object is like a character object, but recognises groups of elements
which are the same, called _levels_. Let's take a look:

```r
factor1 <- rep(LETTERS[1:5], 2)
factor1 <- as.factor(factor1)
factor1
```

```
##  [1] A B C D E A B C D E
## Levels: A B C D E
```
\

The object `LETTERS` is a character object which already exists in `R` without us having 
to create it. Note that it has to be LETTERS in capitals: `R` is case-sensitive, 
which means the code won't work if you have a lower-case letter rather than 
an upper-case letter or vice versa. This is a really common mistake to make and 
easy to miss!  

We use the square brackets to choose which letters we
want: we choose A, B, C, D and E, which are the first 5 letters of the alphabet.  

The `rep` function means repeat, so we repeat A to E five times, to give a vector 
that has a length of 25.  

Finally, we convert that character vector to a factor using `as.factor()` and 
overwrite the original `factor1` object by reassigning it.

```r
summary(factor1)
```

```
## A B C D E 
## 2 2 2 2 2
```

We can see from the summary that R recognises the five different factor levels,
A through E.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 3 &gt;</strong> (Classes - <code>factor</code>)</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz253_3-1" class="tutorial-question panel-body">
<div id="qz253_3-1-answer_container" class="shiny-html-output"></div>
<div id="qz253_3-1-message_container" class="shiny-html-output"></div>
<div id="qz253_3-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz253_3-2" class="tutorial-question panel-body">
<div id="qz253_3-2-answer_container" class="shiny-html-output"></div>
<div id="qz253_3-2-message_container" class="shiny-html-output"></div>
<div id="qz253_3-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz253_3-3" class="tutorial-question panel-body">
<div id="qz253_3-3-answer_container" class="shiny-html-output"></div>
<div id="qz253_3-3-message_container" class="shiny-html-output"></div>
<div id="qz253_3-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->

$~$

### 2.5.4 `logical`
\

Logical objects are perhaps hard to understand at first, but they're simple
really. They basically indicate whether something is `TRUE` or `FALSE`. They
usually relate to a question we ask of our data.

```r
rand_norm <- rnorm(50, 0, 1)
rand_norm
```

```
##  [1]  1.01294563 -0.21117113  0.43945541 -0.02851018 -0.15887697 -0.01657858
##  [7] -0.38883455 -0.20786099  0.60844449  0.05982853 -0.30370304 -1.68021963
## [13]  0.19953869 -1.74464151 -1.08927475 -0.28937659  1.80938318  0.71886353
## [19] -0.12530884  1.50716467 -0.80734802 -1.13056521 -0.75973295 -0.64898578
## [25] -1.13472301 -0.39347740 -0.73903723 -1.83570444 -1.37251763 -0.13164558
## [31]  0.20769541 -0.38132092 -0.28950930 -1.44316000  1.62750935  1.48981300
## [37] -0.07028295  0.77889439  1.06062337 -0.06310368 -0.20430551 -1.88294187
## [43]  0.30339555 -1.85833597  0.76013797  0.87855210  1.38184633  0.72675016
## [49] -1.28517878  1.40856382
```

```r
over0 <- rand_norm > 0
over0
```

```
##  [1]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
## [13]  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
## [25] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE
## [37] FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [49] FALSE  TRUE
```

The result is information on which of your random data are greater than than 0.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 4 &gt;</strong> (Classes - <code>logical</code>)</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz254_4-1" class="tutorial-question panel-body">
<div id="qz254_4-1-answer_container" class="shiny-html-output"></div>
<div id="qz254_4-1-message_container" class="shiny-html-output"></div>
<div id="qz254_4-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz254_4-2" class="tutorial-question panel-body">
<div id="qz254_4-2-answer_container" class="shiny-html-output"></div>
<div id="qz254_4-2-message_container" class="shiny-html-output"></div>
<div id="qz254_4-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

There are lots of questions you can ask of your data using logical operators, and 
you will encounter many on your R journey e.g. 

* `>` greater than 
* `>=` greater than or equal to
* `<` less than
* `<=` less than or equal to  

These behave in exactly the way you would expect given how you've already seen 
`>` works.  

Logical operators (and `R` in general) don't always behave in the way you might 
expect, however. Take these logical operators:

* `==` exactly equal to
* `!=` not equal to

`==` tells you whether the two objects on the left and the right are exactly equal 
to each other:


```r
1 == 1
```

```
## [1] TRUE
```

```r
c(1, 1, 2, 3) == 1
```

```
## [1]  TRUE  TRUE FALSE FALSE
```

```r
# using some objects we created earlier in the chapter:
numbers2 == numbers1 * 2
```

```
##  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```

```r
numbers1 == characters1
```

```
##  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```

We might not expect `numbers1 == characters1` to return all `TRUE`. All I can say is... sometimes `R` is weird.  
\

`!=` does the opposite job of `==`, telling us which elements on the right are NOT the same as the element(s) on the left.  
\

```r
1 != 1
```

```
## [1] FALSE
```

```r
"ABC" != "ABCDEFG"
```

```
## [1] TRUE
```
\

One final useful logical operator:

* `%in%` tells you which elements of one vector belong to another vector.
\

`%in%` is used to find out whether a value or values in one vector
(on the left) exist in another vector (on the right). For example:

```r
c(1, 2, 3) %in% c(1, 2)
```

```
## [1]  TRUE  TRUE FALSE
```

```r
numbers2 %in% numbers1
```

```
##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
```
It's not necessary when using `%in%` for the two vectors to have the same length; in the first line of code, we compare a vector with three elements to a vector with two elements.  

We interpret the results like this: if `numbers2 %in% numbers1` is `TRUE` then the corresponding element of `numbers2`
is found somewhere in `numbers1`. If `FALSE`, it isn't. We can see that the first 5 elements of `numbers2` are found in `numbers1`.  
\

Logicals are very useful for subsetting data:

```r
num2_in_num1 <- numbers2 %in% numbers1
numbers2[num2_in_num1]
```

```
## [1]  2  4  6  8 10
```
We first create an object that tells us which elements of `numbers2` are in `numbers1`. Then, when `num2_in_num1` is put in the square brackets, it 
picks out all the elements of `numbers2` which are `TRUE`: 
these are the values of numbers in `numbers2` which are also found somewhere in `numbers1`.  
\

#### **< EXERCISE 4 >** Classes - `logical`
_Put in the correct logical operators. The correct outputs are found in the solutions._
<div class="tutorial-exercise" data-label="ex254_4" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# 1. ((42 + 43 + 9) / 2) - 42 is the same as ((31 + 32 + 9) / 2) - 31
((42 + 43 + 9) / 2) - 42     ((31 + 32 + 9) / 2) - 31

# the mean of one set of random numbers is NOT the same as the mean of another
mean(runif(100))     mean(runif(100))

# cake is greater than biscuits
"cake"     "biscuits"

# c("A", "B", "Z") are found in the last 10 letters of the alphabet
c("A", "B", "Z")     LETTERS[16:26]
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex254_4-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
1. TRUE, using ==
2. TRUE, using !=
3. FALSE, using >
This is another strange behaviour of R that I don't understand. I 
don't understand how or why one character object "cake" can be numerically greater than another
"biscuits", but R has some way of deciding. It works with any character object.
4. FALSE FALSE TRUE, using %in%
```

</div>
\  


$~$

### 2.5.5 `data.frame`
\

`data.frame`s are extremely important objects. This is the way most data is 
stored for data analysis. As we learned earlier, there's one column per variable
and one row per observation. `data.frame`s are simply collections of variables:

```r
factor2 <- rep(LETTERS[1:2], 5)
random <- rnorm(10, 0, 1)
toydata <- data.frame(numbers2, factor1, factor2, random)
toydata
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["numbers2"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["factor1"],"name":[2],"type":["fctr"],"align":["left"]},{"label":["factor2"],"name":[3],"type":["chr"],"align":["left"]},{"label":["random"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"2","2":"A","3":"A","4":"-0.6696485"},{"1":"4","2":"B","3":"B","4":"1.3610599"},{"1":"6","2":"C","3":"A","4":"0.4377715"},{"1":"8","2":"D","3":"B","4":"0.1038490"},{"1":"10","2":"E","3":"A","4":"1.0344012"},{"1":"12","2":"A","3":"B","4":"-1.4158161"},{"1":"14","2":"B","3":"A","4":"1.4236741"},{"1":"16","2":"C","3":"B","4":"0.1100687"},{"1":"18","2":"D","3":"A","4":"-0.9747989"},{"1":"20","2":"E","3":"B","4":"-0.5112231"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
\

To access variables in a data.frame, you simply use the `$` dollar sign.

```r
toydata$numbers2
```

```
##  [1]  2  4  6  8 10 12 14 16 18 20
```
\

Vectors are one-dimensional but data frames are two-dimensional: rows and columns. The function `dim()` shows you how many dimensions:

* First, rows 
* Second, columns

We know this to be 10 replicates (rows) and 4 variables (columns):

```r
dim(toydata)
```

```
## [1] 10  4
```
\

To quickly select a few rows and/or columns, we can use the square brackets like for vectors, but we need to provide two numbers. 

* **First: the rows** we want to select
* **Second: the columns** we want to select. 
* Separated by a comma
* If you want to select all rows or columns, leave a blank space before or after the comma.

Like this: `dataframe[rows, columns]`.

```r
# If you want all columns then leave the second number blank.
# The first 5 rows of the data frame:
toydata[1:5, ]
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["numbers2"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["factor1"],"name":[2],"type":["fctr"],"align":["left"]},{"label":["factor2"],"name":[3],"type":["chr"],"align":["left"]},{"label":["random"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"2","2":"A","3":"A","4":"-0.6696485","_rn_":"1"},{"1":"4","2":"B","3":"B","4":"1.3610599","_rn_":"2"},{"1":"6","2":"C","3":"A","4":"0.4377715","_rn_":"3"},{"1":"8","2":"D","3":"B","4":"0.1038490","_rn_":"4"},{"1":"10","2":"E","3":"A","4":"1.0344012","_rn_":"5"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
# If you want all rows then leave the first number blank.
# The first and third columns of the data frame:
toydata[ , c(1, 3)]
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["numbers2"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["factor2"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"2","2":"A"},{"1":"4","2":"B"},{"1":"6","2":"A"},{"1":"8","2":"B"},{"1":"10","2":"A"},{"1":"12","2":"B"},{"1":"14","2":"A"},{"1":"16","2":"B"},{"1":"18","2":"A"},{"1":"20","2":"B"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
# The first rows of columns 1 and 3:
toydata[1:5, c(1, 3)]
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["numbers2"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["factor2"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"2","2":"A","_rn_":"1"},{"1":"4","2":"B","_rn_":"2"},{"1":"6","2":"A","_rn_":"3"},{"1":"8","2":"B","_rn_":"4"},{"1":"10","2":"A","_rn_":"5"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
\

Having commas in the right places is important in `R`. If you don't have a 
comma to indicate both rows and columns, then you will encounter an error 
about "undefined rows" or "undefined columns". A missing or extra comma is a
really common mistake and easy to miss.  
\

Most of the time we will be using a different, more modern way of managing and 
selecting data from data frames (introduced in Chapter 4). 
It's a little more flexible and elegant. 
Using the square brackets `[ ]` is really great for doing very simple and 
quick data subsets, but they can get unwieldy when it comes to more complicated
data subsets involving logicals.  
\

You can read in `data.frame`s from your own data using the function 
`read.csv()`. Your data frame needs to be saved as a CSV file, in a data frame 
layout. You can do this easily in Excel using File -> Save As -> CSV (Comma delimited).  

Then you provide the path to the file. For example, on windows, if the 
file "data.csv" is stored in your "My Documents" folder, you use 

```r
read.csv("C:/Users/UserName/Documents/data.csv")
# (replace "UserName" with your user name)
```

On Mac, if the file was stored in your Documents folder then you may use 

```r
### *** CHECK
read.csv("~/Documents/data.csv")
```
\

There are a few requirements / good practices when preparing data in excel or other spreadsheet programs to save as a csv file.

1. One column per variable, one row per "replicate" (an individual piece of data
associated with that variable).
2. No empty columns or rows.
3. No empty cells. If there is a missing piece of data, put `NA` in the cell. `R`
understands this to be missing data.
4. Ideally, no spaces. Replace spaces in variable names and character or factor 
vectors with an underscore `_`.
5. Character variables should have quote marks `" "` or `' '` around each 
data point, otherwise `R` will interpret them as factors. 
\

This video goes over some of these concepts in more detail.  
\

<center>
![](https://www.youtu.be/rWHV2VlQo2w){width="80%"}
</center>  
\

$~$

***
### **2.6 SIMPLE PLOTS**
\

`R` is an extremely powerful graphics generator. In recent years, this has 
extended to generation of things like interactive and multi-dimensional figures.
Check out for example this app that 
[catalogues all LEGO pieces in all sets of the LEGO world](https://shiny.rstudio.com/gallery/lego-world.html), 
or this one that allows you to 
[explore recent crimes anywhere in the UK](https://shiny.rstudio.com/gallery/crime-watch.html).
More apps, including many with biological data, are available in 
[this gallery](https://shiny.rstudio.com/gallery/). All of these are powered 
by `R`.  

BUT, it all starts with a simple plot. It's _very_ easy to produce a plot
in `R`, and we'll run through some here. These are what we term simple 
**base `R`* graphics.  
\

**Histograms** can be produced using the `hist()` function.


```r
hist(toydata$random)
```

<img src="DataSkills_files/figure-html/unnamed-chunk-25-1.png" width="624" style="display: block; margin: auto;" />
\

**Box plots** can be produced using the `boxplot()` function.


```r
boxplot(toydata$numbers2)
```

<img src="DataSkills_files/figure-html/unnamed-chunk-26-1.png" width="624" style="display: block; margin: auto;" />
\

**Bar graphs** can be produced using the `barplot()` function.


```r
barplot(toydata$numbers2[1:5], names.arg = toydata$factor1[1:5], 
        ylab = "numbers2")
```

<img src="DataSkills_files/figure-html/unnamed-chunk-27-1.png" width="624" style="display: block; margin: auto;" />

We introduced a couple of extre arguments here: `names.arg` labels the x axis
and `ylab` labels the y axis.  
\

**Scatter plots** can be produced using the `plot()` function, with both an 
x variable (first argument) and a y variable (second argument).


```r
plot(toydata$numbers2, toydata$random)
```

<img src="DataSkills_files/figure-html/unnamed-chunk-28-1.png" width="624" style="display: block; margin: auto;" />
\

##### **< EXERCISE 5 >** Simple Plots
_Create a boxplot of `random` and a histogram of `numbers2`_.
<div class="tutorial-exercise" data-label="ex26_5" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex26_5-hint" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
Copy the code from the example boxplot and histogram, and replace the variable names.
```

</div>

$~$

***
### **2.7 CREATING AN R SCRIPT**
\ 

R code is saved in a file with the extension `.R`. In the same way as Micosoft 
Word knows to open files with `.docx` extensions and Adobe Reader knows to
open files with `.pdf` extensions, RStudio knows to open files with `.R` 
extensions, and to work with them in certain ways.  

Create an R file in the folder you wish to use as your working directory by 
following the steps in the video below.  
\ 

<center>
![](https://www.youtu.be/rWHV2VlQo2w){width="80%"}
</center>  
\ 

Save this file wherever you like.  

_This is the file in which you're going to write code to fulfil the tasks in Section 2 of each Chapter._ In each Chapter you will cover one aspect of the analytical process.
You'll apply the knowledge and skills learned during the Chapter to a biological data set and 
add to this code file during each online workshop, so that by the end of the 
book, you'll have completed a full analysis including Tidying and Visualising 
your data, fitting a model and evaluating how well it fits the data, 
tweaking the data, visualisations and the model if necessary, until you have some 
reliable and reproducible results.  
\

If you wish, you can copy code from these worksheets into a second R file and practise coding in RStudio alongside completing these worksheets at home.

$~$

***
### **2.8 OTHER RESOURCES**
\

There's a huge amount of other resources out there in the web to help you 
learn basic `R` programming. For exmple, check out this tutorial from RStudio on 
[Programming Basics](https://tutorials.shinyapps.io/04-Programming-Basics).


$~$

***
### **2.9 FINAL TIPS**
\

Use `?` to get help on a function. These help pages take a fair while to get used 
to, but they lay out what arguments a function takes, what those arguments 
are, what the output (value) of the function is, and some examples.  
\

We use the `#` (hash) symbol to create a comment: nothing after the `#` will be run
as code. It's good practise to comment your code as you go, so when you 
go back to it later, it makes sense to you. Trust me, you make life so much 
easier for your future self if you comment well!  
\

The internet is really useful. As you get used to R, you'll be able to find
blogs and articles and forums that give you answers. There are also R mailing
lists, but it's best not to email them until you're sure you've done everything
you can to solve your problem.  
\

If something goes wrong with your R coding (usually Errors), then 99.9% of the
time it's because you've made a mistake. R is very literal. Be careful!  
\

#### **< EXERCISE 6 >** Final Tips
_Correct the mistakes ('bugs') in the lines of code below, bearing in_
_mind the common, small mistakes mentioned in this Chapter. Keep going until you get the_
_right outputs!_
<div class="tutorial-exercise" data-label="ex29_6" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# a sequence from 4 to 40 in steps of 4
mynums <- seq(4, 40, 4,)
mynums

# the first 5 and last 5 letters of the alphabet
mychars <- LETTERS[c(1:5, 21:26)]
# length of mychars
length(Mychars)

# turn mychars into a factor
myfacs <- asfactor(mychars)

# create data frame
mydata <- data.frame(mynums, mychars, myfacs)
# see numbers
mydata$mynum
# first 5 rows of data frame
mydata[1:5]
# first 2 columns of data frame
mydata[1:2, ]
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>

These are really common mistakes to make. Be aware!


$~$

***
### **< WORKSHOP >** R Basics
***
\

During this week's workshop, we're going to build a data frame of made-up data, similar to what was done in the first Chapter of the workbook. This will involve:

* creating random numeric vectors
* creating factor vectors
* creating character vectors
* building a data frame from existing vectors in R
* selecting parts of a data frame using `base R` methods

We will cover quick, basic plots in `base R`, including:

* histograms 
* boxplots
* barplots
* scatter plots

Finally, we will read in the data that we'll be using for the rest of these online sessions, which are saved as csv files. If you're not sure which one you're supposed to be using, check the DATA page of this workbook.  

You won't have encountered absolutely everything you need to do during the at-home study. To mention it again, a really important part of data skills and coding is being able to find answers to question and solutions to probelms yourselves, using whatever resources you have to hand, but especially the internet.  
\

##### **R BASICS: EXERCISES & QUESTIONS**
\

30 mins:  

1. First create a character object called `names` which is the first name of the people in your tutor group (including anyone who is missing). If there are two people in your group with the same name, then give each a number (i.e. `Jane1`, `Jane2`,... )
  * What is the length of this character vector?

2. Now create a numeric variable called `norm` which is a random normal distribution with the same length as the number of people in your tutor group. It should have a mean value of 7 and a variance of 1.
  * Can this normal distribution have values below zero?
  * Can the arguments of this vector be written in any order or does it have to be in the order you used?

3. The normal distribution is just one kind of distribution that you can draw random numbers from. Another distribution you are probably familiar with is the _uniform distribution_, where every number has an equal chance of being chosen. Find out how to draw numbers from a random uniform distribution, and create an object called `unif` which is a numeric vector the same length as the number of people in your tutor group, drawn from a random uniform distribution between 0 and 1.
  * What is the name of the _function_ you used?

4. The random uniform numbers are between 0 and 1, meaning they are proportions. Change these proportions into percentages.

5. Now create a factor vector called `sibs` which tells you whether each person in your tutor group has siblings. It should take the value `sis` if the person has sister(s), `bro` if the person has brother(s),`both` if they have both, and `neither` if they have neither. If the person is absent, use `NA`.
  + Hint: you may want to create a character vector first, and convert it into a factor.

6. Create a data frame for your tutor group of the 4 objects (`name`, `norm`, `unif` and `sibs`). Call it what you like :)
  * What is the name of this object?  
\

##### **BIOLOGICAL DATA**

30 mins:  

For the rest of the online workshops, we'll be using real biological data sets. These data sets are tailored slightly to your degree programs: check the DATA page for a summary of the data set and to find out which one you're using.

7. Read the CSV in to R. Save the object as:
  * `DNA_data` for the DNA and ageing data set from Huh _et al._ (2016) Maintenance of age in human neurons generated by microRNA-based neuronal conversion of fibroblasts. _eLife_, 5:e18648. DOI: 10.7554/eLife.18648.
  * `dogs_data` for the urban dogs data set from Majumder _et al._ (2016) Denning habits of free-ranging dogs reveal preference for human proximity. _Scientific Reports_, 6:32014. DOI: 10.1038/srep32014.
  * `pantheria_data` for the mammal life history data set from Jones _et al._ (2009) PanTHERIA: a species-level database of life history, ecology, and geography of extant and recently extinct mammals. _Ecology_, **90**, 2648. DOI: 10.1890/08-1494.1.

I want to encourage you to explore the data now. Usually these sections will be quite prescriptive, with specific tasks. Right now is just a good opportunity to get to know the data, which is _so_ important. You're free to explore as you wish, using the things you've learned in this Chapter, but here are some ideas of things you might want to do:

* How many variables, and how many replicates (i.e. the dimensions of the data frame)
* How many `numeric`, `character`, `factor`, `logical` or other different types of variable are there?
* Is there any missing data?
* What does a summary of the data frame tell you?
* Make a histogram of one of the numeric variables
* Make a boxplot of one of the factors (x axis) against one of the numeric variables (y axis)
* Make a scatterplot of two numeric variables against one another

$~$

***
##### **END OF CHAPTER**
***































##  2½ - Grammar of Graphics
\

Data visualisations are based on an inherent underlying **Grammar of Graphics**.
This framework was developed by 
[Leland Wilkinson](https://www.springer.com/gp/book/9780387245447)
in the 1990's and then repurposed more recently by 
[Hadley Wickham](https://byrneslab.net/classes/biol607/readings/wickham_layered-grammar.pdf),
who is a chief scientist at RStudio.  

<div align="center">
   ![](www/ggplot2_logo.jpg){width="75px"}
</div>  

We will be using the `R` package `ggplot2` for our graphics. (`gg` stands for 
"grammar of graphics", and this is the second version of the package... hence 
the `2`).  
\

Click Continue for a quick overview of what the grammar of graphics means.


$~$

### GRAMMAR OF GRAPHICS 
\  

<div align="center">
   ![](www/GG.png){width="80%"}
</div>  
\

Any data visualisation is a set of different _layers_ of information, as illustrated
in the image above. We'll go through the most important ones from bottom to top.  

**Data** is the most fundamental base layer. All figures are plotted from data.  

**Aesthetics** describe the mapping of data onto the graph. Foremost, aesthetics are used 
to state what the x-variable and y-variable are, although they can extend to other 
variables for more complex graphs (e.g. a third variable to colour data points, 
or a third axis for a 3D graph).  

**Geometries** describe how aesthetics are represented. This principally includes
the graph "type" (e.g. histogram, boxplot, barplot, scatter plot etc.).

**Facets** can be used to split a figure into sub-plots. Sometimes putting all 
data in one space is difficult to read, so a plot can be split out into different
facets according to chosen aesthetics.  

**Statistics** describe any models used to describe or predict the data. This 
may commonly include means and standard deviations, linear models or loess 
curves.  

**Coordinates** are not commonly used for simple graphs, but are useful when 
projecting the data into a different coordinate space. Mapping is the 
most obvious example: the same data can be plotted using many different 
geographic coordinate systems.



### `ggplot`
\

Functions and arguments in `ggplot2` mirror these layers. You'll encounter 
these methods in the next several chapters. The reason we're using `ggplot`
is because the graphics is produces are generally far better quality than 
the `base` `R` graphics. 

* `base R` graphics **GOOD** for: 
  + Quick, simple plots
  + Fast viewing of your data
  + Extremely flexible customisation _if you take considerable time to learn methods and code._
* `base R` graphics are **NOT good** for:
  + Not good for using for publications if you rely on default options, which are ugly.
  + Not good for customising plots _unless time is taken to learn how_
  + Not good for coherent coding (no underlying framework, order of functions very important)
  + Not good for tutorials available

* `ggplot` graphics are **GOOD** for:
  + Quickly producing and customising aesthetically pleasing plots 
  + Publication-quality figures out the box
  + Coherent code (clear underlying framework, order of functions flexible)
  + Easy access tutorials
* `ggplot` graphics are **NOT good** for:
  + Not good given lack of flexibility outside available options 
  + Not good for quick plots as more code is needed
  + Not good for viewing data fast
\

Here's an example of a scatter plot made using `ggplot` with the  with the toy 
data. 
\


```r
ggplot(toydata, aes(x = numbers2, y = random)) +
  geom_point(color = "steelblue4") +
  xlim(0, 20) + ylim(-2, 2) +
  xlab("Even numbers") + ylab("Random normal") +
  theme_minimal()
```

<img src="DataSkills_files/figure-html/unnamed-chunk-29-1.png" width="624" style="display: block; margin: auto;" />
\

Take a look at the graph and the code, and it's possible to match up the different layers:

* The **DATA** is `toydata`.
* The **AESTHETICS** (in this case just x and y variables) are defined using `aes()`
* The **COORDINATES** are altered in a very simple way by changing the x and y 
axis limits using `xlim()` and `ylim()`
* The **THEME** is changed by applying the minimal theme using `theme_minimal()`.

$~$

***































<!-- spiel -->
## 3 --- Data Distributions
\

_The first section of this Chapter will be completed at home before this week's online workshop._
This first section contains _Quizzes_ and _Exercises_. These multi-
choice questions and `R` coding exercises will test your learning on this chapter's
topic.

_The second section of this worksheet will be completed during the online workshop in your tutor groups._
This section contains some tasks for you to complete with a real data set, on the 
topic of this Chapter. You'll be coding this yourselves in `R` using RStudio.  
\

In this session...



Contine to Resources...  


$~$

***
### **3.1 RESOURCES**
\

##### **BOOKS**
 
<!-- ### *** Pages etc. -->
* [_**R for Data Science**_](https://r4ds.had.co.nz/) by Garrett Grolemund and Hadley Wickham. 
* [_**Getting Started with R: An Introduction for Biologists (2nd ed)**_](http://r4all.org/books/gswr2/) 
by Andrew Beckerman, Dylan Childs, and Owen Petchey, pp 87 - 91, Chapter 4.4, "Distributions:
making histograms of numeric variables", & Chapter 4.5, "Saving your graphs for 
presenatation, documentation, etc.".  
\ 

##### **CHEATSHEETS**

* ggplot2 cheatsheet - see Resources section on blackboard or 
download [**here**](https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)  
\ 

##### **WEB LINKS**

* [**ggplot2 package**](https://ggplot2.tidyverse.org/) by RStudio  
* [**ShinyGLM**](https://iainmstott.shinyapps.io/ShinyGLiM)  
\


##### **ShinyGLM**

We'll be using the [**ShinyGLM**](https://iainmstott.shinyapps.io/ShinyGLiM) webapp 
in this and subsequent chapters. It's designed to make learning data skills in `R`
an interactive experience. It's worth getting to know how to use it, so make sure 
to read the **USER GUIDE** now.  

In this Chapter, we'll mainly be working with the _DATA DISTRIBUTIONS_ tab.  

$~$

***
### **3.2 R PACKAGES**  

We encountered **R packages** in the last 2 Chapters. In this Chapter we will 
need to use an R package developed by the RStudio team.

 * `ggplot2`, is an `R` package which makes pretty pretty data visualisations.

If you are working in RStudio, the package first needs to be installed onto your computer. Unless you update `R`, this only needs to be done _once_. 


```r
install.packages("ggplot2")
```
\

Once a package is installed, it is available for `R` to use. But unless you tell `R` to actually _use_ the package then it won't know it needs to. The reason for thisvis that once you're using `R` a lot and have loads of packages installed, if you loaded _all_ the packages in every time you start `R` it would take forever.  

Think of it like apps on your phone: imagine if every single app on your phone opened 
every time you switched the phone on on...!  _Nightmare_.  

The way we load up these packages is using `library()`. You usually need to do this every time you start a new `R` session (i.e. every time you open RStudio).

 
 ```r
 library(ggplot2)
 ```
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 1 &gt;</strong> R Packages</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz32_1-1" class="tutorial-question panel-body">
<div id="qz32_1-1-answer_container" class="shiny-html-output"></div>
<div id="qz32_1-1-message_container" class="shiny-html-output"></div>
<div id="qz32_1-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz32_1-2" class="tutorial-question panel-body">
<div id="qz32_1-2-answer_container" class="shiny-html-output"></div>
<div id="qz32_1-2-message_container" class="shiny-html-output"></div>
<div id="qz32_1-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

R aficionados will tell you not to confuse "package" and "library"

* packages are stored in a library
* you use the function `library()` to load a package from your library.

If you tell `R` geeks like me that you're loading a library, we can't handle it 
and our brains explode.  

$~$

***
### **3.3 DATA DISTRIBUTIONS** 
\

It's really important to understand the nature of your data. There are different 
types of data, and here are some of the types we regularly encounter as biologists:

* numeric
   + continuous: Gaussian, beta, exponential
   + discrete (counts): Poisson, binomial
* non-numeric
   + categorical
   + ordinal
\

Let's remind ourselves of the different distributions found in the _**games**_ 
data, and the distributions they follow.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 2 &gt;</strong> Data Distributions</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz33_2-1" class="tutorial-question panel-body">
<div id="qz33_2-1-answer_container" class="shiny-html-output"></div>
<div id="qz33_2-1-message_container" class="shiny-html-output"></div>
<div id="qz33_2-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz33_2-2" class="tutorial-question panel-body">
<div id="qz33_2-2-answer_container" class="shiny-html-output"></div>
<div id="qz33_2-2-message_container" class="shiny-html-output"></div>
<div id="qz33_2-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz33_2-3" class="tutorial-question panel-body">
<div id="qz33_2-3-answer_container" class="shiny-html-output"></div>
<div id="qz33_2-3-message_container" class="shiny-html-output"></div>
<div id="qz33_2-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz33_2-4" class="tutorial-question panel-body">
<div id="qz33_2-4-answer_container" class="shiny-html-output"></div>
<div id="qz33_2-4-message_container" class="shiny-html-output"></div>
<div id="qz33_2-4-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz33_2-5" class="tutorial-question panel-body">
<div id="qz33_2-5-answer_container" class="shiny-html-output"></div>
<div id="qz33_2-5-message_container" class="shiny-html-output"></div>
<div id="qz33_2-5-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

#### **3.3.1 Data Distributions Explained**
\

Here's a little from me on data distributions:  
\

<center>
![](https://youtu.be/d7lARa168gk){width="80%"}
</center>  
\  

The **distributions** of variables are important factors in how we 
interpret plots and analyses. Distributions are effectively 'counts' of the
number of times certain variable values occur (e.g. for the paper balls game, which has discrete values, the distribution may be simply 
the counts of occurrence of 0, 1, 2, 3, 4,...), or the number of times variable 
values occur within certain intervals (e.g. for the eyesight variable we can count the number of 
values between -3 to -2, -2 to -1, -1 to 0,..., or any other intervals we choose).  

We use these counts to visualise distributions, as we will see shortly.  

Distributions also show us how variables are:

* _bounded_ (i.e. cannot occur above, below or between certain values)
* how they are _skewed_ (e.g. there are lots of small values but not many large ones or vice versa)
* what values their _moments_ (i.e. mean, variance, skewness) may take
* which _statistical distributions_ the data approximate.

Distributions of your data are important, as all of the things listed here can have implications
for: 

* how you analyse your data
* whether your statistical models are valid
* how you interpret your results.

<!--
In this particular session, we're going to acquaint ourselves with the 
[`ggplot2`](https://ggplot2.tidyverse.org/) package. `ggplot2` is a great 
package for data visualisation: it's easy to make very pretty graphs with 
only a few lines of code, and has simplified many data visualisation problems 
which previously were tricky in R. We'll be learning:

* a reinforcement of data-handling skills
* an understanding of the grammar of graphics and how ggplot uses it
* how plot histograms
   + `ggplot()` and `aes()` to initialise a plot
   + adjustments to coordinates
   + `geom_histogram` to map a histogram 
   + how to change the look of a plot with themes and other options  
\
-->

$~$

***
### **3.4 VISUALISING DATA DISTRIBUTIONS**
 \

Data distributions are most commonly visualised using a **histogram**.  

A refresher on 
histograms: the variable 
of interest, on the x axis, is split into _bins_. Each bin has a bar representing 
either the _count_ of the number of data points that fall in that bin, or the 
_density_: the proportion of total data points that fall in that bin.  

$~$

### 3.4.1 EYESIGHT
\  

We're going to begin by working with the `eyesight` variable.  
\

Head on over to [**ShinyGLM**](https://iainmstott.shinyapps.io/ShinyGLiM). 
I assume you've read all of the user guide now... (I know 
it must have been thrilling reading). Go to the DATA DISTRIBUTIONS page. Choose to plot the 
`eyesight` variable. Keep all of the other options at their defaults, for now.  

Your histogram should look like this:  


```r
### *** THIS NEEDS FIXING
hist <- ggplot(games, aes(x = eyesight)) +
    geom_histogram(aes(y = ..density..), bins = 10, fill = 'steelblue4') +
    xlim(-7.5, 14) +
    theme_minimal()

hist
```

```
## Warning: Removed 4 rows containing non-finite values (stat_bin).
```

```
## Warning: Removed 2 rows containing missing values (geom_bar).
```

<img src="DataSkills_files/figure-html/unnamed-chunk-32-1.png" width="624" style="display: block; margin: auto;" />
\

Using this histogram, answer the questions below.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 3 &gt;</strong> Visualising Data Distributions - Gaussian</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_3-1" class="tutorial-question panel-body">
<div id="qz341_3-1-answer_container" class="shiny-html-output"></div>
<div id="qz341_3-1-message_container" class="shiny-html-output"></div>
<div id="qz341_3-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_3-2" class="tutorial-question panel-body">
<div id="qz341_3-2-answer_container" class="shiny-html-output"></div>
<div id="qz341_3-2-message_container" class="shiny-html-output"></div>
<div id="qz341_3-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_3-3" class="tutorial-question panel-body">
<div id="qz341_3-3-answer_container" class="shiny-html-output"></div>
<div id="qz341_3-3-message_container" class="shiny-html-output"></div>
<div id="qz341_3-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_3-4" class="tutorial-question panel-body">
<div id="qz341_3-4-answer_container" class="shiny-html-output"></div>
<div id="qz341_3-4-message_container" class="shiny-html-output"></div>
<div id="qz341_3-4-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

##### **A little bit on outliers**

The potential outlier at the upper end of the `eyesight` distribution may cause some significant problems for later analysis. Common sense tells us that an eyesight prescription of 14 is very unlikely (extreme farsightedness is considered to be anything over +5 to +6!), so when we come to analyse the data, we may want to remove this data point for purely that reason. When we are trying to analyse the relationship between two (or more) variables, outliers can either

* influence relationships between two variables such that they cause a significant relationship where there otherwise isn't one if the outlier is removed
* mask a real relationship between two variables where the influence of the outlier is in the opposite direction to the relationship between the two variables where the outlier is removed.  
\

**THERE IS A DIFFERENCE BETWEEN AN OUTLIER AND AN INFLUENTIAL POINT**.  

* An outlier is a data point which sits far apart from the majority of points that make up the bulk of its variable's distribution, like the high data point for eyesight.
* Outliers can potentially become influential points when analysing the relationship between one variable and another.
  + An outlier may sit far from the other data, but close to the fitted relationship between two variables, in which case it is not influential.
  + An outlier may sit far from the other data, and also far away from the fitted relationship between two variables, in which case it may be an influential point.  
\

If an outlier is unlikely to be a reasonable or realistic data point (such as an eyesight prescription of +14), we may want to remove it from the data in any case. Otherwise, if we find that an outlier, or another point, significantly influences the outcome of an analysis, we may way to remove it for that reason.  

If this all sounds confusing, it will become clear when we visualise the relationships between data in Chapters 5 and 6.  

We will find out how to subset data frames to remove certain data such as outliers or influential points in Chapter 4.  

$~$

##### **We digress. Back to histograms.**  

In the ShinyGLM app, try adjusting the number of bins that you're plotting. 

* Try higher numbers
* Try lower numbers
* As you adjust the number of bins, look at the CODE tab to see what changes.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 4 &gt;</strong> Visualising Data Distributions - Gaussian</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_4-1" class="tutorial-question panel-body">
<div id="qz341_4-1-answer_container" class="shiny-html-output"></div>
<div id="qz341_4-1-message_container" class="shiny-html-output"></div>
<div id="qz341_4-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_4-2" class="tutorial-question panel-body">
<div id="qz341_4-2-answer_container" class="shiny-html-output"></div>
<div id="qz341_4-2-message_container" class="shiny-html-output"></div>
<div id="qz341_4-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz341_4-3" class="tutorial-question panel-body">
<div id="qz341_4-3-answer_container" class="shiny-html-output"></div>
<div id="qz341_4-3-message_container" class="shiny-html-output"></div>
<div id="qz341_4-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

On the left of the ShinyGLM page you can see lots of different options for the plot. 
You can probably guess by looking at the code how elements of the code match up to the rest of the options in the app.  
\

#### **< EXERCISE 1 >** Visualising Data Distributions - Gaussian
_Use the options in the ShinyGLM app to make a histogram that has:_

1. _Bars which are 'black'_
2. _x axis limits of -10 and 15_
3. _12 bins_
4. _A 'classic' theme_

_Edit the code below, which has deliberate mistakes in it, to reproduce the histogram with the above criteria. Think of this as a game of spot-the-difference... compare this code to the code generated from the app, and fix the differences._  

_Edit the code directly rather than copy-pasting from the ShinyGLM app: you learn far quicker that way._

<div class="tutorial-exercise" data-label="ex341_1" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
hist <- ggplot(games aes(x = Eyesight)) +
    geom_histogram(aes(y = ..density..), bin = 12, color = 'black') +
    xlim(c(-10, 15)) 
    theme('classic')

hist
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
\  
<div class="tutorial-exercise-support" data-label="ex341_1-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
hist <- ggplot(games, aes(x = eyesight)) +
    geom_histogram(aes(y = ..density..), bins = 12, fill = 'black') +
    xlim(-10, 15) 
    theme_classic()

hist
```

</div>

Just reflect also on what's different in the code for this histogram compared to the first histogram in this chapter, and how this maps on to the differences in what the histograms show. For example, using `ggplot(` You'll need this knowledge for the next exercise.  


$~$

### 3.4.2 REACTION
\

The following exercise requires you to code a histogram yourself, for the 'reaction' variable.  
\

Ideally, you should take the following approach to this exercise:

* Step 1: see if you can copy-paste the code for the _eyesight_ histogram from the last exercise and alter it for this exercise
* Step 2: If you need an easier starting point, change the options in the ShinyGLM app to generate the code you need and copy it across here.

You won't find all the answers in the ShinyGLM app. Some of the solutions require a little bit of internet searching. A key skill for any programmer is to be able to find out the answers to any coding problems you encounter.

* Step 3: Google [other search providers are available] to see if you can find ways to change the options which aren't in the ShinyGLM app. Really, really try before moving to step 4.
* Step 4: look at the hints if you're stuck.  
\

#### **< EXERCISE 2 >** Visualising Data Distributions - beta
_Plot a histogram of `reaction`, with:_

* _bar colour "goldenrod"_
* _x limits of 0 and 1_
* _11 bins_
* _x label "Number of continents visited" and y label "Number of countries visited"_
* _a density plot added_
* _a black and white theme_

<div class="tutorial-exercise" data-label="ex342_2" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex342_2-hint" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
Solutions to the last two points, if not found through googling, are on the 
ggplot cheat sheet, linked to at the top of the page! Everything else
is covered in the ShinyGLM app.
```

</div>
\  

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 5 &gt;</strong> Visualising Data Distributions - beta</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz342_5-1" class="tutorial-question panel-body">
<div id="qz342_5-1-answer_container" class="shiny-html-output"></div>
<div id="qz342_5-1-message_container" class="shiny-html-output"></div>
<div id="qz342_5-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

$~$

### 3.4.3 COUNTRIES
\

You may remember that histograms may be represented as densities 
(counts in a bin represented as a proportion of the total), and counts 
(raw counts of 
the number of data points in a bin). So far, we have only plotted histograms 
using density.  

If we want to plot a histogram of countries people have visited, then we 
might want to use counts as it's more informative in this case. We also would 
want to make sure there's one bar per number of countries visited.  
\

#### **< EXERCISE 3 >** Visualising Data Distributions - poisson
_Edit the code below to make a histogram of counts with one_ 
_bar per number of countries visited. Here's two hints:_

* _`R` is literal: if there's somewhere in the code that specifies a density_
_plot, then it's very likely that's what you might have to edit to produce a_
_count plot instead._
* _Run the code `?geom_histogram` before you start to see the help page on this function, and_
_somewhere on this page is another way to specify bins which have a specific_
_width: you want to specify bins that have a width of 1._

<div class="tutorial-exercise" data-label="ex343_3" data-caption="2.3 Data Distributions: Exercise 3" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
hist <- ggplot(games, aes(x = countries)) +
    geom_histogram(aes(y = ..density..), bins = 12, color = 'green4') +
    xlim(0.5, 30.5) +
    theme_minimal()

hist
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex343_3-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
hist <- ggplot(games, aes(x = countries)) +
    geom_histogram(aes(y = ..count..), binwidth = 1, color = 'green4') +
    xlim(0.5, 30.5) +
    theme_minimal()

hist
```

</div>

$~$  

### 3.4.4 CONTINENTS
\

Consider the three code chunks below. There are mistakes in the code.  
\

_Continents: chunk 1_

```r
hist <- ggplot(games, aes(x = continents)) +
    geom_histogram(aes(y = ..count..), binwidth = 1, fill = 'chocolate4') +
    xlim(0.5, 7.5) +
    theme_minimal()

hist
```

_Continents: chunk 2_

```r
hist <- ggplot(games, aes(x = Continents)) +
    geom_hist(aes(y = ..count..), binwidth = 1, fill = 'chocolate4') +
    xlims(0.5, 7.5) +
    theme_minimal()

hist
```

_Continents: chunk 3_

```r
hist <- ggplot(games_data, aes(x = continents)) +
    geom_histogram(aes(y = ..count..), binwidth = 1, fill = 'chocolate4') +
    xlim(0.5, 7.5) +
    minimal_theme()

hist
```

_Continents: chunk 4_

```r
hist <- ggplot(games, aes(x = continents)) +
    geom_histogram(aes(y = 'count'), bins = 1, fill = 'chocolate4') +
    xlim(0.5, 7.5) +
    theme_minimal()

hist
```
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 6 &gt;</strong> Visualising Data Distributions - poisson</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz344_6-1" class="tutorial-question panel-body">
<div id="qz344_6-1-answer_container" class="shiny-html-output"></div>
<div id="qz344_6-1-message_container" class="shiny-html-output"></div>
<div id="qz344_6-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz344_6-2" class="tutorial-question panel-body">
<div id="qz344_6-2-answer_container" class="shiny-html-output"></div>
<div id="qz344_6-2-message_container" class="shiny-html-output"></div>
<div id="qz344_6-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz344_6-3" class="tutorial-question panel-body">
<div id="qz344_6-3-answer_container" class="shiny-html-output"></div>
<div id="qz344_6-3-message_container" class="shiny-html-output"></div>
<div id="qz344_6-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz344_6-4" class="tutorial-question panel-body">
<div id="qz344_6-4-answer_container" class="shiny-html-output"></div>
<div id="qz344_6-4-message_container" class="shiny-html-output"></div>
<div id="qz344_6-4-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz344_6-5" class="tutorial-question panel-body">
<div id="qz344_6-5-answer_container" class="shiny-html-output"></div>
<div id="qz344_6-5-message_container" class="shiny-html-output"></div>
<div id="qz344_6-5-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

$~$


***
### **3.5 OTHER RESOURCES**
\

...

$~$

***
### **3.6 FINAL TIPS**
\

...

$~$

***
### **< WORKSHOP >** Data Distributions
***  
\

...

$~$

***
##### END OF CHAPTER
***




<!--
Cast your mind back to the _BGY2010M W1.2 Data handling_ worksheet, because 
you're going to have to remember something you learned! You want to look 
at the 'games' data for only people who can't touch the floor, as you have a theory 
that their tight muscle tension could mean they have quicker reactions 
(the `ruler` variable).  

_Task: work out (without looking at the app!) which of these three pieces of code 
give the correct way to subset the data in the way described above._


```r
# a)
data %>% filter(ffold %over% 0)

# b)
data %>% slice(ffold >= 0)

# c)
data %>% select(ffold > 0)

# d)
data %>% filter(ffold > 0)
```
\

Now, head to the DATA page and subset the data to only people who can't touch the 
floor. See whether you got the above answer right.  
\

Returning to the DATA VISUALISATION (ONE VARIABLE) page, see how subsetting 
the data has changed your plot.  

_Question: think back to the start of this worksheet and what you thought about
the characteristics of the distribution of the `ffold` variable. Now that you've subsetted the `ffold` data, have those thoughts changed?_  
\
-->































## 4 --- Data Management
\

_The first section of this Chapter will be completed at home before this week's online workshop._
This first section contains _Quizzes_ and _Exercises_. These multi-
choice questions and `R` coding exercises will test your learning on this chapter's
topic.

_The second section of this worksheet will be completed during the online workshop in your tutor groups._
This section contains some tasks for you to complete with a real data set, on the 
topic of this Chapter. You'll be coding this yourselves in `R` using RStudio.  
\

We've learned some basic stuff in R: objects, classes, assignments, functions,
arguments, outputs, comments. Importantly we've learned of a few common classes
of object that we'll often encounter during our R adventures: numeric, 
character, factor, logical, data.frame.  

We've also learned about __Tidy Data__. Tidy data allows you, as analyst padawans, 
to easily subset and manipulate data, so you're working with the data that you 
need to be working with.  

In this session, we're going to learn common means of manipulating data. 
We're going to acquaint ourselves with the 
[`dplyr`](https://dplyr.tidyverse.org/) package. `dplyr` is an expert 
data-wrangler which you can use to organise and manipulate data ready for 
plotting and analysis. We'll be learning:

* how to read data into R
* how to subset data
   + `slice()` and `filter()` to choose certain rows of the `data.frame`
   + `select()` to choose certain columns of the `data.frame`
* how to manipulate data
   + how to add a variable to the `data.frame` using `mutate()`
   + how to arrange the `data.frame` by variable values using `arrange()`
* how to use **pipes** `%>%` to make coding neater and cleaner.  
\

$~$

***
### **4.1 RESOURCES**  
\

##### **BOOKS**
 
<!-- ### *** Pages etc. -->
* [_**R for Data Science**_](https://r4ds.had.co.nz/) by Garrett Grolemund and Hadley Wickham. 
* [_**Getting Started with R: An Introduction for Biologists (2nd ed)**_](http://r4all.org/books/gswr2/) 
by Andrew Beckerman, Dylan Childs, and Owen Petchey, pp 35 - 78, Chapter 2, "Getting your 
data into R" and Chapter 3, "Data management, manipulation and exploration".
\ 

##### **CHEATSHEETS**

* data transformation with dplyr cheatsheet - 
see Resources section on blackboard or download 
[here](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf)
\

##### **WEB LINKS**

* [**dplyr package**](https://dplyr.tidyverse.org/)
* [**R for beginners**](https://education.rstudio.com/learn/beginner") by RStudio
* [**ShinyGLiM**](https://iainmstott.shinyapps.io/ShinyGLiM)  
\

##### **ShinyGLM**

In this Chapter, we'll mainly be working with the _DATA_ tab.  
\

***
### **4.2 R PACKAGES**  
\

In this Chapter we will 
need to use another R package developed by the RStudio team.

 * `dplyr`, is an `R` package which helps work with data: subsetting, transforming, manipulating... etc.

Remember that if you're working alongside this in RStudio, the package first needs to be installed onto your computer, and unless you update `R`, this only needs to be done _once_. 


```r
install.packages("dplyr")
```
\

Then in order for `R` to know to use it in your session, it needs to also be loaded:
 
 ```r
 library(dplyr)
 ```

$~$

***
### **4.3 SUBSETTING DATA**
\  

On the DATA tab of the ShinyGLM app, you can see the games data.  

There are two panels on the right 
(although if your browser window is narrow or you're 
using a smartphone or a tablet then these might be at the bottom of the 
page): **DATA FRAME** and **CODE**. On the CODE tab, you'll see a couple of lines of code which, if you cast your mind back to _Chapter 1 R Basics_, will be familiar. These two lines of 
code are what you would need to use in R Studio to read in the games data and 
get R to show it.  

On the left (or at the top of the page if you're using a small screen or 
small browser window) are some options.  

These options allow you to subset the data:

* Subset rows either by...
  + row numbers using the `slice()` function, or
  + selecting variable values using the `filter()` function
* Subset columns either by...
  + column numbers using the `select()` function, or
  + variable names, also using the `select()` function.  
\

One HUGE advantage of `R` and other coding languages is how quickly and easily it is to manage your data in these ways. With a single line of code you can apply one or more criteria which strip out what you don't want and keep in what you do. When working with data, you usually find this shuffling and re-shuffling of the data is absolutely necessary.  

$~$

### 4.3.1 `slice()`
\

##### **CHOOSING ROWS BY NUMBER**

First we'll pick some rows by their number using `slice`. Imagine that we want to view only the data for group 2, which are rows 7-10 of the data.  

* Change the row numbers slider to values of **7** and **10**.
* Check that the DATA FRAME is displaying persons 7 to 10.
* Look at the CODE panel to see how it's changed.  
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 1 &gt;</strong> Subsetting Data - slice</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz431_3-1" class="tutorial-question panel-body">
<div id="qz431_3-1-answer_container" class="shiny-html-output"></div>
<div id="qz431_3-1-message_container" class="shiny-html-output"></div>
<div id="qz431_3-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz431_3-2" class="tutorial-question panel-body">
<div id="qz431_3-2-answer_container" class="shiny-html-output"></div>
<div id="qz431_3-2-message_container" class="shiny-html-output"></div>
<div id="qz431_3-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz431_3-3" class="tutorial-question panel-body">
<div id="qz431_3-3-answer_container" class="shiny-html-output"></div>
<div id="qz431_3-3-message_container" class="shiny-html-output"></div>
<div id="qz431_3-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

$~$

### 4.3.2 PIPE `%>%`
\

You'll notice that we use a **pipe** `%>%` in the code.


```r
rows <- c(7, 10)

dataSubset <-games %>%
    slice( seq(rows[1], rows[2], 1) )
```
\

Whatever comes before the pipe is passed to whatever comes after the pipe. So, 
the chunk of code above could be interpreted as  

_"Take the `games` object (which is the games data frame), and use the `slice()` function to subset rows 7 to 10 from it._  

This is assigned to an object called `dataSubset`.  
\

There's another way we can write this code:


```r
rows <- c(7, 10)

dataSubset <- slice(games, seq(rows[1], rows[2], 1) )
```
\

For something short like we're doing here, this might be OK. But as you 
need to do more and more things with your data, this gets more complicated:
you end up with functions inside functions, parentheses within parentheses.  
\

#### **< EXERCISE 1 >** Subsetting Data - pipe `%>%`
_Edit the code below so you condense the first three lines of code into one line. Hint: combine answers from "Subsetting Data: Quiz 1" and the information you just learned about pipes._
<div class="tutorial-exercise" data-label="ex432_1" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
rows <- c(7, 10)
dataSubset <- games %>%
    slice( seq(rows[1], rows[2], 1) )
dataSubset
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["person"],"name":[1],"type":["chr"],"align":["left"]},{"label":["role"],"name":[2],"type":["chr"],"align":["left"]},{"label":["group"],"name":[3],"type":["chr"],"align":["left"]},{"label":["eyesight"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["continents"],"name":[5],"type":["int"],"align":["right"]},{"label":["countries"],"name":[6],"type":["int"],"align":["right"]},{"label":["reaction"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["hearing"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"P7","2":"student","3":"G2","4":"-1.50","5":"3","6":"14","7":"0.5250000","8":"17917.69"},{"1":"P8","2":"student","3":"G2","4":"1.25","5":"1","6":"9","7":"0.5833333","8":"17955.76"},{"1":"P9","2":"student","3":"G2","4":"0.00","5":"2","6":"14","7":"0.2750000","8":"18446.55"},{"1":"P10","2":"person","3":"G2","4":"0.75","5":"3","6":"16","7":"0.3916667","8":"18410.08"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex432_1-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
dataSubset <- slice(games, seq(7, 10, 1))
OR
dataSubset <- slice(games, 7:10)

Step 1: use slice(games, ...) instead of the pipe
Step 2: use seq(7, 10, 1) or 7:10 instead of rows object
Step 3: combine!
```

</div>
\

$~$

### 4.3.3 `select()`
\

The pipe `%>%` is particularly useful when you want to perform multiple operations
on an object: we'll see this now as we want to select not just rows, but columns 
from the data.

##### **CHOOSING COLUMNS BY NUMBER**

First, we'll choose by column number. Imagine that we don't want the data related to the online games: this is the columns `pballs`, `reaction` and `hardware` (columns 7, 8 and 9).
Back in the ShinyGLM app, with the rows 
still set to 7 and 10, pick _"Choose by... Column numbers"_ and 
change the slider to 1 and 6. Check the _DATA FRAME_ tab to check 
you have the right rows and columns, then check the _CODE_ tab. Notice that
there's a further step in the data subsetting, which uses `select()` to choose columns. The data should now show the lines for group 2 and the columns for everything except variables related to the online games.  
\

The pipes have become important here. The chunk of code above could be interpreted as:  

_"Take the `games` object [which is the games data frame], and use the `slice()` function to first, subset rows 7 to 10 and second, use the `select()` function to subset columns 1 to 6, from it."_  

Let's take a moment to imagine what that would look like without pipes:
\


```r
rows <- c(7, 10)
cols <- c(1, 6)
dataSubset <- select(slice(games, seq(rows[1], rows[2], 1) ), seq(cols[1], cols[2], 1))
```
\

We also saw in _Chapter 1: R Basics_ that there is a way to use base `R` to 
select rows and columns from a data frame using square brackets `[]` (check back if you've forgotten). That 
would look like this:
\


```r
rows <- c(7, 10)
cols <- c(1, 6)
dataSubset <- games[seq(rows[1], rows[2], 1), seq(cols[1], cols[2], 1)]
```
\

I hope you agree with me that the pipes make everything neater and easier to understand.  
\

#### **< EXERCISE 2 >** Subsetting Data - `select`
_Type in the code you get from the ShinyGLM app (from `# define row range` onwards). Try the following:_

1. _Swapping the `slice()` and `select()` lines_
2. _Deleting the white space at the start of the `slice()` and `select()` lines_
3. _Removing the new line after each pipe `%>%` so that the three lines are on the same line_
<div class="tutorial-exercise" data-label="ex433_2" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 2 &gt;</strong> Subsetting Data - <code>select()</code></div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz433_1-1" class="tutorial-question panel-body">
<div id="qz433_1-1-answer_container" class="shiny-html-output"></div>
<div id="qz433_1-1-message_container" class="shiny-html-output"></div>
<div id="qz433_1-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz433_1-2" class="tutorial-question panel-body">
<div id="qz433_1-2-answer_container" class="shiny-html-output"></div>
<div id="qz433_1-2-message_container" class="shiny-html-output"></div>
<div id="qz433_1-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz433_1-3" class="tutorial-question panel-body">
<div id="qz433_1-3-answer_container" class="shiny-html-output"></div>
<div id="qz433_1-3-message_container" class="shiny-html-output"></div>
<div id="qz433_1-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz433_1-4" class="tutorial-question panel-body">
<div id="qz433_1-4-answer_container" class="shiny-html-output"></div>
<div id="qz433_1-4-message_container" class="shiny-html-output"></div>
<div id="qz433_1-4-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz433_1-5" class="tutorial-question panel-body">
<div id="qz433_1-5-answer_container" class="shiny-html-output"></div>
<div id="qz433_1-5-message_container" class="shiny-html-output"></div>
<div id="qz433_1-5-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

**It's important to note: pipes don't work with every function in `R`**. They work for these functions from the `dplyr` package that we encounter in this Chapter, but don't necessarily expect them to work otherwise.  
\

**It is bad practice to use row and column numbers to select data from a data frame.**

* If you add or remove rows or columns from your data file, then you have to change your code to match those changes.
* If you change the order of the rows or columns in your data file, then you have to change your code to match those changes.
\

##### **CHOOSING COLUMNS BY NAME**

`select()` can therefore also be used to subset according to column _**name**_. 
We're much less likely to make a mistake if we use those names rather 
than picking the wrong column number.  

In ShinyGLM, choose _COLUMNS | Choose by... Variable names_, and take out `pballs`, `reaction` and `hardware`. Note how the code then changes, 
and you're selecting variables by name instead of by number.  
\

#### **< EXERCISE 3 >** Subsetting Data - `select()`
_Edit the code below to give a data frame which has all columns except `group`. Hint: the result ShinyGLM gives you works fine, but is not the quickest way to do it; try googling something like "remove column dplyr select" and see if you can find a simpler solution._  

<div class="tutorial-exercise" data-label="ex433_3" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
dataSubset <- games %>%
    select()
dataSubset
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex433_3-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
dataSubset <- games %>%
    select(-group)
dataSubset
```

</div>
\

$~$

### 4.3.4 `filter()`
\

Selecting rows using numbers is also not the best way to go about things. `filter()` is a function that can select rows according to variable values.  
\

##### **SELECTING ROWS USING VARIABLE VALUES**

In ShinyGLM, make sure that all columns are selected, and choose 
the option to select rows using variable values.  
\

**Logical** commands come into their own here. When we were selecting rows 7 through 10, we were effectively selecting only Group 2. If the number or order of the rows were to change, then rows 7 through 10 would no longer represent Group 2. Instead, we can use a logical command `group == G2` and the `filter()` function:


```r
dataSubset <- games %>%
    filter( group == 'G2' )
dataSubset
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["person"],"name":[1],"type":["chr"],"align":["left"]},{"label":["role"],"name":[2],"type":["chr"],"align":["left"]},{"label":["group"],"name":[3],"type":["chr"],"align":["left"]},{"label":["eyesight"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["continents"],"name":[5],"type":["int"],"align":["right"]},{"label":["countries"],"name":[6],"type":["int"],"align":["right"]},{"label":["reaction"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["hearing"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"P7","2":"student","3":"G2","4":"-1.50","5":"3","6":"14","7":"0.5250000","8":"17917.69"},{"1":"P8","2":"student","3":"G2","4":"1.25","5":"1","6":"9","7":"0.5833333","8":"17955.76"},{"1":"P9","2":"student","3":"G2","4":"0.00","5":"2","6":"14","7":"0.2750000","8":"18446.55"},{"1":"P10","2":"person","3":"G2","4":"0.75","5":"3","6":"16","7":"0.3916667","8":"18410.08"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
\
Try it yourself in ShinyGLM: with all columns selected, choose _ROWS | Choose by... Variable values_ and type `group == "G2"` in the box, and click REFRESH. You should have a data frame that includes only Group 2.  
\

Using `filter()` can be very useful for removing data outliers. There is an outlier in the `eyesight` variable, which is evident from the histogram for `eyesight`. We can remove this by excluding any values below this value.  
\

#### **< EXERCISE 4 >** Subsetting Data - `filter()`
_The `eyesight` variable has an outlier of 14. Edit the code below to remove the outlier value by using `filter()` to select values below this outlier, then plot a histogram for the `eyesight` variable using the new data frame (use the ShinyGLM app or look back on Chapter 2: Data Distributions if you're not sure)._
<div class="tutorial-exercise" data-label="ex434_4" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# subset the data
dataSubset <- games %>%
    filter()
dataSubset

# plot the data
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex434_4-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
# subset the data
dataSubset <- games %>%
    filter(eyesight < 14) # look at the data frame: the outlier is 14
dataSubset

# plot the data
hist <- ggplot(dataSubset, aes(x = eyesight)) +
    geom_histogram()
# This is the simplest histogram possible: you could choose to plot
# y as density, change the number of bins or bin width, fill colour,
# x axis limits, theme, etc., but you don't have to. The important 
# Thing is to use dataSubset as the data layer.
```

</div>
\

More questions on logicals below. If you're not sure of the answers then try them out in ShinyGLM. If you put in an invalid logical then the app will stop working and the screen will fade out. Don't worry: all you need to do is refresh it and try again.
\

<!--html_preserve--><div class="panel-heading tutorial-quiz-title"><strong>&lt; QUIZ 3 &gt;</strong> Subsetting Data - <code>filter</code></div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz434_2-1" class="tutorial-question panel-body">
<div id="qz434_2-1-answer_container" class="shiny-html-output"></div>
<div id="qz434_2-1-message_container" class="shiny-html-output"></div>
<div id="qz434_2-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz434_2-2" class="tutorial-question panel-body">
<div id="qz434_2-2-answer_container" class="shiny-html-output"></div>
<div id="qz434_2-2-message_container" class="shiny-html-output"></div>
<div id="qz434_2-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz434_2-3" class="tutorial-question panel-body">
<div id="qz434_2-3-answer_container" class="shiny-html-output"></div>
<div id="qz434_2-3-message_container" class="shiny-html-output"></div>
<div id="qz434_2-3-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz434_2-4" class="tutorial-question panel-body">
<div id="qz434_2-4-answer_container" class="shiny-html-output"></div>
<div id="qz434_2-4-message_container" class="shiny-html-output"></div>
<div id="qz434_2-4-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve--><!--html_preserve--><div class="panel panel-default">
<div data-label="qz434_2-5" class="tutorial-question panel-body">
<div id="qz434_2-5-answer_container" class="shiny-html-output"></div>
<div id="qz434_2-5-message_container" class="shiny-html-output"></div>
<div id="qz434_2-5-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div><!--/html_preserve-->
\

$~$

***
### **4.4 ADDING VARIABLES**

Sometimes we might want to add a variable to the data frame that's some kind of
function of one or more other variables.  

$~$

### 4.4.1 `mutate()`
\

`mutate()` is the function we'll use to add variables. If we wanted to know how many _extra_ continents someone had been to (i.e. how many continents they have been to, not including their home continent), then we need a variable which is continents minus 1.  

Select _ADD A VARIABLE..._ in ShinyGLM. This allows you to add a variable to the data. You need to give your new variable a name (e.g. `extra_continents`), and then tell `R` how to calculate it: `continents - 1`. If you click _ADD VARIABLE_ it'll add it to the data frame.  
\

#### **< EXERCISE 5 >** Adding Variables - `mutate()`
*Often when we analyse counts, we need to log-transform them. Add a variable called log_countries which is the natural log of `countries`. You'll have to look up how to calculate the natural log in `R`.*
<div class="tutorial-exercise" data-label="ex441_5" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
dataSubset <- games %>%
    mutate()
dataSubset
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["person"],"name":[1],"type":["chr"],"align":["left"]},{"label":["role"],"name":[2],"type":["chr"],"align":["left"]},{"label":["group"],"name":[3],"type":["chr"],"align":["left"]},{"label":["eyesight"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["continents"],"name":[5],"type":["int"],"align":["right"]},{"label":["countries"],"name":[6],"type":["int"],"align":["right"]},{"label":["reaction"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["hearing"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["log_countries"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"P1","2":"student","3":"G1","4":"-2.50","5":"2","6":"9","7":"0.6666667","8":"15320.148","9":"2.1972246"},{"1":"P2","2":"student","3":"G1","4":"-2.00","5":"1","6":"6","7":"0.5583333","8":"17816.971","9":"1.7917595"},{"1":"P3","2":"person","3":"G1","4":"14.00","5":"1","6":"8","7":"0.7250000","8":"14707.285","9":"2.0794415"},{"1":"P4","2":"student","3":"G1","4":"-4.50","5":"5","6":"15","7":"0.4750000","8":"15886.718","9":"2.7080502"},{"1":"P5","2":"staff","3":"G1","4":"0.00","5":"3","6":"17","7":"0.3916667","8":"15753.990","9":"2.8332133"},{"1":"P6","2":"staff","3":"G1","4":"4.00","5":"2","6":"7","7":"0.3583333","8":"16575.005","9":"1.9459101"},{"1":"P7","2":"student","3":"G2","4":"-1.50","5":"3","6":"14","7":"0.5250000","8":"17917.690","9":"2.6390573"},{"1":"P8","2":"student","3":"G2","4":"1.25","5":"1","6":"9","7":"0.5833333","8":"17955.759","9":"2.1972246"},{"1":"P9","2":"student","3":"G2","4":"0.00","5":"2","6":"14","7":"0.2750000","8":"18446.550","9":"2.6390573"},{"1":"P10","2":"person","3":"G2","4":"0.75","5":"3","6":"16","7":"0.3916667","8":"18410.076","9":"2.7725887"},{"1":"P11","2":"staff","3":"G3","4":"8.50","5":"2","6":"3","7":"0.5000000","8":"12176.728","9":"1.0986123"},{"1":"P12","2":"student","3":"G3","4":"1.50","5":"3","6":"12","7":"0.6083333","8":"13536.106","9":"2.4849066"},{"1":"P13","2":"student","3":"G3","4":"-7.50","5":"6","6":"28","7":"0.8166667","8":"16766.966","9":"3.3322045"},{"1":"P14","2":"student","3":"G3","4":"0.00","5":"3","6":"12","7":"0.4750000","8":"17610.990","9":"2.4849066"},{"1":"P15","2":"staff","3":"G3","4":"6.50","5":"3","6":"4","7":"0.3583333","8":"14924.113","9":"1.3862944"},{"1":"P16","2":"student","3":"G4","4":"1.00","5":"1","6":"7","7":"0.4750000","8":"16798.504","9":"1.9459101"},{"1":"P17","2":"person","3":"G4","4":"-3.50","5":"3","6":"10","7":"0.5250000","8":"13637.507","9":"2.3025851"},{"1":"P18","2":"student","3":"G4","4":"0.00","5":"7","6":"17","7":"0.5000000","8":"17584.127","9":"2.8332133"},{"1":"P19","2":"staff","3":"G4","4":"-2.00","5":"1","6":"1","7":"0.7750000","8":"9247.403","9":"0.0000000"},{"1":"P20","2":"person","3":"G4","4":"0.00","5":"1","6":"1","7":"0.4750000","8":"13366.225","9":"0.0000000"},{"1":"P21","2":"student","3":"G5","4":"0.00","5":"2","6":"14","7":"0.3583333","8":"17201.661","9":"2.6390573"},{"1":"P22","2":"student","3":"G5","4":"1.75","5":"1","6":"18","7":"0.5833333","8":"17393.331","9":"2.8903718"},{"1":"P23","2":"child","3":"G5","4":"NA","5":"2","6":"5","7":"0.5000000","8":"19328.497","9":"1.6094379"},{"1":"P24","2":"child","3":"G5","4":"NA","5":"1","6":"5","7":"0.7500000","8":"18712.134","9":"1.6094379"},{"1":"P25","2":"child","3":"G5","4":"NA","5":"4","6":"14","7":"0.2250000","8":"19812.989","9":"2.6390573"},{"1":"P26","2":"baby","3":"G5","4":"NA","5":"1","6":"1","7":"NA","8":"NA","9":"0.0000000"},{"1":"P27","2":"person","3":"G6","4":"0.00","5":"1","6":"9","7":"0.3583333","8":"19165.151","9":"2.1972246"},{"1":"P28","2":"student","3":"G6","4":"-1.50","5":"4","6":"11","7":"0.6416667","8":"18046.194","9":"2.3978953"},{"1":"P29","2":"student","3":"G6","4":"0.00","5":"2","6":"2","7":"0.5000000","8":"18088.747","9":"0.6931472"},{"1":"P30","2":"student","3":"G6","4":"0.00","5":"2","6":"8","7":"NA","8":"15346.350","9":"2.0794415"},{"1":"P31","2":"student","3":"G6","4":"-2.50","5":"2","6":"17","7":"NA","8":"18244.346","9":"2.8332133"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
\

You can use `mutate` as many times as you like to add as many variables as you like.  

$~$

***
### **4.5 CHAINING COMMANDS**
\

You can use the pipe to chain together as many commands as you like.  
\

#### **< EXERCISE 6 >** Chaining Commands
_Subset the data frame to include only data for students, add a variable with a name of your choice which represents `reaction` as a percentage rather than a proportion, remove all columns except `person`, `role`, `reaction` and your new percentage reaction variable._
<div class="tutorial-exercise" data-label="ex45_6" data-caption="3.6 Chaining Commands: Quiz 1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0"><script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false}</script></div>
<div class="tutorial-exercise-support" data-label="ex45_6-solution" data-caption="" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0">

```text
dataSubset <- games %>%
    filter(role == 'student') # could also use role %in% 'student'
        mutate(reaction_pc = reaction * 100)
            select(c('person', 'role', 'reaction', 'reaction_pc'))
# the order of the filter, mutate and select lines doesn't matter
dataSubset
```

</div>
\

$~$

***
### **4.X OTHER RESOURCES**
\

...

$~$

***
### **4.X FINAL TIPS**
\

...

$~$

***
### **< WORKSHOP >** Data Management
***  
\
...

$~$

***
##### END OF CHAPTER
***



<!--

***
### PART 2

We'll now put some of that learning into practise with a few tasks with the 
data. Try and complete these on your own, without consulting the app, and
I'm sure you copied the code over from the app as was suggested, so you can
edit that as you need to. First, pretty simple, but pretty important...  
\

_Task: read in the games data_  
\

You're interested in whether luck truly is a real thing in life, as you think
men are unluckier than any other gender. Drawing a picture card is unlucky, as 
picture cards look at you funny and you're pretty sure they're up to no good.
Drawing a black card is luckier than drawing a red card, as red is the colour 
of the devil. There are several steps to preparing your data...  

_Task: prepare your lucky, lucky data..._

* _You don't want to use any data from people who drew 4 cards, as 4 represents 
the 4 horsemen of the apocalypse. Remove any data where someone chose 4 cards._
* _You don't care about any variable that isn't associated with the cards, except
for the identity of the person: their gender and their group. Get rid of the 
variables you don't care about._
* _You need to know how many non-picture cards there were for each person, so
calculate that and add it to your data._
\

_Questions:_

* _How many rows of data do you have left?_
* _What function would you use to arrange the rows of the data frame by the number of 
picture cards drawn? (Hint: see the Getting Started with R book)... can you 
write the code that would do that?_
* _What's the mean total number of black cards drawn?_
* _What are the mean numbers of picture cards drawn, separately for each gender? 
Hint: you can look at p. 71 of Getting Started With R for this one, and we'll
encounter it later in the course as well._
\


***
### FINAL TIPS

That's a whistle-stop tour in data tidying. I'd encourage you to also look at 
p.75 of _Getting Started With R_ which shows how this information maps on to
the _base-R_ methods for working with `data.frame`s. Most people will use these, 
and they can sometimes be quicker and easier when you just have something 
very simple to do (this is a general rule with the `tidyverse` packages: 
often if you have something quick to do, then the base-R approach is better). 
Either approach is equally as valid.  
\

Note how I write R code: where there are spaces, what the indentation looks like,
etc. This is code _formatting_ and there's an accepted standard for what it 
should look like. Confusingly, it does matter in some instances where you do or 
do not put a space, but most of the time you can put a space (in fact as many spaces 
as you like), wherever you want. It's not the end of the world if you don't keep 
to the proper standards, but it does make code way easier to read.


-->

$~$

## 5 --- Data Visualisation I
\

Nothing to see here... yet

$~$

## 6 --- Data Visualisation II
\

Nothing to see here... yet
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server-start">
# packages
library(learnr)
library(shiny)
library(shinythemes)
library(shinyjs)
library(DT)
library(readr)
library(dplyr)
library(ggplot2)
library(ggfortify)

# toy data
numbers2 <- seq(2, 20, 2)
characters1 <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
factor1 <- rep(LETTERS[1:5], 2)
factor2 <- rep(LETTERS[1:2], 5)
random <- rnorm(10)
toydata <- data.frame(numbers2, characters1, factor1, factor2, random)
rm(numbers2, characters1, factor1, factor2, random)

# games data
games <- read.csv("data/games_data.csv")

# knitr options
knitr::opts_chunk$set(
  fig.align = 'center'
)

# Tutorial options
tutorial_options(exercise.cap = "", exercise.eval = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::register_http_handlers(session, metadata = NULL)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::clear_exercise_setup_chunks()
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
session$onSessionEnded(function() {
        learnr:::event_trigger(session, "session_stop")
      })
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_setup_chunk("__setup__", c("# packages", "library(learnr)", "library(shiny)", "library(shinythemes)", 
"library(shinyjs)", "library(DT)", "library(readr)", "library(dplyr)", 
"library(ggplot2)", "library(ggfortify)", "", "# toy data", "numbers2 <- seq(2, 20, 2)", 
"characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")", 
"factor1 <- rep(LETTERS[1:5], 2)", "factor2 <- rep(LETTERS[1:2], 5)", 
"random <- rnorm(10)", "toydata <- data.frame(numbers2, characters1, factor1, factor2, random)", 
"rm(numbers2, characters1, factor1, factor2, random)", "", "# games data", 
"games <- read.csv(\"data/games_data.csv\")", "", "# knitr options", 
"knitr::opts_chunk$set(", "  fig.align = 'center'", ")", "", 
"# Tutorial options", "tutorial_options(exercise.cap = \"\", exercise.eval = FALSE)"
), overwrite = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_setup_chunk("__setup__", c("# packages", "library(learnr)", "library(shiny)", "library(shinythemes)", 
"library(shinyjs)", "library(DT)", "library(readr)", "library(dplyr)", 
"library(ggplot2)", "library(ggfortify)", "", "# toy data", "numbers2 <- seq(2, 20, 2)", 
"characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")", 
"factor1 <- rep(LETTERS[1:5], 2)", "factor2 <- rep(LETTERS[1:2], 5)", 
"random <- rnorm(10)", "toydata <- data.frame(numbers2, characters1, factor1, factor2, random)", 
"rm(numbers2, characters1, factor1, factor2, random)", "", "# games data", 
"games <- read.csv(\"data/games_data.csv\")", "", "# knitr options", 
"knitr::opts_chunk$set(", "  fig.align = 'center'", ")", "", 
"# Tutorial options", "tutorial_options(exercise.cap = \"\", exercise.eval = FALSE)"
), overwrite = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_setup_chunk("__setup__", c("# packages", "library(learnr)", "library(shiny)", "library(shinythemes)", 
"library(shinyjs)", "library(DT)", "library(readr)", "library(dplyr)", 
"library(ggplot2)", "library(ggfortify)", "", "# toy data", "numbers2 <- seq(2, 20, 2)", 
"characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")", 
"factor1 <- rep(LETTERS[1:5], 2)", "factor2 <- rep(LETTERS[1:2], 5)", 
"random <- rnorm(10)", "toydata <- data.frame(numbers2, characters1, factor1, factor2, random)", 
"rm(numbers2, characters1, factor1, factor2, random)", "", "# games data", 
"games <- read.csv(\"data/games_data.csv\")", "", "# knitr options", 
"knitr::opts_chunk$set(", "  fig.align = 'center'", ")", "", 
"# Tutorial options", "tutorial_options(exercise.cap = \"\", exercise.eval = FALSE)"
), overwrite = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_setup_chunk("__setup__", c("# packages", "library(learnr)", "library(shiny)", "library(shinythemes)", 
"library(shinyjs)", "library(DT)", "library(readr)", "library(dplyr)", 
"library(ggplot2)", "library(ggfortify)", "", "# toy data", "numbers2 <- seq(2, 20, 2)", 
"characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")", 
"factor1 <- rep(LETTERS[1:5], 2)", "factor2 <- rep(LETTERS[1:2], 5)", 
"random <- rnorm(10)", "toydata <- data.frame(numbers2, characters1, factor1, factor2, random)", 
"rm(numbers2, characters1, factor1, factor2, random)", "", "# games data", 
"games <- read.csv(\"data/games_data.csv\")", "", "# knitr options", 
"knitr::opts_chunk$set(", "  fig.align = 'center'", ")", "", 
"# Tutorial options", "tutorial_options(exercise.cap = \"\", exercise.eval = FALSE)"
), overwrite = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz031-1", question = structure("Here&#39;s a simple multiple choice question: which of these is the best?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_6ef9921", 
    option = "Cake", value = "Cake", label = structure("Cake", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("Incorrect. Biscuits rule all. Try dunking some cake in tea or coffee!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_6707937", option = "Biscuits", 
    value = "Biscuits", label = structure("Biscuits", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("Yes!!! Biscuits rule all!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_f7b2762", option = "Cheesecake", 
    value = "Cheesecake", label = structure("Cheesecake", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("Incorrect. Biscuits rule all. Try dunking some cheesecake in tea or coffee!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz031-1-answer", question = "qz031-1"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a simple multiple choice question: which of these is the best?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 612176397.714933, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz031-2", question = structure("Here&#39;s a multiple choice question with more than one answer: which of these are amazing?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_a82d3dc", 
    option = "Tea", value = "Tea", label = structure("Tea", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("Tea is amazing.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_cf71841", option = "Coffee", 
    value = "Coffee", label = structure("Coffee", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("Coffee is amazing.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_1e407d2", option = "Fruit tea", 
    value = "Fruit tea", label = structure("Fruit tea", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_d743b0a", 
    option = "None of these", value = "None of these", label = structure("None of these", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz031-2-answer", question = "qz031-2"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a multiple choice question with more than one answer: which of these are amazing?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1027735469.52142, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz031-3", question = structure("Here&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_a43ed8a", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("...wow. Harsh. Try again.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_68e39cf", option = "Yes", value = "Yes", 
    label = structure("Yes", html = TRUE, class = c("html", "character"
    )), correct = TRUE, message = structure("Yeah you are!!!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz031-3-answer", question = "qz031-3"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 1565748181.77089, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex113_1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex113_1-code-editor`)), session)
output$`tutorial-exercise-ex113_1-output` <- renderUI({
  `tutorial-exercise-ex113_1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex113_1", list(setup = NULL, chunks = list(list(label = "ex113_1", code = "", 
    opts = list(label = "\"ex113_1\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex113_1", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex113_1, exercise=TRUE, echo=FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex113_2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex113_2-code-editor`)), session)
output$`tutorial-exercise-ex113_2-output` <- renderUI({
  `tutorial-exercise-ex113_2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex113_2", list(setup = NULL, chunks = list(list(label = "ex113_2", code = "# draw random numbers\nrandom <- rnorm(1000, , 12)\n\n# mean\nmean(random)\n\n# standard deviation\nsd()\n", 
    opts = list(label = "\"ex113_2\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("# draw random numbers", "# 42 is the mean and it is the second argument in rnorm().", 
    "random <- rnorm(1000, 42, 12)", "", "# mean", "# the function is mean(), not mean_average().", 
    "mean(random)", "", "# standard deviation", "# add 'random' inside the parentheses.", 
    "sd(random)", ""), chunk_opts = list(label = "ex113_2-solution")), 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex113_2", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("# draw random numbers", 
        "random <- rnorm(1000, , 12)", "", "# mean", "mean(random)", 
        "", "# standard deviation", "sd()", ""), params.src = "ex113_2, exercise=TRUE, echo=FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex24_1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex24_1-code-editor`)), session)
output$`tutorial-exercise-ex24_1-output` <- renderUI({
  `tutorial-exercise-ex24_1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex24_1", list(setup = NULL, chunks = list(list(label = "ex24_1", code = "", 
    opts = list(label = "\"ex24_1\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("# If your number is 42", "((42 + 43 + 9) / 2) - 42", 
    "", "# Whatever number you chose, your answer is 5."), chunk_opts = list(
        label = "ex24_1-solution")), options = list(eval = FALSE, 
        echo = TRUE, results = "markup", tidy = FALSE, tidy.opts = NULL, 
        collapse = FALSE, prompt = FALSE, comment = NA, highlight = FALSE, 
        strip.white = TRUE, size = "normalsize", background = "#F7F7F7", 
        cache = 0, cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex24_1", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex24_1, exercise=TRUE, echo=FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex24_2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex24_2-code-editor`)), session)
output$`tutorial-exercise-ex24_2-output` <- renderUI({
  `tutorial-exercise-ex24_2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex24_2", list(setup = NULL, chunks = list(list(label = "ex24_2", code = "", 
    opts = list(label = "\"ex24_2\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure("seq(3, 21, 2)", chunk_opts = list(label = "ex24_2-solution")), 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex24_2", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex24_2, exercise=TRUE, echo=FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz24_1-1", question = structure("What do the three arguments of the seq() function mean (in order)?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_b7d0de2", 
    option = "start of sequence, length of sequence, sequence increment", 
    value = "start of sequence, length of sequence, sequence increment", 
    label = structure("start of sequence, length of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_7aa8b3c", 
    option = "start of sequence, end of sequence, length of sequence", 
    value = "start of sequence, end of sequence, length of sequence", 
    label = structure("start of sequence, end of sequence, length of sequence", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_70767e3", 
    option = "start of sequence, end of sequence, sequence increment", 
    value = "start of sequence, end of sequence, sequence increment", 
    label = structure("start of sequence, end of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), incorrect = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz24_1-1-answer", question = "qz24_1-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat do the three arguments of the seq() function mean (in order)?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1153420352.9629, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz24_1-2", 
    question = structure("Here&#39;s a multiple choice question with more than one answer: which of these are amazing?", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_93f8e79", 
        option = "Tea", value = "Tea", label = structure("Tea", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Tea is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_a913f69", 
        option = "Coffee", value = "Coffee", label = structure("Coffee", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Coffee is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_63ba345", 
        option = "Fruit tea", value = "Fruit tea", label = structure("Fruit tea", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_e54bf3f", 
        option = "None of these", value = "None of these", label = structure("None of these", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz24_1-2-answer", question = "qz24_1-2"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a multiple choice question with more than one answer: which of these are amazing?\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1444111973.82753, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz24_1-3", question = structure("Here&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_ca4f6b2", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("...wow. Harsh. Try again.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_bc3e2ac", option = "Yes", value = "Yes", 
    label = structure("Yes", html = TRUE, class = c("html", "character"
    )), correct = TRUE, message = structure("Yeah you are!!!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz24_1-3-answer", question = "qz24_1-3"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 1111481066.98243, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex252_3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex252_3-code-editor`)), session)
output$`tutorial-exercise-ex252_3-output` <- renderUI({
  `tutorial-exercise-ex252_3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex252_3", list(setup = NULL, chunks = list(list(label = "ex252_3", code = "characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")\n", 
    opts = list(label = "\"ex252_3\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("# the answer is 'character'.", "class(characters1)"
    ), chunk_opts = list(label = "ex252_3-solution")), options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, strip.white = TRUE, size = "normalsize", 
        background = "#F7F7F7", cache = 0, cache.path = "DataSkills_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex252_3", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("characters1 <- c(\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\")", 
        ""), params.src = "ex252_3, exercise=TRUE, echo=FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz252_2-1", question = structure("What do the three arguments of the seq() function mean (in order)?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_4fbbb65", 
    option = "start of sequence, length of sequence, sequence increment", 
    value = "start of sequence, length of sequence, sequence increment", 
    label = structure("start of sequence, length of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_bd9ff0f", 
    option = "start of sequence, end of sequence, length of sequence", 
    value = "start of sequence, end of sequence, length of sequence", 
    label = structure("start of sequence, end of sequence, length of sequence", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_dc50236", 
    option = "start of sequence, end of sequence, sequence increment", 
    value = "start of sequence, end of sequence, sequence increment", 
    label = structure("start of sequence, end of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), incorrect = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz252_2-1-answer", question = "qz252_2-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat do the three arguments of the seq() function mean (in order)?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1369876654.3621, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz252_2-2", 
    question = structure("Here&#39;s a multiple choice question with more than one answer: which of these are amazing?", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_43568d4", 
        option = "Tea", value = "Tea", label = structure("Tea", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Tea is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5ac255", 
        option = "Coffee", value = "Coffee", label = structure("Coffee", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Coffee is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_20b36af", 
        option = "Fruit tea", value = "Fruit tea", label = structure("Fruit tea", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_420a24e", 
        option = "None of these", value = "None of these", label = structure("None of these", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz252_2-2-answer", question = "qz252_2-2"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a multiple choice question with more than one answer: which of these are amazing?\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1524263070.79021, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz252_2-3", question = structure("Here&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_bcef179", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("...wow. Harsh. Try again.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_73cb194", option = "Yes", value = "Yes", 
    label = structure("Yes", html = TRUE, class = c("html", "character"
    )), correct = TRUE, message = structure("Yeah you are!!!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz252_2-3-answer", question = "qz252_2-3"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 967455281.049494, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz253_3-1", question = structure("What do the three arguments of the seq() function mean (in order)?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_af7a5e1", 
    option = "start of sequence, length of sequence, sequence increment", 
    value = "start of sequence, length of sequence, sequence increment", 
    label = structure("start of sequence, length of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_95105d5", 
    option = "start of sequence, end of sequence, length of sequence", 
    value = "start of sequence, end of sequence, length of sequence", 
    label = structure("start of sequence, end of sequence, length of sequence", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_6fb072f", 
    option = "start of sequence, end of sequence, sequence increment", 
    value = "start of sequence, end of sequence, sequence increment", 
    label = structure("start of sequence, end of sequence, sequence increment", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), incorrect = structure("start, end, increment.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz253_3-1-answer", question = "qz253_3-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat do the three arguments of the seq() function mean (in order)?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 672178585.186992, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz253_3-2", 
    question = structure("Here&#39;s a multiple choice question with more than one answer: which of these are amazing?", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_67e5eb6", 
        option = "Tea", value = "Tea", label = structure("Tea", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Tea is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_dc532a6", 
        option = "Coffee", value = "Coffee", label = structure("Coffee", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Coffee is amazing.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6ac5045", 
        option = "Fruit tea", value = "Fruit tea", label = structure("Fruit tea", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_30b18c5", 
        option = "None of these", value = "None of these", label = structure("None of these", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Tea is amazing. Coffee is amazing. Fruit tea is cancelled.", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz253_3-2-answer", question = "qz253_3-2"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a multiple choice question with more than one answer: which of these are amazing?\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1337448617.3772, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz253_3-3", question = structure("Here&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_b961f63", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("...wow. Harsh. Try again.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_6f2fb63", option = "Yes", value = "Yes", 
    label = structure("Yes", html = TRUE, class = c("html", "character"
    )), correct = TRUE, message = structure("Yeah you are!!!", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz253_3-3-answer", question = "qz253_3-3"), loading = structure("<strong>Loading:<\u002fstrong> \nHere&#39;s a question which you can retry if you get the answer wrong. Are you excited to learn some R coding???\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 1565319400.27109, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz254_4-1", question = structure("If you ran the above code multiple times, would you get the same result each time?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_1f38eae", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_453c709", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz254_4-1-answer", question = "qz254_4-1"), loading = structure("<strong>Loading:<\u002fstrong> \nIf you ran the above code multiple times, would you get the same result each time?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1015066011.02732, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz254_4-2", question = structure("You won&#39;t get the same result each time. Which part of the code causes that to happen?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_a2687cd", 
    option = "the function rnorm()", value = "the function rnorm()", 
    label = structure("the function rnorm()", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("The function rnorm() creates random numbers.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_d88b4bc", option = "The arguments 50, 0, 1", 
    value = "The arguments 50, 0, 1", label = structure("The arguments 50, 0, 1", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("The function rnorm() creates random numbers.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_8974800", option = "The logical operator >", 
    value = "The logical operator >", label = structure("The logical operator &gt;", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("The function rnorm() creates random numbers.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz254_4-2-answer", question = "qz254_4-2"), loading = structure("<strong>Loading:<\u002fstrong> \nYou won&#39;t get the same result each time. Which part of the code causes that to happen?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1803714271.66008, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex254_4-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex254_4-code-editor`)), session)
output$`tutorial-exercise-ex254_4-output` <- renderUI({
  `tutorial-exercise-ex254_4-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex254_4", list(setup = NULL, chunks = list(list(label = "ex254_4", code = "# 1. ((42 + 43 + 9) / 2) - 42 is the same as ((31 + 32 + 9) / 2) - 31\n((42 + 43 + 9) / 2) - 42     ((31 + 32 + 9) / 2) - 31\n\n# the mean of one set of random numbers is NOT the same as the mean of another\nmean(runif(100))     mean(runif(100))\n\n# cake is greater than biscuits\n\"cake\"     \"biscuits\"\n\n# c(\"A\", \"B\", \"Z\") are found in the last 10 letters of the alphabet\nc(\"A\", \"B\", \"Z\")     LETTERS[16:26]\n", 
    opts = list(label = "\"ex254_4\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("1. TRUE, using ==", "2. TRUE, using !=", 
    "3. FALSE, using >", "This is another strange behaviour of R that I don't understand. I ", 
    "don't understand how or why one character object \"cake\" can be numerically greater than another", 
    "\"biscuits\", but R has some way of deciding. It works with any character object.", 
    "4. FALSE FALSE TRUE, using %in%"), chunk_opts = list(label = "ex254_4-solution")), 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex254_4", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("# 1. ((42 + 43 + 9) / 2) - 42 is the same as ((31 + 32 + 9) / 2) - 31", 
        "((42 + 43 + 9) / 2) - 42     ((31 + 32 + 9) / 2) - 31", 
        "", "# the mean of one set of random numbers is NOT the same as the mean of another", 
        "mean(runif(100))     mean(runif(100))", "", "# cake is greater than biscuits", 
        "\"cake\"     \"biscuits\"", "", "# c(\"A\", \"B\", \"Z\") are found in the last 10 letters of the alphabet", 
        "c(\"A\", \"B\", \"Z\")     LETTERS[16:26]", ""), params.src = "ex254_4, exercise=TRUE, echo=FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex26_5-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex26_5-code-editor`)), session)
output$`tutorial-exercise-ex26_5-output` <- renderUI({
  `tutorial-exercise-ex26_5-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex26_5", list(setup = NULL, chunks = list(list(label = "ex26_5", code = "", 
    opts = list(label = "\"ex26_5\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex26_5", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex26_5, exercise = TRUE, echo = FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex29_6-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex29_6-code-editor`)), session)
output$`tutorial-exercise-ex29_6-output` <- renderUI({
  `tutorial-exercise-ex29_6-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex29_6", list(setup = NULL, chunks = list(list(label = "ex29_6", code = "# a sequence from 4 to 40 in steps of 4\nmynums <- seq(4, 40, 4,)\nmynums\n\n# the first 5 and last 5 letters of the alphabet\nmychars <- LETTERS[c(1:5, 21:26)]\n# length of mychars\nlength(Mychars)\n\n# turn mychars into a factor\nmyfacs <- asfactor(mychars)\n\n# create data frame\nmydata <- data.frame(mynums, mychars, myfacs)\n# see numbers\nmydata$mynum\n# first 5 rows of data frame\nmydata[1:5]\n# first 2 columns of data frame\nmydata[1:2, ]\n", 
    opts = list(label = "\"ex29_6\"", exercise = "TRUE", eval = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex29_6", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("# a sequence from 4 to 40 in steps of 4", 
        "mynums <- seq(4, 40, 4,)", "mynums", "", "# the first 5 and last 5 letters of the alphabet", 
        "mychars <- LETTERS[c(1:5, 21:26)]", "# length of mychars", 
        "length(Mychars)", "", "# turn mychars into a factor", 
        "myfacs <- asfactor(mychars)", "", "# create data frame", 
        "mydata <- data.frame(mynums, mychars, myfacs)", "# see numbers", 
        "mydata$mynum", "# first 5 rows of data frame", "mydata[1:5]", 
        "# first 2 columns of data frame", "mydata[1:2, ]", ""
        ), params.src = "ex29_6, exercise = TRUE, eval = FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz32_1-1", question = structure("In the line of code above, what is <code>library()<\u002fcode>?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_1166068", 
    option = "A function", value = "A function", label = structure("A function", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_97f537", 
    option = "An object", value = "An object", label = structure("An object", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_626a389", 
    option = "An argument", value = "An argument", label = structure("An argument", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_278d9bc", 
    option = "A-nnoying", value = "A-nnoying", label = structure("A-nnoying", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Remember almost anything with parentheses <code>()<\u002fcode> following it is a function.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Remember almost anything with parentheses <code>()<\u002fcode> following it is a function.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz32_1-1-answer", question = "qz32_1-1"), loading = structure("<strong>Loading:<\u002fstrong> \nIn the line of code above, what is <code>library()<\u002fcode>?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 585223660.227484, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz32_1-2", question = structure("What is <code>ggplot2<\u002fcode>?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_44309ba", 
    option = "None of these", value = "None of these", label = structure("None of these", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("Correct. In fact, loading packages means loading functions, objects and more into the R session.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_5c85077", option = "A character object", 
    value = "A character object", label = structure("A character object", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_40597b1", 
    option = "A logical object", value = "A logical object", 
    label = structure("A logical object", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_a47194c", 
    option = "An object", value = "An object", label = structure("An object", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_7a173ee", 
    option = "A function", value = "A function", label = structure("A function", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("They are none of these. ggplot2 is a package, and loading packages means loading functions, objects and more into the R session.", html = TRUE, class = c("html", 
"character")), incorrect = structure("They are none of these. ggplot2 is a package, and loading packages means loading functions, objects and more into the R session.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz32_1-2-answer", question = "qz32_1-2"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat is <code>ggplot2<\u002fcode>?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 2040663212.04974, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz33_2-1", question = structure("What distribution does the paper balls variable follow?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_3bc10e8", 
    option = "poisson", value = "poisson", label = structure("poisson", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_aa676ab", 
    option = "Gaussian", value = "Gaussian", label = structure("Gaussian", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_9894997", 
    option = "binomial", value = "binomial", label = structure("binomial", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_acde266", 
    option = "categorical", value = "categorical", label = structure("categorical", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("It&#39;s a poisson variable, as it&#39;s a count.", html = TRUE, class = c("html", 
"character")), incorrect = structure("It&#39;s a poisson variable, as it&#39;s a count.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz33_2-1-answer", question = "qz33_2-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat distribution does the paper balls variable follow?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1527185819.28885, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz33_2-2", question = structure("Is the paper balls variable continuous or discrete?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_c533a51", 
    option = "discrete", value = "discrete", label = structure("discrete", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("It&#39;s numeric data, but it&#39;s discrete as it can only take specific values: 1, 2, 3,...", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_98191d", option = "continuous", 
    value = "continuous", label = structure("continuous", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("It&#39;s numeric data, but it&#39;s discrete as it can only take specific values: 1, 2, 3,...", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz33_2-2-answer", question = "qz33_2-2"), loading = structure("<strong>Loading:<\u002fstrong> \nIs the paper balls variable continuous or discrete?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 162172950.924482, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz33_2-3", question = structure("What distribution does the reaction time follow?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_b65192c", 
    option = "beta", value = "beta", label = structure("beta", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_d4a62cd", 
    option = "ordinal", value = "ordinal", label = structure("ordinal", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_981902d", 
    option = "poisson", value = "poisson", label = structure("poisson", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_de429c2", 
    option = "categorical", value = "categorical", label = structure("categorical", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("It&#39;s beta, which is the distribution that describes proportions.", html = TRUE, class = c("html", 
"character")), incorrect = structure("It&#39;s beta, which is the distribution that describes proportions.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz33_2-3-answer", question = "qz33_2-3"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat distribution does the reaction time follow?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1656257735.72874, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz33_2-4", question = structure("Is Tutor Group categorical or ordinal?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_6f76cbc", 
    option = "categorical", value = "categorical", label = structure("categorical", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_9010fbe", 
    option = "ordinal", value = "ordinal", label = structure("ordinal", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("It&#39;s categorical, as it has no natural hierarchy (even if you do think \n        your tutor group is the best in the year group...).", html = TRUE, class = c("html", 
"character")), incorrect = structure("It&#39;s categorical, as it has no natural hierarchy (even if you do think \n        your tutor group is the best in the year group...).", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz33_2-4-answer", question = "qz33_2-4"), loading = structure("<strong>Loading:<\u002fstrong> \nIs Tutor Group categorical or ordinal?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 818870601.118684, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz33_2-5", question = structure("What distribution does the glasses prescription follow?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_556df35", 
    option = "Gaussian", value = "Gaussian", label = structure("Gaussian", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_8b94971", 
    option = "poisson", value = "poisson", label = structure("poisson", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_f57bbb7", 
    option = "beta", value = "beta", label = structure("beta", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_7f28151", 
    option = "ordinal", value = "ordinal", label = structure("ordinal", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("It&#39;s Gaussian, as it can in theory take any continuous value.", html = TRUE, class = c("html", 
"character")), incorrect = structure("It&#39;s Gaussian, as it can in theory take any continuous value.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz33_2-5-answer", question = "qz33_2-5"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat distribution does the glasses prescription follow?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 693024966.177285, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_3-1", question = structure("Does the eyesight variable have any bounds?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_9e220c0", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_a1445c0", 
    option = "Yes: -7 and 14", value = "Yes: -7 and 14", label = structure("Yes: -7 and 14", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_1e9183c", 
    option = "Yes: the maximum short- and long-sighted prescriptions ever given", 
    value = "Yes: the maximum short- and long-sighted prescriptions ever given", 
    label = structure("Yes: the maximum short- and long-sighted prescriptions ever given", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("There are no strict bounds on the data, even if values are very unlikely to go beyond a certain maximum or minimum", html = TRUE, class = c("html", 
"character")), incorrect = structure("There are no strict bounds on the data, even if values are very unlikely to go beyond a certain maximum or minimum", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_3-1-answer", question = "qz341_3-1"), loading = structure("<strong>Loading:<\u002fstrong> \nDoes the eyesight variable have any bounds?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1030781583.52, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_3-2", question = structure("Is the eyesight variable continuous or discrete?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_7293b6e", 
    option = "continuous", value = "continuous", label = structure("continuous", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_3563a00", 
    option = "discrete", value = "discrete", label = structure("discrete", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Continuous: the numbers are often rounded to the nearest 0.25, but they theoretically could take any real number.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Continuous: the numbers are often rounded to the nearest 0.25, but they theoretically could take any real number.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_3-2-answer", question = "qz341_3-2"), loading = structure("<strong>Loading:<\u002fstrong> \nIs the eyesight variable continuous or discrete?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 267742422.375323, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_3-3", question = structure("Is the data skewed?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_284eae", 
    option = "Yes: a positive skew", value = "Yes: a positive skew", 
    label = structure("Yes: a positive skew", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_15f78ee", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_f6683e4", 
    option = "Yes: a negative skew", value = "Yes: a negative skew", 
    label = structure("Yes: a negative skew", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("There is a positive skew in the data, with a tail to the right.", html = TRUE, class = c("html", 
"character")), incorrect = structure("There is a positive skew in the data, with a tail to the right.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_3-3-answer", question = "qz341_3-3"), loading = structure("<strong>Loading:<\u002fstrong> \nIs the data skewed?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 237790540.88927, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_3-4", question = structure("Are there any potential outliers?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_7583e70", 
    option = "Yes: at the upper end of the distribution", value = "Yes: at the upper end of the distribution", 
    label = structure("Yes: at the upper end of the distribution", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_45accb3", 
    option = "Yes: at the lower end of the distribution", value = "Yes: at the lower end of the distribution", 
    label = structure("Yes: at the lower end of the distribution", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_ea18869", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("There is a potential outlier at the upper end of the distribution, as evidenced by a single bar which is apart from the others.", html = TRUE, class = c("html", 
"character")), incorrect = structure("There is a potential outlier at the upper end of the distribution, as evidenced by a single bar which is apart from the others.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_3-4-answer", question = "qz341_3-4"), loading = structure("<strong>Loading:<\u002fstrong> \nAre there any potential outliers?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1373788047.36028, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_4-1", question = structure("What makes for better visualisation of the data distribution?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_c40980", 
    option = "Neither more bins nor fewer bins", value = "Neither more bins nor fewer bins", 
    label = structure("Neither more bins nor fewer bins", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = structure("It&#39;s important to view the data using a variety of bin numbers, to get a good overview of the whole distribution.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_7739ea3", option = "More bins", 
    value = "More bins", label = structure("More bins", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("It&#39;s important to view the data using a variety of bin numbers, to get a good overview of the whole distribution.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
)), structure(list(id = "lnr_ans_5cfb85d", option = "Fewer bins", 
    value = "Fewer bins", label = structure("Fewer bins", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("It&#39;s important to view the data using a variety of bin numbers, to get a good overview of the whole distribution.", html = TRUE, class = c("html", 
    "character"))), class = c("tutorial_question_answer", "tutorial_quiz_answer"
))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_4-1-answer", question = "qz341_4-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat makes for better visualisation of the data distribution?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 988702601.039599, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_4-2", question = structure("What is the perfect number of bins to use?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_deb0ad", 
    option = "There isn't one", value = "There isn't one", label = structure("There isn&#39;t one", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_ee05ba8", 
    option = "10", value = "10", label = structure("10", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_d7146d2", 
    option = "14", value = "14", label = structure("14", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_ca9ff9", 
    option = "20", value = "20", label = structure("20", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_ac3c620", 
    option = "7", value = "7", label = structure("7", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_455fd6b", 
    option = "However many bins show one bar per data point", 
    value = "However many bins show one bar per data point", 
    label = structure("However many bins show one bar per data point", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_938ea63", 
    option = "However many bins show ten bars", value = "However many bins show ten bars", 
    label = structure("However many bins show ten bars", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("check the answer to the question before this one!", html = TRUE, class = c("html", 
"character")), incorrect = structure("check the answer to the question before this one!", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_4-2-answer", question = "qz341_4-2"), loading = structure("<strong>Loading:<\u002fstrong> \nWhat is the perfect number of bins to use?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 1993747333.07159, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz341_4-3", question = structure("When the number of bins is changed, what changes in the code?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_a2369d2", 
    option = "the argument 'bins' in the function geom_histogram", 
    value = "the argument 'bins' in the function geom_histogram", 
    label = structure("the argument &#39;bins&#39; in the function geom_histogram", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_c482b40", 
    option = "the function 'bins' in the argument geom_histogram", 
    value = "the function 'bins' in the argument geom_histogram", 
    label = structure("the function &#39;bins&#39; in the argument geom_histogram", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_900b494", 
    option = "the data in 'ggplot'", value = "the data in 'ggplot'", 
    label = structure("the data in &#39;ggplot&#39;", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_840babb", 
    option = "the y value", value = "the y value", label = structure("the y value", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_8d025ea", 
    option = "the option 'bins'", value = "the option 'bins'", 
    label = structure("the option &#39;bins&#39;", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Remember the grammar of R code... what goes before curved parentheses?", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz341_4-3-answer", question = "qz341_4-3"), loading = structure("<strong>Loading:<\u002fstrong> \nWhen the number of bins is changed, what changes in the code?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = TRUE, 
    seed = 1535817626.28483, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex341_1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex341_1-code-editor`)), session)
output$`tutorial-exercise-ex341_1-output` <- renderUI({
  `tutorial-exercise-ex341_1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex341_1", list(setup = NULL, chunks = list(list(label = "ex341_1", code = "hist <- ggplot(games aes(x = Eyesight)) +\n    geom_histogram(aes(y = ..density..), bin = 12, color = 'black') +\n    xlim(c(-10, 15)) \n    theme('classic')\n\nhist\n", 
    opts = list(label = "\"ex341_1\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("hist <- ggplot(games, aes(x = eyesight)) +", 
    "    geom_histogram(aes(y = ..density..), bins = 12, fill = 'black') +", 
    "    xlim(-10, 15) ", "    theme_classic()", "", "hist", 
    ""), chunk_opts = list(label = "ex341_1-solution")), options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, strip.white = TRUE, size = "normalsize", 
        background = "#F7F7F7", cache = 0, cache.path = "DataSkills_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex341_1", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("hist <- ggplot(games aes(x = Eyesight)) +", 
        "    geom_histogram(aes(y = ..density..), bin = 12, color = 'black') +", 
        "    xlim(c(-10, 15)) ", "    theme('classic')", "", 
        "hist", ""), params.src = "ex341_1, exercise=TRUE, echo=FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex342_2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex342_2-code-editor`)), session)
output$`tutorial-exercise-ex342_2-output` <- renderUI({
  `tutorial-exercise-ex342_2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex342_2", list(setup = NULL, chunks = list(list(label = "ex342_2", code = "", 
    opts = list(label = "\"ex342_2\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex342_2", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex342_2, exercise=TRUE, echo=FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz342_5-1", question = structure("Why does it make sense to choose 0 and 1 for the x axis limits of this plot?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_ab7f216", 
    option = "Zero and one are the outer bounds of the data", 
    value = "Zero and one are the outer bounds of the data", 
    label = structure("Zero and one are the outer bounds of the data", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_aaf3f3e", 
    option = "Zero and 1 are the right distances outside the range to be able to view all the data", 
    value = "Zero and 1 are the right distances outside the range to be able to view all the data", 
    label = structure("Zero and 1 are the right distances outside the range to be able to view all the data", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_5b1c65c", 
    option = "Zero and one are aesthetically pleasing choices", 
    value = "Zero and one are aesthetically pleasing choices", 
    label = structure("Zero and one are aesthetically pleasing choices", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_51058a0", 
    option = "Zero and one are a clear unit integer width", value = "Zero and one are a clear unit integer width", 
    label = structure("Zero and one are a clear unit integer width", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("By making the axis limits equal to the outer bounds of the data, it&#39;s clear how the data are distributed relative to the whole of the possible range.", html = TRUE, class = c("html", 
"character")), try_again = structure("Zero and one are the outer bounds of the data. By making these the axis limits, it&#39;s clear how the data are distributed relative to the whole of the possible range.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Zero and one are the outer bounds of the data. By making these the axis limits, it&#39;s clear how the data are distributed relative to the whole of the possible range.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz342_5-1-answer", question = "qz342_5-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhy does it make sense to choose 0 and 1 for the x axis limits of this plot?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1463555569.81848, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex343_3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex343_3-code-editor`)), session)
output$`tutorial-exercise-ex343_3-output` <- renderUI({
  `tutorial-exercise-ex343_3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex343_3", list(setup = NULL, chunks = list(list(label = "ex343_3", code = "hist <- ggplot(games, aes(x = countries)) +\n    geom_histogram(aes(y = ..density..), bins = 12, color = 'green4') +\n    xlim(0.5, 30.5) +\n    theme_minimal()\n\nhist\n", 
    opts = list(label = "\"ex343_3\"", exercise = "TRUE", echo = "FALSE", 
        exercise.cap = "\"2.3 Data Distributions: Exercise 3\""), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("hist <- ggplot(games, aes(x = countries)) +", 
    "    geom_histogram(aes(y = ..count..), binwidth = 1, color = 'green4') +", 
    "    xlim(0.5, 30.5) +", "    theme_minimal()", "", "hist", 
    ""), chunk_opts = list(label = "ex343_3-solution")), options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, strip.white = TRUE, size = "normalsize", 
        background = "#F7F7F7", cache = 0, cache.path = "DataSkills_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "2.3 Data Distributions: Exercise 3", 
        exercise.eval = FALSE, label = "ex343_3", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("hist <- ggplot(games, aes(x = countries)) +", 
        "    geom_histogram(aes(y = ..density..), bins = 12, color = 'green4') +", 
        "    xlim(0.5, 30.5) +", "    theme_minimal()", "", "hist", 
        ""), params.src = "ex343_3, exercise=TRUE, echo=FALSE, exercise.cap=\"2.3 Data Distributions: Exercise 3\"", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz344_6-1", 
    question = structure("Which of the chunks has a mistake in the <em>data<\u002fem>? Choose one or more answers.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_b3a593e", 
        option = "Chunk 1", value = "Chunk 1", label = structure("Chunk 1", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_8dbd99e", 
        option = "Chunk 2", value = "Chunk 2", label = structure("Chunk 2", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_ab8ca4e", 
        option = "Chunk 3", value = "Chunk 3", label = structure("Chunk 3", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>games_data<\u002fcode> should be <code>games<\u002fcode>.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5026cd8", 
        option = "Chunk 4", value = "Chunk 4", label = structure("Chunk 4", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("The data is always the first argument of the <code>games()<\u002fcode> function.", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz344_6-1-answer", 
        question = "qz344_6-1"), loading = structure("<strong>Loading:<\u002fstrong> \nWhich of the chunks has a mistake in the <em>data<\u002fem>? Choose one or more answers.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = FALSE, allow_retry = TRUE, 
    seed = 55491827.9741596, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz344_6-2", 
    question = structure("Which of the chunks has a mistake in the <em>aesthetics<\u002fem>? Choose one or more answers.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_a8fdb3", 
        option = "Chunk 1", value = "Chunk 1", label = structure("Chunk 1", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_c7ede2e", 
        option = "Chunk 2", value = "Chunk 2", label = structure("Chunk 2", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>aes(x = Continents)<\u002fcode> should be <code>aes(x = continents)<\u002fcode>... the uppercase C should be lowercase.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_a629d7d", 
        option = "Chunk 3", value = "Chunk 3", label = structure("Chunk 3", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_953cfd3", 
        option = "Chunk 4", value = "Chunk 4", label = structure("Chunk 4", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>aes(y = &#39;count&#39;)<\u002fcode> should be <code>aes(y = ..count..)<\u002fcode>", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("aesthetics are most often associated with specifying the axes and are specified using the aes() function.", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz344_6-2-answer", 
        question = "qz344_6-2"), loading = structure("<strong>Loading:<\u002fstrong> \nWhich of the chunks has a mistake in the <em>aesthetics<\u002fem>? Choose one or more answers.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = FALSE, allow_retry = TRUE, 
    seed = 1324751398.88311, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz344_6-3", 
    question = structure("Which of the chunks has a mistake in the <em>geometries<\u002fem>? Choose one or more answers.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_85460c7", 
        option = "Chunk 1", value = "Chunk 1", label = structure("Chunk 1", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_c3ed59c", 
        option = "Chunk 2", value = "Chunk 2", label = structure("Chunk 2", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>geom_hist<\u002fcode> should be <code>geom_histogram<\u002fcode>.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6717a6", 
        option = "Chunk 3", value = "Chunk 3", label = structure("Chunk 3", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_b22d598", 
        option = "Chunk 4", value = "Chunk 4", label = structure("Chunk 4", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>bins = 1<\u002fcode> should be <code>binwidth = 1<\u002fcode>, and are a part of specifying the histogram using the <code>geom_histogram()<\u002fcode> function.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("geometries are simply the type of plot: in this case the histogram.", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz344_6-3-answer", 
        question = "qz344_6-3"), loading = structure("<strong>Loading:<\u002fstrong> \nWhich of the chunks has a mistake in the <em>geometries<\u002fem>? Choose one or more answers.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = FALSE, allow_retry = TRUE, 
    seed = 756163637.647884, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz344_6-4", 
    question = structure("Which of the chunks has a mistake in the <em>theme<\u002fem>? Choose one or more answers.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_a60be2f", 
        option = "Chunk 1", value = "Chunk 1", label = structure("Chunk 1", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_7b40eee", 
        option = "Chunk 2", value = "Chunk 2", label = structure("Chunk 2", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6cfe217", 
        option = "Chunk 3", value = "Chunk 3", label = structure("Chunk 3", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = structure("Correct: <code>minimal_theme<\u002fcode> should be <code>theme_minimal<\u002fcode>.", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5fe66d0", 
        option = "Chunk 4", value = "Chunk 4", label = structure("Chunk 4", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz344_6-4-answer", question = "qz344_6-4"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nWhich of the chunks has a mistake in the <em>theme<\u002fem>? Choose one or more answers.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = FALSE, allow_retry = TRUE, 
    seed = 1250573799.41766, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz344_6-5", 
    question = structure("Which of the chunks has no mistakes?", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_24cd453", 
        option = "Chunk 1", value = "Chunk 1", label = structure("Chunk 1", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_4753cf9", 
        option = "Chunk 2", value = "Chunk 2", label = structure("Chunk 2", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6662b7", 
        option = "Chunk 3", value = "Chunk 3", label = structure("Chunk 3", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5c4e391", 
        option = "Chunk 4", value = "Chunk 4", label = structure("Chunk 4", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_4a3cbb", 
        option = "None of the chunks", value = "None of the chunks", 
        label = structure("None of the chunks", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Well done!", html = TRUE, class = c("html", 
    "character")), try_again = structure("It could only have been chunk 1 or none of them... better luck next time.", html = TRUE, class = c("html", 
    "character")), incorrect = structure("It could only have been chunk 1 or none of them... better luck next time.", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz344_6-5-answer", question = "qz344_6-5"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nWhich of the chunks has no mistakes?\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = FALSE, allow_retry = TRUE, 
    seed = 736920339.656845, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz431_3-1", question = structure("How many objects are assigned in this code?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_776e59b", 
    option = "1", value = "1", label = structure("1", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_b935fa", 
    option = "2", value = "2", label = structure("2", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_dc48118", 
    option = "3", value = "3", label = structure("3", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_359fcbc", 
    option = "4", value = "4", label = structure("4", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("There are 3 objects: <code>data<\u002fcode>, <code>rows<\u002fcode> and <code>dataSubset<\u002fcode>. Objects are assigned using the backwards arrow <code>&lt;-<\u002fcode>", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz431_3-1-answer", 
    question = "qz431_3-1"), loading = structure("<strong>Loading:<\u002fstrong> \nHow many objects are assigned in this code?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = FALSE, allow_retry = FALSE, 
    seed = 1486762212.80767, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz431_3-2", 
    question = structure("How could you specify the rows to subset without assigning the desired range to the object <code>rows<\u002fcode>? Select one or more options.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_c4d7234", 
        option = "using `slice(seq(7, 10, 1))`", value = "using `slice(seq(7, 10, 1))`", 
        label = structure("using <code>slice(seq(7, 10, 1))<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_eee7a13", 
        option = "using `slice(7:10)`", value = "using `slice(7:10)`", 
        label = structure("using <code>slice(7:10)<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6a801ed", 
        option = "using `slice(c(7, 8, 9, 10))`", value = "using `slice(c(7, 8, 9, 10))`", 
        label = structure("using <code>slice(c(7, 8, 9, 10))<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("There&#39;s always more than one way of doing things in <code>R<\u002fcode>. We&#39;ve learned about all of these methods in previous chapters.", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz431_3-2-answer", 
        question = "qz431_3-2"), loading = structure("<strong>Loading:<\u002fstrong> \nHow could you specify the rows to subset without assigning the desired range to the object <code>rows<\u002fcode>? Select one or more options.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 783917196.13496, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz431_3-3", 
    question = structure("Even though the above options require fewer lines of code, why might we want to use the <code>rows<\u002fcode> object anyway?`", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_df337e7", 
        option = "`rows` can be re-used in later code", value = "`rows` can be re-used in later code", 
        label = structure("<code>rows<\u002fcode> can be re-used in later code", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6ee0228", 
        option = "We can change `rows` once, and the row values will change every time it's used in the code", 
        value = "We can change `rows` once, and the row values will change every time it's used in the code", 
        label = structure("We can change <code>rows<\u002fcode> once, and the row values will change every time it&#39;s used in the code", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_862cb02", 
        option = "Using the `rows` object requires less computer RAM", 
        value = "Using the `rows` object requires less computer RAM", 
        label = structure("Using the <code>rows<\u002fcode> object requires less computer RAM", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_2083d9b", 
        option = "Using the `rows` object makes you look cooler and better at coding", 
        value = "Using the `rows` object makes you look cooler and better at coding", 
        label = structure("Using the <code>rows<\u002fcode> object makes you look cooler and better at coding", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz431_3-3-answer", question = "qz431_3-3"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nEven though the above options require fewer lines of code, why might we want to use the <code>rows<\u002fcode> object anyway?`\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 706604043.670962, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex432_1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex432_1-code-editor`)), session)
output$`tutorial-exercise-ex432_1-output` <- renderUI({
  `tutorial-exercise-ex432_1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex432_1", list(setup = NULL, chunks = list(list(label = "ex432_1", code = "rows <- c(7, 10)\ndataSubset <- games %>%\n    slice( seq(rows[1], rows[2], 1) )\ndataSubset", 
    opts = list(label = "\"ex432_1\"", exercise = "TRUE", exercise.eval = "TRUE", 
        echo = "FALSE"), engine = "r")), code_check = NULL, error_check = NULL, 
    check = NULL, solution = structure(c("dataSubset <- slice(games, seq(7, 10, 1))", 
    "OR", "dataSubset <- slice(games, 7:10)", "", "Step 1: use slice(games, ...) instead of the pipe", 
    "Step 2: use seq(7, 10, 1) or 7:10 instead of rows object", 
    "Step 3: combine!"), chunk_opts = list(label = "ex432_1-solution")), 
    options = list(eval = TRUE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = TRUE, label = "ex432_1", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("rows <- c(7, 10)", 
        "dataSubset <- games %>%", "    slice( seq(rows[1], rows[2], 1) )", 
        "dataSubset"), params.src = "ex432_1, exercise=TRUE, exercise.eval= TRUE, echo=FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex433_2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex433_2-code-editor`)), session)
output$`tutorial-exercise-ex433_2-output` <- renderUI({
  `tutorial-exercise-ex433_2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex433_2", list(setup = NULL, chunks = list(list(label = "ex433_2", code = "", 
    opts = list(label = "\"ex433_2\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex433_2", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex433_2, exercise=TRUE, echo= FALSE", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz433_1-1", question = structure("In this case, does it make a difference to the result whether the subsetting functions <code>slice()<\u002fcode> or <code>select()<\u002fcode> functions come first?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_2962f4b", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_f2abda9", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("In this case, it doesn&#39;t make a difference whether rows or columns are selected first.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz433_1-1-answer", 
    question = "qz433_1-1"), loading = structure("<strong>Loading:<\u002fstrong> \nIn this case, does it make a difference to the result whether the subsetting functions <code>slice()<\u002fcode> or <code>select()<\u002fcode> functions come first?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = FALSE, allow_retry = FALSE, 
    seed = 492070328.770862, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz433_1-2", question = structure("Will it ever make a difference to the result which order subsetting functions are put?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_1dd1844", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_843bd02", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("If for some reason you use <code>slice()<\u002fcode> or <code>select()<\u002fcode> twice when subsetting your data, then the order those commands happen matters. If you only use <code>slice()<\u002fcode> and <code>select()<\u002fcode> once each, then the order of the subsetting commands don&#39;t matter.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz433_1-2-answer", 
    question = "qz433_1-2"), loading = structure("<strong>Loading:<\u002fstrong> \nWill it ever make a difference to the result which order subsetting functions are put?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 547280841.245152, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz433_1-3", question = structure("Does it matter whether you delete the white space at the start of the rows?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_d78328b", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_dc09885", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("It takes some practice to know what parts of the code are essential and what parts are stylistic. In this case the white space helps draw quick attention to the fact that each line is &#39;passed&#39; to the next one using the pipe... sort of like a series of steps. It&#39;s good practise in <code>R<\u002fcode> coding.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz433_1-3-answer", 
    question = "qz433_1-3"), loading = structure("<strong>Loading:<\u002fstrong> \nDoes it matter whether you delete the white space at the start of the rows?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1818177440.65335, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz433_1-4", question = structure("Does it matter whether there is a new line after each pipe or not?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_1329062", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_5ebb5af", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("Again, this is a stylistic choice, and is considered good practise.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz433_1-4-answer", 
    question = "qz433_1-4"), loading = structure("<strong>Loading:<\u002fstrong> \nDoes it matter whether there is a new line after each pipe or not?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1359152797.8671, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz433_1-5", question = structure("Do you think it would be possible to have the new line <em>before<\u002fem> the pipe, so that ths <code>slice()<\u002fcode> and <code>select()<\u002fcode> lines start with a pipe?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_2edece7", 
    option = "Yes", value = "Yes", label = structure("Yes", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_2a72274", 
    option = "No", value = "No", label = structure("No", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("Without a pipe at the end of the line, <code>R<\u002fcode> considers the &#39;chain&#39; of commands to be finished. This is an example of a coding practise which is fundamental, not stylistic.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz433_1-5-answer", 
    question = "qz433_1-5"), loading = structure("<strong>Loading:<\u002fstrong> \nDo you think it would be possible to have the new line <em>before<\u002fem> the pipe, so that ths <code>slice()<\u002fcode> and <code>select()<\u002fcode> lines start with a pipe?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 492197412.770803, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex433_3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex433_3-code-editor`)), session)
output$`tutorial-exercise-ex433_3-output` <- renderUI({
  `tutorial-exercise-ex433_3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex433_3", list(setup = NULL, chunks = list(list(label = "ex433_3", code = "dataSubset <- games %>%\n    select()\ndataSubset", 
    opts = list(label = "\"ex433_3\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("dataSubset <- games %>%", "    select(-group)", 
    "dataSubset"), chunk_opts = list(label = "ex433_3-solution", 
        echo = FALSE)), options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex433_3", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("dataSubset <- games %>%", 
        "    select()", "dataSubset"), params.src = "ex433_3, exercise=TRUE, echo= FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex434_4-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex434_4-code-editor`)), session)
output$`tutorial-exercise-ex434_4-output` <- renderUI({
  `tutorial-exercise-ex434_4-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex434_4", list(setup = NULL, chunks = list(list(label = "ex434_4", code = "# subset the data\ndataSubset <- games %>%\n    filter()\ndataSubset\n\n# plot the data\n", 
    opts = list(label = "\"ex434_4\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("# subset the data", "dataSubset <- games %>%", 
    "    filter(eyesight < 14) # look at the data frame: the outlier is 14", 
    "dataSubset", "", "# plot the data", "hist <- ggplot(dataSubset, aes(x = eyesight)) +", 
    "    geom_histogram()", "# This is the simplest histogram possible: you could choose to plot", 
    "# y as density, change the number of bins or bin width, fill colour,", 
    "# x axis limits, theme, etc., but you don't have to. The important ", 
    "# Thing is to use dataSubset as the data layer.", ""), chunk_opts = list(
        label = "ex434_4-solution", echo = FALSE)), options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, strip.white = TRUE, size = "normalsize", 
        background = "#F7F7F7", cache = 0, cache.path = "DataSkills_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex434_4", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("# subset the data", 
        "dataSubset <- games %>%", "    filter()", "dataSubset", 
        "", "# plot the data", ""), params.src = "ex434_4, exercise=TRUE, echo= FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz434_2-1", question = structure("How would you choose everything <em>except<\u002fem> group 2?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_145b579", 
    option = "`group != 'G2'`", value = "`group != 'G2'`", label = structure("<code>group != &#39;G2&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_c72afc1", 
    option = "`group !%in% 'G2'`", value = "`group !%in% 'G2'`", 
    label = structure("<code>group !%in% &#39;G2&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_f858a6b", 
    option = "`group =! 'G2'`", value = "`group =! 'G2'`", label = structure("<code>group =! &#39;G2&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_420857b", 
    option = "`group - 'G2'`", value = "`group - 'G2'`", label = structure("<code>group - &#39;G2&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = structure("<code>!=<\u002fcode> means &#39;not equal to&#39;.", html = TRUE, class = c("html", 
"character")), post_message = NULL), ids = list(answer = "qz434_2-1-answer", 
    question = "qz434_2-1"), loading = structure("<strong>Loading:<\u002fstrong> \nHow would you choose everything <em>except<\u002fem> group 2?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1916225996.60769, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz434_2-2", 
    question = structure("How would you choose only short-sighted people (with negative values for <code>eyesight<\u002fcode>?) Select all that apply.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_3369ab6", 
        option = "`eyesight < 0`", value = "`eyesight < 0`", 
        label = structure("<code>eyesight &lt; 0<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_c30d40a", 
        option = "`0 > eyesight`", value = "`0 > eyesight`", 
        label = structure("<code>0 &gt; eyesight<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_6469ae8", 
        option = "`eyesight <= 0`", value = "`eyesight <= 0`", 
        label = structure("<code>eyesight &lt;= 0<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_5e55d03", 
        option = "`eyesight != 0`", value = "`eyesight != 0`", 
        label = structure("<code>eyesight != 0<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("logicals often work both ways. In this case <code>eyesight &lt; 0<\u002fcode> and <code>0 &gt; eyesight<\u002fcode> are equivalent.", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz434_2-2-answer", 
        question = "qz434_2-2"), loading = structure("<strong>Loading:<\u002fstrong> \nHow would you choose only short-sighted people (with negative values for <code>eyesight<\u002fcode>?) Select all that apply.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 384798623.820814, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz434_2-3", 
    question = structure("How would you choose only people that have been abroad in their lifetimes? Select all that apply.", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_9be7db0", 
        option = "`countries >= 2`", value = "`countries >= 2`", 
        label = structure("<code>countries &gt;= 2<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_7b396e7", 
        option = "`countries > 1`", value = "`countries > 1`", 
        label = structure("<code>countries &gt; 1<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_46808d6", 
        option = "`1 > countries`", value = "`1 > countries`", 
        label = structure("<code>1 &gt; countries<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_229818a", 
        option = "`countries <= 2`", value = "`countries <= 2`", 
        label = structure("<code>countries &lt;= 2<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_4bb863d", 
        option = "`1 < Countries`", value = "`1 < Countries`", 
        label = structure("<code>1 &lt; Countries<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = structure("careful of uppercase letters where they shouldn&#39;t be!", html = TRUE, class = c("html", 
        "character"))), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = structure("There are often several ways in which you can specify what you want using logicals!", html = TRUE, class = c("html", 
    "character")), post_message = NULL), ids = list(answer = "qz434_2-3-answer", 
        question = "qz434_2-3"), loading = structure("<strong>Loading:<\u002fstrong> \nHow would you choose only people that have been abroad in their lifetimes? Select all that apply.\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 1250125886.41786, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "qz434_2-4", question = structure("How would you choose only people who aren&#39;t adults?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_523fe3b", 
    option = "`role %in% c('child', 'baby')`", value = "`role %in% c('child', 'baby')`", 
    label = structure("<code>role %in% c(&#39;child&#39;, &#39;baby&#39;)<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_8a9a539", 
    option = "`role = c('child', 'baby')`", value = "`role = c('child', 'baby')`", 
    label = structure("<code>role = c(&#39;child&#39;, &#39;baby&#39;)<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_c9fee50", 
    option = "`role == 'child', 'baby'`", value = "`role == 'child', 'baby'`", 
    label = structure("<code>role == &#39;child&#39;, &#39;baby&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_b2710b6", 
    option = "`role == 'child' & 'baby'`", value = "`role == 'child' & 'baby'`", 
    label = structure("<code>role == &#39;child&#39; &amp; &#39;baby&#39;<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
"character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
"character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "qz434_2-4-answer", question = "qz434_2-4"), loading = structure("<strong>Loading:<\u002fstrong> \nHow would you choose only people who aren&#39;t adults?\n<br/><br/><br/>", html = TRUE, class = c("html", 
"character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 608277586.716749, options = list()), class = c("learnr_radio", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_checkbox", label = "qz434_2-5", 
    question = structure("How would you choose every hardware except touchscreens?", html = TRUE, class = c("html", 
    "character")), answers = list(structure(list(id = "lnr_ans_e70be5", 
        option = "`hardware != 'touchscreen'`", value = "`hardware != 'touchscreen'`", 
        label = structure("<code>hardware != &#39;touchscreen&#39;<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_81c6ad2", 
        option = "`hardware %in% c('mouse', 'keyboard', 'touchpad')`", 
        value = "`hardware %in% c('mouse', 'keyboard', 'touchpad')`", 
        label = structure("<code>hardware %in% c(&#39;mouse&#39;, &#39;keyboard&#39;, &#39;touchpad&#39;)<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = TRUE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_315beae", 
        option = "`hardware %not% 'touchscreen'`", value = "`hardware %not% 'touchscreen'`", 
        label = structure("<code>hardware %not% &#39;touchscreen&#39;<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer")), structure(list(id = "lnr_ans_d3ca115", 
        option = "`hardware == !'touchscreen'`", value = "`hardware == !'touchscreen'`", 
        label = structure("<code>hardware == !&#39;touchscreen&#39;<\u002fcode>", html = TRUE, class = c("html", 
        "character")), correct = FALSE, message = NULL), class = c("tutorial_question_answer", 
    "tutorial_quiz_answer"))), button_labels = list(submit = structure("Submit Answer", html = TRUE, class = c("html", 
    "character")), try_again = structure("Try Again", html = TRUE, class = c("html", 
    "character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
    "character")), try_again = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), incorrect = structure("Incorrect", html = TRUE, class = c("html", 
    "character")), message = NULL, post_message = NULL), ids = list(
        answer = "qz434_2-5-answer", question = "qz434_2-5"), 
    loading = structure("<strong>Loading:<\u002fstrong> \nHow would you choose every hardware except touchscreens?\n<br/><br/><br/>", html = TRUE, class = c("html", 
    "character")), random_answer_order = TRUE, allow_retry = FALSE, 
    seed = 138044789.435718, options = list()), class = c("learnr_checkbox", 
"tutorial_question")))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex441_5-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex441_5-code-editor`)), session)
output$`tutorial-exercise-ex441_5-output` <- renderUI({
  `tutorial-exercise-ex441_5-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex441_5", list(setup = NULL, chunks = list(list(label = "ex441_5", code = "dataSubset <- games %>%\n    mutate()\ndataSubset", 
    opts = list(label = "\"ex441_5\"", exercise = "TRUE", echo = "FALSE"), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = NULL, options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "", 
        exercise.eval = FALSE, label = "ex441_5", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = c("dataSubset <- games %>%", 
        "    mutate()", "dataSubset"), params.src = "ex441_5, exercise=TRUE, echo= FALSE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex45_6-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex45_6-code-editor`)), session)
output$`tutorial-exercise-ex45_6-output` <- renderUI({
  `tutorial-exercise-ex45_6-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache("ex45_6", list(setup = NULL, chunks = list(list(label = "ex45_6", code = "", 
    opts = list(label = "\"ex45_6\"", exercise = "TRUE", echo = "FALSE", 
        exercise.cap = "\"3.6 Chaining Commands: Quiz 1\""), 
    engine = "r")), code_check = NULL, error_check = NULL, check = NULL, 
    solution = structure(c("dataSubset <- games %>%", "    filter(role == 'student') # could also use role %in% 'student'", 
    "        mutate(reaction_pc = reaction * 100)", "            select(c('person', 'role', 'reaction', 'reaction_pc'))", 
    "# the order of the filter, mutate and select lines doesn't matter", 
    "dataSubset"), chunk_opts = list(label = "ex45_6-solution", 
        echo = FALSE)), options = list(eval = FALSE, echo = TRUE, 
        results = "markup", tidy = FALSE, tidy.opts = NULL, collapse = FALSE, 
        prompt = FALSE, comment = NA, highlight = FALSE, strip.white = TRUE, 
        size = "normalsize", background = "#F7F7F7", cache = 0, 
        cache.path = "DataSkills_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "center", fig.path = "DataSkills_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, tutorial = TRUE, exercise.cap = "3.6 Chaining Commands: Quiz 1", 
        exercise.eval = FALSE, label = "ex45_6", exercise = TRUE, 
        out.width.px = 624, out.height.px = 384, code = "", params.src = "ex45_6, exercise=TRUE, echo= FALSE, exercise.cap=\"3.6 Chaining Commands: Quiz 1\"", 
        fig.num = 0L, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r"))
</script>
<!--/html_preserve-->
