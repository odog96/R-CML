# Deploying R Models in CML

This repo contains three model examples you can use to deploy R models in CML.
Starting with the simplest approach - adding two numbers to more suffisticated
decition tree models to predict car MPG in the classic Cars93 data set.

The two prediction files, each have a corresponding model build file. They 
start with the 'model' prefix. Each model also has its own prediction file 
that is core wrapper file for your CML model. These R files have the key words
"predict" and "serve" in the file name. 

Further below I show the parameters I use to deploy these models within CML>

**Note** 
these models are for educational purposes. I purposefully skip certain validation 
steps you would normally include as part of you model build process. The idea is to 
show key steps in building and deploying models in CML. 



## Files

Modify the default files to get started with your own project.


* `add_model.r` -- simply r wrapper file use to build the 'add' model in CML
* `cdsw.sh` -- model build file using for CML model deployments
* `README.md` -- Readme in Markdown format.
* `model_build_dt.r` -- model build file for decision trees model
* `model_build_lm.r` -- model build file for regression model
* `predict_dt_serve.R` -- R wrapper file used by CML Model for decision tree model
* `predict_lm_serve.R` -- R wrapper file used by CML Model for regression model

## CML Models

### Deploying the add numbers function model

![Alt text](/images/add_two_numbers.png "Add two numbers model")<br>
### Deploying the Regression model

![Alt text](/images/cml_regression_model.png "Regression model")<br>
### Deploying the Decision Tree model

![Alt text](/images/cml_decision_tree_model.png "Decision Tree model")

