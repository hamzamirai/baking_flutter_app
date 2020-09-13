import 'package:baking_app_flutter/Models/Recipe.dart';
import 'file:///E:/0_Programing_Project/Flutter/baking_app_flutter/lib/Ui/RecipeDetailsActivity.dart';
import 'package:baking_app_flutter/Utils/Constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/9/2020
 */

// ignore: must_be_immutable
class Home extends StatefulWidget {
  List mRecipes;

  Home(this.mRecipes);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Constant.KEY_DARK_BLUE_COLOR,
            Constant.KEY_BLUE_COLOR,
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(Constant.KEY_HOME_ACTIVITY_TITLE),
        ),
        backgroundColor: Colors.transparent,
        body: new ListView(
          children: <Widget>[
            new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.fromLTRB(
                          Constant.KEY_MARGIN_EIGHT,
                          Constant.KEY_MARGIN_EIGHT,
                          Constant.KEY_MARGIN_EIGHT,
                          Constant.KEY_MARGIN_ZERO),
                      child: new Text(
                        Constant.KEY_WELCOME_TEXT,
                        style: TextStyle(
                            fontSize: Constant.KEY_WELCOME_TEXT_SIZE,
                            color: Colors.white),
                      )),
                  new Container(
                      margin: EdgeInsets.fromLTRB(
                          Constant.KEY_MARGIN_EIGHT,
                          Constant.KEY_MARGIN_ZERO,
                          Constant.KEY_MARGIN_EIGHT,
                          Constant.KEY_MARGIN_SIXTEEN),
                      child: new Text(
                        Constant.KEY_WELCOME_DESCRIPTION_TEXT,
                        style: TextStyle(
                            fontSize:
                                Constant.KEY_WELCOME_DESCRIPTION_TEXT_SIZE,
                            color: Colors.white),
                      )),
                  new InkWell(
                    child: new CarouselSlider(
                        carouselController: buttonCarouselController,
                        items: Constant.KEY_RECIPE_IMAGES.map((imgUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return new Card(
                                elevation: Constant.KEY_CARD_ELEVATION_TEN,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Constant.KEY_MARGIN_TEN),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constant.KEY_BORDER_RADIUS_TEN),
                                ),
                                child: new SingleChildScrollView(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(
                                                Constant.KEY_BORDER_RADIUS_TEN),
                                            topRight: const Radius.circular(
                                                Constant
                                                    .KEY_BORDER_RADIUS_TEN)),
                                        child: Image.asset(
                                          imgUrl,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height:
                                              Constant.KEY_RECIPE_IMAGE_HEIGHT,
                                        ),
                                      ),
                                      new SizedBox(
                                        height:
                                            Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                                      ),
                                      new Container(
                                        height: 70.0,
                                        margin: EdgeInsets.all(
                                            Constant.KEY_MARGIN_EIGHT),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Text(
                                                widget.mRecipes[_current][
                                                            Constant
                                                                .KEY_RECIPE_ID]
                                                        .toString() +
                                                    " - ",
                                                style: TextStyle(
                                                    fontSize:
                                                        Constant.KEY_TEXT_SIZE,
                                                    color: Colors.deepOrange)),
                                            new SizedBox(
                                              width: Constant
                                                  .KEY_SIZE_BOX_HEIGHT_SIX,
                                            ),
                                            new Container(
                                                child: new Text(
                                              widget.mRecipes[_current]
                                                  [Constant.KEY_RECIPE_NAME],
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize:
                                                      Constant.KEY_TEXT_SIZE,
                                                  color: Colors.deepOrange),
                                            ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                            height: Constant.KEY_CAROUSEL_HEIGHT_FOURHANDRED,
                            initialPage:
                                Constant.KEY_CAROUSEL_INITIAL_PAGE_ZERO,
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            reverse: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            })),
                    onTap: () {
                      List ingredients = widget.mRecipes[_current]
                          [Constant.KEY_RECIPE_INGREDIENTS];
                      List steps =
                          widget.mRecipes[_current][Constant.KEY_RECIPE_STEPS];
                      if (ingredients != null && steps != null) {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext c) =>
                                RecipeDetailsActivity(ingredients, steps)));
                      }
                    },
                  ),
                  new SizedBox(
                    height: Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(widget.mRecipes, (index, url) {
                      return new Container(
                        width: Constant.KEY_CAROUSEL_BOX_DECORATION_INDECATOR_WIDTH,
                        height: Constant.KEY_CAROUSEL_BOX_DECORATION_INDECATOR_HEIGHT,
                        margin: EdgeInsets.symmetric(
                            vertical: Constant.KEY_MARGIN_TEN, horizontal: Constant.KEY_MARGIN_TWO),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.deepOrange
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomAppBar(
          color: Constant.KEY_BLUE_COLOR,
          child: new Container(
            height: Constant.KEY_BOTTOM_NAVIGATION_BAR_HEIGHT,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  child: new Text(
                    Constant.KEY_OUTLINE_BUTTON_PREVIOUS,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: new Text(
                    Constant.KEY_OUTLINE_BUTTON_NEXT,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToPrevious() {
    buttonCarouselController.previousPage(
        duration: Duration(
            milliseconds: Constant.KEY_BUTTON_CAROUSEL_CONTROLLER_MILLISECONDS),
        curve: Curves.ease);
  }

  goToNext() {
    buttonCarouselController.nextPage(
        duration: Duration(
            milliseconds: Constant.KEY_BUTTON_CAROUSEL_CONTROLLER_MILLISECONDS),
        curve: Curves.decelerate);
  }
}
