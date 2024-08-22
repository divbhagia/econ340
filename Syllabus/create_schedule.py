import datetime as dt
import pandas as pd

#################################################
# Function to write table to latex
#################################################

def latex(df, filename=None):
    lines = []
    if filename is None:
        for i in range(df.shape[0]):
            lines.append(' & '.join([str(x) for x in df.iloc[i]]) + ' \\\\')
        return lines
    else:
        with open(filename, 'w') as f:
            for i in range(df.shape[0]):
                f.write(' & '.join([str(x) for x in df.iloc[i]]) + ' \\\\\n')
    

#################################################
# Get dates for the semester
#################################################

# Dictionary to map weekdays to their index
day_to_index = {
    'Mon': 0,
    'Tue': 1,
    'Wed': 2,
    'Thu': 3,
    'Fri': 4,
    'Sat': 5,
    'Sun': 6
}

# Function to get dates for a specific weekday
def get_dates(start, end, weekdays, year):
    """
    Returns a list of dates that fall on a specific weekday between two dates.
        - start: The start date of the semester.
        - end: The end date of the semester.
        - weekdays: Weekdays to filter the dates (e.g., 'Tue', 'Thu').
        - year: The year of the semester.
    """
    weekdaysnum = [day_to_index[day] for day in weekdays]
    start_date = dt.datetime.strptime(start + '/' + str(year), '%m/%d/%Y')
    end_date = dt.datetime.strptime(end + '/' + str(year), '%m/%d/%Y')
    dates = []
    current_date = start_date
    while current_date <= end_date:
        if current_date.weekday() in weekdaysnum:
            dates.append(current_date.strftime('%a %m/%d'))
        current_date += dt.timedelta(days=1)
    return dates

#################################################
# Specify syllabus content
#################################################

# Modules
modules = {}
modules['desc'] = 'Describing Data'
modules['r'] = 'Coding in R'
modules['rv'] = 'Random Variables'
modules['sampest'] = 'Sampling and Estimation'
modules['linreg'] = 'Linear Regression'
modules['adv'] = 'Advanced Topics'

# Topics
topics = {}

# Topics: Describing Data
topics['desc'] = ['Introductions; Summation notation',
                  'Distribution, mean, median, percentiles',
                  'Variance, standard deviation, Z-score',
                  'Covariance and correlation',
                  'Research questions and data']

# Topics: Coding in R
topics['r'] = ['Getting started with R',
                'Importing and cleaning data in R',
                'Describing variables in R']

# Topics: Random Variables
topics['rv'] = ['Distribution, expectation, variance',
                'Normal distribution, Z-score',
                'Independence, correlation']

# Topics: Sampling and Estimation
topics['sampest'] = ['Sample mean distribution; Good estimators', 
                     'Confidence intervals',
                    'Hypothesis testing and p-values']

# Topics: Linear Regression
topics['linreg'] = ['Ordinary least squares (OLS), Goodness of fit: $R^2$',
                    'Prediction vs. causal inference',
                    'Inference (p-values, t-stats, confidence intervals)',
                    'Omitted variable bias; Multiple regression model; Adjusted $R^2$',
                    'Categorical variables; Interaction terms',
                    'Quadratic and log functional forms',
                    'Recap and synthesis',
                    'Linear regression in R',
                    'Linear regression in R'
                    ]

# Topics: Advanced Topics
topics['adv'] = ['Experiments and quasi-experimental methods',
                 'Panel data and event study designs',
                'Big data and machine learning']

#################################################
# Create Fall Syllabus 
#################################################

# Note: Spring semester only need adjustment after midterm

# Initialize
sem = 'fall'
class_days = ['Tue', 'Thu']

# Fall semester dates
if sem == 'fall':
    tues_and_thurs = get_dates('08/24', '12/13', class_days, 2024)
    break_ = get_dates('11/26', '12/01', class_days, 2024)
    examday = 'Thu 12/19'

# Spring semester dates
if sem == 'spring':
    tues_and_thurs = get_dates('01/18', '05/09', class_days, 2025)
    break_ = get_dates('03/31', '04/06', class_days, 2025)
    examday = 'Thu 05/16' # CHECK THIS DATE

# Fall or spring break adjustment
dates = [date for date in tues_and_thurs if date not in break_[1:]]
dates = [date if date != break_[0] else '' for date in dates]

# Add final exam date
dates.append(examday)

# Create a DataFrame with the dates
df = pd.DataFrame({'Date': dates, 
                   'Lecture': '', 
                   'Module': '', 
                   'Topics': '', 
                   'Due': ''}, dtype='object')

# Where empty date it's Fall or Spring Recess
break_idx = df[df['Date'] == ''].index[0]
if sem == 'fall':
    df.loc[break_idx, 'Topics'] = 'Fall Recess'
if sem == 'spring':
    df.loc[break_idx, 'Topics'] = 'Spring Recess'

