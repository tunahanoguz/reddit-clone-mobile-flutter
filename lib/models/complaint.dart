class Complaint {
  final int id, complaintCategoryID, itemID;
  final String email, body;

  Complaint({this.id, this.complaintCategoryID, this.itemID, this.email, this.body});

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json["id"],
      complaintCategoryID: json["complaint_category_id"],
      itemID: json["item_id"],
      email: json["email"],
      body: json["body"],
    );
  }
}