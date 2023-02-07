



class Driver{
  String ID;

  String Pic;
  String Name;
  String Desc;

  truck TruckData;

  Driver(this.ID, this.Pic, this.Name, this.Desc, this.TruckData);
}

class truck{
  String ID;

  String Plate;
  String TruckType;
  String Pic;

  truck(this.ID, this.Plate, this.TruckType, this.Pic);
}

class Rating{
  String ID;

  // ex: 4.6
  double Value;

  //Number of ratings
  double RatingNums;

  //Stars Nums
  double FiveStars;
  double FourStars;
  double ThreeStars;
  double TwoStars;
  double OneStar;

  Rating(this.ID, this.Value, this.RatingNums, this.FiveStars, this.FourStars,
      this.ThreeStars, this.TwoStars, this.OneStar);
}