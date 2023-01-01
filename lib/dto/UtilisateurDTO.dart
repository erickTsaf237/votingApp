


class UtilisateurDTO{

  late int id;
  late String nom;
  late String prenom;
  late String email;
  late String password;
  late String? image;
  late String numero;
  late DateTime dateNaissance = DateTime(2001);
  late DateTime createdAt;
  late DateTime updatedAt;
   static int nombre = 0;

  UtilisateurDTO.Allvalues(
      this.id,
      this.nom,
      this.prenom,
      this.email,
      this.password,
      this.image,
      this.numero,
      this.dateNaissance,
      this.createdAt,
      this.updatedAt
      ){

  }

  UtilisateurDTO(){
    this.id = nombre;
    this.nom = "${nombre}sdjoq";
    this.prenom = " sisdffids";
    this.email ="sdjosdjodqj";
    this.password = "mks sdsd";
    this.image = "http://localhost/images/defaultElection.png";
    this.numero = "dmjonsofsdksd";
    nombre++;
  }

  UtilisateurDTO.partielle(l){
    nom = l['nom'];
    prenom = l['prenom'];
    email = l['email'];
    image = l['image']==null?"http://localhost/images/defaultUser.png":l['image'];
    numero = l['numero'];
  }
}