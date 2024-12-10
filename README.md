# Reproducible research: version control and R

\# INSERT ANSWERS HERE #

## Logistic Growth

For answers to assignment questions 1, 2 and 3, see https://github.com/peculaze/logistic_growth.

## 4) Random Motion

### 4.1) Random Walk

The random walk function, at each step, picks a random direction and moves 0.25 units in that direction. Two examples of 500-step random walks are as follows: 

<p align="center">
  <img src="https://github.com/user-attachments/assets/40eff1b2-b427-44bc-b50f-b52562f022f3">
</p>

With these starting parameters, neither path extended more than ~6 total units away from its starting location. Additionally, in neither path did the initial direction of travel match the overall direction. The movement pattern differs significantly between the two walks, however. The first walk travelled 2.597272 units total, at an angle of 5.189805 radians from the x axis (anticlockwise). Meanwhile, the second walk diverged 4.752672 units from the origin, at an overall angle of 3.655174 radians from the x axis. These final locations are very different, as are the patterns by which they travelled to those locations. Based on the random walk function, the final angle could be predicted under a random uniform distribution, while overall distance could be modelled under a normal distribution due to central limit theorem, hence the differences in results. 

### 4.2) Random Seeds

Computers are inherently deterministic systems, which makes them incapable of generating random numbers spontaneously. Some peripherals are capable of using environmental randomness to source random numbers, but a more common approach is to use pseudo-random number generator (PRNG) algorithms to simulate randomness, which has the advantage of reproducibility. PRNGs use a variety of complex mathematical functions to generate a sequence of apparently independent numbers which each take the previous element of the sequence as input. Different members of this sequence are used to generate random numbers in processes that rely on random number generation. 

The initialisation number which is fed into the PRNG algorithm in order to generate a sequence is called the seed. Since the PRNG is deterministic, each random seed will produce the same sequence of pseudorandom numbers, which are incorporated into 'random' functions in the same manner, thus making reproducible results. R stores this random seed as the `.Random.seed` variable under the global environment and updates each time it is called. Ordinarily, `.Random.seed` is initialised using the system clock, but the `set.seed()` function can be used to fix the PRNG input and thus fix the outputs for any subsequent functions involving random numbers. 

*Sources:*
- *https://stat.ethz.ch/R-manual/R-devel/library/base/html/Random.html*
- *https://r-coder.com/set-seed-r/*

### 4.3) Brownian Motion

Brownian motion is functionally similar to random walk, but true Brownian motion is a continuous movement modelled by a normal distribution for distance in x and y. Thus, the distance per step was modified to also be normally distributed. See `random_walk.R` for updated code. 

### 4.4) Code Modification

<p align="center">
  <img src="https://github.com/user-attachments/assets/8b816768-a22b-4632-88c7-fb2d896c2059">
</p>

## 5) Viral Particle Size 

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
