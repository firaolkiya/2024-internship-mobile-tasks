class Product{
     String name,description;
    double price;

    void setName(String name)=>this.name =name;
    void setPrice(double price)=>this.price =price;
    void setDescription(String description)=>this.description =description;

    String getName(){
      return name;
    }
   

  Product({required this.name, required this.description, required this.price});
}
