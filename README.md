# Backend coding challenge
This help to calculate how much money should be disbursed to each merchant based on the following rules:

* Disbursements are done weekly on Monday.
* We disburse only orders which status is completed.
* The disbursed amount has the following fee per order:
  * 1% fee for amounts smaller than 50 €
  * 0.95% for amounts between 50€ - 300€
  * 0.85% for amounts over 300€

### Task Done
* Create the necessary data structures and a way to persist them for the provided data by following the (provided schema)[https://www.dropbox.com/s/wms8dlqzs6bqkul/backend%20challenge%20dataset.zip?dl=0]
* Calculate and persist the disbursements per merchant on a given week. As the calculations can take some time it should be isolated and be able to run independently of a regular web request, for instance by running a background job.
* Create an API endpoint to expose the disbursements for a given merchant on a given week. If no merchant is provided return for all of them.


### MERCHANTS

```
ID | NAME                      | EMAIL                             | CIF
1  | Treutel, Schumm and Fadel | info@treutel-schumm-and-fadel.com | B611111111
2  | Windler and Sons          | info@windler-and-sons.com         | B611111112
3  | Mraz and Sons             | info@mraz-and-sons.com            | B611111113
4  | Cummerata LLC             | info@cummerata-llc.com            | B611111114
```

### SHOPPERS

```
ID | NAME                 | EMAIL                              | NIF
1  | Olive Thompson       | olive.thompson@not_gmail.com       | 411111111Z
2  | Virgen Anderson      | virgen.anderson@not_gmail.com      | 411111112Z
3  | Reagan Auer          | reagan.auer@not_gmail.com          | 411111113Z
4  | Shanelle Satterfield | shanelle.satterfield@not_gmail.com | 411111114Z
```

### ORDERS

```
ID | MERCHANT ID | SHOPPER ID | AMOUNT | CREATED AT           | COMPLETED AT
1  | 25          | 3351       | 61.74  | 01/01/2017 00:00:00  | 01/07/2017 14:24:01
2  | 13          | 2090       | 293.08 | 01/01/2017 12:00:00  | nil
3  | 18          | 2980       | 373.33 | 01/01/2017 16:00:00  | nil
4  | 10          | 3545       | 60.48  | 01/01/2017 18:00:00  | 01/08/2017 15:51:26
5  | 8           | 1683       | 213.97 | 01/01/2017 19:12:00  | 01/08/2017 14:12:43
```

## Instructions
* Please read carefully the challenge and if you have any doubt or need extra info please don't hesitate to ask us before starting.
* You shouldn't spend more than 3h on the challenge.
* Design, test, develop and document the code. It should be a performant, clean and well structured solution. Then send us a link or a zip with a git repo.
* You should consider this code ready for production as it were a PR to be reviewed by a colleague. Also commit as if it were a real assignment.
* Remember you're dealing with money, so you should be careful with related operations.
* Create a README explaining how to setup and run your solution and a short explanation of your technical choices, tradeoffs, ...
* You don't need to finish. We value quality over feature-completeness. If you have to leave things aside you can mention them on the README explaining why and how you would resolve them.
* You can code the solution in a language of your choice, here are some technologies we are more familiar with (no particular order): JavaScript, Ruby, Python, Go, Elixir, Java, Scala, PHP.
* Your experience level will be taken into consideration when evaluating.

