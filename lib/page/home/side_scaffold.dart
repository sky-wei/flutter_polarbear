/*
 * Copyright (c) 2022 The sky Authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter_polarbear/constant.dart';
import 'package:flutter_polarbear/data/item/side_item.dart';
import 'package:flutter_polarbear/data/item/side_title.dart';
import 'package:flutter_polarbear/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class SideScaffold extends StatefulWidget {

  final SideTitle sideTitle;
  final List<SideItem> sideItems;
  final Widget? body;
  final int currentIndex;
  final ValueChanged<int>? onNavigationIndexChange;
  
  const SideScaffold({
    Key? key,
    required this.sideTitle,
    required this.sideItems,
    this.body,
    required this.currentIndex,
    this.onNavigationIndexChange,
  }) : super(key: key);

  @override
  State<SideScaffold> createState() => _SideScaffoldState();
}

class _SideScaffoldState extends State<SideScaffold> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSideBar(),
        _buildFrameContent()
      ],
    );
  }

  Widget _buildSideBar() {
    return SizedBox(
      width: 260,
      height: double.infinity,
      child: Drawer(
        backgroundColor: XColor.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: _buildSideList(),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Version: ${XConstant.versionName}",
                  style: TextStyle(
                      color: XColor.grayColor
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  List<Widget> _buildSideList() {

    List<Widget> items = <Widget>[
      const SizedBox(height: 30),
      _buildSideTitle(
        image: widget.sideTitle.icon,
        title: widget.sideTitle.name
      ),
      const SizedBox(height: 40),
    ];

    for (var item in widget.sideItems) {
      items.add(
        _buildSideNav(
          iconName: item.icon,
          title: item.name,
          selected: widget.sideItems.indexOf(item) == widget.currentIndex,
          onTap: () { _sideOnTap(item); }
        )
      );
      items.add(const SizedBox(height: 10));
    }

    return items;
  }

  Widget _buildFrameContent() {
    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: widget.body,
        )
      )
    );
  }

  Widget _buildSideTitle({
    required String image, required String title
  }) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 58,
          height: 58,
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
  
  Widget _buildSideNav({
    required String iconName,
    required String title,
    bool selected = false,
    GestureTapCallback? onTap,
  }) {

    Color contentColor = selected ? XColor.white : XColor.black;
    Color backgroundColor = selected ? XColor.themeColor : XColor.backgroundColor;

    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/$iconName',
                  color: contentColor,
                  width: 28,
                  height: 28,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: contentColor
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sideOnTap(SideItem item) {
    var idx = widget.sideItems.indexOf(item);
    if (idx != widget.currentIndex) {
      widget.onNavigationIndexChange!(idx);
    }
  }
}

