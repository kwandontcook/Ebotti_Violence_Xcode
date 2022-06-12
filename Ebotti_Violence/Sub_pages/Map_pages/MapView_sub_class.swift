//
//  MapView_sub_class.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import Foundation
import GoogleMaps

class MapView_sub_class{
    init(){
        
    }
    
    func create_dataSet_header_set_medicoPyschologique() -> [String:CLLocationCoordinate2D]{
        // Create data object
        var header_location_text = [String:CLLocationCoordinate2D]()
        
        header_location_text["Antenne médico-psychologique du CHS"] = CLLocationCoordinate2D(latitude: -20.917520, longitude:167.265402);
        header_location_text["Accueil et assistance aux victimes"] = CLLocationCoordinate2D(latitude: -20.917520, longitude:167.265402);
        header_location_text["Province Koumac"] = CLLocationCoordinate2D(latitude: -20.560000, longitude:164.280819);
        header_location_text["Centre médico-social de Hienghène"] = CLLocationCoordinate2D(latitude: -20.689478, longitude:164.944978);
        header_location_text["Centre médico-social de TOUHO"] = CLLocationCoordinate2D(latitude: -20.780768, longitude:165.226920);
        header_location_text["Antenne médico-psychologique (Poindimie)"] = CLLocationCoordinate2D(latitude: -20.934863, longitude:165.331476);
        header_location_text["Koné"] = CLLocationCoordinate2D(latitude: -21.097964, longitude:164.887776);
        header_location_text["Centre médico-social de Poya"] = CLLocationCoordinate2D(latitude: -21.346494, longitude:165.158729);
        header_location_text["Centre médico sociale de Houailou"] = CLLocationCoordinate2D(latitude: -21.279635, longitude:165.630380);
        header_location_text["Permanence d'écoute psychologique (Bourail)"] = CLLocationCoordinate2D(latitude: -21.570436, longitude:165.497891);
        header_location_text["Permanence d'écoute psychologique (La Foa)"] = CLLocationCoordinate2D(latitude: -21.712144, longitude:165.828495);
        header_location_text["Permanence d'écoute psychologique (Thio)"] = CLLocationCoordinate2D(latitude: -21.611324, longitude:166.214473);
        header_location_text["Permanence d'écoute psychologique (Torre)"] = CLLocationCoordinate2D(latitude: -20.917520, longitude:167.265402);
        header_location_text["Permanence d'écoute psychologique (Dumbéa)"] = CLLocationCoordinate2D(latitude: -22.2045638, longitude:166.4469631);
        header_location_text["Permanence d'écoute psychologique (Mont Doré)"] = CLLocationCoordinate2D(latitude: -22.2270595, longitude:166.5216736);
        header_location_text["Permanence d'écoute psychologique (Yaté)"] = CLLocationCoordinate2D(latitude: -22.1607665, longitude:166.9440482);
        header_location_text["Permanence d'écoute psychologique - annexe (Mont Doré)"] = CLLocationCoordinate2D(latitude: -22.273350, longitude:166.623331);
        header_location_text["Permanence d'écoute psychologique - annexe (Nouméa)"] = CLLocationCoordinate2D(latitude: -22.2716664, longitude:166.4389470);
        header_location_text["Permanence d'écoute psychologique (Sainte Marie/Nouméa)"] = CLLocationCoordinate2D(latitude: -22.2796077, longitude:166.4583538);
        header_location_text["Permanence d'écoute psychologique (République/Nouméa)"] = CLLocationCoordinate2D(latitude: -22.2688729, longitude:166.4395283);
        header_location_text["Permanence d'écoute psychologique (CMS/Nouméa)"] = CLLocationCoordinate2D(latitude: -22.2324242, longitude:166.4288253);
        header_location_text["Permanence d'écoute psychologique (Montravel/Nouméa)"] = CLLocationCoordinate2D(latitude: -22.2485659, longitude: 166.4559020);
        
        return header_location_text
    }
    
