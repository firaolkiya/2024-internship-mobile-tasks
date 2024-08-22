
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   
    

     final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');
    final js = {'name':dummyUser.name,'email':dummyUser.email,'password': dummyUser.password};
   test('should return json', () {

     final res = dummyUser.toJson();

     expect(res, js);

   },);

   test('should return user model', () {
    
     final res = UserModel.fromJson(js);
     expect(res, dummyUser);

   },);

}