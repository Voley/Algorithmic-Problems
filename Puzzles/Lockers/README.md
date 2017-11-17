# 100 Lockers
There are 100 closed lockers in a hallway. A man begins by opening all 100 lockers. Next, he closes every second locker. Then, on his third pass, he toggles every third locker (closes it if it is open or opens it if it is closed). This process continues for 100 passes, such that on each pass i, the man toggles every ith locker. After his 100th pass in the hallway, in which he toggles only locker #100, how many lockers are open?

# Solutions:
Each door is toggled every round that is its factor.
Thus doors that are perfect squares (9, 16, 25...) will be toggled odd number of times.
Other doors will be toggled even number of times.
The doors that are perfect squares will be left open.

# Swift

# Installation
Run `make` to build and run Swift files. Or you can run `.playground` file.