    func create_dataSet_description_set_medicoPyschologique() -> [String:String]{
        var header_description_text = [String:String]()
        // Create data object
        header_description_text["Antenne médico-psychologique du CHS"] = "Province Lifou\n" +
        "        Présentation : Consultations médico-psychologiques et sociales pour toute personne en souffrance psychique\n" +
        "        Informations sur les permanences : Tous les jours de 7h30 à 16h30\n" +
        "        Adresse : Quanono (à côté du dispensaire)RT2 Wé- LIFOU, LIFOU\n" +
        "        Référent : Medecin psychiatre / Infirmier psy\n" +
        "        Numéro(s) de téléphone : 06 87 45 06 23\n" +
        "        Mail : sec.lifou@chs.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : \n" +
        "        Pièces jointes:\n" +
        "        Aucune pièce jointe n’a été trouvée";
        
        header_description_text["Accueil et assistance aux victimes"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "        Informations sur les permanences :\n" +
        "        Adresse : 1124 Route du Sud\n" +
        "        Plum, MONT DORE\n" +
        "        Référent :\n" +
        "        Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 70\n" +
        "        Mail :\n" +
        "        Type de partenaire : Etat\n" +
        "        Zone de compétence : Territoire\n" +
        "        Compétent en :\n" +
        "        - aide aux victimes : Oui\n" +
        "        - droit commun : Non\n" +
        "        - droit coutumier : Non\n" +
        "        - autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "        Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "        Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/\n" +
        "        "
    
        header_description_text["Province Koumac"] = "Hôpital province Nord\n" +
        "        Présentation : consultations médico-psychologiques et sociales pour toute personne en souffrance psychique\n" +
        "        Informations sur les permanences : Tous les jours de 7h30 à 16h00\n" +
        "        Adresse : Village RT1, KOUMAC\n" +
        "        Référent : Médecin psychiatre / Infirmier psy\n" +
        "        Numéro(s) de téléphone : 42 76 56\n" +
        "        Mail : sec.koumac@chs.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Centre médico-social de Hienghène"] = "Présentation : Suivi psychiatrique\n" +
        "        Informations sur les permanences : Visite à domicile jeudi tous les 15 jours\n" +
        "        Adresse : 39 Lot municipal, HIENGHENE\n" +
        "        Référent : Infirmier psy\n" +
        "        Numéro(s) de téléphone : 47.75.00\n" +
        "        Mail : cms-hienghene@province-nord.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-nord.nc/demarches/acceder-centre-medico-social-dispensaire-hienghene-hyehen\n" +
        "        Pièces jointes:\n" +
        "        flyer-permanences CMS Hienghène.pdf\n" +
        "        Zoom sur\n" +
        "        Dispensaire de Hienghène\n" +
        "        RPN3, Nouvelle-Calédonie";
        
        header_description_text["Centre médico-social de TOUHO"] = "Centre médico-social de TOUHO\n" +
        "        Présentation :\n" +
        "        Informations sur les permanences : Visite à domicile : 1 fois par mois\n" +
        "        Adresse : Village - BP 68, TOUHO\n" +
        "        Référent : Infirmier psychiatrique\n" +
        "        Numéro(s) de téléphone : 47 75 10\n" +
        "        Mail : cms-touho@province-nord.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-nord.nc/demarches/acceder-centre-medico-social-dispensaire-touho-tuo-cemuhi\n" +
        "        Centre médico-social Touho";
        
        header_description_text["Antenne médico-psychologique (Poindimie)"] = "Province Poindimie\n" +
        "        Présentation :\n" +
        "        Informations sur les permanences :\n" +
        "        Adresse : Antenne médico-psychologique (Poindimié)\n" +
        "        Village RP3, POINDIMIE\n" +
        "        Référent : Méd psychiatre ou Infirmier psy\n" +
        "        Numéro(s) de téléphone : 42 60 34\n" +
        "        Mail :\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Koné"] = "Présentation : Consultations médico-psychologiques et sociales pour toute personne en souffrance psychique.\n" +
        "        Informations sur les permanences : Tous les jours de 7h30 à 16h00\n" +
        "        Adresse : Lot 140, avenue J. Welepane, KONE\n" +
        "        Référent : Médecin psychiatre / infirmier psy\n" +
        "        Numéro(s) de téléphone : 42.10.00\n" +
        "        Mail : secretmed.psn@chn.nc\n" +
        "Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "        Pôle Sanitaire Koné\n" +
        "        Nouvelle-Calédonie";
        
