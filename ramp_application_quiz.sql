/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

-- In the text box below, provide January 31's rolling 3 day average of total transaction amount processed per day and provide the link to your solution

select x.transaction_day
-- un-comment the following line to get the daily transaction amount
	 -- , x.daily_transaction_amt
	 , avg(daily_transaction_amt) over (order by transaction_day rows between 2 preceding and current row) 
    as three_day_rolling_avg
from (select date_trunc('day', transaction_time) as transaction_day
      	   , sum(transaction_amount) as daily_transaction_amt
      from transactions
      group by transaction_day) as x
-- comment out the next two lines to get each dates 3 day rolling average!
order by x.transaction_day desc
limit 1
