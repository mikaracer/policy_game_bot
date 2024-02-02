import csv

def calculate(combination):
    with open('policies.csv', 'r', newline='') as csvfile:
        reader = list(csv.reader(csvfile))
        inflation = 0
        unemployment = 0
        gdp = 0
        debt = 0
        poll_rating = 0
        #calculate inflation
        for number in combination:
            selected_row = reader[number + 1]
            inflation += int(selected_row[1])
        # calculate unemployment
        for number in combination:
            selected_row = reader[number + 1]
            unemployment += int(selected_row[2])
        # calculate GDP
        for number in combination:
            selected_row = reader[number + 1]
            gdp += int(selected_row[3])
        # calculate economic growth / debt
        for number in combination:
            selected_row = reader[number + 1]
            debt += int(selected_row[4])
        #calculate poll rating
        for number in combination:
            selected_row = reader[number + 1]
            poll_rating += int(selected_row[5])

        #pre-programmed
        inflation += 1
        unemployment -= 5
        gdp += 5
        debt += 2
        poll_rating += 30

        if inflation > -1:
            inflation_score = inflation
        else: inflation_score = 0
        if inflation_score > 2:
            inflation_score_indicator = 1
        else: inflation_score_indicator = 0
        if unemployment < 0:
            unemployment_score = 0
        else: unemployment_score = unemployment
        if unemployment_score == 1:
            unemployment_score_indicator = 0
        else: unemployment_score_indicator = unemployment_score
        if inflation_score_indicator == 0:
            score = gdp - unemployment_score_indicator + inflation_score
        else: score = gdp - unemployment_score_indicator - inflation_score
        if debt > 9:
            debt_score = 0
        else: debt_score = score
        if poll_rating < 0:
            poll_score = 0
        else: poll_score = debt_score
        return poll_score, poll_rating, combination