# Repository-GIT---Ironhack
Repository GIT 
<h1 align="center"> FINANCIAL DATA SET </h1>

![Image1](https://user-images.githubusercontent.com/99502330/162427935-e6ee1c11-9598-4468-a260-2f4fe35b32c6.jpg)


<h1 align="left"> Objectives </h1>

The bank stores information about the clients, including accounts held, transactions over the last few months, loans granted, cards issued, etc. 
The bank managers hope to improve their understanding of customers and seek specific actions to improve services.


![Image8](https://user-images.githubusercontent.com/99502330/162427411-4151cfd3-bb82-499d-8ab9-f4781704c8c3.jpg)

<h1 align="left"> Dataset </h1>

The data provided is real anonymized Czech bank transactions, account info, and loan records released for the PKDD'99 Discovery Challenge.


<h1 align="left"> Scenario </h1>

he bank offers services to the private sector. The services include managing accounts, offering loans, etc.



<h1 align="left"> Tasks </h1>

![Image2](https://user-images.githubusercontent.com/99502330/162428029-872af08f-f8b0-45c5-b9b9-94fe11b07ab5.jpg)


<h2 align="left"> Identify the bad clients that have to watch carefully to minimize the losses </h2>

First of all, I check accounts with loan not payed. 
It is good when the bank has a client paying tax for using services but it is a bad signal when a client can not afford for them.



<h2 align="left"> Identify the good clients to whom we can other services </h2>

.
.
What percentage of accounts have more than one client accessing the account? The disposition table, type column.
How much of the cards’ information is available in this database, and what are the different kinds of cards offered by the bank?
Where are most of the customers located (district)?


![Humans are friends!](https://user-images.githubusercontent.com/99502330/161834340-92521684-877f-495d-8df9-ec22bfacb2fc.jpg)


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


