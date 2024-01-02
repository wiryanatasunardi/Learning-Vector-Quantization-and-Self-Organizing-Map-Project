# Linear-Vector-Quantization-and-Self-Organizing-Map-Project

Self-Organizing Map (SOM) is an unsupervised learning method employed for dimension reduction. It is commonly utilized to generate a representative mapping for the low-dimensional representation of a dataset originally characterized by high dimensionality. The Self-Organizing Map falls under the category of unsupervised learning, as its primary outcome is a map designed to represent the clustering of a dataset visually. This map serves as a tool to visualize and understand the inherent structure or patterns within the data, aiding the identification and exploration of clusters or groupings present in the dataset.

Learning Vector Quantization (LVQ) stands as an Artificial Neural Network paradigm drawing inspiration from the intricate workings of biological neural systems. The LVQ algorithm is founded upon the prototype of a classification algorithm derived from supervised learning principles, employing a training method rooted in the competitive learning algorithm. Specifically designed to address multiclass classification challenges, the Learning Vector Quantization modelling algorithm is a valuable tool in discerning patterns and relationships within complex datasets.

The architecture of Learning Vector Quantization comprises two distinct layers, featuring both an input layer and an output layer. This layered structure facilitates the processing of information, with the input layer receiving the raw data and the output layer producing a refined output indicative of the classification or pattern recognition achieved through the learning process. As a result, Learning Vector Quantization serves as an effective and versatile approach for tasks requiring the nuanced classification of data into multiple classes.

## The Training Method of Self Organizing Map (SOM) and Learning Vector Quantization (LVQ)


The dataset employed in this project is the Iris Dataset, comprising 150 data points. Throughout the Learning Vector Quantization (LVQ) training process, given that LVQ operates as a supervised learning method, the network undergoes training by being presented with inputs in the form of training patterns representing the various classes. These training patterns are derived from the initial distribution of output classes, providing the network with labelled examples to learn from. Subsequent to the training phase, Learning Vector Quantization employs this acquired knowledge to classify input vectors by associating them with the appropriate output class. In essence, the input vector is mapped to the corresponding output unit, reflecting the class to which it has been classified based on the learning achieved during the training process.

## Training Process Parameters for Self-Organizing Map and Learning Vector Quantization

In order to obtain meaningful results from the training processes of Self Organizing Map (SOM) and Learning Vector Quantization (LVQ), it is crucial to determine and set the parameters outlined below carefully:

### 1. Initialize The Initial Weight

The initialization of the weight is a critical step in both SOM and LVQ training processes. Two common approaches are:

- **Random Method:** Initialize weights randomly based on the training data. This approach introduces a level of stochasticity to the model.

- **Representative Vector:** Alternatively, weights can be initialized using a representative vector from each class in the training data. This approach provides a more structured initialization based on class characteristics.

### 2. Initialize The Learning Rate

The learning rate, denoted as α, is a vital parameter influencing the convergence and stability of the optimization process during training. It determines the number of steps taken to adjust the model parameters during each iteration. Consider the following points:

- A **larger learning rate** facilitates quicker convergence but raises the risk of overshooting optimal values. This can lead to oscillations or instability in the optimization process.

- Conversely, a **smaller learning rate** may result in slow convergence or the algorithm getting stuck in a local minimum. Finding an appropriate balance is essential for effective training.

### Important Note:

- **Parameter Tuning:** The values chosen for weight initialization and learning rate are critical aspects of hyperparameter tuning. Different tasks and datasets may require different values to achieve optimal performance.

- **Experimentation:** It is often beneficial to experiment with different combinations of these parameters during the model development phase to identify the most effective setup for a specific problem.

Adjusting these parameters thoughtfully is integral to achieving successful training outcomes in both SOM and LVQ, ultimately leading to accurate and robust models.

### 3. Initialize The Training Process for Every Input Vector

- **Calculate the Euclidean Distance:**
  - The Euclidean distance serves as a measure of dissimilarity or similarity between the input vector and the representative vector for each class. This calculation is fundamental in determining the classification of a data point to its respective class during the training process.
  
  - **Euclidean Distance Equation:** One common method involves using the Euclidean Distance equation to quantify the spatial separation between the input vector and the representative vector.

    ![Euclidean Distance](https://github.com/wiryanatasunardi/Learning-Vector-Quantization-and-Self-Organizing-Map-Project/blob/main/documentation/Euclidean%20Distance.jpg)

  - **Squared Euclidean Distance Equation:** Alternatively, the Squared Euclidean Distance equation can also be employed. Squaring the distances can provide greater emphasis on larger deviations, influencing the classification decision.
    
  - **Update The Representative Vector:**
    During the training process, it is essential to update the representative vector continuously. Specific provisions guide this update to ensure the model's accuracy and adaptability. The key considerations for updating the representative vector are as follows:
  - **Maintain Proximity for Misfits:**
    - If the output class does not align with the target class, adjustments are made to keep the data point at a distance from the target class. This ensures that the model recognizes and corrects misclassifications by maintaining separation from the incorrect class.

  - **Adjust Proximity for Fits:**
    - Conversely, when the output class accurately corresponds to the target class, the data point is brought closer to the target class. This adaptation reinforces correct classifications, allowing the model to capture better the patterns associated with the target class.

    These dynamic updates to the representative vector enable the model to refine its understanding of class relationships iteratively, enhancing its ability to classify data points over successive training iterations accurately.
    

### Important Considerations:

- **Classification Outcome:** The calculated distance is pivotal in assigning a class label to the input vector. Smaller distances indicate proximity to a particular class, influencing the classification outcome.

- **Algorithm Specifics:** The choice between Euclidean Distance and Squared Euclidean Distance depends on the specifics of the algorithm being used and the characteristics of the dataset.

- **Fine-tuning:** Experimentation with different distance calculation methods may be necessary to optimize the training process for specific tasks or datasets.

This step in the initialization process ensures that the model can appropriately categorize input vectors based on their proximity to representative vectors, laying the groundwork for accurate and effective learning. 

### 4. Update The Learning Rate and Epoch

Upon completing the training process, adjustments to the learning rate α and epoch are crucial for optimizing the model's performance over successive iterations. The updates are governed by the following equations :

**epoch = epoch + 1**
**α(t+1) = βα(t)**

where β is a scaling factor. These equations dictate that the epoch is incremented by 1, signifying the completion of another training iteration. Simultaneously, the learning rate for the next iteration (t + 1) is determined by scaling the current learning rate ((α(t)) using the factor β.

Following the update of the learning rate and epoch, a critical step is assessing the training process's stop condition. This evaluation is necessary based on either the cumulative sum of epochs or the specific value of the learning rate. The stop condition serves as a criterion to determine whether the model has reached a satisfactory state, facilitating a controlled and effective conclusion to the training process.