# Add the lecture numbers and topics for lectures before the midterm 
midterm_mods = ['desc', 'r', 'rv', 'sampest']
counter = 0
for mod in midterm_mods:
    step = len(topics[mod])
    df.loc[counter:counter+step-1, 'Lecture'] = list(range(counter+1, counter+step+1))
    df.loc[counter, 'Module'] = modules[mod]
    df.loc[counter:counter+step-1, 'Topics'] = topics[mod]
    counter += step
lec_counter = counter

# After those lectures: Review Class, Midterm, Research Project Feedback
df.loc[counter, 'Topics'] = 'Review Class'
counter += 1
df.loc[counter, 'Topics'] = 'Midterm Exam'
counter += 1
df.loc[counter, 'Topics'] = 'Research Project Feedback'
counter += 1

# Split linreg module if needed
classes_left = break_idx - counter
print(f'Classes to break: {classes_left}')
print(f'Topics in Linear Reg Module: {len(topics["linreg"])}')
if classes_left < len(topics['linreg']):
    linreg_topics = topics['linreg']
    topics['linreg'] = linreg_topics[:classes_left]
    topics['linreg2'] = linreg_topics[classes_left:]
    modules['linreg2'] = 'Linear Regression (cont.)'

# Add the lecture numbers and topics for Linear Regression module
step = len(topics['linreg'])
df.loc[counter:counter+step-1, 'Lecture'] = \
    list(range(lec_counter+1, lec_counter+step+1))
df.loc[counter, 'Module'] = modules['linreg']
df.loc[counter:counter+step-1, 'Topics'] = topics['linreg']
counter += step
lec_counter += step
counter += 1 # For the break

# Add continued Linear Regression module if broken (Spring only probably)
if 'linreg2' in topics:
    step = len(topics['linreg2'])
    df.loc[counter:counter+step-1, 'Lecture'] = \
        list(range(lec_counter+1, lec_counter+step+1))
    df.loc[counter, 'Module'] = modules['linreg2']
    df.loc[counter:counter+step-1, 'Topics'] = topics['linreg2']
    counter += step
    lec_counter += step

# Add the lecture numbers and topics for Advanced Topics module
step = len(topics['adv'])
df.loc[counter:counter+step-1, 'Lecture'] = \
    list(range(lec_counter+1, lec_counter+step+1))
df.loc[counter, 'Module'] = modules['adv']
df.loc[counter:counter+step-1, 'Topics'] = topics['adv']
counter += step
lec_counter += step

# Last two lectures: Review Class and Final Exam
df.loc[counter, 'Topics'] = 'Review Class'
counter += 1
df.loc[counter, 'Topics'] = 'Final Exam (1--2.50 pm)'

# When is stuff due? 
df.loc[df['Lecture'] == 4, 'Due'] = 'RP Team'
df.loc[df['Lecture'] == 5, 'Due'] = 'Problem Set 1'
df.loc[df['Lecture'] == 9, 'Due'] = 'Problem Set 2'
df.loc[df['Lecture'] == 11, 'Due'] = 'RP Submission 1'
df.loc[df['Lecture'] == 14, 'Due'] = 'Problem Set 3'
df.loc[df['Lecture'] == 18, 'Due'] = 'RP Submission 2' 
df.loc[df['Lecture'] == 22, 'Due'] = 'Problem Set 4'
df.loc[df['Lecture'] == 26, 'Due'] = 'Final Paper'

#################################################
# Create latex table
#################################################

# Get the latex lines
lines = latex(df)

# Special multicolumn rows
splrows = df[df['Lecture'] == ''].index
for row in splrows:
    lines[row] = df.loc[row, 'Date'] + ' & ' \
        + f'\\multicolumn{{3}}{{l}}{{{df.loc[row, "Topics"]}}}' \
              + ' & ' + ' \\\\'

# Adjust rows with module names, also grab module end rows for later
mdlbegs = df[df['Module'] != ''].index
mdlends = [0] * len(mdlbegs)
for i, row in enumerate(mdlbegs):
    mod = df.loc[row, 'Module']
    modkey = [key for key, value in modules.items() if value == mod][0]
    numtopics = len(topics[modkey])
    mdlends[i] = mdlbegs[i] + numtopics - 1
    lines[row] = df.loc[row, 'Date'] + ' & ' + f'{df.loc[row, 'Lecture']} & ' \
        + f'\\multirow{{{numtopics}}}{{=}}{{{mod}}} & '  \
              + df.loc[row, 'Topics'] + ' & ' + df.loc[row, 'Due'] + ' \\\\'
    
# Add lines add end of each row and bolder lines at the end of each module
boldlines = list(set(mdlends) | set(mdlbegs[1:]-1))
for row in range(len(lines)):
    if row not in splrows and row not in boldlines:
        lines[row] += '\n\\cline{1-2} \\cline{4-5}'
    if row in splrows and row not in boldlines:
         lines[row] += '\n\\hline'
    if row in boldlines:
        lines[row] += '\n\\Xhline{2.2\\arrayrulewidth}'

# Write to file
with open('Syllabus/schedule.tex', 'w') as f:
    for line in lines:
        f.write(line + '\n')

#################################################