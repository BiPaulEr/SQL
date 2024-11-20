import csv
from faker import Faker

# Initialize the Faker generator
fake = Faker()

# Specify the number of fake addresses to generate
num_addresses = 800000  # You can change this to the desired number of addresses

# Create a CSV file to store the fake addresses
with open('fake_addresses.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    # Define the fieldnames for the CSV
    fieldnames = ['street_number', 'street', 'unit', 'postcode', 'longitude', 'latitude']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    # Write the header row
    writer.writeheader()

    # Generate fake addresses
    for _ in range(num_addresses):
        street_number = fake.building_number()
        street = fake.street_name()
        unit = fake.secondary_address()  # Optional unit number
        postcode = fake.zipcode()
        longitude = fake.longitude()
        latitude = fake.latitude()

        # Write the fake address to the CSV
        writer.writerow({
            'street_number': street_number,
            'street': street,
            'unit': unit,
            'postcode': postcode,
            'longitude': longitude,
            'latitude': latitude
        })

print(f"{num_addresses} fake addresses generated and saved to 'fake_addresses.csv'.")
