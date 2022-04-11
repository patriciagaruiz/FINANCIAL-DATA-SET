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


Warning: There is no information about clients' incomes, investments and assets. 


<h1 align="left"> Tasks </h1>


<h1 align="left"> 1. Identify the bad clients, watching them carefully in order to minimize the losses </h1>


![Image7](https://user-images.githubusercontent.com/99502330/162592623-00aee595-7327-4ebe-95cc-06fbc13c6d6d.jpg)

First of all, I have checked accounts with non payed loan. 

It is good when the bank has clients paying tax for using services but it is a bad signal when clients can not afford paying them.

There are 31 loans that were not payed: € 4,362,348. It is 19% of € 22,965,564 (total loan with expired contracts).

![Graf5](https://user-images.githubusercontent.com/99502330/162592539-93636263-985f-4f01-9851-9e680e9c9f9d.png)


These loans are related to 31 distinct accounts (0,69% of 4,500 accounts) and reffers to 31 distinct clients (0,58% of 5,369 clients).

As of now, there are € 11,217,804 loans with clients in debt. It is 13.97% of € 80,296,176 (total valid loan).

Fortunately there is no golden credit card for theses accounts (credit card service tax is higher than loan). There are only 2 credit cards associate to these bad accounts: 1 classic and 1 junior.

![Graf8](https://user-images.githubusercontent.com/99502330/162595684-34a2297a-8204-4cc3-9e91-03db6425483f.png)



The average district salary could be considered as a reference to determine the loan payments. A conservative approach it would be considering maximum of 50% of the average district salary to define the loan payment. There are 18 loans that were not payed which the payment amount it is over 50% of the average district salary. 

Transaction database stores balance after transaction. I used this information to discover account balance (max(date) by account).

I split accounts based on different amount ranges: LOW_SCORE (negative balance), REGULAR (up to € 40.000), GOOD (up to € 80,000) and VIP (above € 80,000).



![Graf9](https://user-images.githubusercontent.com/99502330/162641892-71c81e97-26e1-462d-907c-7f55938e641d.png)

<h2 align="left"> Actions to minimize the losses </h2>


![Image9](https://user-images.githubusercontent.com/99502330/162592673-efcc9feb-6a56-4a7f-ac21-4eab35bce3b2.jpg)

1. Don't offer golden credic card to bad clients. Find out safe limit for ordinary credit card.

2. Define maximum payment to loan based on average district salary.

3. Monitor bad customers and offer services carefully.


<h1 align="left"> 2. Identify the good clients to whom we can offer other services </h1>


The bank has 892 credit cards: 659 (classic), 145 (junior) and 88 (gold).


![Graf7](https://user-images.githubusercontent.com/99502330/162594186-8a9f6fdb-73ff-4c78-a98c-e5872ab9c835.png)

There are 496 VIP accounts with only 65 credit cards: 7 'gold', 47 'classic' and 11 'junior'.

There are 1,662 GOOD accounts with 220 credit cards: 26 'gold', 167 'classic' and 27 'junior'.

There are 2,305 REGULAR accounts with 337 credit cards: 32 'gold', 253 'classic' and 52 'junior'

There are 39 LOW SCORE accounts with 6 credit cards: 5 'classic' and 1 'junior'.

![Graf10](https://user-images.githubusercontent.com/99502330/162792995-d5adf611-d7c0-4074-bda1-0ce00d8cb1ce.png)




<h2 align="left"> Actions to maximize profit </h2>

1. Offer golden credic card to VIP clients. There is a big opportunity since less then 13.10 % of theses clients have credit card. And 89.23% of these cards are 'junior' or 'classic', so the bank could offer an upgrade for gold credit card.

2. Offer credic card to GOOD clients. There is a another big opportunity since less then 13.24 % of theses clients have credit card. It means that there are 1,442 good accounts without credit card. Analyse if it is possible offer an upgrade for gold credit card for some of them.

3. Identify potencial regular clients to offer credit card. There are 1,968 regular accounts (85.38%) without credit cards. 

4. There are 32 gold credit card related to regular clients. Check if it is necessary a downgrade for 'junior' or 'classic' credit card.

5. Most of the customers are located in Hl.m.Praha. There is an opportunity to focus effort and monitor customer satisfaction. 
1st. Hl.m. Praha	- 663 accounts
2nd. Ostrava - mesto	- 180 accounts
3rd. Karvina	- 169 accounts



