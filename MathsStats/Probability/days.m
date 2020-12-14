% DAYS
% Prompts user to input the month number
% Outputs the number of days in the selected month.
% Performs simple checks on user input
clear
ok=false;
while ~ok
    month = input('Give month number (1-12): ' );
    if isnumeric(month)&& (round(month)==month)&&(1 <=month) &&(month <=12)
        ok=true;
    end
end
if month==1 | month==3 | month ==5 | month==7 ...
        | month==10 |  month==12
    'Your month has 31 days'
else
    if month==2
        'Your month has 28 days'
    else
        'Your month has 30 days'
    end
end
