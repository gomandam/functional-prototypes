/*
Loops
Loops can execute a block of code as long as a specified condition is reached.

Loops are handy because they save time, reduce errors, and they make code more readable.

While Loop
The while loop loops through a block of code as long as a specified condition is true:

Syntax
while (condition) {
  // code block to be executed
}
In the example below, the code in the loop will run, over and over again, as long as a variable (i) is less than 5:

Example
int i = 0;

while (i < 5) {
  printf("%d\n", i);
  i++;
}
  
Note: Do not forget to increase the variable used in the condition (i++), otherwise the loop will never end!

Do you wonder why we use the letter i as a variable name? It's a counter variable and a common choice in simple loops because it's short, traditional, and stands for 'index' or 'iterator'.
*/ 