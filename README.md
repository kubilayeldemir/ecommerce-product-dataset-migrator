Are you tired of creating dummy products and looking for a product dataset for your clone project?
If your answer is yes, you are at the right place.
Flipkart dataset is available on kaggle. We can use it for our clone project.

# What is Flipkart product dataset?
This is a pre-crawled dataset, taken as subset of a bigger dataset (more than 5.8 million products) that was created by extracting data from Flipkart.com, a leading Indian eCommerce store.
Link: [https://www.kaggle.com/PromptCloudHQ/flipkart-products]


## Features

- 20K products
- With properly leveled catalog information
- Products come with their images! There is a list of urls for each product (Some of the URL's are broken tho)

# What is ecommerce-product-dataset-migrator?
I was looking for a way to import all those products to use them for my clone e-commerce project. I have a MongoDb database for my product catalog microservice. MongoDb can import CSV files on it's own but it doesn't work properly with this dataset. So i created this python script to  import all the dataset to my database via using the product catalog service's POST Products Endpoint i already created. Briefly:
#### This piece of code creates product objects for each line in the dataset and sends a POST request to a web service you create.

## Installation
- Clone the repository
- Download dataset from [kaggle](https://www.kaggle.com/PromptCloudHQ/flipkart-products). And put the .csv file (named: flipkart_com-ecommerce_sample.csv) to input folder of the project.
- Open the main.py file with your favourite ide and edit code according to your model/endpoint:
- Edit data object's field names  according to your product model.
- Edit URL of the Post request according to your web service post products end point.
## Running migration script
#### With Docker:
```sh
cd ecommerce-product-dataset-migrator
sudo docker build -t dataset-migrator .
sudo docker run --network="host" dataset-migrator
```
#### Without Docker:
- Install Python 3.x
- Run:
```sh
pip install requirements.txt
```

- Run main.py and wait it to end.

## Default Product Model
```java
    private String unique_id;
    private String URL;
    private String name;
    private List<String> category;
    private String description;
    private String brand;
    private int retailPrice;
    private int discountedPrice;
    private int stock;
    private List<String> images;
```
### POST ​/api​/products

```json
[
  {
    "brand": "string",
    "category": [
      "string"
    ],
    "description": "string",
    "discountedPrice": 0,
    "images": [
      "string"
    ],
    "name": "string",
    "retailPrice": 0,
    "stock": 0,
    "unique_id": "string",
    "url": "string"
  }
]
```


> Note: Instead of sending Http post requests, i tried creating a huge json file and import it to MongoDb but it didn't work with MongoDb.

> Note: You don't have to use MongoDb with your project.
## Extra Information
- There are so many products with a undefined brand field, i assigned those fields with 'Unknown'.
- retail_price and discounted_price field is multiplied by 0.013 because 1 rupee=0.013 US dollars.
- There is no stock data in dataset but i assigned a stock field which is a random number between 10-100
- Category field is a List of Strings.
- product_specifications field from dataset is not used.
- Pull requests welcome.
## Disclaimer
I don't own the dataset. You must download the dataset from  [kaggle](https://www.kaggle.com/PromptCloudHQ/flipkart-products) to use this script.
## License
MIT

   [kaggle]: <https://www.kaggle.com/PromptCloudHQ/flipkart-products>
   
   
