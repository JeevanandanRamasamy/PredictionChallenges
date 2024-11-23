# PredictionChallenges

This repository contains my solutions to the **Prediction Challenges** from the Data Literacy course. The challenges involved developing models to predict various outcomes based on provided datasets. My predictions achieved top rankings, including **1st place out of 276 students overall** for having the lowest prediction error.

---

## Challenge 1: Predicting Student Grades (No ML Allowed)

**Challenge Link:** [Kaggle Competition - Predictive Challenge 1](https://www.kaggle.com/competitions/predictive-challenge-1-2022)  

### **Problem Description**
- **Given:**  
  - Student's major  
  - Seniority level  
  - Score  
- **Goal:** Predict the student's grade.  

### **Solution**
Machine learning models were not allowed for this challenge. After analyzing the dataset, I categorized entries and developed cutoff ranges for each category. In cases with insufficient data, I extended ranges to ensure all possible values were covered.  

### **Results**
- **Accuracy:** 92.3%  
- **Rank:** 1st out of 218 students.  

---

## Challenge 2: Predicting Student Grades (ML Models Allowed)

**Challenge Link:** [Kaggle Competition - Predictive Challenge 2](https://www.kaggle.com/competitions/predictive-challenge-2-2022)  

### **Problem Description**
- **Given:**  
  - Student's major  
  - Seniority level  
  - Score  
- **Goal:** Predict the student's grade.  

### **Solution**
With machine learning models allowed, I built a solution using multiple decision trees. These models were based on the categories I developed in Challenge 1, enabling precise predictions tailored to each group.  

### **Results**
- **Accuracy:** 92.3%  
- **Rank:** 1st out of 212 students.  

---

## Challenge 3: Predicting Student Earnings After Graduation

**Challenge Link:** [Kaggle Competition - Predictive Challenge 3](https://www.kaggle.com/competitions/predictive-challenge-3-2022)  

### **Problem Description**
- **Given:**  
  - Student's GPA  
  - Number of professional connections  
  - Major  
  - Graduation year  
  - Number of credits  
  - Number of parking tickets  
- **Goal:** Predict the student's earnings after graduation.  

### **Solution**
I used a linear regression model after partitioning the data into categories. My analysis revealed that certain variables influenced earnings differently depending on the context, while other variables had no measurable effect. This insight guided the development of my predictive model.  

### **Results**
- **Mean Squared Error:** 90.850861  
- **Rank:** 2nd out of 192 students.  

---

## Achievements

- **Overall Performance:**  
  - Placed 1st among 276 students for having the least error across all challenges.  
- **Challenge-Specific Rankings:**  
  - 1st place in Challenges 1 and 2.  
  - 2nd place in Challenge 3.  

---

## Repository Contents

- **Challenge1/**  
  Code and data analysis for Challenge 1.  
- **Challenge2/**  
  Machine learning implementation and models for Challenge 2.  
- **Challenge3/**  
  Linear regression model and analysis for Challenge 3.  
