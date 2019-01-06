import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show DateFormat;

import '../../resources/app_colors.dart';

class Calendar extends StatefulWidget {
  final TextStyle defaultHeaderTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );
  final TextStyle defaultPrevDaysTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16.0,
  );
  final TextStyle defaultNextDaysTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16.0,
  );
  final TextStyle defaultDaysTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  );
  final TextStyle defaultTodayTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  );
  final TextStyle defaultSelectedDayTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  );
  final TextStyle defaultWeekdayTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
  );
  final TextStyle defaultWeekendTextStyle = TextStyle(
    color: Colors.pinkAccent,
    fontSize: 16.0,
  );

  final List<String> weekDays;
  final double viewportFraction;
  final TextStyle prevDaysTextStyle;
  final TextStyle daysTextStyle;
  final TextStyle nextDaysTextStyle;
  final Color prevMonthDayBorderColor;
  final Color thisMonthDayBorderColor;
  final Color nextMonthDayBorderColor;
  final double dayPadding;
  final double height;
  final double width;
  final TextStyle todayTextStyle;
  final Color dayButtonColor;
  final Color todayBorderColor;
  final Color todayButtonColor;
  final DateTime selectedDateTime;
  final List<DateTime> markedDateTimes;
  final TextStyle selectedDayTextStyle;
  //final Color selectedDayButtonColor;
  //final Color selectedDayBorderColor;
  final bool daysHaveCircularBorder;
  final Function(DateTime) onDayPressed;
  final Function(DateTime) onMonthChanged;
  final TextStyle weekdayTextStyle;
  final Color iconColor;
  final TextStyle headerTextStyle;
  final Widget headerText;
  final TextStyle weekendTextStyle;
  final List<DateTime> markedDates;
  final Color markedDateColor;
  final Widget markedDateWidget;
  final EdgeInsets headerMargin;
  final double childAspectRatio;
  final EdgeInsets weekDayMargin;


