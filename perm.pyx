def permute_iter(numbers, k):
    def generate_combinations(current_combination, start, progress_list):
        if len(current_combination) == k:
            sorted_combination = tuple(sorted(current_combination))
            if sorted_combination not in result:
                result.append(sorted_combination)
            return
        for i in range(start, len(numbers)):
            if not used[i]:
                used[i] = True
                current_combination.append(numbers[i])
                generate_combinations(current_combination, i + 1, progress_list)
                current_combination.pop()
                used[i] = False

                progress_list[0] += 1
                if progress_list[0] % 1000 == 0:
                    progress = progress_list[0] / 479001600 * 100
                    print(f'{progress:.2f}%, and on loop {progress_list[0]}')

    result = []
    used = [False] * len(numbers)
    loops = [0]
    generate_combinations([], 0, loops)
    return result