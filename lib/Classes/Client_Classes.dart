
//Client Is the user (Who Order The drive)
class Client{
  String ID;

  String Name;
  String Email;
  PhoneNumber Number;
  String ProfilePic;

  Client(this.ID, this.Name, this.Email, this.Number, this.ProfilePic);
}

class PhoneNumber{
  String CountryCode;
  String Number;

  PhoneNumber(this.CountryCode, this.Number);

  String SayPhoneNumber(){
    return this.CountryCode+this.Number;
  }
}