//  If true then picking two dates will select all days between those days
  final bool isIntervalSelectable;

  Calendar({
    this.weekDays = const ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
    this.viewportFraction = 1.0,
    this.prevDaysTextStyle,
    this.daysTextStyle,
    this.nextDaysTextStyle,
    this.prevMonthDayBorderColor = Colors.transparent,
    this.thisMonthDayBorderColor = Colors.transparent,
    this.nextMonthDayBorderColor = Colors.transparent,
    this.dayPadding = 2.0,
    this.height = double.infinity,
    this.width = double.infinity,
    this.todayTextStyle,
    this.dayButtonColor = Colors.transparent,
    this.todayBorderColor = Colors.red,
    this.todayButtonColor = Colors.red,
    this.markedDateTimes,
    this.selectedDateTime,
    this.selectedDayTextStyle,
    //this.selectedDayBorderColor = Colors.green,
    //this.selectedDayButtonColor = Colors.green,
    this.daysHaveCircularBorder,
    this.onDayPressed,
    this.onMonthChanged,
    this.weekdayTextStyle,
    this.iconColor = Colors.grey,
    this.headerTextStyle,
    this.headerText,
    this.weekendTextStyle,
    this.markedDates,
    @deprecated this.markedDateColor,
    this.markedDateWidget,
    this.headerMargin = const EdgeInsets.symmetric(vertical: 16.0),
    this.childAspectRatio = 1.0,
    this.weekDayMargin = const EdgeInsets.only(bottom: 4.0),
    this.isIntervalSelectable
  }){
    
  }

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  PageController _controller;
  List<DateTime> _dates = List(3);
  int _startWeekday = 0;
  int _endWeekday = 0;



  @override
  initState() {
    super.initState();

    /// setup pageController
    _controller = PageController(
      initialPage: 1,
      keepPage: true,
      viewportFraction: widget.viewportFraction,

      /// width percentage
    );
    this.setDate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 3.0, left: 0.0, right: 0.0),
            child: DefaultTextStyle(
              style: widget.headerTextStyle != null
                  ? widget.headerTextStyle
                  : widget.defaultHeaderTextStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      setDate(page: 0);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: widget.iconColor,
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Text(
                        //  '${DateFormat.MMMM().format(this._dates[0]).substring(0, 3)}  ${DateFormat.y().format(this._dates[0])}',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 16.0
                        //   ),
                        // ),
                        // Padding(padding: EdgeInsets.only(left: 15.0)),
                        Text(
                          '${DateFormat.MMMM().format(this._dates[1]).substring(0, 3)}  ${DateFormat.y().format(this._dates[1])}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(left: 15.0)),
                        // Text(
                        //   '${DateFormat.MMMM().format(this._dates[2]).substring(0, 3)}  ${DateFormat.y().format(this._dates[2])}',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 16.0
                        //   ),
                        // ),
                      ] 
                    ), 
                  ),
                  IconButton(
                    onPressed: () => setDate(page: 2),
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: widget.iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: widget.weekDays == null
                ? Container()
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: this.renderWeekDays(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              onPageChanged: (value) {
                this.setDate(page: value);
              },
              controller: _controller,
              itemBuilder: (context, index) {
                return builder(index);
              },
              pageSnapping: true,
            ),
          ),
        ],
      ),
    );
  }

  builder(int slideIndex) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    int totalItemCount = DateTime(
      this._dates[slideIndex].year,
      this._dates[slideIndex].month + 1,
      0,
    ).day +
        this._startWeekday +
        (7 - this._endWeekday);
    int year = this._dates[slideIndex].year;
    int month = this._dates[slideIndex].month;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page - slideIndex;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * widget.height,
            width: Curves.easeOut.transform(value) * screenWidth,
            child: child,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                crossAxisCount: 7,
                childAspectRatio: widget.childAspectRatio,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: List.generate(totalItemCount,
                    /// last day of month + weekday
                        (index) {
                      bool isToday =
                          DateTime
                              .now()
                              .day == index + 1 - this._startWeekday &&
                              DateTime
                                  .now()
                                  .month == month &&
                              DateTime
                                  .now()
                                  .year == year;

                      bool isNotEmptyList =  widget.markedDateTimes != null &&
                          widget.markedDateTimes.length >0;

                      int selectedIndex = selectedDayIndex(year, month, index + 1 - this._startWeekday);
                      bool selectedDay = isNotEmptyList && selectedIndex != -1;

                      bool isPrevMonthDay = index < this._startWeekday;
                      bool isNextMonthDay = index >=
                          (DateTime(year, month + 1, 0).day) +
                              this._startWeekday;

                      bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;
                   

                      DateTime now = DateTime(year, month, 1);
                      TextStyle textStyle;
                      TextStyle defaultTextStyle;
                      if (isPrevMonthDay) {
                        now = now
                            .subtract(
                            Duration(days: this._startWeekday - index));
                        textStyle = widget.prevDaysTextStyle;
                        defaultTextStyle = widget.defaultPrevDaysTextStyle;
                      } else if (isThisMonthDay) {
                        now = DateTime(
                            year, month, index + 1 - this._startWeekday);
                        textStyle = selectedDay
                            ? widget.selectedDayTextStyle
                            : widget.daysTextStyle;
                        defaultTextStyle = selectedDay
                            ? widget.defaultSelectedDayTextStyle
                            : widget.defaultDaysTextStyle;
                      } else {
                        now = DateTime(
                            year, month, index + 1 - this._startWeekday);
                        textStyle = widget.nextDaysTextStyle;
                        defaultTextStyle = widget.defaultNextDaysTextStyle;
                      }
                      return GestureDetector(
                        onTap: (){
                          if (isThisMonthDay && widget.onDayPressed != null){
                            widget.onDayPressed(DateTime(year, month, index + 1 - this._startWeekday));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                          child: Container(
                            //decoration: getShape(isFist: firstDay, isLast: lastDay, index: selectedIndex), 
                            // decoration: isDateEqual(widget.selectedDateTime, year, month, index + 1 - this._startWeekday) ? 
                            // BoxDecoration(
                            //   border: Border.all(
                            //     color: Colors.pink,
                            //   ), 
                            //   borderRadius: BorderRadius.all(Radius.circular(50.0))
                            // ) : 
                            // BoxDecoration(),       
                            child: Container(
                              color:  Colors.transparent,
                              /*onPressed: (){
                                if (isThisMonthDay){
                                  widget.onDayPressed(DateTime(
                                      year, month, index + 1 - this._startWeekday));
                                }
                              },*/
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[ 
                                        Container(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: DefaultTextStyle(
                                            style: (index % 7 == 0 || index % 7 == 6) &&
                                                !selectedDay ? defaultTextStyle : defaultTextStyle,
                                            child: Text(
                                              '${now.day}',
                                              style: (index % 7 == 0 || index % 7 == 6) &&
                                                  !selectedDay ?textStyle : textStyle,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        isDateMarked(year, month, index + 1 - this._startWeekday) ? 
                                        Container(
                                          padding: EdgeInsets.only(bottom: 0.0),
                                          child: Icon(Icons.favorite,
                                            color: AppColors.textLightPink,
                                            size: 15.0,
                                          ),
                                        ) :
                                        Container()
                                      ]
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 7.0,
                                      left: 7.0,
                                      bottom: isDateMarked(year, month, index + 1 - this._startWeekday) ? 0.0 : 17.0
                                    ),
                                    decoration: isDateEqual(widget.selectedDateTime, year, month, index + 1 - this._startWeekday) ? 
                                    BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.textLightPink,
                                      ), 
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                    ) : 
                                    BoxDecoration(),     
                                  )
                                ],
                              ),
                            ),
                          )
                        )
                      );
                    }
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setDate({
    int page,
  }) {
    if (page == null) {
      /// setup dates
      DateTime date0 =
      DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month - 1, 1);
      DateTime date1 = DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month, 1);
      DateTime date2 =
      DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month + 1, 1);

      this.setState(() {
        /// setup current day
        _startWeekday = date1.weekday;
        _endWeekday = date2.weekday;
        this._dates = [
          date0,
          date1,
          date2,
        ];
      });
    } else if (page == 1) {
      return;
    } else {
      List<DateTime> dates = this._dates;
      if (page == 0) {
        dates[2] = DateTime(dates[0].year, dates[0].month + 1, 1);
        dates[1] = DateTime(dates[0].year, dates[0].month, 1);
        dates[0] = DateTime(dates[0].year, dates[0].month - 1, 1);
        page = page + 1;
        if (widget.onMonthChanged != null){
          widget.onMonthChanged(dates[1]);
        };
      } else if (page == 2) {
        dates[0] = DateTime(dates[2].year, dates[2].month - 1, 1);
        dates[1] = DateTime(dates[2].year, dates[2].month, 1);
        dates[2] = DateTime(dates[2].year, dates[2].month + 1, 1);
        page = page - 1;
        if (widget.onMonthChanged != null){
          widget.onMonthChanged(dates[1]);
        };
      }

      this.setState(() {
        _startWeekday = dates[page].weekday;
        _endWeekday = dates[page + 1].weekday;
        this._dates = dates;
      });

      _controller.animateToPage(page,
          duration: Duration(milliseconds: 1), curve: Threshold(0.0));
    }
  }

  List<Widget> renderWeekDays() {
    List<Widget> list = [];
    for (var weekDay in widget.weekDays) {
      list.add(
        Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height * .0165)),
              child: Center(
                child: DefaultTextStyle(
                  style: widget.defaultWeekdayTextStyle,
                  child: Text(
                    weekDay,
                    style: widget.weekdayTextStyle,
                  ),
                ),
              ),
            )),
      );
    }
    return list;
  }


  int selectedDayIndex(int year, month, day) {
//    widget.selectedDateTime != null &&
//        widget.selectedDateTime.year == year &&
//        widget.selectedDateTime.month == month &&
//        widget.selectedDateTime.day ==
//            index + 1 - this._startWeekday;

    for (int i = 0; i < widget.markedDateTimes.length; i++) {
      DateTime dateTime = widget.markedDateTimes[i];
      if (dateTime.year == year && dateTime.month == month &&
          dateTime.day == day)
        return i;
    }
    return -1;
  }

  bool isDateEqual(DateTime date, int year, int month, int day) {
    return date != null 
        && date.year == year
        && date.month == month
        && date.day == day;
  }

  bool isDateMarked(int year, int month, int day) {
    if (widget.markedDateTimes != null){
      for (var date in widget.markedDateTimes){
        if (isDateEqual(date, year, month, day)){
          return true;
        }
      }
    }
    return false;
  }

}