        header_description_text["Centre médico-social de Poya"] = "Centre médico-social de Poya\n" +
        "        Présentation : Suivi psychiatrique\n" +
        "        Informations sur les permanences : 1 fois par mois\n" +
        "        Adresse : 26 Route Territoriale 1 Village, POYA\n" +
        "        Référent : infirmière psychiatrique du CHS de Koné\n" +
        "        Numéro(s) de téléphone : 26 Route Territoriale 1 Village\n" +
        "        Mail : cms-poya@province-nord.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-nord.nc/demarches/acceder-centre-medico-social-dispensaire-poya-neko-nepoui\n" +
        "        Dispensaire de Poya\n" +
        "        RT1, Poya, Nouvelle-Calédonie";
        
        header_description_text["Centre médico sociale de Houailou"] = "Centre médico sociale de Houailou\n" +
        "        Présentation : Suivi psychiatrique\n" +
        "        Informations sur les permanences : Visite à Domicile mercredi tous les 15 jours\n" +
        "        Adresse : Centre médico-social, HOUAILOU\n" +
        "        Référent : Infirmier psychiatrique\n" +
        "        Numéro(s) de téléphone : 47.75.40\n" +
        "        Mail : cms-houailou@province-nord.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-nord.nc/demarches/acceder-centre-medico-social-dispensaire-houailou-waa-wi-luu\n" +
        "        Dispensaire de Houailou\n" +
        "        Houaïlou, Nouvelle-Calédonie";
        
