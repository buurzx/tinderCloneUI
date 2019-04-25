final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      "assets/photo_1.jpg",
      "assets/photo_2.jpg",
      "assets/photo_3.jpg",
      "assets/photo_4.jpg",
    ],
    name: "Gross person",
    bio: "You better swpe left",
  ),
  new Profile(
    photos: [
      "assets/photo_2.jpg",
      "assets/photo_3.jpg",
      "assets/photo_4.jpg",
      "assets/photo_1.jpg",
    ],
    name: "Someone Special",
    bio: "This is the person you want",
  ),
];

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}
