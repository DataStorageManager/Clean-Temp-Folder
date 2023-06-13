import datetime
import pytz

def get_current_time(country):
    try:
        country_codes = {
            "US": "United States",
            "JP": "Japan",
            "IN": "India",
            "VN": "Vietnam",
            "CN": "China",
            "CA": "Canada"
        }

        timezone = pytz.country_timezones[country.upper()][0]
        tz = pytz.timezone(timezone)
        current_time = datetime.datetime.now(tz)
        country_name = country_codes[country.upper()]
        return f"{country_name}: {current_time.strftime('%Y-%m-%d %H:%M:%S %Z%z')}"
    except KeyError:
        return "Invalid country code or country does not exist."

# Examples
print(get_current_time("US"))  # United States
print(get_current_time("JP"))  # Japan
print(get_current_time("IN"))  # India
print(get_current_time("VN"))  # Vietnam
print(get_current_time("CN"))  # China
print(get_current_time("CA"))  # Canada
