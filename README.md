# Repository-GIT---Ironhack
Repository GIT 
<h1 align="center"> SHARK ATTACK </h1>
<h1 align="center"> Data Cleaning and Manipulation </h1>




![ec108e76abc8ba235183e1043243f8c7](https://user-images.githubusercontent.com/99502330/161838073-aa87e39a-1afc-4459-9d06-b6a556085659.jpg)


<h1 align="left"> Main Objectives </h1>

Apply the different cleaning and manipulation techniques to generate a cleaner CSV version of this data.
Look for something you want to answer about shark attacks and try to answer that using data.

![Humans are friends!](https://user-images.githubusercontent.com/99502330/161834340-92521684-877f-495d-8df9-ec22bfacb2fc.jpg)

<h1 align="left"> The Datasets </h1>

The mission of the Global Shark Attack File is to provide current and historical data on shark/human interactions for those who seek accurate and meaningful information and verifiable references.
Dataset available at: https://www.kaggle.com/datasets/teajay/global-shark-attacks.


<h1 align="left"> Import File </h1>

The dataset has 25.723 lines and 24 columns.

<h1 align="left"> Heatmap before dropping duplicate values </h1>

![Heatmap_before](https://user-images.githubusercontent.com/99502330/161841837-245a2a81-1254-468b-85cd-5caeb78c776a.png)

<h1 align="left"> Heatmap after dropping duplicate values </h1>

![Heatmap_after](https://user-images.githubusercontent.com/99502330/161843475-aaa14977-13fe-4672-b22b-6c18c98d915e.png)


Cleanned Dataset has 6.302 lines and 23 columns.

<h1 align="left"> 1. Are there more fatal attacks? </h1>

This answer needs a clean column called: Fatal (Y/N).
First of all, I used 'groupby' to discovery the number of lines per value. It is returned: 2017, N, M, Y, y, UNKOWN.
I read the lines with values different from Y or N and changed the wrong values to Y, N or X (when it was impossible to discovery).

CONCLUSION: There are more no fatal attacks

Total Shark Attacks with Known Results: 5692 attacks

Fatal Shark Attacks: 1389 attacks / 24.4 %

No Fatal Shark Attacks: 4303 attacks / 75.6 %

*** Attacks with Unknown Results: 71 attacks / 1.23 % (not inside the previous analise)

![shaaark183](https://user-images.githubusercontent.com/99502330/161834643-751fe82d-f9d7-4b89-8836-52da63639d59.jpg)




<h1 align="left"> 2. Are more attacks for male or female? </h1>

This answer needs a clean column called: Sex.
First of all, I used 'groupby' to discovery the number of lines per value. It is returned: . , F, M, N, lli.
I read the lines with values different from M or F and changed the wrong values to M, F or X (when it was impossible to discovery).

CONCLUSION: There are more attacks for male victim


Total Shark Attacks with Known Gender: 5735

Male Shark Attacks: 5098 attacks / 88.89 %

Female Shark Attacks: 637 attacks / 11.11 %

*** Attacks with Unknown Results: 71 attacks / 1.23 % (not inside the previous analise)



![85d610852c2301f889912430ee9a947b](https://user-images.githubusercontent.com/99502330/161853751-2c5b4a7f-550a-43cc-a915-91474f60ead7.jpg)


<h2 align="left"> OTHERS CONCLUSIONS </h2>

Crossing valid lines for fatal attacks (5.692) and attacks for gender (5.735) I extract a double groupby:


![Graf2](https://user-images.githubusercontent.com/99502330/161857530-2012bd4d-8827-4c76-8333-6f1d98d11764.png)

<h1 align="left"> 3. Are shark attacks influenced by hemisphere? </h1>

This answer needs a clean column from main database called: Country.
However, this column does not give the information necessary to answer the question: if the country is at the Northern Hemisphere or Southern Hemisphere. I used a database of coordinates (latitude/longitude) for countries to find out this information. Dataset available at: https://www.kaggle.com/datasets/max-mind/world-cities-database.
I used 'unique' to discovery the values into main database (150 countries) and compare with the database of coordinates.
Countries after cleanning database: 

I read the lines with values different from M or F and changed the wrong values to M, F or X (when it was impossible to discovery).

CONCLUSION: There are more attacks for male victim