        header_description_text["Permanence d'écoute psychologique (Bourail)"] = "permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les lundis de 07h30 à 17h00.\n" +
        "        Adresse : CMS de Bourail, BOURAIL\n" +
        "        Référent : Nicolas DAMON\n" +
        "        Numéro(s) de téléphone : 51 34 20\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc/demarches/permanences-d-ecoute-psychologique-peps?fbclid=IwAR2eLEJ8Ewm7tbaDErTmLLuedavHROR-j6rEcMMh3z8FoLUKGRXDXTLTHzU\n" +
        "        Dispensaire bourail\n" +
        "        Bourail, Nouvelle-Calédonie";
        
        
        header_description_text["Permanence d'écoute psychologique (La Foa)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les mardis de 07h30 à 17h00.\n" +
        "        Adresse : dispensaire la foa\n" +
        "        Référent : Laurence ANTOINE\n" +
        "        Numéro(s) de téléphone : 52 41 12\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc/demarches/permanences-d-ecoute-psychologique-peps?fbclid=IwAR2eLEJ8Ewm7tbaDErTmLLuedavHROR-j6rEcMMh3z8FoLUKGRXDXTLTHzU\n" +
        "        Centre médico social la Foa\n" +
        "        Nouvelle-Calédonie";
        
        header_description_text["Permanence d'écoute psychologique (Thio)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Permanences : tous les mercredis de 07h30 à 17h00.\n" +
        "        Adresse : UPASS DE THIO, THIO\n" +
        "        Référent : Fanélie BOUCHARLAT\n" +
        "        Numéro(s) de téléphone : 77 47 21\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Commune\n" +
        "        Zone de compétence : Commune\n" +
        "        Dispensaire Thio\n" +
        "        Nouvelle-Calédonie";
        
        header_description_text["Permanence d'écoute psychologique (Torre)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les mardis : 07h30 à 16h00 / Les mercredis de 12h30 à 16h00.\n" +
        "        Adresse : UPASS de Paîta, Rue des Tulipiers - Village, PAITA\n" +
        "        Référent : Virginie TORRE\n" +
        "        Numéro(s) de téléphone : 74 10 11\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Permanence d'écoute psychologique (Dumbéa)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les lundis : 07h30 à 16h00 / Les mercredis de 07h30 à 11h30\n" +
        "        Adresse : CMS de Dumbéa-sur-mer, DUMBEA\n" +
        "        Référent : Virginie TORRE\n" +
        "        Numéro(s) de téléphone : 74 10 11\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc/demarches/permanences-d-ecoute-psychologique-peps?fbclid=IwAR2eLEJ8Ewm7tbaDErTmLLuedavHROR-j6rEcMMh3z8FoLUKGRXDXTLTHzU\n";
        
        header_description_text["Permanence d'écoute psychologique (Mont Doré)"] = "        Permanences Ecoute Psychologique\n" +
        "        Présentation : Accueil écoute et orientation gratuite anonyme et confidentiel, pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les mardis de 07h30 à 16h00 et les jeudis de 12h00 à 16h00.\n" +
        "        Adresse : 297, rue Antoine GRISCELLI (dans les locaux du CMS)., MONT DORE\n" +
        "        Référent : Nicolas DARMON\n" +
        "        Numéro(s) de téléphone : 51 34 20\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc\n" +
        "        Dispensaire Boulari";
        
        header_description_text["Permanence d'écoute psychologique (Yaté)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les jeudis des semaines paires de 07h30 à 17h00.\n" +
        "        Adresse : UPASS de YATE, YATE\n" +
        "        Référent : Fanélie BOUCHARLAT\n" +
        "        Numéro(s) de téléphone : 77 47 21\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Commune\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : htpps://www.province-sud.nc\n" +
        "        Centre médico social Yaté";
        
        
        header_description_text["Permanence d'écoute psychologique - annexe (Mont Doré)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les jeudis de 07h30 à 15h30.\n" +
        "        Adresse : Annexe de la Mairie de Plum, MONT DORE\n" +
        "        Référent : Laurence ANTOINE\n" +
        "        Numéro(s) de téléphone : 52 41 12\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc/demarches/permanences-d-ecoute-psychologique-peps?fbclid=IwAR2eLEJ8Ewm7tbaDErTmLLuedavHROR-j6rEcMMh3z8FoLUKGRXDXTLTHzU\n";
        
        header_description_text["Permanence d'écoute psychologique - annexe (Nouméa)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les lundis de 7h30 à 16h00.\n" +
        "        Adresse : Espace CMP, rue GALIENI, Centre ville, NOUMEA\n" +
        "        Référent : Christel MOUTTOTE (psychologue)\n" +
        "        Numéro(s) de téléphone : 78 62 76\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Permanence d'écoute psychologique (Sainte Marie/Nouméa)"] = "Permanences d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Les mercredis de 07h30 à 16h00 / Les jeudis de 7h30 à 16h00.\n" +
        "        Adresse : Foyer N'GA ( à côté Maison Municipale de Quartier de Ste Marie), NOUMEA\n" +
        "        Référent : Christel MOUTTOTE (psychologue)\n" +
        "        Numéro(s) de téléphone : 78 62 76\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Permanence d'écoute psychologique (République/Nouméa)"] = "Permanences d'écoute psychologique\n" +
        "        Présentation : Activités : Prévention, Social et Insertion,\n" +
        "        Informations sur les permanences : Accueil du lundi au vendredi de 8h00 à 12h00 et de 13h00 à 17h00 ( 16h00 le vendredi)\n" +
        "        Adresse : 7 Ter, rue de la République, NOUMEA\n" +
        "        Référent : Ingrid WAMYTAN\n" +
        "        Numéro(s) de téléphone : 25 50 78\n" +
        "        Mail : secretariat.declic@ass.nc\n" +
        "Type de partenaire : Province\n" +
        "        Zone de compétence : Commune";
        
        header_description_text["Permanence d'écoute psychologique (CMS/Nouméa)"] = "Permanences Ecoute Psychologique\n" +
        "        Présentation : Accueil, écoute et oritentation gratuite, anonyme et confidentitiel pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Tous les jeudis de 7h30 à 16h00.\n" +
        "        Adresse : 128 route de la Baie des Dames, dans les locaux du CMS., NOUMEA\n" +
        "        Référent : Virginie TORRE\n" +
        "        Numéro(s) de téléphone : 74 10 11\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc\n";
        
        header_description_text["Permanence d'écoute psychologique (Montravel/Nouméa)"] = "Permanence d'écoute psychologique\n" +
        "        Présentation : Accueil, écoute et orientation gratuite, anonyme et confidentielle pour tout public rencontrant des difficultés.\n" +
        "        Informations sur les permanences : Tout les mardis de 7h30 à 16h00\n" +
        "        Adresse : PMI de Montravel, NOUMEA\n" +
        "        Référent : Chrystel MOUTOTE\n" +
        "        Numéro(s) de téléphone : 78 62 76\n" +
        "        Mail : spps@province-sud.nc\n" +
        "        Type de partenaire : Province\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.province-sud.nc/demarches/permanences-d-ecoute-psychologique-peps?fbclid=IwAR2eLEJ8Ewm7tbaDErTmLLuedavHROR-j6rEcMMh3z8FoLUKGRXDXTLTHzU\n";
    
        return header_description_text
    }
    
    func create_dataSet_header_set_helpToVictims() -> [String:CLLocationCoordinate2D]{
        // Create data object
        var header_location_text = [String:CLLocationCoordinate2D]()
    
        header_location_text["Brigade de Plum"] = CLLocationCoordinate2D(latitude: -22.27333403423604, longitude:166.63172222587073);
        header_location_text["Brigade des Pins"] = CLLocationCoordinate2D(latitude: -22.663464347682844, longitude:167.44013699977745);
        header_location_text["Brigade de Tadine"] = CLLocationCoordinate2D(latitude: -21.55257961216032, longitude:167.8789080681866);
        header_location_text["Brigade de We"] = CLLocationCoordinate2D(latitude: -20.918237060757907, longitude:167.268937177764);
        header_location_text["Brigade de Xepenehe"] = CLLocationCoordinate2D(latitude: -20.781579116980623, longitude:167.15001184621394);
        header_location_text["Brigade de Fayaoué"] = CLLocationCoordinate2D(latitude: -20.653050900644896, longitude:166.53406751689985);
        header_location_text["Brigade de Poum - Poste provisoire de Bélep"] = CLLocationCoordinate2D(latitude: -19.71197375366216, longitude:163.64716594468734);
        header_location_text["Brigade de Poum"] = CLLocationCoordinate2D(latitude: -20.23244325862845, longitude:164.02279631193966);
        header_location_text["Brigade de Ouégoa"] = CLLocationCoordinate2D(latitude: -20.34523602647682, longitude:164.44100362259869);
        header_location_text["Brigade de Pouébo"] = CLLocationCoordinate2D(latitude: -20.392406686897182, longitude:164.5785700266447);
        header_location_text["Brigade de Koumac"] = CLLocationCoordinate2D(latitude: -20.564849009179383, longitude:164.28126815282778);
        header_location_text["Brigade de Kaala-Gomen"] = CLLocationCoordinate2D(latitude: -20.667647320410406, longitude:164.39663334464424);
        header_location_text["Brigade de Hienghène"] = CLLocationCoordinate2D(latitude: -20.6889608320638, longitude:164.94786764140463);

        // new dataSet
        header_location_text["Brigade de Thio"] = CLLocationCoordinate2D(latitude: -21.60863223427484, longitude : 166.21691287062);
        header_location_text["Brigade de Koné"] = CLLocationCoordinate2D(latitude: -21.0588174097751, longitude: 164.86415390622724);
        header_location_text["Brigade de Bourail"] = CLLocationCoordinate2D(latitude: -21.56709068302095, longitude: 165.498208124908027);
        header_location_text["Brigade de Poya"] = CLLocationCoordinate2D(latitude: -21.34687760883291, longitude : 165.15808792368935);
        header_location_text["Brigade de Canala"] = CLLocationCoordinate2D(latitude: -21.523069721030254, longitude : 165.96118117014302);
        header_location_text["Brigade de Ponérihouen"] = CLLocationCoordinate2D(latitude: -21.071160074796893, longitude : 165.40409586766283);
        header_location_text["Brigade de Touho"] = CLLocationCoordinate2D(latitude: -20.79130802980237, longitude : 165.25322554340755);
        header_location_text["Brigade de Kouaoua"] = CLLocationCoordinate2D(latitude: -21.394227198602856, longitude : 165.82656090121503);
        header_location_text["Brigade de Fayaoue"] = CLLocationCoordinate2D(latitude: -20.654717421520477, longitude : 166.5353021426726);
        header_location_text["Brigade de Yaté"] = CLLocationCoordinate2D(latitude: -22.160331705384987, longitude : 166.94340474345287);
        header_location_text["Brigade de Dumbéa"] = CLLocationCoordinate2D(latitude: -22.20749773763127, longitude : 166.46829378986837);
        header_location_text["Brigade de Voh"] = CLLocationCoordinate2D(latitude: -20.9554613094739, longitude : 164.6839538442974);
        header_location_text["Brigade de Mont-Doré"] = CLLocationCoordinate2D(latitude: -22.271314100546995,longitude : 166.61630909023253);
        header_location_text["Brigade de Boulouparis"] = CLLocationCoordinate2D(latitude: -22.225540843951002, longitude : 166.48027236723397);
        header_location_text["Brigade de Houailou"] = CLLocationCoordinate2D(latitude: -21.279262295644674, longitude : 165.63552740743012);
        header_location_text["Brigade de Paita"] = CLLocationCoordinate2D(latitude: -22.14637174444429, longitude : 166.38711633840546);
        header_location_text["Brigade de la Foa"] = CLLocationCoordinate2D(latitude: -21.709922876908564, longitude : 165.8274526711809);
        header_location_text["Brigade de Pouébo"] = CLLocationCoordinate2D(latitude: -20.391858076512477, longitude : 164.57489736897446);
        header_location_text["Brigade de Poindimié"] = CLLocationCoordinate2D(latitude: -20.93534271212428, longitude : 165.33039932144983);
        
        return header_location_text
    }
    
    func create_dataSet_description_set_helpToVictims() -> [String:String]{
        var header_description_text = [String:String]()
        header_description_text["Brigade de Plum"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : 1124 Route du Sud\n" +
        "Plum, MONT DORE\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 70\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Territoire\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non"
        
        header_description_text["Brigade des Pins"] =  "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 82, 98832 Ile des Pins S'Y RENDRE :\n" +
        "Kuto, 98832 Ile des Pins TÉLÉPHONE :\n" +
        "44.87.85\n" +
        "EMAIL :\n" +
        "bta.l-ile-des-pins@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        
        header_description_text["Brigade de Tadine"] =  "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "Tadine, 98828 Maré S'Y RENDRE : Tadine, 98828 Maré TÉLÉPHONE : 45.53.00\n" +
        "EMAIL :\n" +
        "bta.tadine@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        header_description_text["Brigade de We"] =  "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 181, 98820 Lifou\n" +
        "S'Y RENDRE :\n" +
        "Route territoriale 2, Wé, 98820 Lifou\n" +
        "TÉLÉPHONE :\n" +
        "44.87.95\n" +
        "EMAIL :\n" +
        "bta.we@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        header_description_text["Brigade de Xepenehe"] =  "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Tribu de Xepenehe, LIFOU\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44.88.00\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/\n" +
        "Pièces jointes:\n" +
        "Aucune pièce jointe n’a été trouvée"
        
        header_description_text["Brigade de Fayaoué"] =  "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Tribu de Fayaoué, OUVEA\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 45 53 10\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/"
        
        
        header_description_text["Brigade de Poum - Poste provisoire de Bélep"] =  ""
        header_description_text["Brigade de Poum"] =  ""
        header_description_text["Brigade de Ouégoa"] = "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "Voie Urbaine 12, 98821 Ouégoa S'Y RENDRE :\n" +
        "Voie Urbaine 12, 98821 Ouégoa TÉLÉPHONE :\n" +
        "47.89.60\n" +
        "EMAIL : bta.ouegoa@gendarmerie.interieur.gouv.fr HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h à 11h30 et de 14h à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        
        header_description_text["Brigade de Pouébo"] = ""
        header_description_text["Brigade de Koumac"] =  "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences : Du lundi au vendredi : 08h00-16h00\n" +
        "Adresse : 03, rue Raphael Ménard, NOUMEA\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 41 37 00\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/policenationale988/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/"
        
        
        header_description_text["Brigade de Kaala-Gomen"] =  "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "928 avenue Bwapanu, 98817 Kaala Gomen\n" +
        "S'Y RENDRE :\n" +
        "928 avenue Bwapanu, 98817 Kaala Gomen\n" +
        "TÉLÉPHONE :\n" +
        "47.89.55\n" +
        "EMAIL :\n" +
        "cob.koumac@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h à 11h30 et de 14h à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        header_description_text["Brigade de Hienghène"] =  "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Village\n" +
        "Route Provinciale nord 3, HIENGHENE\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 47 89 80\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr"
        
        header_description_text["Brigade de Thio"] = ""
        header_description_text["Brigade de Koné"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Rue du Grand chef Noel, KONE\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 47 89 15\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Territoire\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/"
        
        header_description_text["Brigade de Bourail"] = ""
        header_description_text["Brigade de Poya"] = ""
        header_description_text["Brigade de Canala"] = ""
        header_description_text["Brigade de Ponérihouen"] = ""
        header_description_text["Brigade de Touho"] = ""
        header_description_text["Brigade de Kouaoua"] = ""
        header_description_text["Brigade de Fayaoue - Ouvéa"] = ""
        header_description_text["Brigade de Yaté"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : , YATE\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 80\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/"
        
        header_description_text["Brigade de Dumbéa"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Avenue Numa Joubert, DUMBEA\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 00\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/\n" +
        "Pièces jointes:\n" +
        "Aucune pièce jointe n’a été trouvée\n"
        
        header_description_text["Brigade de Voh"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : , VOH\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 47 89 70\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/"
        
        header_description_text["Brigade du Mont-Doré"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Route de Yahoué, MONT DORE\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 26 / FAX : 44 87 33\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non\n" +
        "\n" +
        "Page facebook : https://www.facebook.com/ComgendNC/\n" +
        "Pour déposer une plainte, suivre le lien : https://www.pre-plainte-en-ligne.gouv.fr/"
        
        header_description_text["Brigade de Boulouparis"] = "Présentation : Accueil et assistance aux victimes. Prise de plainte et orientation des victimes vers un accompagnement juridique, social et psychologique.\n" +
        "Informations sur les permanences :\n" +
        "Adresse : Avenue Numa Joubert, DUMBEA\n" +
        "Référent :\n" +
        "Numéro(s) de téléphone : Le 17 (urgence) ou le 44 87 00\n" +
        "Mail :\n" +
        "Type de partenaire : Etat\n" +
        "Zone de compétence : Commune\n" +
        "Compétent en :\n" +
        "- aide aux victimes : Oui\n" +
        "- droit commun : Non\n" +
        "- droit coutumier : Non\n" +
        "- autre(s) type(s) de droit(s) : Non"
        
        header_description_text["Brigade de Houailou"] = ""
        
        header_description_text["Brigade de Paita"] = "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 87, 98889 Païta\n" +
        "S'Y RENDRE :\n" +
        "16 route territoriale 1, 98889 Païta\n" +
        "TÉLÉPHONE :\n" +
        "44.87.36\n" +
        "EMAIL :\n" +
        "bta.paita@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 9h à 12h et de 15h à 18h"
        
        header_description_text["Brigade de la Foa"] = "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 1060, 98880 La Foa\n" +
        "S'Y RENDRE :\n" +
        "95 route territoriale 1, 98880 La Foa\n" +
        "TÉLÉPHONE :\n" +
        "44.87.50\n" +
        "EMAIL :\n" +
        "bta.la-foa@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 8h30 à 11h30 et de 14h30 à 17h30"
        
        header_description_text["Brigade de Pouébo"] = "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 3, 98824 Pouébo S'Y RENDRE : Village, 98824 Pouébo TÉLÉPHONE : 47.89.65\n" +
        "EMAIL :\n" +
        "bta.pouebo@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 9h à 12h et de 14h30 à 17h30"
        
        header_description_text["Brigade de Poindimié"] = "Brigades de gendarmerie\n" +
        "(Etat)\n" +
        "ECRIRE :\n" +
        "BP 15, 98822 Poindimié\n" +
        "S'Y RENDRE :\n" +
        "68 Voie Urbaine 13, 98822 Poindimié\n" +
        "TÉLÉPHONE :\n" +
        "47.89.00\n" +
        "EMAIL :\n" +
        "bta.poindimie@gendarmerie.interieur.gouv.fr\n" +
        "HORAIRES D'OUVERTURE :\n" +
        "Du lundi au samedi de 7h30 à 11h30 et de 13h30 à 17h30 Dimanche et jours fériés de 9h à 12h et de 14h30 à 17h30"
        
        
        
        return header_description_text
    }
    
    func create_dataSet_header_set_aidePyschologique() -> [String:CLLocationCoordinate2D]{
        // Create data object
        var header_location_text = [String:CLLocationCoordinate2D]()
        header_location_text["Associatif (Nouméa)"] = CLLocationCoordinate2D(latitude: -22.283, longitude:166.444);
        return header_location_text
    }
    
    func create_dataSet_description_set_aidePyschologique() -> [String:String]{
        var header_description_text = [String:String]()
        header_description_text["Associatif (Nouméa)"] = "Présentation : La mission principale de l'association Diversités NC est d'oeuvrer pour l'inclusion des diversités sexuelles, d'identités de genre et des pluralités familiales à l'échelle du territoire Calédonien." +
        "Informations sur les permanences : Mardi, mercredi, jeudi après midi de 13h30 à 17h 00" +
        "Adresse : 1, rue Gustave Flaubert (à côté de la Maison des associations), NOUMEA" +
        "Référent : Le président et son conseil d'amnistration" +
        "Numéro(s) de téléphone : 27 60 66 / 97 62 64 ligne d'écoute de 9h00 à 21h 7J/7" +
        "Mail : contact@diversitesnc.org" +
        "Type de partenaire : Association" +
        "Zone de compétence : Territoire" +
        "Pour plus d'informations, suivre le lien : sur la page Facebook diversites nc" +
        "Pièces jointes:" +
        "Aucune pièce jointe n’a été trouvée"
        return header_description_text
    }
    
    func create_dataSet_header_set_ccas() -> [String:CLLocationCoordinate2D]{
        // Create data object
        var header_location_text = [String:CLLocationCoordinate2D]()
        header_location_text["Centre communal d'action sociale de Nouméa"] = CLLocationCoordinate2D(latitude: -22.271, longitude:166.439);
        header_location_text["Direction Provinciale de l'Action Sanitaire et Sociale"] = CLLocationCoordinate2D(latitude: -22.268, longitude:166.439);
        header_location_text["Centre Hospitalier Spécialisé Albert Bousquet"] = CLLocationCoordinate2D(latitude: -22.271, longitude:166.439);
        return header_location_text
    }
    
    func create_dataSet_description_set_ccas() -> [String:String]{
        var header_description_text = [String:String]()
        
        header_description_text["Centre communal d'action sociale de Nouméa"] = "Présentation : Le CCAS de Nouméa anime une action générale de prévention et de développement social en direction de différents publics : petite enfance, enfance et adolescence, personnes en situation de handicap, les séniors et les familles.\n" +
        "        Informations sur les permanences : Du lundi au vendredi : 07h30 - 16h00\n" +
        "        Adresse : Mairie Annexe\n" +
        "        20 rue du Général Gallieni, NOUMEA\n" +
        "        Référent : Valérie LECLERC\n" +
        "        Numéro(s) de téléphone : 27.07.86\n" +
        "        Mail : mairie.ccas@ville-noumea.nc\n" +
        "        Type de partenaire : Commune\n" +
        "        Zone de compétence : Commune\n" +
        "\n" +
        "        Pour plus d'informations, suivre le lien : https://www.noumea.nc/solidarites/le-centre-communal-daction-sociale\n" +
        "        Pièces jointes:\n" +
        "        Aucune pièce jointe n’a été trouvée"
        
        header_description_text["Direction Provinciale de l'Action Sanitaire et Sociale"] = "Présentation : Espas CMP; Une équipe de médecins, infirmières,psychologue, éducatrice vous accueille et vous guide dans votre démarche de prévention, d’information, de dépistage et de soins. \n" +
        "Informations sur les permanences : Du lundi au vendredi \n" +
        "De 7 h30 - 12 h00\n" +
        "De 13h00 à 16h00 sauf le mardi \n" +
        "Adresse : 1 bis Rue Gallieni, NOUMEA \n" +
        "Référent : Le médecin chef du service Dr BLANCO \n" +
        "Numéro(s) de téléphone : Tèl : 20 47 40 / Fax ; 20 47 81 \n" +
        "Mail : dpass.cmp-secretariat@province-sud.nc \n" +
        "Type de partenaire : Province \n" +
        "Zone de compétence : Commune"
        
        header_description_text["Centre Hospitalier Spécialisé Albert Bousquet"] = "Présentation : Accueil, écoute et soins en addictologie. Le centre d'addictologie accompagne l'entourage et la famille. Aide et soutine dans les changements de comportement et pour le suivi du sevrage. \n" +
        "Informations sur les permanences : Du lundi au vendredi de 8h00 à 12h00 et de 13h00 0 17h00 (16h00 le vendredi) \n" +
        "Adresse : 1 bis rue du Général Gallieni 98800 Nouméa ou BP :120 98845 Néa Cédex, NOUMEA \n" +
        "Référent : Dr NATAF \n" +
        "Numéro(s) de téléphone : 24 01 66 / Fax 24 14 09 / Sur RDV et gratuit. \n" +
        "Mail : secretariat.csa@chs.nc \n" +
        "Type de partenaire : Commune \n" +
        "Zone de compétence : Province Sud \n" +
        "\n" +
        "Pour plus d'informations, suivre le lien : \n" +
        "Pièces jointes:\n" +
        "Aucune pièce jointe n’a été trouvée\n"
        
        return header_description_text
    }
}
