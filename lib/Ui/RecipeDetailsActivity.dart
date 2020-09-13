import 'file:///E:/0_Programing_Project/Flutter/baking_app_flutter/lib/Ui/StepDetailsActivity.dart';
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
class RecipeDetailsActivity extends StatefulWidget {
  List mIngredients;
  List mSteps;

  RecipeDetailsActivity(this.mIngredients, this.mSteps);

  @override
  _RecipeDetailsActivityState createState() => _RecipeDetailsActivityState();
}

class _RecipeDetailsActivityState extends State<RecipeDetailsActivity> {
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
          title: new Text(Constant.KEY_RECIPE_DETAILS_ACTIVITY_TITLE),
        ),
        backgroundColor: Colors.transparent,
        body: new ListView(
          children: <Widget>[
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(Constant.KEY_MARGIN_TEN),
                    child: new Text(
                        "Ingredients: (${widget.mIngredients.length})",
                        style: TextStyle(
                            fontSize: Constant.KEY_WELCOME_TEXT_SIZE,
                            color: Colors.white)),
                  ),
                  new SizedBox(
                    width: Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                  ),
                  new CarouselSlider(
                      items: widget.mIngredients.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return new Card(
                              elevation: Constant.KEY_CARD_ELEVATION_TEN,
                              margin: EdgeInsets.fromLTRB(
                                  Constant.KEY_MARGIN_TEN,
                                  Constant.KEY_MARGIN_TEN,
                                  Constant.KEY_MARGIN_TEN,
                                  Constant.KEY_MARGIN_ZERO),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Constant.KEY_BORDER_RADIUS_TEN),
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Container(
                                    margin: EdgeInsets.all(
                                        Constant.KEY_MARGIN_EIGHT),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Text(
                                            widget.mIngredients[_current][Constant
                                                .KEY_RECIPE_INGREDIENTS_INGREDIENT],
                                            style: TextStyle(
                                                fontSize:
                                                    Constant.KEY_TEXT_SIZE,
                                                color:
                                                    Constant.KEY_BLUE_COLOR)),
                                        new SizedBox(
                                          width:
                                              Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                                        ),
                                        new Container(
                                            child: new Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.center,
                                              child: new Text(
                                                widget.mIngredients[_current][
                                                        Constant
                                                            .KEY_RECIPE_INGREDIENTS_QUANTITY]
                                                    .toString(),
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constant.KEY_TEXT_SIZE,
                                                    color: Colors.deepOrange),
                                              ),
                                            ),
                                            new SizedBox(
                                              width: Constant
                                                  .KEY_SIZE_BOX_HEIGHT_SIX,
                                            ),
                                            new Text(
                                              widget.mIngredients[_current][Constant
                                                  .KEY_RECIPE_INGREDIENTS_MEASURE],
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize:
                                                      Constant.KEY_TEXT_SIZE,
                                                  color: Colors.deepOrange),
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          height: Constant.KEY_CAROUSEL_INGREDIENT_HEIGHT,
                          initialPage: Constant.KEY_CAROUSEL_INITIAL_PAGE_ZERO,
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          })),
                  new SizedBox(
                    height: Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(widget.mIngredients, (index, url) {
                      return new Container(
                        width: Constant
                            .KEY_CAROUSEL_BOX_DECORATION_INDICATOR_WIDTH,
                        height: Constant
                            .KEY_CAROUSEL_BOX_DECORATION_INDICATOR_HEIGHT,
                        margin: EdgeInsets.symmetric(
                            vertical: Constant.KEY_MARGIN_TEN,
                            horizontal: Constant.KEY_MARGIN_TWO),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                  new SizedBox(
                    height: Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                  ),
                  new Container(
                    margin: EdgeInsets.all(Constant.KEY_MARGIN_TEN),
                    child: new Text("Steps: (${widget.mSteps.length})",
                        style: TextStyle(
                            fontSize: Constant.KEY_WELCOME_TEXT_SIZE,
                            color: Colors.white)),
                  ),
                  new SizedBox(
                    width: Constant.KEY_SIZE_BOX_HEIGHT_SIX,
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height -
                        Constant.KEY_CONTAINER_STEPS_HEIGHT,
                    child: new ListView.builder(
                        itemCount: widget.mSteps.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                            child: new Card(
                              margin: EdgeInsets.fromLTRB(
                                  Constant.KEY_MARGIN_EIGHT,
                                  Constant.KEY_MARGIN_FOUR,
                                  Constant.KEY_MARGIN_EIGHT,
                                  Constant.KEY_MARGIN_FOUR),
                              elevation: Constant.KEY_CARD_ELEVATION_TEN,
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    height: Constant
                                        .KEY_CONTAINER_STEP_ITEM_CARD_HEIGHT,
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Expanded(
                                          flex: 1,
                                          child: new Container(
                                            width: Constant.KEY_ICON_SIZE,
                                            height: Constant.KEY_ICON_SIZE,
                                            child: new CircleAvatar(
                                              child: new Text(
                                                  "${widget.mSteps[index][Constant.KEY_RECIPE_STEPS_ID] + 1}"),
                                              foregroundColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        new Expanded(
                                            flex: 2,
                                            child: new Text(
                                              widget.mSteps[index][Constant
                                                  .KEY_RECIPE_STEPS_SHORT_DESCRIPTION],
                                              style: TextStyle(
                                                  color:
                                                      Constant.KEY_BLUE_COLOR),
                                            )),
                                        new Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Constant.KEY_BLUE_COLOR,
                                            size: Constant.KEY_ICON_SIZE,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              List steps = widget.mSteps;
                              if (steps != null) {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext c) =>
                                            StepDetailsActivity(steps, index)));
                              }
                            },
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
