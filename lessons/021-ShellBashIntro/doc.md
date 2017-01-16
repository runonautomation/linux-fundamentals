#### Shell scripting basics
##### IO redirection for scripting 
###### Output redirection with > and >> and |
Descriptors - 
standard input: 0 
standard output: 1 
standard error: 2

```
echo HELLO > world.txt
echo HELLO3 >> world.txt
cat world.txt | tail -n 1
```

##### Combining commands
- Multi-line command
```
echo \
> hello
```
- Multi-command
```
ping tttttttttttt.com -c 1; echo world; echo now
```
- Sequential commands execution and bash _OR_
```
ping localhost -c 1 && echo SUCCESS
ping localhost -c 1 || echo FAILED && echo COMPLETE
ping tttttttttttt.com -c 1 || echo FAILED && echo COMPLETE
```

##### Getting command output 

#### Shell scripts 

```
#!/bin/bash
echo $USER
```

THis indicates that the script should be run in the bash shell regardless of which interactive shell the user has chosen. (Users)
$USER - variables. 

##### Variables
```
VAR="hello"
VAR=hello
X=hello world # error
$VAR

Substitutions:
echo "${X}abc"
```

##### Functions

```
f1 ()
{
  echo "f1 $1 $2"
  f2
}
f2 ()
{
  echo "f2 - number of arguments: $#, arguments: "$@""
}
f1 hello world
f1 hi
f2 one two 3 4 5 six seven
f2 one two
echo DONE
```

#####  Conditionals, if/then/elif

Our destiny is not predefined

```
if condition
then
	statement1
	statement2
	..........
else
	statement3
fi
```

###### Test
#######[ operand1 operator operand2 ] #SPACE IS IMPORTANT

The statements inside the block between if/elif and the next elif or fi are executed if the corresponding condition is true. Actually, any command can go in place of the conditions, and the block will be executed if and only if the command returns an exit status of 0 (in other words, if the command exits "succesfully" ). However, in the course of this document, we will be only interested in using "test" or "[ ]" to evaluate conditions.

```
#!/bin/bash
X=3
Y=4
empty_string=""
if [ $X -lt $Y ]	# is $X less than $Y ? 
then
	echo "\$X=${X}, which is smaller than \$Y=${Y}"
fi
```

Shortened test
```
if [ -n "$empty_string" ]; then
	echo "empty string is non_empty"
fi
```

Example nested: 
```
if [ -e "${HOME}/.fvwmrc" ]; then 			# test to see if ~/.fvwmrc exists
	echo "you have a .fvwmrc file"
	if [ -L "${HOME}/.fvwmrc" ]; then 		# is it a symlink ?
		echo "it's a symbolic link
	elif [ -f "${HOME}/.fvwmrc" ]; then 	# is it a regular file ?
		echo "it's a regular file"
	fi
else
	echo "you have no .fvwmrc file"
fi
```

Base operators:
```
-n	operand non zero length
-z	operand has zero length
-d	-f there exists a directory or file whose name is operand
-eq -neq	the operands are integers and they are equal/not equal
=/ !=	the operands are equal/not equal (as strings)
-lt -gt -ge -le	comparison operators
```


##### Loops

```
#!/bin/bash
for ACTION in smoke drink learn
do
	echo $ACTION
done
```

Globbing in for loops
```
for X in *; do echo $X; done
```


##### While Loops

While loops repeat until while condition is still met. 

```
#!/bin/bash
X=0
while [ $X -le 20 ]
do
	echo $X
	X=$((X+1))
done
```

##### Command Substitution

Command Substitution is a very handy feature of the bash shell. It enables you to take the output of a command and treat it as though it was written on the command line. For example, if you want to set the variable X to the output of a command, the way you do this is via command substitution.

There are two means of command substitution: brace expansion and backtick expansion.

```
files=$(ls)
files2=`ls`
echo $files
echo $files2
```

##### BASH4 Associative arrays
```
declare -A aa
aa[hello]=world
aa[ab]=cd

for i in "${!aa[@]}"
do
  echo "key  : $i"
  echo "value: ${aa[$i]}"
done
```

##### Traps
```
#!/bin/bash
scratch=$(mktemp -d -t tmp.XXXXXXXXXX)
function finish {
  rm -rf "$scratch"
}
trap finish EXIT
```