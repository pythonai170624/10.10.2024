

# pip install matplotlib !!!

import matplotlib.pyplot as plt
import numpy as np

# Data
labels = ['Category A', 'Category B', 'Category C', 'Category D']
sizes = [25, 35, 20, 20]
colors = ['gold', 'yellowgreen', 'lightcoral', 'lightskyblue']
explode = (0.1, 0, 0, 0)  # To "explode" the first slice

# Create a pie chart
fig, ax = plt.subplots()
ax.pie(sizes, explode=explode, labels=labels, colors=colors, autopct='%1.1f%%',
       shadow=True, startangle=90)

# Equal aspect ratio ensures that the pie chart is drawn as a circle.
ax.axis('equal')

# Add a headline
ax.set_title("Distribution of Categories")

# Show the plot
plt.show()
