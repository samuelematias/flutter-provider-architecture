import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/enum/viewstate.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/shared/text_styles.dart';
import 'package:flutter_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_architecture/ui/views/base_view.dart';
import 'package:flutter_provider_architecture/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return BaseView<HomeModel>(
      onModelReeady: (model) => model.gePosts(user.id),
      builder: (BuildContext context, HomeModel model, Widget child) =>
          Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome ${user.name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Here are all your posts',
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: _getPostUi(model.posts),
                  )
                ],
              ),
      ),
    );
  }

  Widget _getPostUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, '/post', arguments: posts[index]);
          },
        ),
      );
}
