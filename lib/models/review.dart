class Review {
  int? id;
  int? driverId;
  int? userId;
  int? rating;
  String? reviewDate;

  Review({this.id, this.driverId, this.userId, this.rating, this.reviewDate});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    userId = json['user_id'];
    rating = json['Rating'];
    reviewDate = json['review_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_id'] = this.driverId;
    data['user_id'] = this.userId;
    data['Rating'] = this.rating;
    data['review_date'] = this.reviewDate;
    return data;
  }
}
