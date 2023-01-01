import 'package:apprend/dto/UtilisateurDTO.dart';

class ElectionDTO {
  late int id;
  late int idCreateur;
  late String libele;
  late String description;
  late DateTime createdAd;
  late DateTime updatedAd;
  late String? image;

  late UtilisateurDTO utilisateur;

  ElectionDTO(this.id, this.idCreateur, this.libele, this.description,
      this.createdAd, this.updatedAd, this.image) {}

  ElectionDTO.utlisateur(this.id, this.idCreateur, this.libele,
      this.description, this.createdAd, this.updatedAd, this.image, l) {
    // ElectionDTO(this.id, this.idCreateur, this.libele, this.description, this.createdAd, this.updatedAd, this.image);
    this.utilisateur = UtilisateurDTO.partielle(l);
  }
}
