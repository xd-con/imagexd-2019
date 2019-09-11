import yaml

data = yaml.safe_load(open('site/config.yml', 'r'))

table_head = [
    '| Time  | Slot                      | Presenter    |',
    '| ----- | ------------------------- | ------------ |'
]

schedule = []

for day in data['params']['Schedule']:
    schedule += ['### ' + day['day'] + '\n']
    schedule.extend(table_head)

    for slot in day['slots']:
        field = lambda k: slot.get(k, '')
        line = f'| {field("time")} | {field("name")} | {field("presenter")} |'
        schedule.append(line)

    schedule += ['']

print('\n'.join(schedule), end='')
