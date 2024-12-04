POS_SAFE = [1, 2, 3]
NEG_SAFE = [-1, -2, -3]  

def report_is_safe(report, diff=None):
    if len(report) == 1:
        return True

    if diff is None:
        diff = report[1] - report[0]

    if diff == 0:
        return False

    if diff > 0:
        if diff in POS_SAFE:
            next_diff = report[1] - report[0]
            if next_diff in POS_SAFE:
                return report_is_safe(report[1:], next_diff)
            else:
                return False
        return False 

    elif diff < 0:
        if diff in NEG_SAFE:
            next_diff = report[1] - report[0]
            if next_diff in NEG_SAFE:
                return report_is_safe(report[1:], next_diff)
            else:
                return False
        return False 

    return True 

def main(reports):
    report_list = []
    with open(reports, "r") as file:
        while line := file.readline():
            report_list.append(list(map(int, line.split())))

    safe_count = 0
    for report in report_list:
        if report_is_safe(report):
            safe_count += 1

    print(f'Safe reports: {safe_count}')

main("input.txt") 
