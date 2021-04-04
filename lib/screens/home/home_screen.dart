import 'package:flutter/material.dart';
import 'package:flutter_responsive_blog/models/Blog.dart';
import 'package:flutter_responsive_blog/screens/constants.dart';
import 'package:flutter_responsive_blog/screens/home/components/blog_post.dart';
import 'package:flutter_responsive_blog/screens/home/components/categories.dart';
import 'package:flutter_responsive_blog/screens/home/components/recent_posts.dart';
import 'package:flutter_responsive_blog/screens/home/components/search.dart';
import 'package:flutter_responsive_blog/screens/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(
              blogPosts.length,
              (index) => BlogPostCard(blog: blogPosts[index]),
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                Search(),
                SizedBox(height: kDefaultPadding),
                Categories(),
                SizedBox(height: kDefaultPadding),
                RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
