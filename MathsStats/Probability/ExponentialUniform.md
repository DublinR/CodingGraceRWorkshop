
ProbabilityWithR


```R
###Exponential Distribution: Example}

dexp(0:10,rate=0.10)
```


<ol class="list-inline">
	<li>0.1</li>
	<li>0.0904837418035959</li>
	<li>0.0818730753077982</li>
	<li>0.0740818220681718</li>
	<li>0.0670320046035639</li>
	<li>0.0606530659712633</li>
	<li>0.0548811636094026</li>
	<li>0.049658530379141</li>
	<li>0.0449328964117222</li>
	<li>0.0406569659740599</li>
	<li>0.0367879441171442</li>
</ol>




```R
pexp(0:10,rate=0.10)
```


<ol class="list-inline">
	<li>0</li>
	<li>0.0951625819640404</li>
	<li>0.181269246922018</li>
	<li>0.259181779318282</li>
	<li>0.329679953964361</li>
	<li>0.393469340287367</li>
	<li>0.451188363905974</li>
	<li>0.50341469620859</li>
	<li>0.550671035882778</li>
	<li>0.593430340259401</li>
	<li>0.632120558828558</li>
</ol>



### The Uniform Distribution
In the last class, we had a look at the continuous uniform distribution. It is very useful in constructing simulations. Briefly we will look at some relevant ***R*** function.
The distribution has two parameters: i.e ``min`` and ``max``. 
(Here chosen as 5 and 10 respectively)




```R
# Generate Four Random Numberrunif(4, min=5,max=10)
```


```R
# Compute Density
dunif(4:11,min=5,max=10)
```


<ol class="list-inline">
	<li>0</li>
	<li>0.2</li>
	<li>0.2</li>
	<li>0.2</li>
	<li>0.2</li>
	<li>0.2</li>
	<li>0.2</li>
	<li>0</li>
</ol>




```R
#Compute distribution of
punif(4:11,min=5,max=10)
```


<ol class="list-inline">
	<li>0</li>
	<li>0</li>
	<li>0.2</li>
	<li>0.4</li>
	<li>0.6</li>
	<li>0.8</li>
	<li>1</li>
	<li>1</li>
</ol>


