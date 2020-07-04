class Customer{
  int userIndex;
  String name;
  int balance;

  Customer(this.userIndex, this.name, this.balance) : assert(userIndex!=null && name!= null && balance != null);
}