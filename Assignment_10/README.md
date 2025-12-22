# Exercise 10 – Moving Average Filter Analysis

This repository contains a MATLAB solution template for **Exercise 10**, which demonstrates the analysis of moving average (MA) filters using **frequency response** and **zero-pole analysis**.

## 📘 Problem Description
We are given two finite impulse response (FIR) filters:

- **5-point moving average filter**  
  \( b_1 = [1 \ 1 \ 1 \ 1 \ 1], \ a_1 = 1 \)

- **9-point moving average filter**  
  \( b_2 = [1 \ 1 \ 1 \ 1 \ 1 \ 1 \ 1 \ 1 \ 1], \ a_2 = 1 \)

### Tasks
1. Normalize the filters to convert them into **averaging filters**.  
2. Use `freqz` to plot their **magnitude responses**.  
3. Use `tf2zpk` and `zplane` to perform **zero-pole analysis**.  
4. Compare the two filters in terms of their frequency behavior and pole-zero locations.

---

## 📂 Files
- `exercise10_solution.m` – Main MATLAB script implementing the tasks.
- `README.md` – Documentation of the project.

---

## 🚀 How to Run
1. Open MATLAB.
2. Load the script:
   ```matlab
   exercise10_solution
