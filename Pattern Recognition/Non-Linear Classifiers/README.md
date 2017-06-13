# Non-Linear Classifiers

## 4.2

**a.** *Run the standard backpropagation algorithm with lr = 0.01 and 2,4,
and 15 first layer nodes, for 1000 iterations, using the data set (X1, y1)
as training set.*

**b.** *Evaluate the performance of the designed neural networks for both
(X1, y1) (training set) and (X2, y2) (test set) and plot the decision
regions (use lh = lv = -10, uh = uv = 10, rh = rv = 0.2).*

**Solution (a and b) Results of standard back propagation algorithm:**

**i)** Using Data Set (X1, y1) with mu = 0.01, num_epochs = 1000, and num_nodes = 2
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>58.75%</td> <td>58.00%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_i_1.png" height="200" /></td> 
</tr>
<tr> 
<td>2</td> <td>26.25%</td> <td>26.75%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_i_2.png" height="200" /></td> 
</tr>
<tr> 
<td>3</td> <td>26.75%</td> <td>27.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_i_3.png" height="200" /></td> 
</tr>
</table>

**ii)** Using Data Set (X1, y1) with mu = 0.01, num_epochs = 1000, and num_nodes = 4
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>11.25%</td> <td>12.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_ii_1.png" height="200" /></td> 
</tr>
<tr> 
<td>2</td> <td>3.25%</td> <td>3.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_ii_2.png" height="200" /></td> 
</tr>
<tr> 
<td>3</td> <td>1.75%</td> <td>2.75%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_ii_3.png" height="200" /></td> 
</tr>
</table>

**iii)** Using Data Set (X1, y1) with mu = 0.01, num_epochs = 1000, and num_nodes = 15
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>5.00%</td> <td>5.00%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_iii_1.png" height="200" /></td> 
</tr>
<tr> 
<td>2</td> <td>4.25%</td> <td>2.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_iii_2.png" height="200" /></td> 
</tr>
<tr> 
<td>3</td> <td>2.75%</td> <td>1.75%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_2_iii_3.png" height="200" /></td> 
</tr>
</table>

**c.** *Comment on the results.*
It is clear by exhaustive testing, that both the number of nodes and the number of times a given net is trained impact the accuracy of classification. But, there is little to no variation in the accuracy of classification between the second training run of the 4 node net and the second run of the 15 node net. This suggests that the neural networks optimal performance lies within a range of hidden nodes rather than the maximum that may be supported by a system.

## 4.3

**a.** *Run the backpropagation algorithm with 4 first layer nodes with (i)
lr = 0.01 for 300 iterations, (ii) lr = 0.001, for 300 iterations, (iii)
lr = 0.01, for 1000 iterations and (iv) lr = 0.001, for 1000 iterations,
using the (X1, y1) as training set*

**b.** *Evaluate the performance of the designed neural networks for both
(X1, y1) (training set) and (X2, y2) (test set) and plot the decision
regions.*

**Solution (a and b) Only Including Best Results:**

**i)** Using Data Set (X1, y1) with mu = 0.01, num_epochs = 300, and num_nodes = 4
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>23.75%</td> <td>25.75%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_3_i.png" height="200" /></td> 
</tr>
</table>

**ii)** Using Data Set (X1, y1) with mu = 0.001, num_epochs = 300, and num_nodes = 4
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>50.00%</td> <td>50.00%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_3_ii.png" height="200" /></td> 
</tr>
</table>

**iii)** Using Data Set (X1, y1) with mu = 0.01, num_epochs = 1000, and num_nodes = 4
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>12.00%</td> <td>12.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_3_iii.png" height="200" /></td> 
</tr>
</table>

**iv)** Using Data Set (X1, y1) with mu = 0.001, num_epochs = 1000, and num_nodes = 4
<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>43.00%</td> <td>43.75%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_3_iv.png" height="200" /></td> 
</tr>
</table>

**c.** *Comment on the results.*
both (ii) and (iv) exhibit sub-optimal classification performance. Misclassifying half of the training vectors and test vectors in the case of (ii) and nearly half in (iv). This is mostly due to learning rate. In both of these cases the learning rate is chosen to be too small a value, requiring a long wait time for convergence. (i) and (iii)’s out performance of (ii) and (iv) is due to a more manageable learning rate. (iii)’s greater number of epochs lends to its outperformance of (i).

## 4.4

**a.** *Run the adaptive learning rate variation of the backpropagation algo-
rithm with lr = 0.001, lr_inc = 1.05, lr_dec = 0.7, max_perf _inc =
1.04, for 300 iterations.*

**b.** *Evaluate the performance of the designed neural networks for both
(X1, y1) (training set) and (X2, y2) (test set) and plot the decision
regions.*

**Solution (a and b):** an if statement was added to the nn_ex function that adds the requested values of lr_inc, lr_dec and max_perf_inc to the net object if traingda is passed as an argument. Since the number of nodes is a required parameter for the pattern net function call used to instantiate the object using traingda, the number of nodes was chosen to be 4

<table style="width:100%">
<tr><th>Training Run</th> <th>Error w/ X1</th> <th>Error w/ X2</th> <th>Decision Regions</th></tr>
<tr> 
<td>1</td> <td>0.25%</td> <td>0.25%</td> 
<td><img src="https://github.com/cyw214/Machine-Learning/blob/master/Pattern%20Recognition/Non-Linear%20Classifiers/plot/4_4.png" height="200" /></td> 
</tr>
</table>

**c.** *Comment on the results.*
The adaptive learning rate delivers better performance than gradient decent. This is, in part, due to the fact that the adaptive learning rate algorithm modulates the learning rate to prevent over fitting caused by too large a learning rate, or diminished performance caused by too small a learning rate.



