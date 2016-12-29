import re

# Compile the regular expression
REGEX = re.compile('([0-9]+):([0-9]+)')

class TinyTime(object):

    def __init__(self, time_string):
        parsed_time = REGEX.findall(time_string)
        if (len(parsed_time) != 1):
            raise Exception('Non-compliant strings not yet implemented')
        else:
            self.hour = int(parsed_time[0][0])
            self.minute = int(parsed_time[0][1])

        if (self.hour < 0) or (self.hour > 23):
            raise Exception('Times must be bound between 00:00 and 23:59. You gave hour: ' + str(self.hour))
        if (self.minute < 0) or (self.minute > 59):
            raise Exception('Minutes must be bound between 00 and 59. You gave minute: ' + str(self.minute))

    def __str__(self):
        if (self.minute == 0):
            return "{0}:{1}".format(self.hour, '00')
        else:
            return "{0}:{1}".format(self.hour, self.minute)

    def __sub__(self, other):
        hour_diff = self.hour - other.hour
        minute_diff = self.minute - other.minute
        if (minute_diff < 0):
            hour_diff -= 1
            minute_diff = 60 - abs(minute_diff)
        return TinyTime("{0}:{1}".format(hour_diff, minute_diff))

    def __add__(self, other):
        hour_sum = self.hour + other.hour
        minute_sum = self.minute + other.minute
        if (minute_sum >= 60):
            hour_sum += 1
            minute_sum -= 60
        return TinyTime("{0}:{1}".format(hour_sum, minute_sum))

    def __float__(self):
        return self.hour + (self.minute / 60)

    def __lt__(self, other):
        return float(self - other) < 0
    def __le__(self, other):
        return float(self - other) <= 0
    def __eq__(self, other):
        return float(self - other) == 0
    def __ne__(self, other):
        return float(self - other) != 0
    def __gt__(self, other):
        return float(self - other) > 0
    def __ge__(self, other):
        return float(self - other) >= 0

if __name__ == '__main__':

    a = TinyTime('12:30')
    print(a)

    b = TinyTime('2:45')
    print(b)

    d = a - b
    print(d)
    print(float(d))
    e = a + b
    print(e)
    print(float(e))
    print(a > b)
    print(a >= b)
    print(a == b)
    print(a != b)
    print(a < b)
    print(a <= b)
