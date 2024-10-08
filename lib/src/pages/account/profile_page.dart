// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_price/src/pages/account/edit_profile.dart';
import 'package:e_price/src/screen.dart';
import 'package:e_price/src/widgets/cerrar_seccion.dart';
import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
//import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final dynamic userData;
  const ProfilePage({super.key, this.userData});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedTitle = '';

  void _onTap(String title) {
    setState(() {
      _selectedTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.headerColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: AppColors.pink,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: widget.userData['imageUser'],
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Image.asset(
                            "assets/gif/circle.gif",
                            fit: BoxFit.fill),
                        errorWidget: (context, url, error) {
                          return Image.asset("assets/images/noimage.png",
                              fit: BoxFit.fill);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hola!",
                        style: TextStyle(
                          fontFamily: "MonB",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.userData['username'],
                        style: const TextStyle(
                          fontFamily: "MonB",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CerrarSeccion(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //Buttom cambiar datos
            MaterialButtomWidget(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              title: "Editar perfil",
              color: AppColors.orangeAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      userData: widget.userData,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    
 
                    ListTitleWidget(
                      icon: Icons.share_rounded,
                      title: "Compartir",
                      subtitle: "Comparte la app",
                      onTap: () async {
                        // _onTap("Compartir");
                        // const urlPreview =
                        //     "https://play.google.com/store/apps/details?id=orarconsalmosapp.gs";
                        // await Share.share(
                        //     "Te recomiendo esta App para fortalecer tu fe \n\n$urlPreview");
                      },
                      isSelected: _selectedTitle == "Compartir",
                      
                    ),
                    ListTitleWidget(
                      icon: Icons.star_border_rounded,
                      title: "Calificar",
                      subtitle: "Califica nuestra app",
                      onTap: () async {
                        // _onTap("Calificar");
                        // final url = Uri.parse(
                        //     "https://play.google.com/store/apps/details?id=orarconsalmosapp.gs");
                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(url);
                        // } else {
                        //   throw 'No se pudo lanzar $url';
                        // }
                      },
                      isSelected: _selectedTitle == "Calificar",
                       
                    ),
                    //contactar
                    ListTitleWidget(
                      icon: Icons.contact_support_rounded,
                      title: "Contactar",
                      subtitle: "Contacta con nosotros",
                      onTap: () {
                        // _onTap("Contactar");
                        // launchUrl(Uri.parse(
                        //     "mailto:giansando2022@gmail.com?Subject=Te%20escribo%20desde%20la%20app%20orar%20con%20salmos"));
                      },
                      isSelected: _selectedTitle == "Contactar",
                     
                    ),
                    ListTitleWidget(
                      icon: Icons.comment_rounded,
                      title: "Ayudanos",
                      subtitle: "Ayudanos a mejorar ",
                      onTap: () => _onTap("Ayudanos"),
                      isSelected: _selectedTitle == "Ayudanos",
                      
                    ),
                    //politica de privacidad
                    ListTitleWidget(
                      icon: Icons.privacy_tip_rounded,
                      title: "Privacidad",
                      subtitle: "Politica de privacidad",
                      onTap: () {
                        // _onTap("Privacidad");
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     backgroundColor: isDarkMode
                        //         ? AppColors.darkColor
                        //         : AppColors.headerColor,
                        //     title: const Text(
                        //       "POLÍTICA DE PRIVACIDAD Y CONTENIDO",
                        //       style: TextStyle(
                        //         color: AppColors.orangeAcents,
                        //         fontSize: 18,
                        //         fontFamily: "MonB",
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //     content: Text(
                        //       "· La app no recoge ningún dato de carácter personal del usuario como, por ejemplo, nombre, fotografías o localización.\n· En consecuencia la app no comparte ningún dato personal con ninguna otra entidad o terceras personas.\n· Permitimos que terceras compañías publiquen anuncios y recopilen cierta información anónima cuando visite nuestra aplicación. Estas empresas pueden utilizar información anónima, como su ID de publicidad de Google, el tipo y la versión de su dispositivo, la actividad de navegación, la ubicación y otros datos técnicos relacionados con su dispositivo, a fin de proporcionar anuncios.",
                        //       style: TextStyle(
                        //         color: isDarkMode
                        //             ? AppColors.text
                        //             : AppColors.darkColor,
                        //         fontSize: 14,
                        //         fontFamily: "MonM",
                        //       ),
                        //       textAlign: TextAlign.justify,
                        //     ),
                        //     actions: <Widget>[
                        //       Center(
                        //         child: MaterialButton(
                        //           color: AppColors.orangeAcents,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(100),
                        //           ),
                        //           child: const Padding(
                        //             padding: EdgeInsets.all(8.0),
                        //             child: Text(
                        //               "CERRAR",
                        //               style: TextStyle(
                        //                 color: AppColors.text,
                        //                 fontSize: 15,
                        //                 fontFamily: "MonB",
                        //               ),
                        //             ),
                        //           ),
                        //           onPressed: () {
                        //             Navigator.of(context).pop();
                        //           },
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // );
                      },
                      isSelected: _selectedTitle == "Privacidad",
                      
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isSelected;
 

  const ListTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isSelected,
 
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? AppColors.white
        : (  AppColors.darkColor);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected
            ? AppColors.orangeAccent
            : ( AppColors.headerColor),
        child: ListTile(
          leading: Icon(icon, color: color),
          title:
              Text(title, style: TextStyle(color: color, fontFamily: "MonB")),
          subtitle: Text(subtitle,
              style: TextStyle(color: color, fontFamily: "MonM")),
          trailing: Icon(Icons.arrow_forward_ios_rounded, color: color),
        ),
      ),
    );
  }
}
