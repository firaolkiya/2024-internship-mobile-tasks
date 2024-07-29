
import 'product.dart';

class ProductManager{
   final List<Product> productList = [];

   String addProduct(String name,double price, String description){
         if(price<0||description.isEmpty||name.isEmpty){
          return "something is wrong";
         }
          productList.add(Product(name: name, description: description, price: price));
          return "Succesfully added";
   }
   List<Product> viewAllProduct(){
          return productList;
   }
   
   Product getProduct(int index){
         if(index>=0 && index<productList.length){

         return productList[index];
         }
         return Product(name: "", description: "", price: 0);
   }

   String updateName(int index,String name){
     
        if(index>=0 && index<productList.length){
              productList[index].setName(name);
              return 'Succesfully updated';

         }
         return 'Something is wrong';

   }

    String updatePrice(int index,double price){
       if(index>=0 && index<productList.length || price<0){
           productList[index].setPrice(price);
              return 'Succesfully updated';

         }
         return 'Something is wrong';
    
   }

    String updateDescription(int index,String description){
       if(index>=0 && index<productList.length){
            productList[index].setDescription(description);
              return 'Succesfully updated';

         }
         return 'Item not found';
    
   }
    String deleteProduct(int index){
       if(index>=0 && index<productList.length){
            productList.removeAt(index);
              return 'Succesfully updated';

         }
         return 'Item not found';
   }
   

}
