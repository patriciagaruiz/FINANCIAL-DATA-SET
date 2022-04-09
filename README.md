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

The bank offers services to the private sector. The services include managing accounts, offering loans, etc.


Warning: There is no information about account balance, revenue, investments and assets. 


<h1 align="left"> Tasks </h1>


<h1 align="left"> 1. Identify the bad clients that have to watch carefully to minimize the losses </h1>


![Image7](https://user-images.githubusercontent.com/99502330/162592623-00aee595-7327-4ebe-95cc-06fbc13c6d6d.jpg)

First of all, I check accounts with loan not payed. 

It is good when the bank has clients paying tax for using services but it is a bad signal when clients can not afford for them.

There are 31 loans not payed: € 4,362,348. It is 19% of € 22,965,564 (total loan with closed contracts).

![Graf5](https://user-images.githubusercontent.com/99502330/162592539-93636263-985f-4f01-9851-9e680e9c9f9d.png)


These loans are related to 31 distinct accounts (0,69% of 4,500 accounts) and refers to 31 distinct clients (0,58% of 5,369 clients).

At the present time, there are 11,217,804 loans with clients in debt. It is 13.97% of 80,296,176 (total loan running)

Fortunatelly there is no golden credit card for theses accounts (credit card service tax is higher than loan). There are only 2 credit cards associate to these bad accounts: 1 classic and 1 junior.

The district average salary could be considerated to set loan maximum payment. It is a safe condition calculate the loan payment under 60% the district average salary. There are 11 loans not payed in this situation . 

![Graf6](https://user-images.githubusercontent.com/99502330/162593673-5245936a-9012-4703-bac2-bf8c9b3084a2.png)


<h2 align="left"> Actions to minimize the losses </h2>


![Image9](https://user-images.githubusercontent.com/99502330/162592673-efcc9feb-6a56-4a7f-ac21-4eab35bce3b2.jpg)

1. Don't offer golden credic card to bad clients. Find out safety limit for ordinary credit card.

2. Set maximum payment to loan based on average salary

3. Control bad customers and offer services carefully


<h1 align="left"> 2. Identify the good clients to whom we can other services </h1>

Good clients have golden credit card.





What percentage of accounts have more than one client accessing the account? The disposition table, type column.
How much of the cards’ information is available in this database, and what are the different kinds of cards offered by the bank?
Where are most of the customers located (district)?



<h1 align="left"> Import File </h1>

The dataset has 25.723 lines and 24 columns.

Cleanned Dataset has 6.302 lines and 23 columns.

