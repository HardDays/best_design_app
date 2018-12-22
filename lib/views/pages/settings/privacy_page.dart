import 'package:flutter/material.dart';

import '../../widgets/main_button.dart';
import '../../widgets/shadow_text.dart';

import '../../routes/default_page_route.dart';

import '../../../resources/app_colors.dart';

class PrivacyPage extends StatefulWidget {

  @override
  PrivacyPageState createState() => PrivacyPageState();
}

class PrivacyPageState extends State<PrivacyPage> {


  @override
  void initState() {    
    super.initState(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarBlue,
        centerTitle: false,
        title: Text('Privacy Notice',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontSize: 18.0
          ),
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              iconSize: 20.0,
              alignment: Alignment.center,
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: (){
                //Dialogs.showMessage(context, 'Self Love/Self Care List', AppText.careDescription, 'OK');
              },
            ),
          )
        ]
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.1),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Uplifting Women Privacy Notice',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mattis nunc sed blandit libero volutpat sed cras ornare. Volutpat sed cras ornare arcu dui. In tellus integer feugiat scelerisque varius morbi enim nunc faucibus. Elit sed vulputate mi sit amet mauris. Condimentum vitae sapien pellentesque habitant morbi tristique. Et egestas quis ipsum suspendisse. Sagittis vitae et leo duis ut diam quam nulla porttitor. Urna id volutpat lacus laoreet non curabitur gravida. Sed vulputate mi sit amet. Risus viverra adipiscing at in tellus integer feugiat scelerisque varius. Nunc mattis enim ut tellus elementum sagittis vitae. Lorem dolor sed viverra ipsum nunc aliquet bibendum. Malesuada proin libero nunc consequat. Felis eget nunc lobortis mattis. Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra. At urna condimentum mattis pellentesque id nibh tortor id. Vulputate ut pharetra sit amet aliquam id diam maecenas. Tellus at urna condimentum mattis pellentesque id nibh tortor. Nulla facilisi etiam dignissim diam. A cras semper auctor neque vitae tempus quam. Mauris in aliquam sem fringilla ut morbi',
                    style: TextStyle(
                      fontSize: 14.0
                    ),
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }
}
