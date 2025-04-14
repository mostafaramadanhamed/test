void main(){

  //? calculate students degree from list
  num sumOfDegrees(List<num> degrees){
    num sum=0;
    for(int i=0; i<degrees.length;i++){
      sum+=degrees[i];
    }
    return sum;
  }
  List <num> dg=[10,8.5,9,10,2,3.7];
print(sumOfDegrees(dg));
//? print std name longer than 5
List<String> stdNames=['mostafa','mo','kp','ahmed','omar','ramadan'];
String name='';
for(name in stdNames){
  if(name.length>5){
    print(name.toUpperCase());
  }
}
}
