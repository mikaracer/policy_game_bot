import calculate
import perm

numbers = list(range(1, 25))
k = 8
combinations = perm.permute_iter(numbers, k)

highest_score = 0
highest_combi = 0
for combination in combinations:
    x = calculate.calculate(combination)
    if x[0] > highest_score:
        highest_score = x [0]
        highest_combi = x[2]
        poll_rating = x[1]
print(f'Hoogste score: {highest_score}.')
print(f'Gebruikte combo: {highest_combi}.')
print(f'Poll rating: {poll_rating}.')


