// extension declare
extension EmptyText on String{
  String up() {
   return toUpperCase();
  }
  String lower() {
   return toLowerCase();
  }
}
void main(){
  print('object'.up());
  // run time error for dynamic variable
  dynamic b ='met';
  print(b.toString().up());
}