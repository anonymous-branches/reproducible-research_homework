# Reproducible research: version control and R

## Answers 
### Questions 1, 2, and 3
My `logistic_growth` repository is here: https://github.com/anonymous-branches/logistic_growth
The answers to questions 1, 2 and 3 are within in the README.md file of the 'logistic_growth' repository. 

### Question 4
<b>(30 points) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:</b>

<b> a) A script for simulating a random_walk is provided in the question-4-code folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)</b>

The random walk produced each time you run the code is different, even if the same number of steps (e.g. 500) is used. All the outputs are completely random, but this means that the result is not reproducible, as if you run the code a second time / if someone else were to run this code, you would get different outputs. 

<b> b) Investigate the term random seeds. What is a random seed and how does it work? (5 points)</b>

A random seed is a number or vector that is used to initialise the selection of numbers by a pseudo-random number generator in a reproducible way.
The random seed is used to generate a sequence of numbers that approximates the properties of a random sequence. The resulting sequence is not actually random (i.e. is 'pseudorandom') because the sequence is determined by the value of the random seed chosen. This means that whenever the same seed is used, the same sequence will be obtained. This sacrifices 'true' randomness for reproducibility. Random seeds are key in our ability to reproduce the same outputs when working with code reliant on random processes.

<b> c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked reproducible-research_homework repo. (10 points) </b>

I edited the code to add `set.seed()` to make the results of `runif()` reproducible. I put `set.seed()` outside of the for loop because if `set.seed()` was within the for loop, each iteration of the loop would give the same result - i.e every angle generated would be the same. Having `set.seed()` outside of the loop means that the angles are drawn from the same pseudorandom sequence (so are reproducible), but do not have the same value for each iteration, so the result of the code still replicates brownian motion, rather than a straight line.   

<b> d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the README.md of the fork). (5 points) </b> 

![random_walk_comparison_view](https://github.com/user-attachments/assets/8e918e5e-71c3-46fe-aa4e-33b7de1f95d3)
<figcaption><i>Figure 1. Edits I made to the random_walk.R script.</i>i></figcaption>

### Question 5

<b>(30 points) In 2014, Cui, Schlub and Holmes published an article in the Journal of Virology (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form <i>V = αL<sup>β</sup></i>, where <i>V</i> is the virion volume in nm<sup>3</sup> and <i>L</i> is the genome length in nucleotides.</b>

<b>a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the question-5-data folder). How many rows and columns does the table have? (3 points) </b>

The table has 33 rows and 13 columns. 

<b>b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) </b>

A log transformation for both virion volume and genome length will enable fitting a linear model. 
I used a natural logarithm transformation: `log()` in R. 
The allometric equation they describe (<i>V = αL<sup>β</sup></i>) can be expressed as a linear equation, if a natural log (ln) transformation is applied (<i>ln(V) = ln(α) + β * ln(L) </i>)

<b>c) Find the exponent (β) and scaling factor (α) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in Table 2 of the paper, did you find the same values? (10 points) </b>
The estimate of the scaling factor (α) (the intercept of the linear model) I obtained was <b>1181.807</b>. The model output was 7.0748. Since the model was written in terms of ln(α), to find the value of alpha, I calculated <i>e</i><sup> 7.0748</sup> = 1181.807. This had a p-value of 2.28x10<sup>-10</sup>, so was significant at the 99% significance level. 
The estimate of the exponent (β) (the slope of the linear model) I obtained was <b>1.5142</b>. The linear form of the equation just contains β not logged, so this value required no further calculation. This estimate had a p-value of 6.44x10<sup>-10</sup>, so was also signficant at the 99% significance level. 

Cui, et al., 2014, estimate that, for dsDNA viruses, the exponent (β) = 1.52 (with a 95% confidence interval of 1.16–1.87) and the scaling factor (α) = 	1,182 (95% confidence interval: 246–5,675). These estimates are very similar to mine, with small differences that can be attributed to Cui, et al., rounding their estimates. 
 
<b>d) Write the code to reproduce the figure shown below. (10 points)</b>
The code I wrote is included in `question-5-code.R`. This is the graph I produced:


![graph_for_5_d](https://github.com/user-attachments/assets/9cb164db-28f7-4f4c-8ebf-b37fbd1571db)
<figcaption><i>Figure 2. Graph of the relationship between the natural log of genome length and the natural log of virion volume. Produced with the aim of reproducing the figure given in the question.</i></figcaption>
<br></br>


<b>e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) </b>
The predicted volume of a 300kb dsDNA virus is 6698070 nm<sup>3</sup>. I obtained this value using the `predict()` function in R to use my linear model to predict the viral volume. I input ln(300) and recieved the output 15.71733 = log(V). <i>e</i><sup>15.71733</sup> = 6698070 nm<sup>3</sup>


## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
