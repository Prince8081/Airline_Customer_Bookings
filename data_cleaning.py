import pandas as pd 

df = pd.read_csv('Airline_Customer.csv' , encoding= 'latin1')

# 1. Basic checks

# print('Shape :' , df.shape)
# print(df.info())
# print(df.isnull().sum())

df['booking_origin']= df['booking_origin'].fillna('Unknown')
df['route'] = df['route'].fillna('Unknown')


# For numeric columns – replace missing with median

cols = ['purchase_lead', 'length_of_stay', 'flight_hour', 'flight_duration']
for col in cols :
    if df[col].isnull().sum() > 0 :
        df[col] = df[col].fillna(df[col].median())


# Flight day → category

df['flight_day'] = df['flight_day'].astype('category')

# Time of day bucket

def flight_period(hour) : 
    if 5 <= hour < 12 : 
        return "Morning" 
    elif 12 <= hour < 17 :
        return "Afternoon"
    elif 17 <= hour < 21 : 
        return "Evening"
    else :
        return "Night"
    
df['flight_period'] = df['flight_hour'].apply(flight_period)
    
#  Convert 0/1 columns into Yes/No

binary_cols = ['wants_extra_baggage', 'wants_preferred_seat','wants_in_flight_meals','booking_complete']

for col in binary_cols : 
    if col in df.columns:
        df[col] = df[col].map({1 : 'Yes', 0 : 'No'})

print(df.head(20))

#  Save cleaned dataset

df.to_csv("Airline_Customer_Cleaned.csv", index=False)