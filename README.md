# Pewlett-Hackard-Analysis
Module7_SQL

# Overview
## Background
Pewlitt Hackard is a company with thousands of employees that are nearing their retirement. Due to that many vacancies will become available within the company. As a result this project has become necessary. The project entails analysing the company's set of data files to better understand the impact of these employees retiring. The analysis will be carried out using PosgreSQL within its interface, pgAdmin.  

## Purpose
The analysis presents data files to help the company make decisions in regards to the upcoming situation "silver tsunami". In the analysis, a file that holds eligible to retire employees' information (emplyee number, first name, last name) and current job titles (if they are stil working). From that file the number of employees soon to retire for every job title was counted. Also the company wants to have a mentorship program for new employees run by eligible to retire or recently retired employees born in the year 1965. The information for these employees was extracted and presented in another file.
  

# Results
Below is a snapshot of the rteirement_titles table. The table holds eligible to retire employees' information and job titles (both previous and current), based on their birth date (January 1952 to December 1955) ordered by employee number.
![image1](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/1_retirement_titles.PNG)  


Below is a snapshot of the unique_titles table extracted from retirement_titles table. It holds eligible to retire employees' information and current job titles (if they are stil working). In total there is 72,458 individuals eligible to retire.  
![image2](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/2_unique_titles.PNG) 

Below is the retiring_titles table which was generated based on the uniques_titles table. It holds the number of eligible to retire employees for each job title in the company.  
![image3](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/3_retiring_titles.PNG)

Below is a snapshot of the list of employees eligible for the mentorship program. In total there are 1,549 individuals eligible for the mentorship program. 
![image4](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/4_mentorship_eligibility.PNG)

Based on the tables above the following conclusions can be drawn:  
**1 -** From the data in the retiring_titles table, it is calculated that around 70% of the eligible to retire employees hold senior engineer or senior staff positions.  
**2 -** The company currenlty employs 240,124 individuals. The eligible/soon to retire employees are 72,458 or around 30% of the company's employees.  
**3 -** Out of the soon to become 72,458 vacant positions, only 1,549 individuals are eligible for becoming their mentors. That is only about 2% of mentors out of the future vacancies.  
**4 -** The job titles that will be least impacted are manageers, assistant engineers, and technique leaders.


# Summary
In summary as the "silver tsunami" begins to make an impact 72,458 roles will need to be filled. The number of qualified, retirement-ready employees is just slighly over 2% of the number of roles to be filled therefore there is not enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.  

Another two table were generated to further help in drawing conlusions.    

**1 -** The table below expands on the retiring_titles data such that it groups the data by departments and then titles. The previous table showed that the Senior Engineers job title woud be the most impacted. This table further shows that the department most impacted by this title is the Development title.  
![image5](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/5_retiring_dept.PNG)  

**2 -** The table below is a join between the number of eligible mentors and retiring titles (or soon to be vacant titles) for every title. The table's open_to_mentor column is a ratio of soon to become vacant positions to eligible mentors. The table shows that for some titles, such as the assistant engineer title, the ratio may be manageable (17 new employees to 1 mentor) while the senior engineer is more difficult to be successful (84 new employees to 1 mentor).  
![image6](https://github.com/nabuhant/Pewlett-Hackard-Analysis/blob/main/Data/Challenge%20Data%20Files/Tables%20Screenshots/6_ratio.PNG)
