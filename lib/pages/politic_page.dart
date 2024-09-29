import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politique de Confidentialité'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Politique de Confidentialité',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 1 – Collecte des Informations Personnelles',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lors de l’achat sur notre boutique, nous recueillons les informations personnelles que vous nous transmettez, telles que votre nom, adresse et adresse e-mail. Lors de votre navigation, nous enregistrons également l\'adresse IP de votre appareil pour obtenir des détails sur votre navigateur et système d’exploitation.\n\n'
                  'Avec votre consentement, nous pourrions vous envoyer des courriels concernant notre boutique, nos produits et autres mises à jour. En fournissant votre numéro de téléphone lors de l\'achat ou de l\'abonnement, vous acceptez de recevoir des notifications SMS et des offres marketing. Vous pouvez vous désabonner à tout moment via le lien de désabonnement fourni.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 2 – Consentement',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'En fournissant vos informations pour une transaction, vous consentez à leur collecte et utilisation exclusivement dans ce cadre. Pour toute autre utilisation, nous demanderons votre consentement explicite. Vous pouvez retirer votre consentement à tout moment en nous contactant à sneakers@fe-store.pro.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 3 – Divulgation',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nous divulguerons vos informations personnelles uniquement si la loi l\'exige ou si vous enfreignez nos Conditions Générales de Vente et d\'Utilisation.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 4 – Hébergement',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Notre boutique est hébergée par LWS, avec une base de données MySQL incluse. Les fichiers front-end sont stockés sur Netlify et le nom de domaine est enregistré via GoDaddy.com. Vos données sont sécurisées par des mesures robustes.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),



            SizedBox(height: 16.0),
            Text(
              'Article 5 – Sécurité',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nous appliquons des pratiques rigoureuses pour protéger vos données personnelles contre toute perte ou divulgation non autorisée.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 6 – Cookies',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nous utilisons des cookies pour améliorer votre expérience utilisateur et analyser l’audience. Vous pouvez gérer vos préférences en matière de cookies via les paramètres de votre navigateur.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 7 – Âge de Consentement',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'En utilisant notre app, vous certifiez être majeur dans votre juridiction et autoriser les mineurs sous votre responsabilité à utiliser notre app.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Article 8– Modifications',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Cette politique peut être modifiée à tout moment. Les changements seront publiés sur notre site, avec une notification des mises à jour.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Pour toute question ou demande d’accès, correction ou suppression de vos informations personnelles, veuillez contacter notre responsable de la confidentialité à sneakers@fe-store.pro.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
