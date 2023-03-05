import 'package:flutter/material.dart';

String ipsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit, mi quis consequat iaculis, neque arcu suscipit nunc, sit amet hendrerit mauris quam sed neque. Sed rutrum sapien lorem, eu mattis ante fermentum sed. Nullam eleifend purus quis facilisis facilisis. In elementum massa sit amet dui fermentum, bibendum aliquet arcu porttitor. Pellentesque vel ex scelerisque, luctus lorem ut, finibus ipsum. Praesent mauris dui, sodales id interdum dapibus, tempor sit amet sem. Morbi facilisis gravida tellus sit amet dapibus. Vivamus vel libero a risus vestibulum hendrerit nec dignissim erat. Etiam ultricies consectetur velit. Nam molestie nisl purus, vel pellentesque nulla volutpat vitae. Duis eget mollis eros. Aenean nec suscipit elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras placerat laoreet purus, sit amet tempus metus volutpat vel. Quisque ullamcorper urna eu lacus pulvinar, sed feugiat magna eleifend. Mauris gravida elementum ante, ut luctus justo. Etiam sit amet sem ex. Sed id velit molestie, semper magna a, imperdiet tortor. Cras eu enim ligula. Morbi tempus est nulla, sed molestie felis consequat blandit. Aliquam facilisis nisl enim, eu efficitur nisi mattis a. Proin malesuada metus sed eros aliquet egestas. Donec commodo orci quis neque egestas tempus. Maecenas sit amet orci molestie, feugiat nisl in, accumsan lectus. Aliquam finibus felis eu dictum iaculis. Ut et libero ac massa euismod egestas bibendum at mi. Phasellus luctus purus gravida aliquam blandit. Aenean sed arcu eu ipsum malesuada imperdiet in in sem. Sed eros sapien, rhoncus nec feugiat eget, laoreet sed metus. Nam vel ornare quam. Sed quis imperdiet eros, et iaculis dui. Fusce nisl erat, tincidunt non tellus ac, finibus faucibus quam. Donec at ligula et nibh porta vestibulum et nec risus. Aenean et dui felis. Duis ex ante, efficitur sit amet rutrum luctus, pellentesque vitae neque. Vivamus viverra dignissim tincidunt.';

class TestDescritionPage extends StatelessWidget {
  const TestDescritionPage({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(imagePath),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ipsumText,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
